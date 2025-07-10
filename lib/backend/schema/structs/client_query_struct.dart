// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientQueryStruct extends FFFirebaseStruct {
  ClientQueryStruct({
    String? clientId,
    CursorStruct? cursor,
    List<String>? selection,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _clientId = clientId,
        _cursor = cursor,
        _selection = selection,
        super(firestoreUtilData);

  // "clientId" field.
  String? _clientId;
  String get clientId => _clientId ?? 'viewVenueDetail__photoViewer';
  set clientId(String? val) => _clientId = val;

  bool hasClientId() => _clientId != null;

  // "cursor" field.
  CursorStruct? _cursor;
  CursorStruct get cursor => _cursor ?? CursorStruct();
  set cursor(CursorStruct? val) => _cursor = val;

  void updateCursor(Function(CursorStruct) updateFn) {
    updateFn(_cursor ??= CursorStruct());
  }

  bool hasCursor() => _cursor != null;

  // "selection" field.
  List<String>? _selection;
  List<String> get selection => _selection ?? const [];
  set selection(List<String>? val) => _selection = val;

  void updateSelection(Function(List<String>) updateFn) {
    updateFn(_selection ??= []);
  }

  bool hasSelection() => _selection != null;

  static ClientQueryStruct fromMap(Map<String, dynamic> data) =>
      ClientQueryStruct(
        clientId: data['clientId'] as String?,
        cursor: data['cursor'] is CursorStruct
            ? data['cursor']
            : CursorStruct.maybeFromMap(data['cursor']),
        selection: getDataList(data['selection']),
      );

  static ClientQueryStruct? maybeFromMap(dynamic data) => data is Map
      ? ClientQueryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'clientId': _clientId,
        'cursor': _cursor?.toMap(),
        'selection': _selection,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'clientId': serializeParam(
          _clientId,
          ParamType.String,
        ),
        'cursor': serializeParam(
          _cursor,
          ParamType.DataStruct,
        ),
        'selection': serializeParam(
          _selection,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ClientQueryStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClientQueryStruct(
        clientId: deserializeParam(
          data['clientId'],
          ParamType.String,
          false,
        ),
        cursor: deserializeStructParam(
          data['cursor'],
          ParamType.DataStruct,
          false,
          structBuilder: CursorStruct.fromSerializableMap,
        ),
        selection: deserializeParam<String>(
          data['selection'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ClientQueryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ClientQueryStruct &&
        clientId == other.clientId &&
        cursor == other.cursor &&
        listEquality.equals(selection, other.selection);
  }

  @override
  int get hashCode => const ListEquality().hash([clientId, cursor, selection]);
}

ClientQueryStruct createClientQueryStruct({
  String? clientId,
  CursorStruct? cursor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClientQueryStruct(
      clientId: clientId,
      cursor: cursor ?? (clearUnsetFields ? CursorStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClientQueryStruct? updateClientQueryStruct(
  ClientQueryStruct? clientQuery, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    clientQuery
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClientQueryStructData(
  Map<String, dynamic> firestoreData,
  ClientQueryStruct? clientQuery,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (clientQuery == null) {
    return;
  }
  if (clientQuery.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && clientQuery.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final clientQueryData =
      getClientQueryFirestoreData(clientQuery, forFieldValue);
  final nestedData =
      clientQueryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = clientQuery.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClientQueryFirestoreData(
  ClientQueryStruct? clientQuery, [
  bool forFieldValue = false,
]) {
  if (clientQuery == null) {
    return {};
  }
  final firestoreData = mapToFirestore(clientQuery.toMap());

  // Handle nested data for "cursor" field.
  addCursorStructData(
    firestoreData,
    clientQuery.hasCursor() ? clientQuery.cursor : null,
    'cursor',
    forFieldValue,
  );

  // Add any Firestore field values
  clientQuery.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClientQueryListFirestoreData(
  List<ClientQueryStruct>? clientQuerys,
) =>
    clientQuerys?.map((e) => getClientQueryFirestoreData(e, true)).toList() ??
    [];
