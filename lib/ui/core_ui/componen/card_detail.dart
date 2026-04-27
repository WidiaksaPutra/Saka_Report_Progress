// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class CardDetail extends StatelessWidget {
  final Widget child;
  const CardDetail({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Card(
        color: kGreyColor3,
        elevation: 3.0,
        margin: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 6.0.h),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(
            width: 0.4.w, color: kWhiteColor
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: child,
        ),
      ),
    );
  }
}