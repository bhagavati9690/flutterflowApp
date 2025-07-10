// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SortingDataStruct extends FFFirebaseStruct {
  SortingDataStruct({
    String? viewSelection,
    String? sortSelection,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _viewSelection = viewSelection,
        _sortSelection = sortSelection,
        super(firestoreUtilData);

  // "viewSelection" field.
  String? _viewSelection;
  String get viewSelection => _viewSelection ?? '';
  set viewSelection(String? val) => _viewSelection = val;

  bool hasViewSelection() => _viewSelection != null;

  // "sortSelection" field.
  String? _sortSelection;
  String get sortSelection => _sortSelection ?? '';
  set sortSelection(String? val) => _sortSelection = val;

  bool hasSortSelection() => _sortSelection != null;

  static SortingDataStruct fromMap(Map<String, dynamic> data) =>
      SortingDataStruct(
        viewSelection: data['viewSelection'] as String?,
        sortSelection: data['sortSelection'] as String?,
      );

  static SortingDataStruct? maybeFromMap(dynamic data) => data is Map
      ? SortingDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'viewSelection': _viewSelection,
        'sortSelection': _sortSelection,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'viewSelection': serializeParam(
          _viewSelection,
          ParamType.String,
        ),
        'sortSelection': serializeParam(
          _sortSelection,
          ParamType.String,
        ),
      }.withoutNulls;

  static SortingDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      SortingDataStruct(
        viewSelection: deserializeParam(
          data['viewSelection'],
          ParamType.String,
          false,
        ),
        sortSelection: deserializeParam(
          data['sortSelection'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SortingDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SortingDataStruct &&
        viewSelection == other.viewSelection &&
        sortSelection == other.sortSelection;
  }

  @override
  int get hashCode => const ListEquality().hash([viewSelection, sortSelection]);
}

SortingDataStruct createSortingDataStruct({
  String? viewSelection,
  String? sortSelection,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SortingDataStruct(
      viewSelection: viewSelection,
      sortSelection: sortSelection,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SortingDataStruct? updateSortingDataStruct(
  SortingDataStruct? sortingData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sortingData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSortingDataStructData(
  Map<String, dynamic> firestoreData,
  SortingDataStruct? sortingData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sortingData == null) {
    return;
  }
  if (sortingData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sortingData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sortingDataData =
      getSortingDataFirestoreData(sortingData, forFieldValue);
  final nestedData =
      sortingDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sortingData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSortingDataFirestoreData(
  SortingDataStruct? sortingData, [
  bool forFieldValue = false,
]) {
  if (sortingData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sortingData.toMap());

  // Add any Firestore field values
  sortingData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSortingDataListFirestoreData(
  List<SortingDataStruct>? sortingDatas,
) =>
    sortingDatas?.map((e) => getSortingDataFirestoreData(e, true)).toList() ??
    [];
