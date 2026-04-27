// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class ComponenFormNotIcon extends StatelessWidget {
  late bool obscureText, enabled;
  late int? maxLines, maxLength;
  late String? labelText;

  TextEditingController? controller;
  Function(String) onChanged;
  String? Function(String?)? validator;
  String hintText;
  TextInputType? keyboardType;
  TextCapitalization textCapitalization;
  List<TextInputFormatter>? inputFormatters;

  ComponenFormNotIcon({super.key,
    this.obscureText = false,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.controller,
    this.labelText,
    this.maxLength,
    required this.onChanged,
    this.validator,
    required this.maxLines,
    required this.hintText,
    required this.keyboardType,
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
        labelText: labelText,
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
      ),
      maxLines: maxLines,
      maxLength: maxLength,
    );
  }
}

class ComponenFormNotIconBorder extends StatelessWidget {
  late bool obscureText, enabled;
  late int? maxLines;
  late Color? colorIcon;
  late String? labelText;

  TextEditingController? controller;
  Function(String) onChanged;
  String? Function(String?)? validator;
  String hintText;
  IconData icon;
  TextInputType? keyboardType;
  TextCapitalization textCapitalization;
  List<TextInputFormatter>? inputFormatters;

  ComponenFormNotIconBorder({super.key,
    this.obscureText = false,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.controller,
    this.labelText,
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
        hintText: labelText,
        labelText: labelText,
        labelStyle: const TextStyle(color: kPrimaryColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey), // Ubah warna border ketika tidak fokus
          borderRadius: BorderRadius.circular(5.0.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor), // Ubah warna border saat fokus
          borderRadius: BorderRadius.circular(5.0.r),
        ),
      ),
      maxLines: maxLines,
    );
  }
}