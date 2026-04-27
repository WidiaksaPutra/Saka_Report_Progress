import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/service/webview/informasi_aplikasi/informasi_aplikasi.dart';
import 'package:sales_progress_report/service/webview/informasi_aplikasi/interface_gambar_user.dart';

final injectionInformasiAplikasi = Provider<InterfaceInformasiAplikasi>(
  (ref) {
    return InformasiAplikasi();
  },
);