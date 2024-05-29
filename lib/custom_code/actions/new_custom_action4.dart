// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:maxminddb/maxminddb.dart';

Future newCustomAction4() async {
  // Add your function code here!
  final database = await MaxMindDatabase.file(File('GeoLite2-City.mmdb'));

  print(await database.search('8.8.8.8'));
}
