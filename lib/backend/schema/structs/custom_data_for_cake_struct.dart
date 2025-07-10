// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CustomDataForCakeStruct extends FFFirebaseStruct {
  CustomDataForCakeStruct({
    String? customText,
    String? customColor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _customText = customText,
        _customColor = customColor,
        super(firestoreUtilData);

  // "customText" field.
  String? _customText;
  String get customText => _customText ?? '';
  set customText(String? val) => _customText = val;

  bool hasCustomText() => _customText != null;

  // "customColor" field.
  String? _customColor;
  String get customColor => _customColor ?? '';
  set customColor(String? val) => _customColor = val;

  bool hasCustomColor() => _customColor != null;

  static CustomDataForCakeStruct fromMap(Map<String, dynamic> data) =>
      CustomDataForCakeStruct(
        customText: data['customText'] as String?,
        customColor: data['customColor'] as String?,
      );

  static CustomDataForCakeStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomDataForCakeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'customText': _customText,
        'customColor': _customColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customText': serializeParam(
          _customText,
          ParamType.String,
        ),
        'customColor': serializeParam(
          _customColor,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomDataForCakeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CustomDataForCakeStruct(
        customText: deserializeParam(
          data['customText'],
          ParamType.String,
          false,
        ),
        customColor: deserializeParam(
          data['customColor'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomDataForCakeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomDataForCakeStruct &&
        customText == other.customText &&
        customColor == other.customColor;
  }

  @override
  int get hashCode => const ListEquality().hash([customText, customColor]);
}

CustomDataForCakeStruct createCustomDataForCakeStruct({
  String? customText,
  String? customColor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomDataForCakeStruct(
      customText: customText,
      customColor: customColor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomDataForCakeStruct? updateCustomDataForCakeStruct(
  CustomDataForCakeStruct? customDataForCake, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customDataForCake
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomDataForCakeStructData(
  Map<String, dynamic> firestoreData,
  CustomDataForCakeStruct? customDataForCake,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customDataForCake == null) {
    return;
  }
  if (customDataForCake.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customDataForCake.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customDataForCakeData =
      getCustomDataForCakeFirestoreData(customDataForCake, forFieldValue);
  final nestedData =
      customDataForCakeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customDataForCake.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomDataForCakeFirestoreData(
  CustomDataForCakeStruct? customDataForCake, [
  bool forFieldValue = false,
]) {
  if (customDataForCake == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customDataForCake.toMap());

  // Add any Firestore field values
  customDataForCake.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomDataForCakeListFirestoreData(
  List<CustomDataForCakeStruct>? customDataForCakes,
) =>
    customDataForCakes
        ?.map((e) => getCustomDataForCakeFirestoreData(e, true))
        .toList() ??
    [];
