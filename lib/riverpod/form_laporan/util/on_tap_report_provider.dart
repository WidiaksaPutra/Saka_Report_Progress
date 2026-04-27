// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, await_only_futures
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_progress_report/riverpod/dropdown_riverpod/dropdown_riverpod_list_project/dropdown_riverpod_list_project.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/ui/modul/menu/menu_page_connect.dart';

final onTapReportProvider = Provider<OnTapReportProvider>((ref) {
  return OnTapReportProvider(ref);
});

class OnTapReportProvider {
  final Ref ref;
  OnTapReportProvider(this.ref);
  Future<void> onTapReport() async {
    final List _dropdownTypeProgressReport = (await dropdownListTypeProgressReportBox).values.toList();
    await (await dropdownListProjectProgressReportBox).clear();
    if(await (await dropdownListProjectProgressReportBox).values.isEmpty && await _dropdownTypeProgressReport.isNotEmpty){
      for(var data in _dropdownTypeProgressReport){
        if(data.projectInputType.toString() == "select"){
          ref.read(dropdownRiverpodListProjectProgressReport.notifier).dropdownListProjectProgressReport(type: data.type);
        }
      }
    }
    ref.read(selectedIndex.notifier).state = 1;
  }
}
