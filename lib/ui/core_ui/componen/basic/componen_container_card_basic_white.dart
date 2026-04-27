// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class ComponenContainerCardBasicWhite extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  late EdgeInsetsGeometry? margin = EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w);
  final BorderRadiusGeometry? borderRadius;
  final Widget content;
  ComponenContainerCardBasicWhite({super.key,
    this.margin,
    required this.padding,
    required this.borderRadius,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: kGreyColorShadow.withOpacity(0.4),
            offset: Offset(8.w, 8.h),
            blurRadius: 15.r,
            spreadRadius: 2.r,
          ),
          BoxShadow(
            color: kGreyColorShadow.withOpacity(0.4),
            offset: Offset(-2.w, -2.h),
            blurRadius: 10.r,
            spreadRadius: 0.r,
          ),
        ]
      ),
      child: content,
    );
  }
}
