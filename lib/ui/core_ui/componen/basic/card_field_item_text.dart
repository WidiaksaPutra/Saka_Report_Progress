// ignore_for_file: unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class FieldItemText extends StatelessWidget {
  final String label;
  final String? contentData;
  final double sizeLabel, sizeContent;
  final int flexContent;
  Color color;
  FieldItemText({
    super.key,
    this.color = kBlackColor,
    this.flexContent = 2,
    required this.label,
    required this.contentData,
    required this.sizeLabel,
    required this.sizeContent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text("$label",
            style: TextStyle(
              color: color,
              fontSize: sizeLabel.sp,
              fontWeight: FontWeight.w500, 
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Text(" : ",
          style: TextStyle(
            color: color,
            fontSize: sizeLabel.sp,
            fontWeight: FontWeight.w500, 
          ),
          textAlign: TextAlign.left,
        ),
        (contentData != null)
        ? Expanded(
            flex: flexContent,
            child: Text(contentData.toString(),
              style: TextStyle(
                color: color,
                fontSize: sizeContent.sp,
              ),
              textAlign: TextAlign.left,
            ),
          )
        : Expanded(
            flex: flexContent,
            child: Text("-",
            style: TextStyle(
              color: color,
              fontSize: sizeContent.sp,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}