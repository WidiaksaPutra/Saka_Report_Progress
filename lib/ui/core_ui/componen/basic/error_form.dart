// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FormErrors extends StatelessWidget {
  final String errors;
  final double fontSize;
  final Color color;
  const FormErrors({Key? key,
    required this.errors,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: 14.h,
          width: 14.w,
        ),
        SizedBox(width: 10.w),
        Expanded(child: Text(errors, style: TextStyle(fontSize: fontSize, color: color))),
      ],
    );
  }
}