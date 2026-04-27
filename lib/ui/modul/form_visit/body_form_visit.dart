// ignore_for_file: prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, unused_element, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, prefer_const_constructors, unused_local_variable, use_build_context_synchronously, await_only_futures, unrelated_type_equality_checks, avoid_single_cascade_in_expression_statements, must_be_immutable, unnecessary_null_comparison, prefer_function_declarations_over_variables, unnecessary_type_check, avoid_print, prefer_is_empty, unnecessary_string_interpolations, curly_braces_in_flow_control_structures
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/riverpod/camera_riverpod/single_camera_riverpod/single_camera_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/util/dialog_basic.dart';
import 'package:sales_progress_report/riverpod/core_control/util/list_remove_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/util/save_file_to_documents.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_card_border_alert.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_content_dialog.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/error_form.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/componen_form_not_icon.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/dialog/componen_dialog_gambar_option.dart';
import 'package:sales_progress_report/ui/modul/form_visit/dialog_hapus_gambar.dart';
import 'package:sales_progress_report/ui/modul/form_visit/dropdown_project_progress.dart';
import 'package:sales_progress_report/ui/modul/form_visit/dropdown_type_progress.dart';
import 'package:sales_progress_report/ui/modul/form_visit/form_hapus_form_dialog.dart';
import 'package:sales_progress_report/ui/modul/form_visit/gambar_form.dart';
import 'package:sales_progress_report/ui/modul/form_visit/submit_visit.dart';

final dataTokoConnectSna = StateProvider.autoDispose<Map<String, dynamic>>((ref) => {});
final gambarLaporanError = StateProvider.autoDispose<bool>((ref) => false);
final textFormLaporan = StateProvider.autoDispose<Box<String>?>((ref) => null);

final typePelaporan = StateProvider.autoDispose<String?>((ref) => null);
final projectInputTypePelaporan = StateProvider.autoDispose<String?>((ref) => null);
final projectPelaporan = StateProvider.autoDispose<String?>((ref) => null);
final idProjectPelaporan = StateProvider.autoDispose<String?>((ref) => null);

final enableSearchTypePelaporan = StateProvider.autoDispose<bool>((ref) => true);

class BodyFormReport extends HookConsumerWidget{
  BodyFormReport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _statusOnClickSna = useState<bool>(true);
    final _statusOnClickSaa = useState<bool>(false);

    final _checkBoxOrderSna = useState<bool>(false);
    final _checkBoxOrderSaa = useState<bool>(false);

    final _checkBoxTokoTutup = useState<bool>(false);
    final _loadingToMap = useState<bool>(false);
    
    final _typePelaporan = ref.watch(typePelaporan.select((state) => state));
    final _type = useState<String?>(_typePelaporan);
    final _projectInputTypePelaporan = ref.watch(projectInputTypePelaporan.select((state) => state));
    final _projectInputType = useState<String?>(_projectInputTypePelaporan);
    final _projectPelaporan = useState<String?>(null);
    final _project = useState<String?>(null);
    final _idProjectPelaporan = useState<String?>(null);

    final _gambarLaporanError = ref.watch(gambarLaporanError.select((state) => state));
    final _dataTokoConnectSna = ref.watch(dataTokoConnectSna.select((state) => state));
    
    final _projectProgressError = useState<bool>(false);
    final _laporanProgressError = useState<bool>(false);
    final _responsTokoSnaError = useState<bool>(false);
    final _kondisiKunjunganSaaError = useState<bool>(false);
    final _responsTokoSaaError = useState<bool>(false);
    final _orderTokoSnaError = useState<bool>(false);
    final _orderTokoSaaError = useState<bool>(false);

    final _projectProgressBack = useState<bool>(false);
    final _laporanProgressBack = useState<bool>(true);
    final _responsTokoSnaBack = useState<bool>(true);
    final _gambarSalesBack = useState<bool>(true);
    final _gambarGudangBack = useState<bool>(true);
    final _kondisiKunjunganSaaBack = useState<bool>(true);
    final _responsTokoSaaBack = useState<bool>(true);
    final _orderTokoSnaBack = useState<bool>(true);
    final _orderTokoSaaBack = useState<bool>(true);

    final _listGambarLaporanPath = useState<List<String>>([]);
    
    final _enableExpanded = useState<bool>(true);
    final _statusComp = useState<Box<dynamic>?>(null);
    final _textFormLaporan = useState<Box<dynamic>?>(null);
    final _isLoaded = useState(true);
    final _debounce = useRef<Timer?>(null);

