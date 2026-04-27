// ignore_for_file: unrelated_project_equality_checks, use_build_context_synchronously, prefer_final_fields, no_leading_underscores_for_local_identifiers, unused_field, avoid_init_to_null, unnecessary_null_comparison, await_only_futures, override_on_non_overriding_member
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_progress_report/model/hive/dropdown/dropdown_list_project_progress_report/dropdown_list_project_progress_report.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/storage/token_local_storage.dart';
import 'package:sales_progress_report/riverpod/dropdown_riverpod/dropdown_riverpod_list_project/dropdown_riverpod_list_project_state.dart';
import 'package:sales_progress_report/riverpod/dropdown_riverpod/dropdown_riverpod_list_project/interface_dropdown_riverpod_list_project.dart';
import 'package:sales_progress_report/service/dropdown/dropdown_list_project_progress_report/injection_dropdown_progress_report.dart';
import 'package:sales_progress_report/service/dropdown/dropdown_list_project_progress_report/interface_dropdown_list_project_progress_report.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';

final dropdownRiverpodListProjectProgressReport = StateNotifierProvider.autoDispose<DropdownRiverpodListProject, DropdownRiverpodListProjectState>((ref) {
  final serviceDropdownProgressReport = ref.read(injectionDropdownProjectProjectProgressReport);
  final _tokenLocalStorage = ref.read(globalLocalStorage);
  return DropdownRiverpodListProject(serviceDropdownProgressReport, _tokenLocalStorage);
});

class DropdownRiverpodListProject extends StateNotifier<DropdownRiverpodListProjectState> implements InterfaceDropdownRiverpodListProject{
  final InterfaceDropdownListProjectProgressReport _serviceDropdownListProjectProgressReport;
  final TokenLocalStorage _tokenLocalStorage;
  late dynamic _dataDropdown = null;
  
  DropdownRiverpodListProject(this._serviceDropdownListProjectProgressReport, this._tokenLocalStorage) : super(DropdownRiverpodListProjectState(message: '', statusCode: '0', data: []));
  
  @override
  Future<void> dropdownListProjectProgressReport({required String type}) async{
    try{
      print("testing data $type");
      final Map<String, String?> _global = await _tokenLocalStorage.get();
      _dataDropdown = await _serviceDropdownListProjectProgressReport.dropdownListProjectProgressReport(token: _global['token']!, type: type);
      if(_dataDropdown['code'] == 200 && _dataDropdown['data'] != []){
        for(int i = 0; i < _dataDropdown['data'].length; i++){
          late DropdownListProjectProgressReportHive _dropdownListProjectProgressReportHive;          
          final _progressReport = _dataDropdown['data'][i];
          _dropdownListProjectProgressReportHive = await DropdownListProjectProgressReportHive(
            id: _progressReport.id.toString(),
            type: type,
            label: _progressReport.label.toString(),
          );
          await (await dropdownListProjectProgressReportBox).add(_dropdownListProjectProgressReportHive);
        }
        state = state.copyWith(
          statusCode: _dataDropdown['code'],
          message: _dataDropdown['message'],
          data: (await dropdownListProjectProgressReportBox).values.toList(),
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