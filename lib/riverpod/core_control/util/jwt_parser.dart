import 'dart:convert';

class JwtParser {
  static Map<String, dynamic> parse(String token) {
    final payload = token.split('.')[1];
    return jsonDecode(
      utf8.decode(base64Url.decode(base64Url.normalize(payload))),
    );
  }
}