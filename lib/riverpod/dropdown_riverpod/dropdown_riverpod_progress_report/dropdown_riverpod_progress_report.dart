// // ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously, prefer_final_fields, no_leading_underscores_for_local_identifiers, unused_field, avoid_init_to_null, unnecessary_null_comparison, await_only_futures
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sales_progress_report/model/hive/dropdown/dropdown_progress_report/dropdown_progress_report.dart';
// import 'package:sales_progress_report/model/hive/dropdown/dropdown_progress_report/submission_details/submission_details.dart';
// import 'package:sales_progress_report/riverpod/core_control/riverpod/storage/token_local_storage.dart';
// import 'package:sales_progress_report/riverpod/dropdown_riverpod/dropdown_riverpod_progress_report/dropdown_riverpod_progress_state.dart';
// import 'package:sales_progress_report/riverpod/dropdown_riverpod/dropdown_riverpod_progress_report/interface_dropdown_riverpod_progress_report.dart';
// import 'package:sales_progress_report/service/dropdown/dropdown_progress_report/injection_dropdown_progress_report.dart';
// import 'package:sales_progress_report/service/dropdown/dropdown_progress_report/interface_dropdown_progress_report.dart';
// import 'package:sales_progress_report/shared/theme_hive.dart';

// final dropdownRiverpodProgressReport = StateNotifierProvider.autoDispose<DropdownRiverpodProgressReport, DropdownRiverpodProgressReportState>((ref) {
//   final serviceDropdownProgressReport = ref.read(injectionDropdownProgressReport);
//   final _tokenLocalStorage = ref.read(globalLocalStorage);
//   return DropdownRiverpodProgressReport(serviceDropdownProgressReport, _tokenLocalStorage);
// });

// class DropdownRiverpodProgressReport extends StateNotifier<DropdownRiverpodProgressReportState> implements InterfaceDropdownRiverpodProgressReport{
//   final InterfaceDropdownProgressReport _serviceDropdownProgressReport;
//   final TokenLocalStorage _tokenLocalStorage;
//   late dynamic _dataDropdown = null;
  
//   DropdownRiverpodProgressReport(this._serviceDropdownProgressReport, this._tokenLocalStorage) : super(DropdownRiverpodProgressReportState(message: '', statusCode: '0', data: []));
  
//   @override
//   Future<void> dropdownProgressReport() async{
//     try{
//       await (await dropdownProgressReportBox).clear();
//       final Map<String, String?> _global = await _tokenLocalStorage.get();
//       late DropdownProgressReport _dropdownProgressReport;
//       _dataDropdown = await _serviceDropdownProgressReport.dropdownProgressReport(token: _global['token']!);
//       if(_dataDropdown['code'] == 200 && _dataDropdown['data'] != []){
//         for(int i = 0; i < _dataDropdown['data'].length; i++){
//           late SubmissionDetails _submissionDetails;
//           await (await submissionDetailsBox).clear();
          
//           final _progressReport = _dataDropdown['data'][i];
//           final List _listSubmissionDetails = _progressReport.submissionDetails;
          
//           if(_listSubmissionDetails != []){
//             for(int i2 = 0; i2 <_listSubmissionDetails.length; i2++){
//               final _details = _listSubmissionDetails[i2];
//               _submissionDetails = await SubmissionDetails(
//                 id: _details.id.toString(),
//                 idpeng: _details.idpeng.toString(),
//                 jobDescription: _details.jobDescription.toString(),
//                 vendorName: _details.vendorName.toString(),
//               );
//               await (await submissionDetailsBox).add(_submissionDetails);
//             }
//           }

//           _dropdownProgressReport = await DropdownProgressReport(
//             idHeader: _progressReport.id.toString(),
//             submissionNo: _progressReport.submissionNo.toString(),
//             office: _progressReport.office.toString(),
//             submissionHeader: _progressReport.submissionHeader.toString(),
//             submissionDetails: (await submissionDetailsBox).values.toList(),
//           );
//           await (await dropdownProgressReportBox).add(_dropdownProgressReport);
//         }
//         print("testing dropdown riverpod ${_dataDropdown['code']}");
//         state = state.copyWith(
//           statusCode: _dataDropdown['code'],
//           message: _dataDropdown['message'],
//           data: (await dropdownProgressReportBox).values.toList(),
//         );
//       }else{
//         state = state.copyWith(
//           statusCode: _dataDropdown['code'],
//           message: _dataDropdown['message'],
//           data: [],
//         );
//       }
//     }catch(e){
//       state = state.copyWith(statusCode: '999', message: '$e', data: []);
//     }
//   }
// }