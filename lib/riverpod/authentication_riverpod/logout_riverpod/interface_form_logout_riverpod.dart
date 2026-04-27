import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class InterfaceFormLogoutRiverpod{
  Future<void> logoutData({
    required BuildContext context,
    required bool logoutStatus
  });
}