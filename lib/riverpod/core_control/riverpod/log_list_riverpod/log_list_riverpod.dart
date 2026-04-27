// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, strict_top_level_inference
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/log_list_riverpod/interface_log_list_riverpod.dart';
import 'package:sales_progress_report/service/log/log_list/interface_log_list_saka_mobile_api.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';

final logListRiverpod = StateNotifierProvider<LogListRiverpod, bool>((ref) => LogListRiverpod(ref));

class LogListRiverpod extends StateNotifier<bool> implements InterfaceLogListRiverpod{
  InterfaceLogListSakaMobileApi _logSaka = getItInstance<InterfaceLogListSakaMobileApi>();
  LogListRiverpod(ref) : super(false);

  @override
  Future<void> logSaveLocalListData({
    required String username,
    required String module,
    required String transactionType,
    required String actionDetails,
    required String status,
    required String tableName,
  }) async {
    // final box = await listLogKunjungan;
    if (
      username != "" && 
      module != "" &&
      transactionType != "-" &&
      actionDetails != "-" &&
      status != "-" &&
      tableName != "-"
    ){
      // ModelHiveListLog _localList = ModelHiveListLog(
      //   username: username,
      //   module: module,
      //   transactionType: transactionType,
      //   actionDetails: actionDetails,
      //   status: status,
      //   tableName: tableName,
      // );
      // await box.add(_localList);
    }
  }

  @override
  Future<void> logListData() async {
  //  final box = await listLogKunjungan;
    // if (box.isNotEmpty) {
    //   final logList = box.values.map((e) => e.toMap()).toList();
    //   String _statusCode = await _logSaka.logListSakaMobile(logList: logList);
    //   if(_statusCode == "200"){
    //     await box.clear();
    //   }
    // }
  } 
}