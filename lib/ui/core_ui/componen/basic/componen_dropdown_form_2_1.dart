// ignore_for_file: prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, must_be_immutable, camel_case_types, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_type_def.dart';

class ComponenDropdownForm2_1 extends HookConsumerWidget{  
  final void Function(String)? onSelected;
  final List<String> listStore;
  final voidFunctionContextTextEditingFocusNode fieldViewBuilder;
  ComponenDropdownForm2_1({super.key,
    required this.onSelected,
    required this.listStore,
    required this.fieldViewBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return listStore.where((item) => item.toLowerCase().contains(textEditingValue.text.toLowerCase()));
          },
          displayStringForOption: (String option) {
            List<String> data = option.split('_').where((item) => item.isNotEmpty).toList();
            return "${data[1]}";
          },
          onSelected: onSelected,
          fieldViewBuilder: fieldViewBuilder,
          optionsViewBuilder: (context, onSelected, options) {
            return Material(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 40.w),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final String option = options.elementAt(index);
                    List<String> data = option.split('_').where((item) => item.isNotEmpty).toList();
                    return GestureDetector(
                      onTap: () => onSelected(option),
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                          child: Row(
                            children: [
                              Icon(Icons.description,
                                color: kGreenColor,
                                size: 15.w,
                              ),
                              Expanded(child: Text("${data[1]}")),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}