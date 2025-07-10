// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PlaceTypeSelectedListStruct extends FFFirebaseStruct {
  PlaceTypeSelectedListStruct({
    String? id,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        super(firestoreUtilData);

  // "Id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static PlaceTypeSelectedListStruct fromMap(Map<String, dynamic> data) =>
      PlaceTypeSelectedListStruct(
        id: data['Id'] as String?,
        name: data['name'] as String?,
      );

  static PlaceTypeSelectedListStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceTypeSelectedListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlaceTypeSelectedListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PlaceTypeSelectedListStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlaceTypeSelectedListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlaceTypeSelectedListStruct &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

PlaceTypeSelectedListStruct createPlaceTypeSelectedListStruct({
  String? id,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaceTypeSelectedListStruct(
      id: id,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaceTypeSelectedListStruct? updatePlaceTypeSelectedListStruct(
  PlaceTypeSelectedListStruct? placeTypeSelectedList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placeTypeSelectedList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaceTypeSelectedListStructData(
  Map<String, dynamic> firestoreData,
  PlaceTypeSelectedListStruct? placeTypeSelectedList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placeTypeSelectedList == null) {
    return;
  }
  if (placeTypeSelectedList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      placeTypeSelectedList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placeTypeSelectedListData = getPlaceTypeSelectedListFirestoreData(
      placeTypeSelectedList, forFieldValue);
  final nestedData =
      placeTypeSelectedListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      placeTypeSelectedList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaceTypeSelectedListFirestoreData(
  PlaceTypeSelectedListStruct? placeTypeSelectedList, [
  bool forFieldValue = false,
]) {
  if (placeTypeSelectedList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placeTypeSelectedList.toMap());

  // Add any Firestore field values
  placeTypeSelectedList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaceTypeSelectedListListFirestoreData(
  List<PlaceTypeSelectedListStruct>? placeTypeSelectedLists,
) =>
    placeTypeSelectedLists
        ?.map((e) => getPlaceTypeSelectedListFirestoreData(e, true))
        .toList() ??
    [];
