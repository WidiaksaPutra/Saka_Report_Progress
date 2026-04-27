// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class ComponenDropdownMultiSelect extends HookWidget {
  final List<String> dataList, selectedItems;
  final void Function(List<String>)? onChanged;
  final String hintText, labelText;
  final double horizontal, vertical, circular;
  const ComponenDropdownMultiSelect({
    super.key,
    required this.dataList,
    required this.selectedItems,
    required this.onChanged,
    required this.hintText,
    required this.horizontal,
    required this.vertical,
    required this.labelText,
    required this.circular,
  });

  @override
  Widget build(BuildContext context) {  
    return DropdownSearch<String>.multiSelection(
      items: dataList,
      selectedItems: selectedItems,
      dropdownBuilder: (context, selected) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: selected.map((e) => Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: InputChip(
                label: Text(e, style: TextStyle(fontSize: 10.sp, color: kBlackColor)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            )).toList(),
          ),
        );
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circular),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
        ),
      ),
      popupProps: PopupPropsMultiSelection.dialog(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: hintText,
          ),
          style: TextStyle(fontSize: 10.sp)
        ),
      ),
      onChanged: onChanged,
    );
  }
}
