// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/shared/theme_text_style.dart';

class ComponenDropdownBasic extends StatelessWidget{
  final String hintText;
  final double paddingVertical, paddingHorizontal, radiusBorder, fontSize;
  final List list;
  final Color colorBorder;
  final void Function(String?)? onClicked;
  final bool iconValidasi;
  final IconData? dropdownIcon;
  
  const ComponenDropdownBasic({super.key,
    required this.colorBorder,
    required this.paddingVertical,
    required this.paddingHorizontal,
    required this.radiusBorder, 
    required this.hintText,
    required this.list,
    required this.fontSize,
    required this.onClicked,
    required this.iconValidasi,
    required this.dropdownIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal.w, vertical: paddingVertical.h),
      decoration: BoxDecoration(
        border: Border.all(color: colorBorder),
        borderRadius: BorderRadius.circular(radiusBorder.r), 
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Center(child: Text(hintText, style: blackTextStyle.copyWith(fontSize: fontSize.sp, fontWeight: medium))),
          icon: (iconValidasi == true) ? Icon(dropdownIcon, color: kPrimaryColor,) : null,
          style: blackTextStyle.copyWith(fontSize: fontSize.sp, fontWeight: medium),
          items: list.map(buildMenuItems).toList(),
          borderRadius: BorderRadius.circular(radiusBorder.r),
          underline: const SizedBox(),
          isExpanded: true,
          onChanged: onClicked,
        ),
      ), 
    );
  }

  DropdownMenuItem<String> buildMenuItems(dynamic item)
  => DropdownMenuItem(
    value: item.isNotEmpty ? item : null,
    child: Center(child: Text(item)),
  );
}

// class ComponenMapDropdownBasic extends StatelessWidget{
//   final String hintText;
//   final double paddingVertical, paddingHorizontal, radiusBorder, fontSize;
//   final List list;
//   final Color colorBorder;
//   final void Function(String?)? onClicked;
//   final bool iconValidasi;
//   final IconData? dropdownIcon;
  

//   const ComponenMapDropdownBasic({super.key,
//     required this.colorBorder,
//     required this.paddingVertical,
//     required this.paddingHorizontal,
//     required this.radiusBorder, 
//     required this.hintText,
//     required this.list,
//     required this.fontSize,
//     required this.onClicked,
//     required this.iconValidasi,
//     required this.dropdownIcon,
//     required this.keyOnMap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     late List<dynamic> dataListMap = list.map((buildMenuItems) {
//         return buildMenuItems.keyOnMap;
//       }).toList();

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: paddingHorizontal.w, vertical: paddingVertical.h),
//       decoration: BoxDecoration(
//         border: Border.all(color: colorBorder),
//         borderRadius: BorderRadius.circular(radiusBorder.r), 
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton(
//           hint: Center(child: Text(hintText, style: blackTextStyle.copyWith(fontSize: fontSize.sp, fontWeight: medium))),
//           icon: (iconValidasi == true) ? Icon(dropdownIcon, color: kPrimaryColor,) : null,
//           style: blackTextStyle.copyWith(fontSize: fontSize.sp, fontWeight: medium),
//           items: dataListMap.map(buildMenuItems).toList(),
//           borderRadius: BorderRadius.circular(radiusBorder.r),
//           underline: const SizedBox(),
//           isExpanded: true,
//           onChanged: onClicked,
//         ),
//       ), 
//     );
//   }

//   DropdownMenuItem<String> buildMenuItems(dynamic item)
//   => DropdownMenuItem(
//     value: item.isNotEmpty ? item : null,
//     child: Center(child: Text(item)),
//   );
// }