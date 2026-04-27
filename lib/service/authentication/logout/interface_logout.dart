// ignore_for_file: non_constant_identifier_names

abstract class InterfaceLogout{
  late String urlLogout = "";
  late bool status = false;
  late String message = "";
  Future<Map<String, dynamic>> logoutUser({required String token});
}