    final _controllers = useRef<Map<String, TextEditingController>>({});
    final _connection = useState<bool?>(null);

    useEffect(() {
      StreamSubscription? _sub;
      Future.microtask(() async {
        final _box = await modeOnlineBox;
        _connection.value = _box.get('mode_online');
        _sub = _box.watch(key: 'mode_online').listen((event) {
          if (event.value != null) {
            _connection.value = event.value as bool;
          }
        });
      });
      return () => _sub?.cancel();
    }, []);

    useEffect((){
      WidgetsBinding.instance.addPersistentFrameCallback((_){
        if(_textFormLaporan.value?.get('dropdownTypeProgress') != null){
          _type.value = _textFormLaporan.value?.get('dropdownTypeProgress');
          List _splitType = _type.value!.split("_");
          _projectInputType.value = _splitType.last;
          _projectPelaporan.value = _splitType[1];
        }
      });
      return null;
    },[_textFormLaporan.value?.get('dropdownTypeProgress')]);
    
    useEffect((){
      WidgetsBinding.instance.addPersistentFrameCallback((_){
        if(_textFormLaporan.value?.get('dropdownProjectProgress') != null){
          if(_projectInputType.value == 'select' || _projectInputType.value == 'text'){
            ref.read(enableSearchTypePelaporan.notifier).state = false;
          }

          _project.value = _textFormLaporan.value?.get('dropdownProjectProgress');
          List _splitProject = _project.value!.split("_");
          _idProjectPelaporan.value = _splitProject.last;
        }
      });
      return null;
    },[_textFormLaporan.value?.get('dropdownProjectProgress')]);

