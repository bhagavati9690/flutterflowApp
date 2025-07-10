import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'IPBasedDev';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _BaseUrl = data['BaseUrl'];
      _AuthHeader = data['AuthHeader'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _BaseUrl = '';
  String get BaseUrl => _BaseUrl;

  String _AuthHeader = '';
  String get AuthHeader => _AuthHeader;
}
