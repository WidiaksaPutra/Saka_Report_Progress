// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/riverpod/core_control/util/dialog_basic.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/shared/theme_type_def.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_basic_button.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_container_card_basic_white.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_content_dialog.dart';

void dialogHapusGambar({
  required BuildContext context,
  required VoidCallback onAction,
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
      widget: HookBuilder(builder: (contextDialog){
        final _statusDialog = useState<int>(1);
        return Column(
          children: [
            Lottie.asset(
              (_statusDialog.value == 0)
              ? 'assets/animations/loading_big.json'
              : (_statusDialog.value == 1)
                ? 'assets/animations/peringatan_lottie.json'
                : (_statusDialog.value == 2)
                  ?'assets/animations/check_lottie.json'
                  : 'assets/animations/close_lottie.json',
              height: 150.h,
              width: 152.w,
              alignment: Alignment.center,
            ),
           if(_statusDialog.value == 0)...[
              Text("mohon tunggu kurang lebih 60 detik...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,)
            ] else if(_statusDialog.value == 1)...[
              Text("apakah anda yakin menghapus foto ini ?", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,)
            ] else if(_statusDialog.value == 2)...[
              Text("foto berhasil dihapus...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,)
            ]else...[
              Text("foto gagal dihapus...", style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor,), textAlign: TextAlign.center,)
            ],

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if(_statusDialog.value == 1)...[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: ComponenBasicButton(
                        paddingVertical: 0,
                        borderRadius: 5.r,
                        content: Text("Ya", style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                        onPressed: (){
                          try{
                            _statusDialog.value = 0;
                            onAction();
                            _statusDialog.value = 2;
                          }catch(e){
                            _statusDialog.value = 3;
                          }
                        },
                        primaryColor: kGreenColor2,
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
                        },
                        primaryColor: kPrimaryColor,
                        secondaryColor: kGreyColor,
                      ), 
                    ),
                  ),
                ],

                if(_statusDialog.value == 2 || _statusDialog.value == 3)...[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: ComponenBasicButton(
                        paddingVertical: 0, 
                        borderRadius: 5.r, 
                        content: Text('Close', style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400, fontSize: defaultFont16.sp)),
                        onPressed: () => Navigator.of(context).pop(),
                        primaryColor: kPrimaryColor,
                        secondaryColor: kGreyColor,
                      ), 
                    ),
                  )
                ],
              ],
            )
          ],
        );
      })
    ),
  );
  return null;
}


class ViewHapusGambar extends StatelessWidget {
  final voidFunction onAction;
  final File file;
  const ViewHapusGambar({super.key,
    required this.onAction,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      padding: EdgeInsets.only(left: 10.w),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: Image.file(
              file,
              width: 105.w,
              fit: BoxFit.cover,
            ),
          ),
          ComponenContainerCardBasicWhite(
            margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h), 
            borderRadius: BorderRadius.circular(5.r), 
            content: GestureDetector(
              onTap: onAction,
              child: Icon(
                Icons.close_rounded,
                color: kPrimaryColor,
                size: 15.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}