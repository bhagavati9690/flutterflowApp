// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geocoding/geocoding.dart';

Future<String> newCustomAction(LatLng? loc) async {
  // CONVERT LAT LONG TO STRING
  print(loc);
  if (loc == null) {
    return "";
  }
  String lat = loc.latitude.toStringAsFixed(6);
  print(lat);
  String lng = loc.longitude.toStringAsFixed(6);
  print(lng);
  String loca = lat + "  , " + lng;
  print(loca);

  if (lat.isEmpty || lng.isEmpty) {
    print('Latitude or longitude is empty');
    return "";
  }

  return loca;
}
