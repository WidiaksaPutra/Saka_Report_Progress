// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_field

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_progress_report/riverpod/core_control/riverpod/storage/token_local_storage.dart';
import 'package:sales_progress_report/riverpod/core_control/util/jwt_parser.dart';
import 'package:sales_progress_report/session/session_data.dart';

final sessionNotifierProvider = StateNotifierProvider<SessionNotifier, SessionData?>((ref) {
  // final _profileRepo = ref.read(profileRepoProvider);
  final _globalLocalLocalStorage = ref.read(globalLocalStorage);
  return SessionNotifier(_globalLocalLocalStorage);
});

class SessionNotifier extends StateNotifier<SessionData?> {
  // final ProfileRepositoryHive _profileRepo;
  final TokenLocalStorage _tokenLocalStorage;
  SessionNotifier(this._tokenLocalStorage) : super(null);

  Future<void> dataToken(String token, String endPoint1, String endPoint2) async {
    final payload = JwtParser.parse(token);
     
    await _tokenLocalStorage.save(token, endPoint1, endPoint2);
    state = SessionData(
      token: token,
    );
  }
}
