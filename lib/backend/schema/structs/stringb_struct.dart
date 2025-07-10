// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StringbStruct extends FFFirebaseStruct {
  StringbStruct({
    String? cc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cc = cc,
        super(firestoreUtilData);

  // "cc" field.
  String? _cc;
  String get cc => _cc ?? '';
  set cc(String? val) => _cc = val;

  bool hasCc() => _cc != null;

  static StringbStruct fromMap(Map<String, dynamic> data) => StringbStruct(
        cc: data['cc'] as String?,
      );

  static StringbStruct? maybeFromMap(dynamic data) =>
      data is Map ? StringbStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'cc': _cc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cc': serializeParam(
          _cc,
          ParamType.String,
        ),
      }.withoutNulls;

  static StringbStruct fromSerializableMap(Map<String, dynamic> data) =>
      StringbStruct(
        cc: deserializeParam(
          data['cc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StringbStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StringbStruct && cc == other.cc;
  }

  @override
  int get hashCode => const ListEquality().hash([cc]);
}

StringbStruct createStringbStruct({
  String? cc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StringbStruct(
      cc: cc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StringbStruct? updateStringbStruct(
  StringbStruct? stringb, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stringb
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStringbStructData(
  Map<String, dynamic> firestoreData,
  StringbStruct? stringb,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stringb == null) {
    return;
  }
  if (stringb.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stringb.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stringbData = getStringbFirestoreData(stringb, forFieldValue);
  final nestedData = stringbData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stringb.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStringbFirestoreData(
  StringbStruct? stringb, [
  bool forFieldValue = false,
]) {
  if (stringb == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stringb.toMap());

  // Add any Firestore field values
  stringb.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStringbListFirestoreData(
  List<StringbStruct>? stringbs,
) =>
    stringbs?.map((e) => getStringbFirestoreData(e, true)).toList() ?? [];
