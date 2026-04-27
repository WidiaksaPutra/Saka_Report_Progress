import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/service/form_laporan/interface_post_form_laporan.dart';
import 'package:sales_progress_report/service/form_laporan/post_form_visit_sna.dart';

final injectionPostFormLaporanApi = Provider<InterfacePostFormLaporan>(
  (ref) {
    return PostFormLaporanApi();
  },
);