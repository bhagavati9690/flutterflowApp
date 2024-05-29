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

Future newCustomAction2() async {
  // Add your function code here!

  try {
    // Convert an address to coordinates
    List<Location> locations =
        await locationFromAddress("Gronausestraat 710, Enschede");

    if (locations.isNotEmpty) {
      print("Coordinates from address: $locations");
    } else {
      print("Address not found for the provided location.");
    }

    // Convert coordinates to an address
    List<Placemark> placemarks =
        await placemarkFromCoordinates(52.2165157, 6.9437819);

    if (placemarks.isNotEmpty) {
      print("Address from coordinates: $placemarks");
    } else {
      print("No address found for the provided coordinates.");
    }
  } catch (e) {
    print("Error: $e");
    print("Error: ${e.toString()}");

    print("Stack trace: ${StackTrace.current}");
  }
}
