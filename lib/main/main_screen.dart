// ignore_for_file: use_super_parameters, unused_local_variable
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes/page_routes.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final Size designSize = Platform.isWindows || Platform.isMacOS || Platform.isLinux
      ? const Size(1200, 800)
      : (width >= 600 && width < 1200)
        ? const Size(720, 1280)
        : const Size(375 , 812);

    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.pages,
      ),
    );
  }
}