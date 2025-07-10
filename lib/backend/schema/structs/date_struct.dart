// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DateStruct extends FFFirebaseStruct {
  DateStruct({
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static DateStruct fromMap(Map<String, dynamic> data) => DateStruct(
        date: data['date'] as DateTime?,
      );

  static DateStruct? maybeFromMap(dynamic data) =>
      data is Map ? DateStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DateStruct fromSerializableMap(Map<String, dynamic> data) =>
      DateStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DateStruct && date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([date]);
}

DateStruct createDateStruct({
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DateStruct(
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DateStruct? updateDateStruct(
  DateStruct? dateStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dateStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDateStructData(
  Map<String, dynamic> firestoreData,
  DateStruct? dateStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dateStruct == null) {
    return;
  }
  if (dateStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dateStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dateStructData = getDateFirestoreData(dateStruct, forFieldValue);
  final nestedData = dateStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dateStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDateFirestoreData(
  DateStruct? dateStruct, [
  bool forFieldValue = false,
]) {
  if (dateStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dateStruct.toMap());

  // Add any Firestore field values
  dateStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDateListFirestoreData(
  List<DateStruct>? dateStructs,
) =>
    dateStructs?.map((e) => getDateFirestoreData(e, true)).toList() ?? [];
