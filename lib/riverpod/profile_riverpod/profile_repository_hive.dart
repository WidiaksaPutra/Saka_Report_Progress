// // ignore_for_file: no_leading_underscores_for_local_identifiers, unused_field

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sales_progress_report/model/hive/profile/profile_user/model_hive_profile_user.dart';
// import 'package:sales_progress_report/shared/theme_hive.dart';

// final profileRepoProvider = Provider<ProfileRepositoryHive>((ref) {
//   return ProfileRepositoryHive();
// });

// class ProfileRepositoryHive {
//   ProfileRepositoryHive();

//   Future<void> saveFromToken(Map<String, dynamic> token) async {
//     final _box = await profileUserBox;
//     final _profile = ModelHiveProfileUser.fromToken(token);
//     if(_box.isEmpty){
//       await _box.put(_profile.idUser, _profile);
//     }
//   }

//   Future<ModelHiveProfileUser?> get(int userId) async{
//     final _box = await profileUserBox;
//     return _box.get(userId);
//   }
// }
 