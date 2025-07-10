// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';

Future<LatLng> determinePosition() async {
  // Default location: Boston, MA
  const LatLng bostonLatLng = LatLng(42.3601, -71.0589);

  // Add your function code here!
  // This function returns the current position of the device using the Geolocator package

  LocationPermission permission;

  print("Checking if location services are enabled...");

  // Test if location services are enabled.
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the App to enable the location services.

    // return Future.error('Location services are disabled.');
    print("Location services are disabled. Returning default location.");
    // Location services are not enabled, return default location
    return bostonLatLng;
  }
  print("Location services are enabled.");

  permission = await Geolocator.checkPermission();
  print("Location permission status: $permission");

  if (permission == LocationPermission.denied) {
    print("Location permission denied, requesting permission...");
    permission = await Geolocator.requestPermission();
    print("Location permission status after request: $permission");

    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.

      //  return Future.error('Location permissions are denied');
      print("Location permission still denied. Returning default location.");
      // Permissions are denied, return default location
      return bostonLatLng;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    // return Future.error(
    //    'Location permissions are permanently denied, we cannot request permissions.');
    print(
        "Location permission permanently denied. Returning default location.");

    // Permissions are denied, return default location
    return bostonLatLng;
  }

  /*Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  print("position");
  print(position);
  return LatLng(position.latitude, position.longitude);*/

  try {
    // Get the current position with high accuracy
    print("Attempting to get current position...");
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(
        "Current position obtained: Latitude: ${position.latitude}, Longitude: ${position.longitude}");

    print(position);
    // Return the current location
    return LatLng(position.latitude, position.longitude);
  } catch (e) {
    // If there is an error getting the position, return the default location
    print("Error while getting location: $e");
    return bostonLatLng;
  }
}
