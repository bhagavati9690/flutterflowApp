// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    String? city,
    String? state,
    String? street,
    String? postalCode,
    String? country,
    String? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _city = city,
        _state = state,
        _street = street,
        _postalCode = postalCode,
        _country = country,
        _address = address,
        super(firestoreUtilData);

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  set street(String? val) => _street = val;

  bool hasStreet() => _street != null;

  // "postalCode" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;

  bool hasPostalCode() => _postalCode != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        city: data['city'] as String?,
        state: data['state'] as String?,
        street: data['street'] as String?,
        postalCode: data['postalCode'] as String?,
        country: data['country'] as String?,
        address: data['address'] as String?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'city': _city,
        'state': _state,
        'street': _street,
        'postalCode': _postalCode,
        'country': _country,
        'address': _address,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'street': serializeParam(
          _street,
          ParamType.String,
        ),
        'postalCode': serializeParam(
          _postalCode,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        street: deserializeParam(
          data['street'],
          ParamType.String,
          false,
        ),
        postalCode: deserializeParam(
          data['postalCode'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        city == other.city &&
        state == other.state &&
        street == other.street &&
        postalCode == other.postalCode &&
        country == other.country &&
        address == other.address;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([city, state, street, postalCode, country, address]);
}

AddressStruct createAddressStruct({
  String? city,
  String? state,
  String? street,
  String? postalCode,
  String? country,
  String? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      city: city,
      state: state,
      street: street,
      postalCode: postalCode,
      country: country,
      address: address,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? addressStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addressStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? addressStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addressStruct == null) {
    return;
  }
  if (addressStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addressStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressStructData =
      getAddressFirestoreData(addressStruct, forFieldValue);
  final nestedData =
      addressStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addressStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? addressStruct, [
  bool forFieldValue = false,
]) {
  if (addressStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addressStruct.toMap());

  // Add any Firestore field values
  addressStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addressStructs,
) =>
    addressStructs?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
