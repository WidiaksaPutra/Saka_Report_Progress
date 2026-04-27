import 'package:flutter/services.dart';

class DeviceInfo {
  static const platform = MethodChannel('com.example.device_info');

  Future<String> getAndroidId() async {
    try {
      final String androidId = await platform.invokeMethod('getAndroidId');
      // final String androidId = await platform.invokeMethod('getIMEI');
      return androidId;
    } on PlatformException catch (e) {
      return "Failed to get Android ID: '${e.message}'.";
    }
  }
}