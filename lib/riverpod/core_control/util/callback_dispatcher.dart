// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workmanager/workmanager.dart';

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     Consumer(builder: (context, ref, child){
//       // ref.read(logRiverpod.notifier).logData(
//       //   username: "splashscreen", 
//       //   module: "sales",
//       //   transactionType: "INSERT", 
//       //   actionDetails: "$versiAplikasi test background...",
//       //   status: "0", 
//       //   tableName: "splashscreen",
//       // );
//       Future.microtask(() async{
//         await ref.watch(postTrackPositionRiverpod.notifier).trackPositionData(
//           context: context,
//           latitude: position.latitude.toString(),
//           longitude: position.longitude.toString(),
//           ref: ref,
//         );
//       });
//       return SizedBox();
//     });
//     return Future.value(true);
//   });
// }






void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      await Hive.initFlutter();

      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );

      final box = await Hive.openBox('positionBox');
      await box.put('background_position', {
        'latitude': position.latitude,
        'longitude': position.longitude,
        'timestamp': DateTime.now().toIso8601String(),
      });

      debugPrint("📦 Background location saved to Hive");

      return Future.value(true);
    } catch (e, s) {
      debugPrint("❌ Background error: $e\n$s");
      return Future.value(false);
    }
  });
}
