// // ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously, unrelated_type_equality_checks

// // import 'package:another_telephony/telephony.dart';
// // import 'package:another_telephony/telephony.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sales_progress_report/riverpod/util/util/snack_bar.dart';
// import 'package:sales_progress_report/shared/theme_color.dart';
// import 'package:sales_progress_report/shared/theme_hive.dart';

// class TelephonyService {
  
//   // final _telephony = Telephony.instance;
//   late List _signalStrength = [];
//   late String _cacheValue = "SignalStrength.EXCELLENT";
//   Future<String> getSignalStrength({required WidgetRef ref, required BuildContext context}) async {
//     // return "SignalStrength.EXCELLENT";
//     try {
//       // _signalStrength = await _telephony.signalStrengths;
//       if(_signalStrength.isNotEmpty || _signalStrength != null){
//         // await ref.read(logRiverpod.notifier).logData(
//         //   username: "splashscreen", 
//         //   module: "sales",
//         //   transactionType: "INSERT", 
//         //   actionDetails: "test telephony...${_signalStrength.toString()}",
//         //   status: "0", 
//         //   tableName: "controller splashscreen",
//         // );
//         _cacheValue = _signalStrength[0].toString();
//       }
//       // else{
//       //   _signalStrength = await _telephony.getConversations();
//       //   if(_signalStrength.isNotEmpty || _signalStrength != null){
          
//       //   }
//       // }
//       return _cacheValue;
//     } catch (e) {
//       if((await usernameBox).get('username') != null){  
//         try {
//           // _signalStrength = await _telephony.signalStrengths;
//           if(_signalStrength.isNotEmpty || _signalStrength != null){
//             // await ref.read(logRiverpod.notifier).logData(
//             //   username: "splashscreen", 
//             //   module: "sales",
//             //   transactionType: "INSERT", 
//             //   actionDetails: "test telephony...${_signalStrength.toString()}",
//             //   status: "0", 
//             //   tableName: "controller splashscreen",
//             // );
//             _cacheValue = _signalStrength[0].toString();
//           }
//           return _cacheValue;
//         }catch (e){
//            return _cacheValue;
//         }
//       }else{
//         await UtilSnackBar().snackBar(
//           context: context,
//           margin: EdgeInsets.only(bottom: 100.0.h, left: 10.0.w, right: 10.0.w),
//           textSnackBar: "anda menolak pengecekan koneksi internet, aktifkan izin penggunaan SIM...",
//           backgroudColor:const Color.fromARGB(255, 255, 248, 189),
//           textColor: kGreyColor,
//         );
//       }
      
//       return _cacheValue;
//       // Future.delayed(const Duration(milliseconds: 2000));
//       // await Geolocator.openAppSettings();
//       // FlutterExitApp.exitApp();
//     }
//   }
// }