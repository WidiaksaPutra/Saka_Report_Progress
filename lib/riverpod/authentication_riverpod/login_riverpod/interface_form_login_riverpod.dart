import 'package:flutter/material.dart';

abstract class InterfaceFormLoginRiverpod{
  Future<void> loginData({
    required String username, 
    required String password,
    required bool connection
  });
}