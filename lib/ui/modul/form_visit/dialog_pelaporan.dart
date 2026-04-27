// ignore_for_file: no_leading_underscores_for_local_identifiers, await_only_futures, avoid_print, dead_code, use_build_context_synchronously, unnecessary_string_interpolations, unused_local_variable, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/log_riverpod/log_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/util/dialog_basic.dart';
import 'package:sales_progress_report/riverpod/form_laporan/form_laporan.dart';
import 'package:sales_progress_report/routes/route_name.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_date.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_basic_button.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_content_dialog.dart';
import 'package:sales_progress_report/ui/modul/form_visit/body_form_visit.dart';
import 'package:sales_progress_report/ui/modul/form_visit/submit_visit.dart';

void dialogPelaporan({
  required BuildContext context,
  required List<String> reportImages,
  required String id,
  required String reportDescription,
  required String projectInputType,
  required String type,
  required String title,
}) async{
  DialogBasic().voidDialogBasic(
    padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
    borderRadius: BorderRadius.circular(10.r),
    color: kWhiteColor,
    context: context,
    CloseIconStatus: false,
    barrierDismissible: false,
    autoClose: false,
    contentDialog: ComponenContentDialog(
      widget: Consumer(builder: (context2, ref, child) {
        final _textFormLaporan = ref.watch(textFormLaporan.select((state) => state));
        
        return HookBuilder(builder: (contextDialog){
          final _statusDialog = useState<int>(9);
          final _messageDialog = useState<String>('-');
          final _showButton = useState<bool>(false);

          final _connection = useState<bool?>(null);
          useEffect(() {
            StreamSubscription? _sub;
            (() async {
              final _box = await modeOnlineBox;
              _connection.value = _box.get('mode_online');
              _sub = _box.watch(key: 'mode_online').listen((event) {
                if (event.value != null) {
                  _connection.value = event.value as bool;
                }
              });
            })();
            return () => _sub?.cancel();
          }, []);
          
          final validasiGambarLaporan = useCallback(({
            required List<String> reportImages,
          }) => reportImages.isEmpty, []);

          final validasiTextLaporan = useCallback(({
            required String id,
            required String reportDescription,
            required String projectInputType,
            required String type,
            required String title,
          }){
            if(projectInputType == "select"){
              return (id != "" && reportDescription.isNotEmpty && type.isNotEmpty);
            }else if(projectInputType == "text"){
              return (reportDescription.isNotEmpty && type.isNotEmpty && title != "");
            }else{
              return (reportDescription.isNotEmpty && type.isNotEmpty);
            }
          }, []);

          useEffect((){
            if(_statusDialog.value == 0){
              if(validasiGambarLaporan(
              reportImages: reportImages)){
                ref.read(gambarLaporanError.notifier).state = reportImages.isEmpty;
                _statusDialog.value = 1;
              }else{
                Future.microtask(() {
                  ref.read(gambarLaporanError.notifier).state = false;
                });
                if(validasiTextLaporan(
                  reportDescription: reportDescription,
                  id: id,
                  projectInputType: projectInputType,
                  type: type,
                  title: title,
                )){
                  Future.microtask(() async{
                    late String _statusCode = ""; 
                    late String _message = ""; 
                    if(_connection.value == true){
                      try{
                        await ref.watch(formLaporan.notifier).formLaporan(
                          id: id,
                          reportDescription: reportDescription,
                          reportImages: reportImages,
                          projectInputType: projectInputType,
                          type: type,
                          title: title,
                        );
                        _statusCode = ref.watch(formLaporan).code;
                        _message = ref.watch(formLaporan).message;
                      }catch(e){
                        _statusCode = ref.watch(formLaporan).code;
                        _message = '$e';
                        await ref.read(logRiverpod.notifier).logData(
                          username: (await usernameBox).get('username')!, 
                          module: "sales",
                          transactionType: "INSERT", 
                          actionDetails: "$versiAplikasi catch $e",
                          status: "1",
                          tableName: "ui submit report",
                        );
                      }
                      if(_statusCode == "0"){
                        for(int i = 0; i < 3; i++){
                          _statusCode = ref.watch(formLaporan).code;
                          if(_statusCode.toString() != "0"){
                            break;
                          }
                        }
                      }
                      if(_statusCode.toString() == "200"){
                        _statusDialog.value = 2;
                      }else{
                        _statusDialog.value = 3;
                        _messageDialog.value = _message;
                      }
                    }else{
                      _statusDialog.value = 5;
                    }
                  });
                }else{
                  _statusDialog.value = 1;
                }
              }              
            }
            return null;
          },[_statusDialog.value]);

          useEffect(() {
            Timer? timer;
            if (_statusDialog.value == 0) {
              timer = Timer(Duration(seconds: 15), () {
                _showButton.value = true;
              });
            }
            return timer?.cancel;
          }, [_statusDialog.value]);
          
          return Column(
            children: [
              Lottie.asset(
                (_statusDialog.value == 0)
                ? 'assets/animations/loading_big.json'
                : (_statusDialog.value == 1 || _statusDialog.value == 5 || _statusDialog.value == 6
                || _statusDialog.value == 7 || _statusDialog.value == 8 || _statusDialog.value == 9)
                  ? 'assets/animations/peringatan_lottie.json'
                  : (_statusDialog.value == 2)
                    ?'assets/animations/check_lottie.json'
                    : 'assets/animations/close_lottie.json',
                height: 150.h,
                width: 152.w,
                alignment: Alignment.center,
              ),

              if(_statusDialog.value == 0)...[
                Text("proses melakukan pengiriman data, mohon tunggu kurang lebih 60 detik...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,)
              ] else if(_statusDialog.value == 1)...[
                Text("formulir laporan belum lengkap, silahkan dilengkapi...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,)
              ] else if(_statusDialog.value == 2)...[
                Text("formulir laporan sukses tersimpan...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,)
              ] else if (_statusDialog.value == 3)...[
                Text("${_messageDialog.value}", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,)
              ] else if(_statusDialog.value == 5)...[
                Text("koneksi internet buruk, silahkan lakukan pelaporan ditempat lain...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,),
              ]else if(_statusDialog.value == 6)...[
                Text("data ledger dan nama toko di tgl ${formatDateShortSlash.format(DateTime.now())} sudah tersedia...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,),
              ]else if(_statusDialog.value == 7)...[
                Text("tidak terdapat token akses, silahkan login kembali...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,)
              ]else if(_statusDialog.value == 8)...[
                Text("aplikasi dalam mode offline, data akan tersimpan dalam penyimpanan local...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,),
              ]else if(_statusDialog.value == 9)...[
                Text("apakah anda yakin, akan melakukan pengiriman data...?", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,),
              ],

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if(_statusDialog.value == 9)...[
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: ComponenBasicButton(
                          paddingVertical: 0, 
                          borderRadius: 5.r, 
                          content: Text('Ya', style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                          onPressed: (){
                            _statusDialog.value = 0;
                          },
                          primaryColor: kGreenColor,
                          secondaryColor: kGreyColor,
                        ), 
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: ComponenBasicButton(
                          paddingVertical: 0, 
                          borderRadius: 5.r, 
                          content: Text('Tidak', style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                          onPressed: (){
                            Navigator.of(context).pop();
                            ref.read(loadingFormLaporan.notifier).state = false;
                          },
                          primaryColor: kPrimaryColor,
                          secondaryColor: kGreyColor,
                        ), 
                      ),
                    ),
                  ]else if(_statusDialog.value != 0 && _statusDialog.value != 9)...[
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: ComponenBasicButton(
                          paddingVertical: 0,
                          borderRadius: 5.r,
                          content: Text("Ok", style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                          onPressed: () async{
                            if(_statusDialog.value == 2){
                              await (await listGambarFormLaporanBox).clear();
                              await (await textFormLaporanBox).clear();
                              ref.read(projectPelaporan.notifier).state = null;
                              ref.read(idProjectPelaporan.notifier).state = null;

                              ref.read(typePelaporan.notifier).state = null;
                              ref.read(projectInputTypePelaporan.notifier).state = null;

                              context.pushReplacement(
                                RouteName.menuPageConnect, extra: {
                                  'select': 1,
                                  'refresh': DateTime.now().millisecondsSinceEpoch,
                                },
                              );
                            }
                            ref.read(loadingFormLaporan.notifier).state = false;
                            Navigator.of(context).pop();
                          },
                          primaryColor: kGreenColor2,
                          secondaryColor: kGreyColor,
                        ),
                      ),
                    ),  
                  ]else if(_statusDialog.value == 0 && _showButton.value == true)...[
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: ComponenBasicButton(
                          paddingVertical: 0, 
                          borderRadius: 5.r, 
                          content: Text('Close', style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                          onPressed: (){
                            _showButton.value = false;
                            ref.read(loadingFormLaporan.notifier).state = false;
                            Navigator.of(context).pop();
                          },
                          primaryColor: kPrimaryColor,
                          secondaryColor: kGreyColor,
                        ), 
                      ),
                    ),
                  ]
                ],
              ),
            ],
          );
        });
      })
    ),
  );
}