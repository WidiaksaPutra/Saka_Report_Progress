import 'package:sales_progress_report/service/log/log_list/interface_log_list_saka_mobile_api.dart';
import 'package:sales_progress_report/service/log/log_list/log_list_saka_mobile.dart';
import 'package:sales_progress_report/shared/theme_konstanta.dart';

void setupDInjectionLogListSakaMobile(){
  if(!getItInstance.isRegistered<InterfaceLogListSakaMobileApi>()){
    getItInstance.registerFactory<InterfaceLogListSakaMobileApi>(() => LogListSakaMobileApi());
  }
}