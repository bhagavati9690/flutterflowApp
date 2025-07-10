// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CursorStruct extends FFFirebaseStruct {
  CursorStruct({
    String? parentRecordKey,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _parentRecordKey = parentRecordKey,
        super(firestoreUtilData);

  // "parentRecordKey" field.
  String? _parentRecordKey;
  String get parentRecordKey => _parentRecordKey ?? '4563';
  set parentRecordKey(String? val) => _parentRecordKey = val;

  bool hasParentRecordKey() => _parentRecordKey != null;

  static CursorStruct fromMap(Map<String, dynamic> data) => CursorStruct(
        parentRecordKey: data['parentRecordKey'] as String?,
      );

  static CursorStruct? maybeFromMap(dynamic data) =>
      data is Map ? CursorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'parentRecordKey': _parentRecordKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'parentRecordKey': serializeParam(
          _parentRecordKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static CursorStruct fromSerializableMap(Map<String, dynamic> data) =>
      CursorStruct(
        parentRecordKey: deserializeParam(
          data['parentRecordKey'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CursorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CursorStruct && parentRecordKey == other.parentRecordKey;
  }

  @override
  int get hashCode => const ListEquality().hash([parentRecordKey]);
}

CursorStruct createCursorStruct({
  String? parentRecordKey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CursorStruct(
      parentRecordKey: parentRecordKey,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CursorStruct? updateCursorStruct(
  CursorStruct? cursor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cursor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCursorStructData(
  Map<String, dynamic> firestoreData,
  CursorStruct? cursor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cursor == null) {
    return;
  }
  if (cursor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cursor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cursorData = getCursorFirestoreData(cursor, forFieldValue);
  final nestedData = cursorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cursor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCursorFirestoreData(
  CursorStruct? cursor, [
  bool forFieldValue = false,
]) {
  if (cursor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cursor.toMap());

  // Add any Firestore field values
  cursor.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCursorListFirestoreData(
  List<CursorStruct>? cursors,
) =>
    cursors?.map((e) => getCursorFirestoreData(e, true)).toList() ?? [];
