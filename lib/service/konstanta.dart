// ignore_for_file: unnecessary_string_interpolations

import 'package:http/http.dart' as https;

class BASICAPI {
  static var client = https.Client();
  //ingat di hp menggunakan wifi saka
  // static var baseURL = "http://172.17.1.56:8000/api/sipil/v1"; //dev bayu
  // static var baseURL = "http://172.17.1.47:8000/api/sipil/v1";//dev widi
  static var baseURL = "https://mobile-apisakasystem.pt-saa.com/api/general/v1";
  static var baseURL2 = "https://web.pt-saa.com";

  static var baseURLTelegram = "https://api.telegram.org";
  // static var baseURLUnshorten = "https://unshorten.me";
  static var baseURLShortToLong = "https://web.pt-saa.com/api-mobile/short-to-long-link?";

  static var urlGetFileLama = "/bot354774826:AAFQcuKVxboChy94A3739wZ1fAjTbg3GeTo/getFile?";
  static var urlGetFileBaru = "/bot7547182994:AAEU8_8wt9-yB8TB0sYtpY79LO1NSTXkGlY/getFile?";
  static var baseImageURLTelegramLama = "https://api.telegram.org/file/bot354774826:AAFQcuKVxboChy94A3739wZ1fAjTbg3GeTo/";
  static var baseImageURLTelegramBaru = "https://api.telegram.org/file/bot7547182994:AAEU8_8wt9-yB8TB0sYtpY79LO1NSTXkGlY/";
  // https://api.telegram.org/bot354774826:AAFQcuKVxboChy94A3739wZ1fAjTbg3GeTo/getFile?file_id=AgACAgUAAxkBAAFkDD9nIdo1gqF6qeqJ3aIVhUDdxck2cwAC270xG7ebEFU6Q3ehilrW4wEAAwIAA3kAAzYE
  static var baseURLAddreass = "https://alamat.thecloudalert.com/api";
  static var urlGoogleMapsPlaceLocation = "https://maps.googleapis.com/maps/api/place/textsearch/json?";

  //post
  static var urlLogin = "$baseURL/login";
}


// # Run Dev
// flutter run -t lib/main_dev.dart --flavor dev

// # Run Staging
// flutter run -t lib/main_staging.dart --flavor staging

// # Run Prod
// flutter run -t lib/main_prod.dart --flavor prod

// # Build APK Prod
// flutter build apk --flavor prod -t lib/main_prod.dart

// # Build iOS Prod
// flutter build ios --flavor prod -t lib/main_prod.dart
