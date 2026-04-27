import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/service/authentication/logout/interface_logout.dart';
import 'package:sales_progress_report/service/authentication/logout/logout.dart';

final injectionLogout = Provider<InterfaceLogout>(
  (ref) {
    return LogoutApi();
  },
);