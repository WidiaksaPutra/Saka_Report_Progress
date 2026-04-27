// ignore_for_file: prefer_interpolation_to_compose_strings, await_only_futures, unnecessary_string_interpolations

import 'package:sales_progress_report/service/konstanta.dart';
import 'package:sales_progress_report/service/webview/informasi_aplikasi/interface_gambar_user.dart';

class InformasiAplikasi implements InterfaceInformasiAplikasi{
  @override
  bool html = false;
  
  @override
  String url = "https://web.telegram.org/a/";

  @override
  String error = "-";
  
  @override
  Future informasiAplikasi({
    required String token,
    required String webView,
  }) async {
    try {
      print("testing link web 3");
      final responsBody = await BASICAPI.client.get(Uri.parse("$webView"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
          "Connection": "keep-alive",
        },
      ).timeout(const Duration(minutes: 3));
      print("testing link web 2 ${responsBody.statusCode}");
      if(responsBody.statusCode == 200){
        html = true;
        url = responsBody.body;
        print("testing token $url");
      }
    } catch (e) {
      error = e.toString();
    }
    return {
      'url' : url,
      'html' : html,
      'error' : error,
    };
  }
}