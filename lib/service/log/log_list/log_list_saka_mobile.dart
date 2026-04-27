// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';

import 'package:sales_progress_report/service/konstanta.dart';
import 'package:sales_progress_report/service/log/log_list/interface_log_list_saka_mobile_api.dart';

class LogListSakaMobileApi implements InterfaceLogListSakaMobileApi{
  
  @override
  String urlPostTransactionSna = "/transaction-log-array";

  @override
  Future<String> logListSakaMobile({
    required List<Map<String,String>> logList,
  }) async {
     print("testing data log list $logList");
    final responsBody = await BASICAPI.client.post(Uri.parse("${BASICAPI.baseURL}$urlPostTransactionSna"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Connection": "keep-alive",
      },
      body: jsonEncode(<String, List<Map<String,String>>>{
        "log" : logList,
      }),
    ).timeout(const Duration(minutes: 3));
    print("testing data log list ${responsBody.statusCode.toString()}");
    return responsBody.statusCode.toString();
  }
}