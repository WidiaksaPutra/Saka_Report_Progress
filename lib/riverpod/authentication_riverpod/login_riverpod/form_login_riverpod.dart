// ignore_for_file: no_leading_underscores_for_local_identifiers, await_only_futures

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_progress_report/riverpod/authentication_riverpod/login_riverpod/form_login_riverpod_state.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/log_riverpod/log_riverpod.dart';
import 'package:sales_progress_report/service/authentication/login/excaption_login.dart';
import 'package:sales_progress_report/service/authentication/login/injection_login.dart';
import 'package:sales_progress_report/service/authentication/login/interface_login.dart';
import 'package:sales_progress_report/session/session_notifier.dart';
import 'package:sales_progress_report/riverpod/authentication_riverpod/login_riverpod/helper_initial.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'interface_form_login_riverpod.dart';

final formLoginRiverpod = StateNotifierProvider<FormLoginRiverpod, FormLoginRiverpodState>((ref) {
  final serviceLogin = ref.read(injectionLogin);
  return FormLoginRiverpod(ref, serviceLogin);
});

class FormLoginRiverpod extends StateNotifier<FormLoginRiverpodState> implements InterfaceFormLoginRiverpod{
  final Ref ref;
  final InterfaceLogin serviceLogin;
  FormLoginRiverpod(this.ref, this.serviceLogin) : super(FormLoginRiverpodState(statusDialog: 0, message: '', statusCode: ''));

  @override
  Future<void> loginData({
    required String username,
    required String password,
    required bool connection,
  }) async{
    if (username != ""
      && password != ""
      && connection == true) {
      try{
        final _loginProses = await serviceLogin.loginUser(
          username: username,
          password: password,
        );
        print("testing login rev 200");
        await (await dropdownListTypeProgressReportBox).clear();

        await ref.read(sessionNotifierProvider.notifier).dataToken(
          _loginProses.token,
          _loginProses.endPoin1,
          _loginProses.endPoin2,
        );

        await (await usernameBox).put('username', username);
        await (await passwordBox).put('password', password);
        
        await (await modeOnlineBox).put('mode_online', true);
        await ref.read(loginInitProvider);
        state = state.copyWith(statusDialog: 1, message: 'success', statusCode: '200');
      }on ExcaptionLogin catch (e) {
        state = state.copyWith(statusDialog: 2, message: (e.statusCode == '1000') ? 'tolong priksa koneksi internet anda, dan informasikan kepada tim IT...' : e.statusMessage, statusCode: e.statusCode);
      }
    }else {
      state = state.copyWith(statusDialog: 2, message: 'isi username dan password dengan benar...', statusCode: '403');
    }
  }
}