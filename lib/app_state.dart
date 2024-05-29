import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _nn = 0;
  int get nn => _nn;
  set nn(int value) {
    _nn = value;
  }

  bool _visibalMap = true;
  bool get visibalMap => _visibalMap;
  set visibalMap(bool value) {
    _visibalMap = value;
  }
}
