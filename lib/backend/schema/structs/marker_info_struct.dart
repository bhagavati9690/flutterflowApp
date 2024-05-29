// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarkerInfoStruct extends BaseStruct {
  MarkerInfoStruct({
    LatLng? point,
    String? venueType,
    String? address,
    String? name,
    String? price,
    String? activityType,
    String? activityCategory,
  })  : _point = point,
        _venueType = venueType,
        _address = address,
        _name = name,
        _price = price,
        _activityType = activityType,
        _activityCategory = activityCategory;

  // "point" field.
  LatLng? _point;
  LatLng? get point => _point;
  set point(LatLng? val) => _point = val;
  bool hasPoint() => _point != null;

  // "venueType" field.
  String? _venueType;
  String get venueType => _venueType ?? '';
  set venueType(String? val) => _venueType = val;
  bool hasVenueType() => _venueType != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;
  bool hasPrice() => _price != null;

  // "activityType" field.
  String? _activityType;
  String get activityType => _activityType ?? '';
  set activityType(String? val) => _activityType = val;
  bool hasActivityType() => _activityType != null;

  // "activityCategory" field.
  String? _activityCategory;
  String get activityCategory => _activityCategory ?? '';
  set activityCategory(String? val) => _activityCategory = val;
  bool hasActivityCategory() => _activityCategory != null;

  static MarkerInfoStruct fromMap(Map<String, dynamic> data) =>
      MarkerInfoStruct(
        point: data['point'] as LatLng?,
        venueType: data['venueType'] as String?,
        address: data['address'] as String?,
        name: data['name'] as String?,
        price: data['price'] as String?,
        activityType: data['activityType'] as String?,
        activityCategory: data['activityCategory'] as String?,
      );

  static MarkerInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? MarkerInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'point': _point,
        'venueType': _venueType,
        'address': _address,
        'name': _name,
        'price': _price,
        'activityType': _activityType,
        'activityCategory': _activityCategory,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'point': serializeParam(
          _point,
          ParamType.LatLng,
        ),
        'venueType': serializeParam(
          _venueType,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
        'activityType': serializeParam(
          _activityType,
          ParamType.String,
        ),
        'activityCategory': serializeParam(
          _activityCategory,
          ParamType.String,
        ),
      }.withoutNulls;

  static MarkerInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarkerInfoStruct(
        point: deserializeParam(
          data['point'],
          ParamType.LatLng,
          false,
        ),
        venueType: deserializeParam(
          data['venueType'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
        activityType: deserializeParam(
          data['activityType'],
          ParamType.String,
          false,
        ),
        activityCategory: deserializeParam(
          data['activityCategory'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MarkerInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MarkerInfoStruct &&
        point == other.point &&
        venueType == other.venueType &&
        address == other.address &&
        name == other.name &&
        price == other.price &&
        activityType == other.activityType &&
        activityCategory == other.activityCategory;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [point, venueType, address, name, price, activityType, activityCategory]);
}

MarkerInfoStruct createMarkerInfoStruct({
  LatLng? point,
  String? venueType,
  String? address,
  String? name,
  String? price,
  String? activityType,
  String? activityCategory,
}) =>
    MarkerInfoStruct(
      point: point,
      venueType: venueType,
      address: address,
      name: name,
      price: price,
      activityType: activityType,
      activityCategory: activityCategory,
    );
