// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final isLoadingPencahayaanRiverpod = StateProvider.autoDispose<bool>((ref) => false);

// final pencahayaanRiverpod = StateNotifierProvider.autoDispose<PencahayaanRiverpod, bool>((ref) => PencahayaanRiverpod(ref));

// class PencahayaanRiverpod extends StateNotifier<bool> implements InterfacePencahayaanRiverpod{
//   PencahayaanRiverpod(ref) : super(false);

//   @override
//   Future<void> logoutData({required BuildContext context, required bool logoutStatus}) async{
//     final logoutProses = await _dataLogout.logoutUser();
//     if (logoutProses['status'] == true){
//       await (await accessTokenBox).clear();
//       await loginBox.put("login", false);
//       await (await tipeKunjunganBox).clear();
//       state = false;
//       if(logoutStatus == true){
//         //print("test logout ${logoutProses['message']}");
//         DialogBasic().voidDialogBasic(
//           padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
//           borderRadius: BorderRadius.circular(10.r),
//           color:kWhiteColor,
//           context: context, 
//           CloseIconStatus: false,
//           barrierDismissible: false,
//           autoClose: true,
//           navigationAfter: true,
//           routeNameGo: RouteName.auth,
//           extra: {'login': true},
//           contentDialog: ComponenContentDialog_ImageAndTitleText(
//             image: 'assets/animations/check_lottie.json', 
//             text: Text((logoutProses['message'] == "") ? snackBarLogoutBerhasil : logoutProses['message'], style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
//           ),
//         );
//       }
//     } else {
//       state = false;
//       if(logoutStatus == true){
//         DialogBasic().voidDialogBasic(
//           padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
//           borderRadius: BorderRadius.circular(10.r),
//           color:kWhiteColor,
//           context: context, 
//           CloseIconStatus: false,
//           barrierDismissible: false,
//           autoClose: true,
//           contentDialog: ComponenContentDialog_ImageAndTitleText(
//             image: 'assets/animations/close_lottie.json', 
//             text: Text(snackBarLogoutGagal, style: TextStyle(fontWeight: regular, fontSize: defaultFont14, color: kGreyColor)),
//           ),
//         );
//       }
//     }
//   }
// }