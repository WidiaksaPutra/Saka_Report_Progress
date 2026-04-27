// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_font.dart';

Widget showAppLottie({
  required BuildContext context,
  required String asset,
  required String text,
}) {
  return SingleChildScrollView(
    child: Center(
      child: Column(
        children: [
          Lottie.asset(
            "assets/animations/$asset",
            height: 100.h,
          ),
          Text(text, style: TextStyle(fontWeight: regular, fontSize: defaultFont14.sp, color: kGreyColor)),
        ],
      ),
    ),
  );
}

Widget showAppLottie2({
  required BuildContext context,
  required String asset,
  required String text1,
  required String text2,
}) {
  return SingleChildScrollView(
    child: Center(
      child: Column(
        children: [
          Lottie.asset(
            "assets/animations/$asset",
            height: 100.h,
          ),
          Text(text1, style: TextStyle(fontWeight: regular, fontSize: defaultFont14.sp, color: kGreyColor)),
          Text(text2, style: TextStyle(fontWeight: regular, fontSize: defaultFont14.sp, color: kGreyColor))
        ],
      ),
    ),
  );
}