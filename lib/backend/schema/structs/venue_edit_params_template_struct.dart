// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VenueEditParamsTemplateStruct extends FFFirebaseStruct {
  VenueEditParamsTemplateStruct({
    String? resourceItemId,
    String? recordKey,
    String? type,
    String? firstTab,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _resourceItemId = resourceItemId,
        _recordKey = recordKey,
        _type = type,
        _firstTab = firstTab,
        super(firestoreUtilData);

  // "resourceItemId" field.
  String? _resourceItemId;
  String get resourceItemId => _resourceItemId ?? '';
  set resourceItemId(String? val) => _resourceItemId = val;

  bool hasResourceItemId() => _resourceItemId != null;

  // "recordKey" field.
  String? _recordKey;
  String get recordKey => _recordKey ?? '';
  set recordKey(String? val) => _recordKey = val;

  bool hasRecordKey() => _recordKey != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "firstTab" field.
  String? _firstTab;
  String get firstTab => _firstTab ?? '';
  set firstTab(String? val) => _firstTab = val;

  bool hasFirstTab() => _firstTab != null;

  static VenueEditParamsTemplateStruct fromMap(Map<String, dynamic> data) =>
      VenueEditParamsTemplateStruct(
        resourceItemId: data['resourceItemId'] as String?,
        recordKey: data['recordKey'] as String?,
        type: data['type'] as String?,
        firstTab: data['firstTab'] as String?,
      );

  static VenueEditParamsTemplateStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? VenueEditParamsTemplateStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'resourceItemId': _resourceItemId,
        'recordKey': _recordKey,
        'type': _type,
        'firstTab': _firstTab,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'resourceItemId': serializeParam(
          _resourceItemId,
          ParamType.String,
        ),
        'recordKey': serializeParam(
          _recordKey,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'firstTab': serializeParam(
          _firstTab,
          ParamType.String,
        ),
      }.withoutNulls;

  static VenueEditParamsTemplateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VenueEditParamsTemplateStruct(
        resourceItemId: deserializeParam(
          data['resourceItemId'],
          ParamType.String,
          false,
        ),
        recordKey: deserializeParam(
          data['recordKey'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        firstTab: deserializeParam(
          data['firstTab'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VenueEditParamsTemplateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VenueEditParamsTemplateStruct &&
        resourceItemId == other.resourceItemId &&
        recordKey == other.recordKey &&
        type == other.type &&
        firstTab == other.firstTab;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([resourceItemId, recordKey, type, firstTab]);
}

VenueEditParamsTemplateStruct createVenueEditParamsTemplateStruct({
  String? resourceItemId,
  String? recordKey,
  String? type,
  String? firstTab,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VenueEditParamsTemplateStruct(
      resourceItemId: resourceItemId,
      recordKey: recordKey,
      type: type,
      firstTab: firstTab,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VenueEditParamsTemplateStruct? updateVenueEditParamsTemplateStruct(
  VenueEditParamsTemplateStruct? venueEditParamsTemplate, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    venueEditParamsTemplate
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVenueEditParamsTemplateStructData(
  Map<String, dynamic> firestoreData,
  VenueEditParamsTemplateStruct? venueEditParamsTemplate,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (venueEditParamsTemplate == null) {
    return;
  }
  if (venueEditParamsTemplate.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      venueEditParamsTemplate.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final venueEditParamsTemplateData = getVenueEditParamsTemplateFirestoreData(
      venueEditParamsTemplate, forFieldValue);
  final nestedData =
      venueEditParamsTemplateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      venueEditParamsTemplate.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVenueEditParamsTemplateFirestoreData(
  VenueEditParamsTemplateStruct? venueEditParamsTemplate, [
  bool forFieldValue = false,
]) {
  if (venueEditParamsTemplate == null) {
    return {};
  }
  final firestoreData = mapToFirestore(venueEditParamsTemplate.toMap());

  // Add any Firestore field values
  venueEditParamsTemplate.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVenueEditParamsTemplateListFirestoreData(
  List<VenueEditParamsTemplateStruct>? venueEditParamsTemplates,
) =>
    venueEditParamsTemplates
        ?.map((e) => getVenueEditParamsTemplateFirestoreData(e, true))
        .toList() ??
    [];
