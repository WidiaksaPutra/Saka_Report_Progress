// ignore_for_file: no_leading_underscores_for_local_identifiers, body_might_complete_normally_nullable, unused_field

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';

final globalLocalStorage = Provider<TokenLocalStorage>((ref) {
  return TokenLocalStorage();
});

class TokenLocalStorage {
  TokenLocalStorage();
  
  static const _keyToken = 'token';
  static const _keyEndPoint1 = 'end_point1';
  static const _keyEndPoint2 = 'end_point2';

  Future<void> save(String token, String endPoint1, String endPoint2) async {
    final _box = await userStorageBox;
    await _box.put(_keyToken, token);
    await _box.put(_keyEndPoint1, endPoint1);
    await _box.put(_keyEndPoint2, endPoint2);
  }

  Future<Map<String, String?>> get() async{
    final _box = await userStorageBox;
    return {
      'token': _box.get(_keyToken).toString(),
      'end_point1': _box.get(_keyEndPoint1).toString(),
      'end_point2': _box.get(_keyEndPoint2).toString(),
    };
  }

  Future<void> clear() async {
    final _box = await userStorageBox;
    await _box.delete(_keyToken);
    await _box.delete(_keyEndPoint1);
    await _box.delete(_keyEndPoint2);
  }
}
