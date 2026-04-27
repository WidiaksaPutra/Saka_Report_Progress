// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class CardItemExpansionDetail extends StatelessWidget {
  final Widget child;
  const CardItemExpansionDetail({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kGreyColor2,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: child,
    );
  }
}