// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class CardMicroBorderButton extends StatelessWidget {
  late VoidCallback onClicked;
  final String textButton;
  final double sizeFont;
  final Color colorButton;
  final bool statusOnClick;

  CardMicroBorderButton({
    Key? key,
    required this.onClicked,
    required this.textButton,
    required this.sizeFont,
    required this.colorButton,
    required this.statusOnClick,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: (statusOnClick == true) ? 40.h : 30.h,
          decoration: BoxDecoration(
            color: (statusOnClick == true) ? colorButton : kWhiteColor,
            borderRadius: BorderRadius.circular(5.r),
            border: (statusOnClick == true) 
            ? null
            : Border.all(
              color: colorButton,
            ),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))
            ),
            onPressed: onClicked,
            child: Text(textButton,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: sizeFont.sp,
                color: (statusOnClick == true) ? kWhiteColor : colorButton,
              ),
            )
          ),
        ),
      ],
    );
  }
}