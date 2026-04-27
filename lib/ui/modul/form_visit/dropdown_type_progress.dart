// ignore_for_file: invalid_use_of_protected_member, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unrelated_type_equality_checks, use_build_context_synchronously, await_only_futures, unused_element, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_dropdown_form_2_1.dart';
import 'package:sales_progress_report/ui/modul/form_visit/body_form_visit.dart';

class DropdownTypeProgress extends HookConsumerWidget {
  late bool enableSearch;
  DropdownTypeProgress({super.key, required this.enableSearch});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _jenisType = useState<List<String>>([]);
    final _textFormLaporan = useState<Box<dynamic>?>(null);
    final _statusController = useState<bool>(false);

    final _typePelaporan = ref.watch(typePelaporan.select((state) => state));
    final _projectInputTypePelaporan = ref.watch(projectInputTypePelaporan.select((state) => state));

    _textFormLaporan.value = ref.watch(textFormLaporan.select((state) => state));  
    
    useEffect((){
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        final List _dropdownProgressReport = (await dropdownListTypeProgressReportBox).values.toList();
        if(_dropdownProgressReport.isNotEmpty){
          if(_jenisType.value.isNotEmpty){
            _jenisType.value = [];
          }
          
          for(var data in _dropdownProgressReport){
            _jenisType.value = [
              ..._jenisType.value,
              "0_ ${data.type}_${data.projectInputType}",
            ];
          } 
        }
      });
      return null;
    },[_typePelaporan, _projectInputTypePelaporan]);

    final searchOnTap = useCallback(({
      required String value,
    }) async{
      List _data = value.split("_");
      ref.read(typePelaporan.notifier).state = null;
      ref.read(projectInputTypePelaporan.notifier).state = null;

      ref.read(idProjectPelaporan.notifier).state = null;
      _jenisType.value = [];
     
      ref.read(typePelaporan.notifier).state = _data[1];
      ref.read(projectInputTypePelaporan.notifier).state = _data[2];
    },[]);

    return ComponenDropdownForm2_1(
      onSelected: (String value) async{
        FocusManager.instance.primaryFocus?.unfocus();
        _textFormLaporan.value?.put('dropdownTypeProgress', value);
        await searchOnTap(value: value);
      },
      listStore: _jenisType.value,
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        String? _savedValue = _textFormLaporan.value?.get('dropdownTypeProgress');
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
            ref.read(typePelaporan.notifier).state = null;
            ref.read(projectInputTypePelaporan.notifier).state = null;
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
            hintText: 'Pilih Type Pelaporan',
            labelText: 'Pilih Type Pelaporan',
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
              return "Harap pilih type pelaporan";
            }
            return null;
          },
        );
      }, 
    );
  }
}