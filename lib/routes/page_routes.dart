// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sales_progress_report/ui/modul/menu/menu_page_connect.dart';
import '../ui/modul/authentication/auth.dart';
import 'route_name.dart';
import '../ui/splashscreen/splashscreen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(); //global dialog
abstract class AppRoutes{
  static GoRouter pages = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(path: RouteName.splashScreen, builder: (context, state) => const SplashScreen()),
      GoRoute(path: RouteName.auth, builder: (context, state){
        final argument = state.extra as Map<String, bool>? ?? {};
        return Auth(login: argument['login']!,);
      }),
      GoRoute(path: RouteName.menuPageConnect, builder: (context, state){
        final argument = state.extra as Map<String, int>? ?? {};
        final refreshKey = state..uri.queryParameters['refresh'];
        return MenuPageConnect(
          key: ValueKey(state.extra.hashCode),
          select: double.parse(argument['select']!.toString()).toInt(),
          refreshKey: refreshKey,
        );
      }),
    ],
  );
}