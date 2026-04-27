// ignore_for_file: unrelated_type_equality_checks, use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_date.dart';

class CardFieldItemDate extends StatelessWidget {
  final String label;
  final dynamic date;
  const CardFieldItemDate({
    Key? key,
    required this.label,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$label :",
          style: TextStyle(
            color: kBlackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500, 
          ),
          textAlign: TextAlign.left,
        ),
        (date != null)
        ? Text(
          formatDateDay.format(DateTime.parse(date.toString())).toString(),
          style: TextStyle(
            color: kBlackColor,
            fontSize: 12.sp,
          ),
          textAlign: TextAlign.left,
        )
        : Text("-",
          style: TextStyle(
            fontSize: 12.sp,
            color: kBlackColor
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}