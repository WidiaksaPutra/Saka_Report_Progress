// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_init_to_null, unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';

import 'package:sales_progress_report/model/service/authentication/login.dart';
import 'package:sales_progress_report/service/authentication/login/excaption_login.dart';
import 'package:sales_progress_report/service/authentication/login/interface_login.dart';
import 'package:sales_progress_report/service/authentication/login/result_login.dart';
import 'package:sales_progress_report/service/konstanta.dart';

class LoginApi implements InterfaceLogin{
  
  @override
  Future<ResultLogin> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      print("testing login 2 $username $password service");
      final responsBody = await BASICAPI.client.post(Uri.parse(BASICAPI.urlLogin),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Connection": "keep-alive",
        },
        body: jsonEncode(<String, String>{
          "username": username,
          "password": password,
        }),
      ).timeout(const Duration(minutes: 3));
      final _jsonData = responsBody.body;
      final _loginRespons = loginModelFromJson(_jsonData);
      
      final _meta = _loginRespons.meta;
      final _data = _loginRespons.data;
     
      print("testing login 2 ${_meta?.code} ${responsBody.statusCode} ${_meta?.message.toString()}");
      if(_meta == null || _data == null || _meta.code != 200){
        throw ExcaptionLogin(
          statusCode: _meta?.code.toString() ?? '1000',
          statusMessage: _meta?.message.toString() ?? 'data null, tolong login ulang',
        );
      }

      return ResultLogin(
        token: _data.token.toString(),
        endPoin1: _data.endpointPermissions![0],
        endPoin2: _data.endpointPermissions![1],
      );
    } on TimeoutException {
      throw ExcaptionLogin(
        statusCode: '408',
        statusMessage: 'Koneksi timeout...',
      );
    } on ExcaptionLogin {
      rethrow;
    } catch (e) {
      throw ExcaptionLogin(
        statusCode: '1000',
        statusMessage: e.toString(),
      );
    }
  }
}