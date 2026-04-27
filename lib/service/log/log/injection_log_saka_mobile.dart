import 'package:sales_progress_report/service/log/log/interface_log_saka_mobile_api.dart';
import 'package:sales_progress_report/service/log/log/log_saka_mobile.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';

void setupDInjectionLogSakaMobile(){
  if(!getItInstance.isRegistered<InterfaceLogSakaMobileApi>()){
    getItInstance.registerFactory<InterfaceLogSakaMobileApi>(() => LogSakaMobileApi());
  }
}