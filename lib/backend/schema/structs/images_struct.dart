// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ImagesStruct extends FFFirebaseStruct {
  ImagesStruct({
    String? imageHold,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imageHold = imageHold,
        super(firestoreUtilData);

  // "imageHold" field.
  String? _imageHold;
  String get imageHold => _imageHold ?? '';
  set imageHold(String? val) => _imageHold = val;

  bool hasImageHold() => _imageHold != null;

  static ImagesStruct fromMap(Map<String, dynamic> data) => ImagesStruct(
        imageHold: data['imageHold'] as String?,
      );

  static ImagesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ImagesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'imageHold': _imageHold,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imageHold': serializeParam(
          _imageHold,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImagesStruct(
        imageHold: deserializeParam(
          data['imageHold'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImagesStruct && imageHold == other.imageHold;
  }

  @override
  int get hashCode => const ListEquality().hash([imageHold]);
}

ImagesStruct createImagesStruct({
  String? imageHold,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImagesStruct(
      imageHold: imageHold,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImagesStruct? updateImagesStruct(
  ImagesStruct? images, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    images
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImagesStructData(
  Map<String, dynamic> firestoreData,
  ImagesStruct? images,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (images == null) {
    return;
  }
  if (images.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && images.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imagesData = getImagesFirestoreData(images, forFieldValue);
  final nestedData = imagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = images.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImagesFirestoreData(
  ImagesStruct? images, [
  bool forFieldValue = false,
]) {
  if (images == null) {
    return {};
  }
  final firestoreData = mapToFirestore(images.toMap());

  // Add any Firestore field values
  images.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImagesListFirestoreData(
  List<ImagesStruct>? imagess,
) =>
    imagess?.map((e) => getImagesFirestoreData(e, true)).toList() ?? [];
