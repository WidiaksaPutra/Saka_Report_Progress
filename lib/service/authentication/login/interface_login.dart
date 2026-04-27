// ignore_for_file: non_constant_identifier_names, avoid_init_to_null

import 'package:sales_progress_report/service/authentication/login/result_login.dart';

abstract class InterfaceLogin{
  Future<ResultLogin> loginUser({
    required String username, 
    required String password,
  });
}