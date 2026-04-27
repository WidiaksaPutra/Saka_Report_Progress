// ignore_for_file: unused_element

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerMap{
  Marker markerMap({
    required MarkerId markerId,
    required LatLng position,
    required InfoWindow infoWindow,
  }){
    return Marker(
      markerId: markerId,
      position: position, // Koordinat Surabaya, Indonesia
      infoWindow: infoWindow,
    );
  }
}