import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/service/authentication/login/interface_login.dart';
import 'package:sales_progress_report/service/authentication/login/api_login.dart';

final injectionLogin = Provider<InterfaceLogin>(
  (ref) {
    return LoginApi();
  },
);
