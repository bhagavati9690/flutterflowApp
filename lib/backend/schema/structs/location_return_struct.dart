// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LocationReturnStruct extends FFFirebaseStruct {
  LocationReturnStruct({
    double? latitude,
    double? longitude,
    String? country,
    String? place,
    String? postalCode,
    String? region,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _latitude = latitude,
        _longitude = longitude,
        _country = country,
        _place = place,
        _postalCode = postalCode,
        _region = region,
        super(firestoreUtilData);

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;

  void incrementLatitude(double amount) => latitude = latitude + amount;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;

  void incrementLongitude(double amount) => longitude = longitude + amount;

  bool hasLongitude() => _longitude != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  set place(String? val) => _place = val;

  bool hasPlace() => _place != null;

  // "postalCode" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;

  bool hasPostalCode() => _postalCode != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  set region(String? val) => _region = val;

  bool hasRegion() => _region != null;

  static LocationReturnStruct fromMap(Map<String, dynamic> data) =>
      LocationReturnStruct(
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
        country: data['country'] as String?,
        place: data['place'] as String?,
        postalCode: data['postalCode'] as String?,
        region: data['region'] as String?,
      );

  static LocationReturnStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationReturnStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'latitude': _latitude,
        'longitude': _longitude,
        'country': _country,
        'place': _place,
        'postalCode': _postalCode,
        'region': _region,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'place': serializeParam(
          _place,
          ParamType.String,
        ),
        'postalCode': serializeParam(
          _postalCode,
          ParamType.String,
        ),
        'region': serializeParam(
          _region,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationReturnStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationReturnStruct(
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        place: deserializeParam(
          data['place'],
          ParamType.String,
          false,
        ),
        postalCode: deserializeParam(
          data['postalCode'],
          ParamType.String,
          false,
        ),
        region: deserializeParam(
          data['region'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocationReturnStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationReturnStruct &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        country == other.country &&
        place == other.place &&
        postalCode == other.postalCode &&
        region == other.region;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([latitude, longitude, country, place, postalCode, region]);
}

LocationReturnStruct createLocationReturnStruct({
  double? latitude,
  double? longitude,
  String? country,
  String? place,
  String? postalCode,
  String? region,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationReturnStruct(
      latitude: latitude,
      longitude: longitude,
      country: country,
      place: place,
      postalCode: postalCode,
      region: region,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationReturnStruct? updateLocationReturnStruct(
  LocationReturnStruct? locationReturn, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationReturn
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationReturnStructData(
  Map<String, dynamic> firestoreData,
  LocationReturnStruct? locationReturn,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationReturn == null) {
    return;
  }
  if (locationReturn.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationReturn.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationReturnData =
      getLocationReturnFirestoreData(locationReturn, forFieldValue);
  final nestedData =
      locationReturnData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = locationReturn.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationReturnFirestoreData(
  LocationReturnStruct? locationReturn, [
  bool forFieldValue = false,
]) {
  if (locationReturn == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationReturn.toMap());

  // Add any Firestore field values
  locationReturn.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationReturnListFirestoreData(
  List<LocationReturnStruct>? locationReturns,
) =>
    locationReturns
        ?.map((e) => getLocationReturnFirestoreData(e, true))
        .toList() ??
    [];
