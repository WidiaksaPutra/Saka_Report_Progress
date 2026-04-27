// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously, prefer_final_fields, no_leading_underscores_for_local_identifiers, unused_field, avoid_init_to_null, unnecessary_null_comparison, await_only_futures, override_on_non_overriding_member
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_progress_report/model/hive/dropdown/dropdown_list_type_progress_report/dropdown_list_type_progress_report.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/storage/token_local_storage.dart';
import 'package:sales_progress_report/riverpod/dropdown_riverpod/dropdown_riverpod_list_type/dropdown_riverpod_list_type_state.dart';
import 'package:sales_progress_report/riverpod/dropdown_riverpod/dropdown_riverpod_list_type/interface_dropdown_riverpod_list_type.dart';
import 'package:sales_progress_report/service/dropdown/dropdown_list_type_progress_report/injection_dropdown_progress_report.dart';
import 'package:sales_progress_report/service/dropdown/dropdown_list_type_progress_report/interface_dropdown_list_type_progress_report.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';

final dropdownRiverpodListTypeProgressReport = StateNotifierProvider.autoDispose<DropdownRiverpodListType, DropdownRiverpodListTypeState>((ref) {
  final serviceDropdownProgressReport = ref.read(injectionDropdownListTypeProgressReport);
  final _tokenLocalStorage = ref.read(globalLocalStorage);
  return DropdownRiverpodListType(serviceDropdownProgressReport, _tokenLocalStorage);
});

class DropdownRiverpodListType extends StateNotifier<DropdownRiverpodListTypeState> implements InterfaceDropdownRiverpodListType{
  final InterfaceDropdownListTypeProgressReport _serviceDropdownListTypeProgressReport;
  final TokenLocalStorage _tokenLocalStorage;
  late dynamic _dataDropdown = null;
  
  DropdownRiverpodListType(this._serviceDropdownListTypeProgressReport, this._tokenLocalStorage) : super(DropdownRiverpodListTypeState(message: '', statusCode: '0', data: []));
  
  @override
  Future<void> dropdownListTypeProgressReport() async{
    try{
      await (await dropdownListTypeProgressReportBox).clear();
      final Map<String, String?> _global = await _tokenLocalStorage.get();
      _dataDropdown = await _serviceDropdownListTypeProgressReport.dropdownListTypeProgressReport(token: _global['token']!);
      if(_dataDropdown['code'] == 200 && _dataDropdown['data'] != []){
        for(int i = 0; i < _dataDropdown['data'].length; i++){
          late DropdownListTypeProgressReportHive _dropdownListTypeProgressReportHive;
          
          final _progressReport = _dataDropdown['data'][i];
          _dropdownListTypeProgressReportHive = await DropdownListTypeProgressReportHive(
            id: _progressReport.id.toString(),
            type: _progressReport.type.toString(),
            projectInputType: _progressReport.projectInputType.toString(),
          );
          await (await dropdownListTypeProgressReportBox).add(_dropdownListTypeProgressReportHive);
        }
        state = state.copyWith(
          statusCode: _dataDropdown['code'],
          message: _dataDropdown['message'],
          data: (await dropdownListTypeProgressReportBox).values.toList(),
        );
      }else{
        state = state.copyWith(
          statusCode: _dataDropdown['code'],
          message: _dataDropdown['message'],
          data: [],
        );
      }
    }catch(e){
      state = state.copyWith(statusCode: '999', message: '$e', data: []);
    }
  }
}