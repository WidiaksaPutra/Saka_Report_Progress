// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sales_progress_report/riverpod/core_control/util/dialog_basic.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/dialog/componen_content_dialog_image_&_title_text_&_2_button_text.dart';

class DialogBack{
  Future<void> dialogBack({
    String textDialog = "apakah anda yakin ingin keluar halaman..?",
    required bool textNotNull,
    required BuildContext context, 
    required String routeNameGo,
    required VoidCallback onTap1,
    required VoidCallback onTap2,  
    Object? extra = null,
  }) async {
    if(textNotNull == true){
      DialogBasic().voidDialogBasic(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
        borderRadius: BorderRadius.circular(10.r),
        color: kWhiteColor,
        context: context,
        CloseIconStatus: true,
        barrierDismissible: false,
        autoClose: false,
        contentDialog: ComponenContentDialog_ImageAndTitleTextAnd2ButtonText(
          image: 'assets/animations/peringatan_lottie.json', 
          text: Text(textDialog,
          style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
          textButton1: 'Ya',
          textButton2: 'Tidak',
          buttonColor1: kGreenColor, 
          buttonColor2: kPrimaryColor,
          onTap1: onTap1,
          onTap2: onTap2,
        ),
      );
    }else{
      context.go(routeNameGo, extra: extra);
    }
  }
}