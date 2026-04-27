// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/storage/token_local_storage.dart';
import 'package:sales_progress_report/riverpod/form_laporan/form_laporan_state.dart';
import 'package:sales_progress_report/riverpod/form_laporan/interface_form_laporan.dart';
import 'package:sales_progress_report/service/form_laporan/injection_post_form_visit_sna.dart';
import 'package:sales_progress_report/service/form_laporan/interface_post_form_laporan.dart';

final formLaporan = StateNotifierProvider<FormLaporan, FormLaporanState>((ref) {
  final serviceFormLaporan = ref.read(injectionPostFormLaporanApi);
  final tokenLocalStorage = ref.read(globalLocalStorage);
  return FormLaporan(serviceFormLaporan, tokenLocalStorage);
});

class FormLaporan extends StateNotifier<FormLaporanState> implements InterfaceFormLaporan{
  final InterfacePostFormLaporan _serviceFormLaporan;
  final TokenLocalStorage _tokenLocalStorage;
  FormLaporan(this._serviceFormLaporan, this._tokenLocalStorage) : super(FormLaporanState(code: '0', status: '', message: ''));

  @override
  Future<void> formLaporan({
    required String id,
    required String projectInputType,
    required String reportDescription,
    required String type,
    required String title,
    required List<String> reportImages}) async{
    try{
      final Map<String, String?> _global = await _tokenLocalStorage.get();
      final _responsLaporan = await _serviceFormLaporan.postFormLaporan(
        id: id, 
        projectInputType: projectInputType,
        reportDescription: reportDescription,
        reportImages: reportImages,
        type: type,
        title: title,
        token: _global['token']!,
      );
      state = state.copyWith(
        code: _responsLaporan['code'].toString(),
        status: _responsLaporan['status'].toString(),
        message: _responsLaporan['message'].toString(),
      );
    }catch(e){
      state = state.copyWith(code: '999', message: '$e', status: "");
    }
  }
}