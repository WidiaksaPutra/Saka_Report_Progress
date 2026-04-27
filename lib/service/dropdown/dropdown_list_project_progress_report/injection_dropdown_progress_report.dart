import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/service/dropdown/dropdown_list_project_progress_report/dropdown_list_type_progress_report.dart';
import 'package:sales_progress_report/service/dropdown/dropdown_list_project_progress_report/interface_dropdown_list_project_progress_report.dart';

final injectionDropdownProjectProjectProgressReport = Provider<InterfaceDropdownListProjectProgressReport>(
  (ref) {
    return DropdownListProjectProgressReport();
  },
);