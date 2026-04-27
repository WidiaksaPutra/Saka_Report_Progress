// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';

import 'package:sales_progress_report/service/konstanta.dart';
import 'package:sales_progress_report/service/log/log/interface_log_saka_mobile_api.dart';

class LogSakaMobileApi implements InterfaceLogSakaMobileApi{
  
  @override
  String urlPostTransactionSna = "/transaction-log";

  @override
  Future<String> logSakaMobile({
    required String username,
    required String module,
    required String transactionType,
    required String actionDetails,
    required String status,
    required String tableName,
  }) async {
    await BASICAPI.client.post(Uri.parse("${BASICAPI.baseURL}$urlPostTransactionSna"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Connection": "keep-alive",
      },
      body: jsonEncode(<String, String>{
        "username" : username,
        "module" : module,
        "transaction_type" : transactionType,
        "action_details" : "$actionDetails $tableName",
        "status" : status,
        "table_name" : tableName
      }),
    ).timeout(const Duration(minutes: 3));
    return "200";
  }
}