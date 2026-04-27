// ignore_for_file: await_only_futures

import 'dart:async';

import 'package:geolocator/geolocator.dart';

class RadiusLocationControll{
  Future<bool> validasiInRadius({
    required double latTargetLocation,
    required double langTargetLocation,
    required double latNowLocation,
    required double langNowLocation,
    required double radius,
  }) async {
    // //print("test radius");
    double _radius = radius*1000.0;
    double distance = await Geolocator.distanceBetween(
      latTargetLocation,
      langTargetLocation,
      latNowLocation,
      langNowLocation,
    );
    
    if (distance <= _radius && distance != _radius) {
      return true;
    }else{
      return false;
    }
  }
}