// // ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

// import 'dart:convert';

// import 'package:sales_progress_report/model/service/dropdown/model_dropdown_progress_report.dart';
// import 'package:sales_progress_report/service/dropdown/dropdown_progress_report/interface_dropdown_progress_report.dart';
// import 'package:sales_progress_report/service/konstanta.dart';

// class DropdownProgressReport implements InterfaceDropdownProgressReport{
  
//   @override
//   late Map<String, dynamic> dataDropdown = {};
  
//   @override
//   String urlDropdownProgressReport = "/progress-reports/projects";
  
//   @override
//   Future dropdownProgressReport({required String token}) async{
//     try {
//       print("testing dropdown riverpod $token");
//       final responsBody = await BASICAPI.client.get(Uri.parse("${BASICAPI.baseURL}$urlDropdownProgressReport"),
//         headers: <String, String> {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json; charset=UTF-8',
//           "Accept": "application/json",
//           "Connection": "keep-alive",
//         },
//       ).timeout(const Duration(minutes: 3));
//       final _jsonData = responsBody.body;
//       final _progressReportRespons = modelDropdownProgressReportFromJson(_jsonData);

//       final _meta = _progressReportRespons.meta;
//       final _data = _progressReportRespons.data;

//       if(_meta!.code == 200){
//         final parse = await json.decode(_jsonData);
//         ModelDropdownProgressReport _progressReport = ModelDropdownProgressReport.fromJson(parse);
//         print("testing dropdown riverpod 15 $_data");
//         return dataDropdown = {
//           'code': _meta.code,
//           'message': _meta.message,
//           'data': _data
//         };
//       }else{
//         return dataDropdown = {
//           'code': _meta.code,
//           'message': _meta.message,
//           'data': []
//         };
//       }
//     } catch (e) {
//       return dataDropdown = {
//         'code': '999',
//         'message': '$e',
//         'data': []
//       };
//     }
//   }
// }