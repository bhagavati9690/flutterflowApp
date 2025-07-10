import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Email = prefs.getString('ff_Email') ?? _Email;
    });
    _safeInit(() {
      _password = prefs.getString('ff_password') ?? _password;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _visibalMap = true;
  bool get visibalMap => _visibalMap;
  set visibalMap(bool value) {
    _visibalMap = value;
  }

  bool _IsLoggedInUser = false;
  bool get IsLoggedInUser => _IsLoggedInUser;
  set IsLoggedInUser(bool value) {
    _IsLoggedInUser = value;
  }

  String _SessionToken = '';
  String get SessionToken => _SessionToken;
  set SessionToken(String value) {
    _SessionToken = value;
  }

  String _custmorName = 'Guest';
  String get custmorName => _custmorName;
  set custmorName(String value) {
    _custmorName = value;
  }

  double _latitude = 42.3601;
  double get latitude => _latitude;
  set latitude(double value) {
    _latitude = value;
  }

  double _longituade = -71.4325;
  double get longituade => _longituade;
  set longituade(double value) {
    _longituade = value;
  }

  String _place = 'Boston';
  String get place => _place;
  set place(String value) {
    _place = value;
  }

  String _region = 'MA';
  String get region => _region;
  set region(String value) {
    _region = value;
  }

  String _pincode = '';
  String get pincode => _pincode;
  set pincode(String value) {
    _pincode = value;
  }

  String _country = '';
  String get country => _country;
  set country(String value) {
    _country = value;
  }

  bool _locationCalled = true;
  bool get locationCalled => _locationCalled;
  set locationCalled(bool value) {
    _locationCalled = value;
  }

  String _to = '';
  String get to => _to;
  set to(String value) {
    _to = value;
  }

  DateTime? _customCalendar2Selection =
      DateTime.fromMillisecondsSinceEpoch(1738662420000);
  DateTime? get customCalendar2Selection => _customCalendar2Selection;
  set customCalendar2Selection(DateTime? value) {
    _customCalendar2Selection = value;
  }

  String _eventId = '';
  String get eventId => _eventId;
  set eventId(String value) {
    _eventId = value;
  }

  DateTime? _altDate1Event;
  DateTime? get altDate1Event => _altDate1Event;
  set altDate1Event(DateTime? value) {
    _altDate1Event = value;
  }

  DateTime? _altDate2Event;
  DateTime? get altDate2Event => _altDate2Event;
  set altDate2Event(DateTime? value) {
    _altDate2Event = value;
  }

  DateTime? _ItemDate = DateTime.fromMillisecondsSinceEpoch(1739281320000);
  DateTime? get ItemDate => _ItemDate;
  set ItemDate(DateTime? value) {
    _ItemDate = value;
  }

  DateTime? _ItemAltDate1;
  DateTime? get ItemAltDate1 => _ItemAltDate1;
  set ItemAltDate1(DateTime? value) {
    _ItemAltDate1 = value;
  }

  DateTime? _ItemAltDate2;
  DateTime? get ItemAltDate2 => _ItemAltDate2;
  set ItemAltDate2(DateTime? value) {
    _ItemAltDate2 = value;
  }

  String _customChoiceChipSelection = '-1';
  String get customChoiceChipSelection => _customChoiceChipSelection;
  set customChoiceChipSelection(String value) {
    _customChoiceChipSelection = value;
  }

  /// The number which appears above shoppingcart
  /// in browser
  ///
  String _cartCount = '';
  String get cartCount => _cartCount;
  set cartCount(String value) {
    _cartCount = value;
  }

  String _Email = 'bhagavati@celebratix.com';
  String get Email => _Email;
  set Email(String value) {
    _Email = value;
    prefs.setString('ff_Email', value);
  }

  String _password = '1234';
  String get password => _password;
  set password(String value) {
    _password = value;
    prefs.setString('ff_password', value);
  }

  String _distance = '25 Mile';
  String get distance => _distance;
  set distance(String value) {
    _distance = value;
  }

  String _SerchtextVenue = '';
  String get SerchtextVenue => _SerchtextVenue;
  set SerchtextVenue(String value) {
    _SerchtextVenue = value;
  }

  bool _rentalVisible = false;
  bool get rentalVisible => _rentalVisible;
  set rentalVisible(bool value) {
    _rentalVisible = value;
  }

  bool _entertainerVisible = false;
  bool get entertainerVisible => _entertainerVisible;
  set entertainerVisible(bool value) {
    _entertainerVisible = value;
  }

  bool _cakeVisible = false;
  bool get cakeVisible => _cakeVisible;
  set cakeVisible(bool value) {
    _cakeVisible = value;
  }

  DocumentReference? _currentUserId;
  DocumentReference? get currentUserId => _currentUserId;
  set currentUserId(DocumentReference? value) {
    _currentUserId = value;
  }

  UserStruct _currentUser = UserStruct();
  UserStruct get currentUser => _currentUser;
  set currentUser(UserStruct value) {
    _currentUser = value;
  }

  void updateCurrentUserStruct(Function(UserStruct) updateFn) {
    updateFn(_currentUser);
  }

  String _userType = 'consumer';
  String get userType => _userType;
  set userType(String value) {
    _userType = value;
  }

  String _profilePic =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/celebratix-u9fafm/assets/733pip1s33kw/profile.jpeg';
  String get profilePic => _profilePic;
  set profilePic(String value) {
    _profilePic = value;
  }

  int _resourceId = -1;
  int get resourceId => _resourceId;
  set resourceId(int value) {
    _resourceId = value;
  }

  String _customChoiceChipSelection2 = '-1';
  String get customChoiceChipSelection2 => _customChoiceChipSelection2;
  set customChoiceChipSelection2(String value) {
    _customChoiceChipSelection2 = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
