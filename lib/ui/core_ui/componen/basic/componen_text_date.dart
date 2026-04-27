// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class ComponenDropdown extends StatelessWidget{
  final String hintText;
  final TextStyle hintStyle;
  final VoidCallback onTap;
  final double horizontalPadding, radiusCircular;
  final IconData icon;

  const ComponenDropdown({ Key? key,
    required this.hintText,
    required this.hintStyle,
    required this.onTap,
    required this.horizontalPadding,
    required this.radiusCircular,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTap: () => onTap(),
          readOnly: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
            fillColor: kGreyBaseColor.withOpacity(0.1),
            filled: true,
            hintText: hintText,
            hintStyle: hintStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusCircular.r),
              borderSide: BorderSide.none
            ),
            suffixIcon: Icon(icon, color: kPrimaryColor),
          ),
        ),
      ]
    );
  }
}