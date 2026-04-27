// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:sales_progress_report/model/service/dropdown/model_list_project_dropdown_progress_report.dart';
import 'package:sales_progress_report/service/dropdown/dropdown_list_project_progress_report/interface_dropdown_list_project_progress_report.dart';
import 'package:sales_progress_report/service/konstanta.dart';

class DropdownListProjectProgressReport implements InterfaceDropdownListProjectProgressReport{
  
  @override
  late Map<String, dynamic> dataDropdown = {};
  
  @override
  String urlDropdownListProjectProgressReport = "/progress-reports/projects?";
  
  @override
  Future dropdownListProjectProgressReport({required String token, required String type}) async{
    try {
      Map<String, String> parameterApi = {
        'type' : type,
      };
      String? parameterString = Uri(queryParameters: parameterApi).query;
      final responsBody = await BASICAPI.client.get(Uri.parse("${BASICAPI.baseURL}$urlDropdownListProjectProgressReport" + parameterString),
        headers: <String, String> {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Connection": "keep-alive",
        },
      ).timeout(const Duration(minutes: 3));

      final _jsonData = responsBody.body;
      final _listProjectProgressReport = modelListProjectDropdownProgressReportFromJson(_jsonData);

      final _meta = _listProjectProgressReport.meta;
      final _data = _listProjectProgressReport.data;

      if(_meta!.code == 200){
        final parse = await json.decode(_jsonData);
        ModelListProjectDropdownProgressReport _progressReport = ModelListProjectDropdownProgressReport.fromJson(parse);
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