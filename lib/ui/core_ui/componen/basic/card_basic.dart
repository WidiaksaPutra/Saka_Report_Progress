// ignore_for_file: use_super_parameters, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class CardBasic extends StatelessWidget {
  final Widget child;
  late double marginTop, marginBottom, marginLeft, marginRight, circularRadiusTopLeft, circularRadiusTopRight, circularRadiusBottomLeft, circularRadiusBottomRight, borderSideWidth;
  final Color cardColor;
  CardBasic({Key? key, 
  this.marginTop = 0.0,
  this.marginBottom = 0.0,
  this.marginLeft = 0.0,
  this.marginRight = 0.0,
  this.cardColor = kWhiteColor,
  required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom.h, top: marginTop.h, left: marginLeft.w, right: marginRight.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            offset: Offset(0.w, 4.h),
            blurRadius: 12.r,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.02),
            offset: Offset(0.w, 1.h),
            blurRadius: 2.r,
          ),
        ],
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.black12,
            width: 0.5.w,
          ),
        ),
      ),
      child: child,
    );
  }
}