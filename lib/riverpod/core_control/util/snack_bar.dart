import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/theme_font.dart';
import '../../../shared/theme_text_style.dart';

class UtilSnackBar{
  Future<void> snackBar({
    required BuildContext context,
    required String textSnackBar,
    required Color backgroudColor,
    required Color textColor,
    EdgeInsetsGeometry? margin = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  }) async{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: margin,
        duration: const Duration(milliseconds: 6000),
        backgroundColor: backgroudColor,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        content: Text(textSnackBar,
          style: whiteTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: defaultFont12, color: textColor),
          textAlign: TextAlign.center
        ),
      ),
    );
  }
}