    final _statusImage = useState<int>(0);
    File? _fileImage = ref.watch(fileImage.select((state) => state));
    useEffect((){
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        final _listGambarFormLaporan = await listGambarFormLaporanBox;
        if(_fileImage != null){
          final savedPath = await saveFileToDocuments(_fileImage);
          final existingList = _listGambarFormLaporan.get('listGambarLaporanPath') ?? <String>[];
          final updatedList = List<String>.from(existingList)..add(savedPath);
          _listGambarLaporanPath.value = updatedList;
          await _listGambarFormLaporan.put('listGambarLaporanPath', updatedList);
        
          ref.read(fileImage.notifier).state = null;
        }
      });
      _statusImage.value = 2;
      return null;
    },[_fileImage]);

    final _statusImages = useState<int>(0);
    List<File>? _filesImage = ref.watch(filesImage.select((state) => state));
    useEffect((){
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        final _listGambarFormLaporan = await listGambarFormLaporanBox;
        if(_filesImage != []){
          final savedPath = await saveFilesToDocuments(_filesImage!);
          final existingList = _listGambarFormLaporan.get('listGambarLaporanPath') ?? <String>[];
          final updatedList = List<String>.from(existingList)..addAll(savedPath);
          _listGambarLaporanPath.value = updatedList;
          await _listGambarFormLaporan.put('listGambarLaporanPath', updatedList);
        
          ref.read(filesImage.notifier).state = null;
        }
      });
      _statusImage.value = 2;
      return null;
    },[_filesImage]);

    _textFormLaporan.value = ref.watch(textFormLaporan.select((state) => state));  
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        ref.read(textFormLaporan.notifier).state = await textFormLaporanBox;
      });
      return null;
    }, []);

    useEffect(() {
      final disposers = <VoidCallback>[];
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        _controllers.value = {
          "laporanProgressTextController": TextEditingController(text: (_textFormLaporan.value?.get('laporanProgressTextController') != null) ? _textFormLaporan.value?.get('laporanProgressTextController') : ''),
          "projectProgressTextController": TextEditingController(text: (_textFormLaporan.value?.get('projectProgressTextController') != null) ? _textFormLaporan.value?.get('projectProgressTextController') : ''),
        };

        _controllers.value.forEach((key, controller) {
          controller.text = _textFormLaporan.value?.get(key, defaultValue: '') ?? '';
          final _listener = () {
            _debounce.value?.cancel();
            _debounce.value = Timer(const Duration(milliseconds: 300), () async {
              await _textFormLaporan.value?.put(key, controller.text);
            });
          };
          controller.addListener(_listener);
          disposers.add(() => controller.removeListener(_listener));
        });
        _isLoaded.value = false;
      });

      return () {
        for (final dispose in disposers) {
          dispose();
        }
      };
    },[_textFormLaporan.value != null]);

    useEffect(() {
      return () {
        _controllers.value.forEach((_, c) => c.dispose());
      };
    }, []);

    useEffect((){
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        final _listGambarFormLaporan = await listGambarFormLaporanBox;

        if(_listGambarFormLaporan.get('listGambarLaporanPath') != null && _listGambarFormLaporan.get('listGambarLaporanPath')!.isNotEmpty){
          _listGambarLaporanPath.value = _listGambarFormLaporan.get('listGambarLaporanPath')!;
        }
      });
      return null;
    },[_listGambarLaporanPath.value]);

    useEffect((){
      () async{
        final _listGambarFormLaporan = await listGambarFormLaporanBox;
        final List _listGambarForm = _listGambarFormLaporan.get('listGambarLaporanPath') ?? <String>[];
        late bool _kondisi = false;
        if(_projectInputType.value == 'text'){
          _kondisi = (_controllers.value["laporanProgressTextController"]!.text.isNotEmpty || _listGambarForm.isNotEmpty || _controllers.value["projectProgressTextController"]!.text.isNotEmpty);
        }else{
          _kondisi = (_controllers.value["laporanProgressTextController"]!.text.isNotEmpty || _listGambarForm.isNotEmpty);
        }
        if(_kondisi){
          DialogBasic().voidDialogBasic(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
            borderRadius: BorderRadius.circular(10.r),
            color: kWhiteColor,
            context: context, 
            CloseIconStatus: false,
            barrierDismissible: false,
            autoClose: false,
            contentDialog: ComponenContentDialog(
              widget: FormHapusFormDialog(),
            ),
          );
        }
      }();
      return null;
    },[_isLoaded.value]);

    Widget _formLaporan(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(_projectInputType.value == 'select' && ref.watch(enableSearchTypePelaporan) == false)...[
            SizedBox(height: 5.h),
            DropdownProjectProgress(enableSearch: true, type: _projectPelaporan.value!),
          ]else if(_projectInputType.value == 'text' && ref.watch(enableSearchTypePelaporan) == false)...[
            SizedBox(height: 10.h),
            Text("Project Progress", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)),           
            SizedBox(height: 10.h),
            ComponenFormNotIcon(
              enabled: true,
              controller: _controllers.value["projectProgressTextController"],
              keyboardType: TextInputType.multiline,
              hintText: "Project Progress", 
              maxLines: 2,
              onChanged: (value) {
                if (value.isEmpty) {
                  _projectProgressError.value = true;
                }else{
                  _projectProgressError.value = false;
                  _projectProgressBack.value = false;
                }
                return null;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  _projectProgressError.value = true;
                }
                return null;
              },
            ),
            Visibility(
              visible: _projectProgressError.value,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5.h),
                  FormErrors(errors: kKondisiKunjunganNullError, fontSize: 12.sp, color: kRedColor),
                ],
              )
            ),
          ],
          SizedBox(height: 10.h),
          Text("Laporan Progress", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)),           
          SizedBox(height: 10.h),
          ComponenFormNotIcon(
            enabled: true,
            controller: _controllers.value["laporanProgressTextController"], 
            keyboardType: TextInputType.multiline,
            hintText: "Laporan Progress", 
            maxLines: 5,
            onChanged: (value) {
              if (value.isEmpty) {
                _laporanProgressError.value = true;
              }else{
                _laporanProgressError.value = false;
                _laporanProgressBack.value = false;
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                _laporanProgressError.value = true;
              }
              return null;
            },
          ),
          Visibility(
            visible: _laporanProgressError.value,
            child: Column(
              children: <Widget>[
                SizedBox(height: 5.h),
                FormErrors(errors: kKondisiKunjunganNullError, fontSize: 12.sp, color: kRedColor),
              ],
            )
          ),
          SizedBox(height: 10.h),
          GambarForm(
            title: "Foto Progress",
            jumlahGambar: 6,
            listGambarPath: _listGambarLaporanPath,
            onTapTambah: (){
              FocusManager.instance.primaryFocus?.unfocus();
              _statusImage.value = 0;
              DialogBasic().voidDialogBasic(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
                borderRadius: BorderRadius.circular(10.r),
                color: kWhiteColor,
                context: context, 
                CloseIconStatus: false,
                barrierDismissible: false,
                autoClose: false,
                contentDialog: ComponenContentDialog(
                  widget: ComponenDialogGambarOption(
                    onTapCamera: () async{
                      _statusImage.value = 3;
                      final _file = await ref.read(singleCameraRiverpod.notifier).pickImageCamera();
                      ref.read(fileImage.notifier).state = _file;

                      if (Navigator.canPop(context)) {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      }
                    },
                    onTapGalery: () async{
                      _statusImage.value = 3;
                      final _files = await ref.watch(singleCameraRiverpod.notifier).pickImageGallery();
                      ref.read(filesImage.notifier).state = _files;

                      if (Navigator.canPop(context)) {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      }
                    },
                    statusImage: _statusImage.value,
                    listGambar: _listGambarLaporanPath.value,
                    jumlahGambar: _listGambarLaporanPath.value.length,
                  ),
                ),
              );
            },
            widgetHapusGambar: ValueListenableBuilder<List<String>>(
              valueListenable: _listGambarLaporanPath,
              builder: (context2, pathList, _) {
                FocusManager.instance.primaryFocus?.unfocus();
                if (pathList.isEmpty) {
                  return Text('Belum ada gambar');
                }
                return ListView.builder(
                  itemCount: pathList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context2, index){
                    final file = File(pathList[index]);
                    return ViewHapusGambar(
                      file: file,
                      onAction: (){
                        dialogHapusGambar(
                          context: context,
                          onAction: () async{
                            final _listGambarFormLaporan = await listGambarFormLaporanBox;

                            final List<String> newListPath = ListStringRemoveRiverpod().removeList(
                              index: index,
                              data: _listGambarLaporanPath.value,
                            );
                            await _listGambarFormLaporan.put('listGambarLaporanPath', newListPath);
                            _listGambarLaporanPath.value = newListPath;
                          }
                        );
                      },
                    );
                  }
                );
              },
            ),
            gambarError: _gambarLaporanError, 
          ),
          SizedBox(height: 20.h),
          SubmitLaporan(
            id: _idProjectPelaporan.value.toString(),
            context: context,
            textButton: 'Kirim Laporan',
            reportImages: _listGambarLaporanPath.value,
            reportDescription: _controllers.value["laporanProgressTextController"]!,
            projectInputType: _projectInputType.value!,
            type: _projectPelaporan.value!,
            title: _controllers.value["projectProgressTextController"]!,
            otherFunction: () async{
              _debounce.value?.cancel();
              for (final entry in _controllers.value.entries) {
                await _textFormLaporan.value?.put(entry.key, entry.value.text);
              }
              await _textFormLaporan.value?.flush();
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 100.h),
            child: (_isLoaded.value)
            ? Center(
                child: Lottie.asset(
                  "assets/animations/loading_big.json",
                  height: 150.h,
                  width: double.maxFinite,    
                ),
              ) 
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: DropdownTypeProgress(enableSearch: ref.watch(enableSearchTypePelaporan))),
                    if(_projectPelaporan.value != null && (_projectInputType.value == 'select' || _projectInputType.value == 'text'))...[
                      SizedBox(width: 5.w),
                      GestureDetector(
                        onTap: () async{
                          if(ref.watch(enableSearchTypePelaporan) == false){
                            await _textFormLaporan.value?.delete('dropdownTypeProgress');
                            await _textFormLaporan.value?.delete('dropdownProjectProgress');
                          }
                          ref.read(enableSearchTypePelaporan.notifier).state = !ref.watch(enableSearchTypePelaporan);               
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 5.w),
                          curve: Curves.easeIn,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: (ref.watch(enableSearchTypePelaporan) == true) ? kRedColor2 : kGreyColor3,
                          ),
                          child: Icon(
                            (ref.watch(enableSearchTypePelaporan) == true)
                            ? Icons.search
                            : Icons.search_off,
                            color: kPrimaryColor,
                            size: 20.w,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                if(_projectPelaporan.value != null)...[
                  if(_projectInputType.value == 'select' || _projectInputType.value == 'text')...[
                    if(ref.watch(enableSearchTypePelaporan) == false)...[
                      _formLaporan(),  
                    ]else...[
                      SizedBox(height: 20.h),
                      ComponenCardBorderAlert(textAlert: "klik tombol search untuk melanjutkan pelaporan...",),
                    ],
                  ]else...[
                    _formLaporan(),
                  ],
                ]else...[
                  SizedBox(height: 20.h),
                  ComponenCardBorderAlert(textAlert: "pilih type pelaporan dan lengkapi laporan, agar dapat melakukan Submit...",),
                ],
              ],
            ),
          )
        )
      ),
    );
  }
}
