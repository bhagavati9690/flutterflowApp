// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NameIdSearchableStruct extends FFFirebaseStruct {
  NameIdSearchableStruct({
    String? id,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static NameIdSearchableStruct fromMap(Map<String, dynamic> data) =>
      NameIdSearchableStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  static NameIdSearchableStruct? maybeFromMap(dynamic data) => data is Map
      ? NameIdSearchableStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static NameIdSearchableStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NameIdSearchableStruct(
        id: deserializeParam(
          data['id'],
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
  String toString() => 'NameIdSearchableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NameIdSearchableStruct &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

NameIdSearchableStruct createNameIdSearchableStruct({
  String? id,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NameIdSearchableStruct(
      id: id,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NameIdSearchableStruct? updateNameIdSearchableStruct(
  NameIdSearchableStruct? nameIdSearchable, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nameIdSearchable
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNameIdSearchableStructData(
  Map<String, dynamic> firestoreData,
  NameIdSearchableStruct? nameIdSearchable,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nameIdSearchable == null) {
    return;
  }
  if (nameIdSearchable.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nameIdSearchable.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nameIdSearchableData =
      getNameIdSearchableFirestoreData(nameIdSearchable, forFieldValue);
  final nestedData =
      nameIdSearchableData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nameIdSearchable.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNameIdSearchableFirestoreData(
  NameIdSearchableStruct? nameIdSearchable, [
  bool forFieldValue = false,
]) {
  if (nameIdSearchable == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nameIdSearchable.toMap());

  // Add any Firestore field values
  nameIdSearchable.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNameIdSearchableListFirestoreData(
  List<NameIdSearchableStruct>? nameIdSearchables,
) =>
    nameIdSearchables
        ?.map((e) => getNameIdSearchableFirestoreData(e, true))
        .toList() ??
    [];
