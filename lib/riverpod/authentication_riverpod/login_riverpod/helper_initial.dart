// ignore_for_file: await_only_futures, no_leading_underscores_for_local_identifiers
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/util/get_retry.dart';
import 'package:sales_progress_report/riverpod/dropdown_riverpod/dropdown_riverpod_list_project/dropdown_riverpod_list_project.dart';
import 'package:sales_progress_report/riverpod/dropdown_riverpod/dropdown_riverpod_list_type/dropdown_riverpod_list_type.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';

final loginInitProvider = FutureProvider.autoDispose<void>((ref) async {
  final _dropdownTypeProgressReport = await dropdownListTypeProgressReportBox;
  
  final tasks = <Future<void> Function()>[
    () async {
      if(await _dropdownTypeProgressReport.values.isEmpty){
        await ref.read(dropdownRiverpodListTypeProgressReport.notifier).dropdownListTypeProgressReport();
      }
    },
  ];

  for (var i = 0; i < tasks.length; i += 3) {
    final batch = tasks.skip(i).take(3).map((t) => runWithRetry(t));
    await Future.wait(batch);
  }
});