// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class ComponenFormPrefixIcon extends StatelessWidget {
  late bool obscureText, enabled;
  late Widget suffixIcon;
  late int? maxLines;
  late Color? colorIcon;

  TextEditingController? controller;
  Function(String) onChanged;
  String? Function(String?)? validator;
  String hintText;
  IconData icon;
  TextInputType? keyboardType;
  TextCapitalization textCapitalization;
  List<TextInputFormatter>? inputFormatters;

  ComponenFormPrefixIcon({super.key,
    this.obscureText = false,
    this.enabled = true,
    this.suffixIcon = const SizedBox(),
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.controller,
    required this.onChanged,
    this.validator,
    required this.maxLines,
    required this.hintText,
    required this.icon,
    required this.keyboardType,
    required this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {    
    return TextFormField(
      enabled: enabled,
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 14.sp),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14.sp, color: kGreyBaseColor),
        filled: true,
        fillColor: kGreyColor3,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(color: kTransparentColor),
          gapPadding: 10.w,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(color: kTransparentColor),
          gapPadding: 10.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(color: kTransparentColor),
          gapPadding: 10.w,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 5.w,
            top: 5.h,
            bottom: 5.h,
          ),
          child: Icon(
            icon,
            size: 20.w,
            color: colorIcon,
          ),
        ),
      ),
      maxLines: maxLines,
    );
  }
}