// // ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously, prefer_final_fields, no_leading_underscores_for_local_identifiers, unused_field, avoid_init_to_null
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sales_progress_report/riverpod/profile_riverpod/gambar_user/interface_gambar_user_riverpod.dart';
// import 'package:sales_progress_report/service/profile/gambar_user/interface_gambar_user.dart';
// import 'package:sales_progress_report/shared/theme_hive.dart';
// import 'package:sales_progress_report/shared/theme_konstanta.dart';

// final gambarUserRiverpod = StateNotifierProvider.autoDispose<GambarUserRiverpod, bool>((ref) {
//   final service = getItInstance<InterfaceGambarUser>();
//   return GambarUserRiverpod(service);
// });

// class GambarUserRiverpod extends StateNotifier<bool> implements InterfaceGambarUserRiverpod{
//   final InterfaceGambarUser _dataInterfaceGambarUser;
//   GambarUserRiverpod(this._dataInterfaceGambarUser) : super(false);

//   @override
//   Future<void> gambarUser() async {
//     InterfaceGambarUser _dataGambar = await _dataInterfaceGambarUser.gambarUser();
//     if(_dataGambar != false){
//       final _gambarUser = await gambarUserBox;
//       await _gambarUser.put('gambar_user', _dataGambar);
//     }
//   }
// }