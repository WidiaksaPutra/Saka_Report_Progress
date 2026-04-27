
import 'dart:convert';

import 'package:crypto/crypto.dart';

class Hashing{
  String hashing({required dynamic data}) {
    try {
      if (data.isEmpty) {
        throw ArgumentError('data string cannot be empty..');
      }
      var encodeBytes = utf8.encode(data);
      var hashData = sha256.convert(encodeBytes);
      return hashData.toString();
    } catch (e) {
      throw Exception('Encryption failed: $e');
    }
  }

  String shortHashing({required dynamic data, int length = 8}) {
    try {
      if (data.isEmpty) throw ArgumentError('Data tidak boleh kosong');
      final bytes = utf8.encode(data);
      final digest = sha256.convert(bytes).toString();
      return digest.substring(0, length);
    } catch (e) {
      throw Exception('Encryption failed: $e');
    }
  }
}
