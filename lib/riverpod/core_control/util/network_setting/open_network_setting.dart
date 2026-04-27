import 'package:flutter/services.dart';

class OpenNetworkSetting {
  static const platform = MethodChannel('com.example.open_network_channel');

  static Future<void> openNetwork() async {
    try {
      await platform.invokeMethod('openNetworkSettings');
    } on PlatformException catch (e) {
      print("Failed to get Android ID: '${e.message}'.");
    }
  }
}