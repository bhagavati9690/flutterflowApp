// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmptyListStruct extends FFFirebaseStruct {
  EmptyListStruct({
    List<String>? emptyList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _emptyList = emptyList,
        super(firestoreUtilData);

  // "EmptyList" field.
  List<String>? _emptyList;
  List<String> get emptyList => _emptyList ?? const [];
  set emptyList(List<String>? val) => _emptyList = val;

  void updateEmptyList(Function(List<String>) updateFn) {
    updateFn(_emptyList ??= []);
  }

  bool hasEmptyList() => _emptyList != null;

  static EmptyListStruct fromMap(Map<String, dynamic> data) => EmptyListStruct(
        emptyList: getDataList(data['EmptyList']),
      );

  static EmptyListStruct? maybeFromMap(dynamic data) => data is Map
      ? EmptyListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'EmptyList': _emptyList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'EmptyList': serializeParam(
          _emptyList,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static EmptyListStruct fromSerializableMap(Map<String, dynamic> data) =>
      EmptyListStruct(
        emptyList: deserializeParam<String>(
          data['EmptyList'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'EmptyListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EmptyListStruct &&
        listEquality.equals(emptyList, other.emptyList);
  }

  @override
  int get hashCode => const ListEquality().hash([emptyList]);
}

EmptyListStruct createEmptyListStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EmptyListStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EmptyListStruct? updateEmptyListStruct(
  EmptyListStruct? emptyListStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    emptyListStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEmptyListStructData(
  Map<String, dynamic> firestoreData,
  EmptyListStruct? emptyListStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (emptyListStruct == null) {
    return;
  }
  if (emptyListStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && emptyListStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final emptyListStructData =
      getEmptyListFirestoreData(emptyListStruct, forFieldValue);
  final nestedData =
      emptyListStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = emptyListStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEmptyListFirestoreData(
  EmptyListStruct? emptyListStruct, [
  bool forFieldValue = false,
]) {
  if (emptyListStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(emptyListStruct.toMap());

  // Add any Firestore field values
  emptyListStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEmptyListListFirestoreData(
  List<EmptyListStruct>? emptyListStructs,
) =>
    emptyListStructs?.map((e) => getEmptyListFirestoreData(e, true)).toList() ??
    [];
