// ignore_for_file: annotate_overrides, unused_local_variable, no_leading_underscores_for_local_identifiers
import 'package:sales_progress_report/model/service/authentication/logout.dart';
import 'package:sales_progress_report/service/authentication/logout/interface_logout.dart';
import 'package:sales_progress_report/service/konstanta.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';

class LogoutApi implements InterfaceLogout{

  @override
  String urlLogout = "/logout";
  late bool status = false;
  late String message = "";

  @override
  Future<Map<String, dynamic>> logoutUser({required String token}) async {
    try {
      final responsBody = await BASICAPI.client.get(Uri.parse("${BASICAPI.baseURL}$urlLogout"),
        headers: <String, String> {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Connection": "keep-alive",
        },
      ).timeout(const Duration(minutes: 3));
      final jsonData = responsBody.body;
      
      if(responsBody.statusCode == 200){
        status = true;
      }else if(responsBody.statusCode == 404){
        final regisStatusRespons = logoutModelFromJson(jsonData);
        if(regisStatusRespons.meta!.code == 404 && regisStatusRespons.meta!.status == "logout"){
          status = true;
          message = regisStatusRespons.meta!.message!;
        }
      }
      else{
        status = false;
      }
    } catch (e) {
      status = true;
    }
    return {
      'status' : status,
      'message' : message,
    };
  }
}