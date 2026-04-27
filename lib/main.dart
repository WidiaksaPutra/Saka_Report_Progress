// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sales_progress_report/main/hive_init.dart';
import 'package:sales_progress_report/main/main_screen.dart'; 
import 'package:sales_progress_report/riverpod/core_control/util/callback_dispatcher.dart';
import 'package:workmanager/workmanager.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async{
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint("Flutter Error Caught:");
    debugPrint(details.exceptionAsString());
    debugPrint(details.stack.toString());
  };

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,

      statusBarBrightness: Brightness.light,
    ),
  );

  await HiveService.instance.initializeWithLifecycle();

  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );
  
  await Workmanager().registerPeriodicTask(
    "background_location_task",
    "fetchLocation",
    frequency: const Duration(minutes: 15),
    initialDelay: const Duration(minutes: 1),
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
  
  initializeDateFormatting('in').then((_) =>
    runZonedGuarded(() {runApp(const ProviderScope(child: MyApp(env: 'PROD')));},
    (error, stackTrace) {
      debugPrint("Zone error:");
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
    }),
  );
}

class MyApp extends StatelessWidget {
  final String env;
  const MyApp({super.key, required this.env});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MainScreen(),
    );
  }
}