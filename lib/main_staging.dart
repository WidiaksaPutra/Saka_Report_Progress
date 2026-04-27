// // ignore_for_file: prefer_const_constructors, override_on_non_overriding_member
// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sales_progress_report/main.dart';
// import 'package:sales_progress_report/config/config.dart';
// import 'package:sales_progress_report/main/dependency_injection_init.dart';
// import 'package:sales_progress_report/riverpod/util/util/callback_dispatcher.dart';
// import 'package:workmanager/workmanager.dart';
// import 'main/hive_init.dart';
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Config.load('lib/config/staging.env');

//   await HiveService().hiveInit();
  
//   Workmanager().initialize(
//     callbackDispatcher,
//     isInDebugMode: true,
//   );
  
//   Workmanager().registerPeriodicTask(
//     "1",
//     "fetchLocation",
//     // frequency: Duration(minutes: 15),
//   );
  
//   dependencyInjectionInit();
  
//   initializeDateFormatting('in').then((_) =>
//     runApp(const ProviderScope(child: MyApp(env: 'STAGING')))
//   );
// }
