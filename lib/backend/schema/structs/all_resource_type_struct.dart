// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AllResourceTypeStruct extends FFFirebaseStruct {
  AllResourceTypeStruct({
    bool? isVenue,
    bool? isRental,
    bool? isEntertainer,
    bool? isCake,
    bool? isFood,
    int? resourceId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isVenue = isVenue,
        _isRental = isRental,
        _isEntertainer = isEntertainer,
        _isCake = isCake,
        _isFood = isFood,
        _resourceId = resourceId,
        super(firestoreUtilData);

  // "isVenue" field.
  bool? _isVenue;
  bool get isVenue => _isVenue ?? false;
  set isVenue(bool? val) => _isVenue = val;

  bool hasIsVenue() => _isVenue != null;

  // "isRental" field.
  bool? _isRental;
  bool get isRental => _isRental ?? false;
  set isRental(bool? val) => _isRental = val;

  bool hasIsRental() => _isRental != null;

  // "isEntertainer" field.
  bool? _isEntertainer;
  bool get isEntertainer => _isEntertainer ?? false;
  set isEntertainer(bool? val) => _isEntertainer = val;

  bool hasIsEntertainer() => _isEntertainer != null;

  // "isCake" field.
  bool? _isCake;
  bool get isCake => _isCake ?? false;
  set isCake(bool? val) => _isCake = val;

  bool hasIsCake() => _isCake != null;

  // "isFood" field.
  bool? _isFood;
  bool get isFood => _isFood ?? false;
  set isFood(bool? val) => _isFood = val;

  bool hasIsFood() => _isFood != null;

  // "resourceId" field.
  int? _resourceId;
  int get resourceId => _resourceId ?? -1;
  set resourceId(int? val) => _resourceId = val;

  void incrementResourceId(int amount) => resourceId = resourceId + amount;

  bool hasResourceId() => _resourceId != null;

  static AllResourceTypeStruct fromMap(Map<String, dynamic> data) =>
      AllResourceTypeStruct(
        isVenue: data['isVenue'] as bool?,
        isRental: data['isRental'] as bool?,
        isEntertainer: data['isEntertainer'] as bool?,
        isCake: data['isCake'] as bool?,
        isFood: data['isFood'] as bool?,
        resourceId: castToType<int>(data['resourceId']),
      );

  static AllResourceTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? AllResourceTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isVenue': _isVenue,
        'isRental': _isRental,
        'isEntertainer': _isEntertainer,
        'isCake': _isCake,
        'isFood': _isFood,
        'resourceId': _resourceId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isVenue': serializeParam(
          _isVenue,
          ParamType.bool,
        ),
        'isRental': serializeParam(
          _isRental,
          ParamType.bool,
        ),
        'isEntertainer': serializeParam(
          _isEntertainer,
          ParamType.bool,
        ),
        'isCake': serializeParam(
          _isCake,
          ParamType.bool,
        ),
        'isFood': serializeParam(
          _isFood,
          ParamType.bool,
        ),
        'resourceId': serializeParam(
          _resourceId,
          ParamType.int,
        ),
      }.withoutNulls;

  static AllResourceTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      AllResourceTypeStruct(
        isVenue: deserializeParam(
          data['isVenue'],
          ParamType.bool,
          false,
        ),
        isRental: deserializeParam(
          data['isRental'],
          ParamType.bool,
          false,
        ),
        isEntertainer: deserializeParam(
          data['isEntertainer'],
          ParamType.bool,
          false,
        ),
        isCake: deserializeParam(
          data['isCake'],
          ParamType.bool,
          false,
        ),
        isFood: deserializeParam(
          data['isFood'],
          ParamType.bool,
          false,
        ),
        resourceId: deserializeParam(
          data['resourceId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AllResourceTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AllResourceTypeStruct &&
        isVenue == other.isVenue &&
        isRental == other.isRental &&
        isEntertainer == other.isEntertainer &&
        isCake == other.isCake &&
        isFood == other.isFood &&
        resourceId == other.resourceId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([isVenue, isRental, isEntertainer, isCake, isFood, resourceId]);
}

AllResourceTypeStruct createAllResourceTypeStruct({
  bool? isVenue,
  bool? isRental,
  bool? isEntertainer,
  bool? isCake,
  bool? isFood,
  int? resourceId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AllResourceTypeStruct(
      isVenue: isVenue,
      isRental: isRental,
      isEntertainer: isEntertainer,
      isCake: isCake,
      isFood: isFood,
      resourceId: resourceId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AllResourceTypeStruct? updateAllResourceTypeStruct(
  AllResourceTypeStruct? allResourceType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    allResourceType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAllResourceTypeStructData(
  Map<String, dynamic> firestoreData,
  AllResourceTypeStruct? allResourceType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (allResourceType == null) {
    return;
  }
  if (allResourceType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && allResourceType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final allResourceTypeData =
      getAllResourceTypeFirestoreData(allResourceType, forFieldValue);
  final nestedData =
      allResourceTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = allResourceType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAllResourceTypeFirestoreData(
  AllResourceTypeStruct? allResourceType, [
  bool forFieldValue = false,
]) {
  if (allResourceType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(allResourceType.toMap());

  // Add any Firestore field values
  allResourceType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAllResourceTypeListFirestoreData(
  List<AllResourceTypeStruct>? allResourceTypes,
) =>
    allResourceTypes
        ?.map((e) => getAllResourceTypeFirestoreData(e, true))
        .toList() ??
    [];
