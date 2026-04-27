// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/log_riverpod/interface_log_riverpod.dart';
import 'package:sales_progress_report/service/log/log/interface_log_saka_mobile_api.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';

final logRiverpod = StateNotifierProvider<LogRiverpod, bool>((ref) => LogRiverpod(ref));

class LogRiverpod extends StateNotifier<bool> implements InterfaceLogRiverpod{
  InterfaceLogSakaMobileApi _logSaka = getItInstance<InterfaceLogSakaMobileApi>();
  LogRiverpod(ref) : super(false);

  @override
  Future<void> logData({
    required String username,
    required String module,
    required String transactionType,
    required String actionDetails,
    required String status,
    required String tableName,
  }) async {
    if (
      username != "" && 
      module != "" &&
      transactionType != "-" &&
      actionDetails != "-" &&
      status != "-" &&
      tableName != "-"
    ){
      print("testing gagal report aervice log 1");
      try{
        await _logSaka.logSakaMobile(
          username: username,
          module: module,
          transactionType: transactionType,
          actionDetails: actionDetails,
          status: status,
          tableName: tableName,
        );
      }catch(e){
        print("testing gagal report aervice log 3 $e");  
      }
      print("testing gagal report aervice log 2");
    }
  }  
}