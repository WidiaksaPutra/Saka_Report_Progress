// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:sales_progress_report/model/service/dropdown/model_list_type_dropdown_progress_report.dart';
import 'package:sales_progress_report/service/dropdown/dropdown_list_type_progress_report/interface_dropdown_list_type_progress_report.dart';
import 'package:sales_progress_report/service/konstanta.dart';

class DropdownListTypeProgressReport implements InterfaceDropdownListTypeProgressReport{
  
  @override
  late Map<String, dynamic> dataDropdown = {};
  
  @override
  String urlDropdownListTypeProgressReport = "/progress-reports/types";
  
  @override
  Future dropdownListTypeProgressReport({required String token}) async{
    try {
      final responsBody = await BASICAPI.client.get(Uri.parse("${BASICAPI.baseURL}$urlDropdownListTypeProgressReport"),
        headers: <String, String> {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Connection": "keep-alive",
        },
      ).timeout(const Duration(minutes: 3));
      final _jsonData = responsBody.body;
      final _listTypeProgressReport = modelListTypeDropdownProgressReportFromJson(_jsonData);

      final _meta = _listTypeProgressReport.meta;
      final _data = _listTypeProgressReport.data;

      if(_meta!.code == 200){
        final parse = await json.decode(_jsonData);
        ModelListTypeDropdownProgressReport _progressReport = ModelListTypeDropdownProgressReport.fromJson(parse);
        return dataDropdown = {
          'code': _meta.code,
          'message': _meta.message,
          'data': _data
        };
      }else{
        return dataDropdown = {
          'code': _meta.code,
          'message': _meta.message,
          'data': []
        };
      }
    } catch (e) {
      return dataDropdown = {
        'code': '999',
        'message': '$e',
        'data': []
      };
    }
  }
}