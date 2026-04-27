// import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sales_progress_report/model/hive/profile/profile_user/model_hive_profile_user.dart';
// import 'package:sales_progress_report/riverpod/profile_riverpod/gambar_user/gambar_user_riverpod.dart';
// import 'package:sales_progress_report/riverpod/core_control/riverpod/log_riverpod/log_riverpod.dart';
// import 'package:sales_progress_report/shared/theme_hive.dart';
// import 'package:sales_progress_report/shared/theme_konstanta.dart';

// ModelHiveProfileUser decodeJwtToProfile(String token) {
//   final decodedJwt = JWT.verify(token, SecretKey(screatKey));
//   return ModelHiveProfileUser(
//     empName: decodedJwt.payload['user']?['emp_name'] ?? "",
//     position: decodedJwt.payload['user']?['position'] ?? "",
//     office: decodedJwt.payload['user']?['office'] ?? "",
//     company: decodedJwt.payload['user']?['company'] ?? "",
//     onDuty: decodedJwt.payload['user']?['on_duty'] ?? "",
//     offDuty: decodedJwt.payload['user']?['off_duty'] ?? "",
//     dayOff: decodedJwt.payload['user']?['day_off'] ?? false,
//     statusTraining: decodedJwt.payload['status_training'] ?? false,
//     pathPhoto: decodedJwt.payload['user']?['path_photo'] ?? "",
//     infoLink : decodedJwt.payload['option_token'] ?? "",
//     pin: decodedJwt.payload['user']?['pin2'] ?? "",
//     kodeSales: decodedJwt.payload['user']?['sales_code'] ?? "",
//     role: decodedJwt.payload['user']?['role'] ?? "",
//     infoLink: decodedJwt.payload['info_link'] ?? "",
//   );
// }

// final gambarUserSaveHaveRiverpod = FutureProvider.family<void, String>((ref, token) async {
//   try {
//     final profile = await compute(decodeJwtToProfile, token);
//     await (await profileUserBox).add(profile);
//     await ref.read(gambarUserRiverpod.notifier).gambarUser();
//   } catch (e) {
//     await ref.read(logRiverpod.notifier).logData(
//       username: (await usernameBox).get('username').toString(),
//       module: "sales",
//       transactionType: "GET", 
//       actionDetails: "$e",
//       status: "0",
//       tableName: "foto profile",
//     );
//     throw Exception("Gagal decode JWT: $e");
//   }
// });