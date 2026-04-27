import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_font.dart';
import 'package:sales_progress_report/shared/theme_text_style.dart';

class ComponenDropdownBasicForm extends StatelessWidget{
  final String hintText;
  final double paddingVertical, paddingHorizontal, radiusBorder, fontSize;
  final List<dynamic> listIndex, list;
  final Color colorBorder;
  final dynamic onClicked;
  final bool iconValidasi;
  final IconData? dropdownIcon;

  const ComponenDropdownBasicForm({ super.key,
    required this.colorBorder,
    required this.paddingVertical,
    required this.paddingHorizontal,
    required this.radiusBorder, 
    required this.hintText,
    required this.list,
    required this.listIndex,
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
          alignment: AlignmentDirectional.center,
          hint: Center(child: Text(hintText, style: blackTextStyle.copyWith(fontSize: fontSize.sp, fontWeight: medium), textAlign: TextAlign.center,)),
          icon: (iconValidasi == true) ? Icon(dropdownIcon, color: kPrimaryColor,) : null,
          style: blackTextStyle.copyWith(fontSize: fontSize.sp, fontWeight: medium,),
          items: list.map(buildMenuItems).toList(),
          borderRadius: BorderRadius.circular(radiusBorder.r),
          underline: const SizedBox(),
          isExpanded: true,
          onChanged:(value){
            onClicked(value: value, list: list, listIndex: listIndex);
          },
        ),
      ), 
    );
  }

  DropdownMenuItem<String> buildMenuItems(dynamic item)
  => DropdownMenuItem(
    alignment: AlignmentDirectional.center,
    value: item.isNotEmpty ? item : null,
    child: Center(child: Text(item, style: blackTextStyle.copyWith(fontSize: fontSize.sp, fontWeight: medium), textAlign: TextAlign.center,)),
  );
}