// ignore_for_file: prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_type_def.dart';

class ComponenDropdownForm3 extends HookWidget{  
  final onSelected onSelect;
  final String labelText, hintText, valueEmpty;
  final List<String> listStore;
  bool enabled;
  ComponenDropdownForm3({super.key,
    required this.onSelect,
    required this.listStore,
    required this.labelText,
    required this.hintText,
    required this.valueEmpty,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final _statusController = useState<bool>(false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return listStore.where((item) => item.toLowerCase().contains(textEditingValue.text.toLowerCase()));
          },
          displayStringForOption: (String option) {
            List<String> data = option.split('_').where((item) => item.isNotEmpty).toList();
            return "${data[3]}";
          },
          onSelected: onSelect,
          fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
            if(enabled == true){
              if(_statusController.value == true){
                _statusController.value = false;
                controller.text = "";
              }
            }else{
              if(_statusController.value == false){
                _statusController.value = true;
              }
            }
            return TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              enabled: enabled,
              controller: controller,
              focusNode: focusNode,
              onEditingComplete: onEditingComplete,
              decoration: InputDecoration( 
                hintText: hintText,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return valueEmpty;
                }
                return null;
              },
            );
          },
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
                              Icon((data[0] == 'null' || data[0] == '0') 
                                ? Icons.location_off_sharp 
                                : Icons.location_on_sharp,
                                color: (data[0] == 'null' || data[0] == '0' || data[0] == '0.0') 
                                ? kPrimaryColor 
                                : kGreenColor,
                                size: 15.w,
                              ),
                              Expanded(child: Text("${data[3]}")),
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