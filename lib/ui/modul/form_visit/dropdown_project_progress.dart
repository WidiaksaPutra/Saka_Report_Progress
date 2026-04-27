// ignore_for_file: invalid_use_of_protected_member, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unrelated_project_equality_checks, use_build_context_synchronously, await_only_futures, unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_dropdown_form_2_1.dart';
import 'package:sales_progress_report/ui/modul/form_visit/body_form_visit.dart';

class DropdownProjectProgress extends HookConsumerWidget {
  late bool enableSearch;
  final String type;
  DropdownProjectProgress({super.key, required this.enableSearch, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _jenisProject = useState<List<String>>([]);
    final _textFormLaporan = useState<Box<dynamic>?>(null);
    final _statusController = useState<bool>(false);

    _textFormLaporan.value = ref.watch(textFormLaporan.select((state) => state));  
    final _projectPelaporan = ref.watch(projectPelaporan.select((state) => state));
    
    String _type = type.trim();
    
    useEffect((){
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        final List _dropdownProgressReport = (await dropdownListProjectProgressReportBox).values.toList();
        if(_dropdownProgressReport.isNotEmpty){
          if(_jenisProject.value.isNotEmpty){
            _jenisProject.value = [];
          }
          
          for(var data in _dropdownProgressReport){
            if(data.type == _type){
              _jenisProject.value = [
                ..._jenisProject.value,
                "0_ ${data.label}_${data.id}",
              ];
            }
          } 
        }
      });
      return null;
    },[_projectPelaporan]);

    final searchOnTap = useCallback(({
      required String value,
    }) async{
      List _data = value.split("_");
      ref.read(projectPelaporan.notifier).state = null;
      ref.read(idProjectPelaporan.notifier).state = null;
      _jenisProject.value = [];
      
      ref.read(projectPelaporan.notifier).state = _data[1];
      ref.read(idProjectPelaporan.notifier).state = _data[2];
    },[]);

    return ComponenDropdownForm2_1(
      onSelected: (String value) async{
        FocusManager.instance.primaryFocus?.unfocus();
        _textFormLaporan.value?.put('dropdownProjectProgress', value);
        await searchOnTap(value: value);
      },
      listStore: _jenisProject.value,
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        String? _savedValue = _textFormLaporan.value?.get('dropdownProjectProgress');
        if (_savedValue != null && controller.text.isEmpty) {
          List<String> _data = _savedValue.split('_').where((e) => e.isNotEmpty).toList();
          controller.text = _data[1];
        }
        if(enableSearch == true){
          if(_statusController.value == true){
            _statusController.value = false;
            _textFormLaporan.value?.clear();
            controller.clear();
          }
        }else{
          if(_statusController.value == false){
            _statusController.value = true;
          }
        }
        
        return TextFormField(
          onTap: (){
            ref.read(projectPelaporan.notifier).state = null;
            ref.read(idProjectPelaporan.notifier).state = null;
            controller.clear();
          },
          keyboardType: TextInputType.multiline,
          maxLines: null,
          enabled: enableSearch,
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration( 
            hintText: 'Pilih Project Pelaporan',
            labelText: 'Pilih Project Pelaporan',
            labelStyle: const TextStyle(color: kPrimaryColor),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(5.0.r),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Harap pilih project pelaporan";
            }
            return null;
          },
        );
      }, 
    );
  }
}