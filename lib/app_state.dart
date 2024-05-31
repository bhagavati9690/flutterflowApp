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

  bool _visibalMap = true;
  bool get visibalMap => _visibalMap;
  set visibalMap(bool value) {
    _visibalMap = value;
  }

  String _banquetHall =
      'https://5.imimg.com/data5/KD/ED/TR/SELLER-97243288/banquet-hall-interior-design-services-1000x1000.jpg';
  String get banquetHall => _banquetHall;
  set banquetHall(String value) {
    _banquetHall = value;
  }
}
