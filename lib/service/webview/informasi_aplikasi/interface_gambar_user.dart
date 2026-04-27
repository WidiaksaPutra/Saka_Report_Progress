// ignore_for_file: non_constant_identifier_names

abstract class InterfaceInformasiAplikasi{
  late String url, error;
  late bool html;
  Future informasiAplikasi({required String token, required String webView});
}