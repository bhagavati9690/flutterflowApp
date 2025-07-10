// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CakeFilterDataStruct extends FFFirebaseStruct {
  CakeFilterDataStruct({
    List<String>? foodprovidertypeSelections,
    List<String>? menurestrictionsSelections,
    List<String>? cakeflavorsSelections,
    List<String>? themesSelections,
    List<String>? mindeliveryfeeSelections,
    List<String>? fillingsSelections,
    List<String>? townSelections,
    List<String>? priceFactorSelections,
    List<String>? icecreamflavorsSelections,
    List<String>? rankingSelections,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _foodprovidertypeSelections = foodprovidertypeSelections,
        _menurestrictionsSelections = menurestrictionsSelections,
        _cakeflavorsSelections = cakeflavorsSelections,
        _themesSelections = themesSelections,
        _mindeliveryfeeSelections = mindeliveryfeeSelections,
        _fillingsSelections = fillingsSelections,
        _townSelections = townSelections,
        _priceFactorSelections = priceFactorSelections,
        _icecreamflavorsSelections = icecreamflavorsSelections,
        _rankingSelections = rankingSelections,
        super(firestoreUtilData);

  // "foodprovidertypeSelections" field.
  List<String>? _foodprovidertypeSelections;
  List<String> get foodprovidertypeSelections =>
      _foodprovidertypeSelections ?? const [];
  set foodprovidertypeSelections(List<String>? val) =>
      _foodprovidertypeSelections = val;

  void updateFoodprovidertypeSelections(Function(List<String>) updateFn) {
    updateFn(_foodprovidertypeSelections ??= []);
  }

  bool hasFoodprovidertypeSelections() => _foodprovidertypeSelections != null;

  // "menurestrictionsSelections" field.
  List<String>? _menurestrictionsSelections;
  List<String> get menurestrictionsSelections =>
      _menurestrictionsSelections ?? const [];
  set menurestrictionsSelections(List<String>? val) =>
      _menurestrictionsSelections = val;

  void updateMenurestrictionsSelections(Function(List<String>) updateFn) {
    updateFn(_menurestrictionsSelections ??= []);
  }

  bool hasMenurestrictionsSelections() => _menurestrictionsSelections != null;

  // "cakeflavorsSelections" field.
  List<String>? _cakeflavorsSelections;
  List<String> get cakeflavorsSelections => _cakeflavorsSelections ?? const [];
  set cakeflavorsSelections(List<String>? val) => _cakeflavorsSelections = val;

  void updateCakeflavorsSelections(Function(List<String>) updateFn) {
    updateFn(_cakeflavorsSelections ??= []);
  }

  bool hasCakeflavorsSelections() => _cakeflavorsSelections != null;

  // "themesSelections" field.
  List<String>? _themesSelections;
  List<String> get themesSelections => _themesSelections ?? const [];
  set themesSelections(List<String>? val) => _themesSelections = val;

  void updateThemesSelections(Function(List<String>) updateFn) {
    updateFn(_themesSelections ??= []);
  }

  bool hasThemesSelections() => _themesSelections != null;

  // "mindeliveryfeeSelections" field.
  List<String>? _mindeliveryfeeSelections;
  List<String> get mindeliveryfeeSelections =>
      _mindeliveryfeeSelections ?? const [];
  set mindeliveryfeeSelections(List<String>? val) =>
      _mindeliveryfeeSelections = val;

  void updateMindeliveryfeeSelections(Function(List<String>) updateFn) {
    updateFn(_mindeliveryfeeSelections ??= []);
  }

  bool hasMindeliveryfeeSelections() => _mindeliveryfeeSelections != null;

  // "fillingsSelections" field.
  List<String>? _fillingsSelections;
  List<String> get fillingsSelections => _fillingsSelections ?? const [];
  set fillingsSelections(List<String>? val) => _fillingsSelections = val;

  void updateFillingsSelections(Function(List<String>) updateFn) {
    updateFn(_fillingsSelections ??= []);
  }

  bool hasFillingsSelections() => _fillingsSelections != null;

  // "townSelections" field.
  List<String>? _townSelections;
  List<String> get townSelections => _townSelections ?? const [];
  set townSelections(List<String>? val) => _townSelections = val;

  void updateTownSelections(Function(List<String>) updateFn) {
    updateFn(_townSelections ??= []);
  }

  bool hasTownSelections() => _townSelections != null;

  // "priceFactorSelections" field.
  List<String>? _priceFactorSelections;
  List<String> get priceFactorSelections => _priceFactorSelections ?? const [];
  set priceFactorSelections(List<String>? val) => _priceFactorSelections = val;

  void updatePriceFactorSelections(Function(List<String>) updateFn) {
    updateFn(_priceFactorSelections ??= []);
  }

  bool hasPriceFactorSelections() => _priceFactorSelections != null;

  // "icecreamflavorsSelections" field.
  List<String>? _icecreamflavorsSelections;
  List<String> get icecreamflavorsSelections =>
      _icecreamflavorsSelections ?? const [];
  set icecreamflavorsSelections(List<String>? val) =>
      _icecreamflavorsSelections = val;

  void updateIcecreamflavorsSelections(Function(List<String>) updateFn) {
    updateFn(_icecreamflavorsSelections ??= []);
  }

  bool hasIcecreamflavorsSelections() => _icecreamflavorsSelections != null;

  // "rankingSelections" field.
  List<String>? _rankingSelections;
  List<String> get rankingSelections => _rankingSelections ?? const [];
  set rankingSelections(List<String>? val) => _rankingSelections = val;

  void updateRankingSelections(Function(List<String>) updateFn) {
    updateFn(_rankingSelections ??= []);
  }

  bool hasRankingSelections() => _rankingSelections != null;

  static CakeFilterDataStruct fromMap(Map<String, dynamic> data) =>
      CakeFilterDataStruct(
        foodprovidertypeSelections:
            getDataList(data['foodprovidertypeSelections']),
        menurestrictionsSelections:
            getDataList(data['menurestrictionsSelections']),
        cakeflavorsSelections: getDataList(data['cakeflavorsSelections']),
        themesSelections: getDataList(data['themesSelections']),
        mindeliveryfeeSelections: getDataList(data['mindeliveryfeeSelections']),
        fillingsSelections: getDataList(data['fillingsSelections']),
        townSelections: getDataList(data['townSelections']),
        priceFactorSelections: getDataList(data['priceFactorSelections']),
        icecreamflavorsSelections:
            getDataList(data['icecreamflavorsSelections']),
        rankingSelections: getDataList(data['rankingSelections']),
      );

  static CakeFilterDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CakeFilterDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'foodprovidertypeSelections': _foodprovidertypeSelections,
        'menurestrictionsSelections': _menurestrictionsSelections,
        'cakeflavorsSelections': _cakeflavorsSelections,
        'themesSelections': _themesSelections,
        'mindeliveryfeeSelections': _mindeliveryfeeSelections,
        'fillingsSelections': _fillingsSelections,
        'townSelections': _townSelections,
        'priceFactorSelections': _priceFactorSelections,
        'icecreamflavorsSelections': _icecreamflavorsSelections,
        'rankingSelections': _rankingSelections,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'foodprovidertypeSelections': serializeParam(
          _foodprovidertypeSelections,
          ParamType.String,
          isList: true,
        ),
        'menurestrictionsSelections': serializeParam(
          _menurestrictionsSelections,
          ParamType.String,
          isList: true,
        ),
        'cakeflavorsSelections': serializeParam(
          _cakeflavorsSelections,
          ParamType.String,
          isList: true,
        ),
        'themesSelections': serializeParam(
          _themesSelections,
          ParamType.String,
          isList: true,
        ),
        'mindeliveryfeeSelections': serializeParam(
          _mindeliveryfeeSelections,
          ParamType.String,
          isList: true,
        ),
        'fillingsSelections': serializeParam(
          _fillingsSelections,
          ParamType.String,
          isList: true,
        ),
        'townSelections': serializeParam(
          _townSelections,
          ParamType.String,
          isList: true,
        ),
        'priceFactorSelections': serializeParam(
          _priceFactorSelections,
          ParamType.String,
          isList: true,
        ),
        'icecreamflavorsSelections': serializeParam(
          _icecreamflavorsSelections,
          ParamType.String,
          isList: true,
        ),
        'rankingSelections': serializeParam(
          _rankingSelections,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static CakeFilterDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CakeFilterDataStruct(
        foodprovidertypeSelections: deserializeParam<String>(
          data['foodprovidertypeSelections'],
          ParamType.String,
          true,
        ),
        menurestrictionsSelections: deserializeParam<String>(
          data['menurestrictionsSelections'],
          ParamType.String,
          true,
        ),
        cakeflavorsSelections: deserializeParam<String>(
          data['cakeflavorsSelections'],
          ParamType.String,
          true,
        ),
        themesSelections: deserializeParam<String>(
          data['themesSelections'],
          ParamType.String,
          true,
        ),
        mindeliveryfeeSelections: deserializeParam<String>(
          data['mindeliveryfeeSelections'],
          ParamType.String,
          true,
        ),
        fillingsSelections: deserializeParam<String>(
          data['fillingsSelections'],
          ParamType.String,
          true,
        ),
        townSelections: deserializeParam<String>(
          data['townSelections'],
          ParamType.String,
          true,
        ),
        priceFactorSelections: deserializeParam<String>(
          data['priceFactorSelections'],
          ParamType.String,
          true,
        ),
        icecreamflavorsSelections: deserializeParam<String>(
          data['icecreamflavorsSelections'],
          ParamType.String,
          true,
        ),
        rankingSelections: deserializeParam<String>(
          data['rankingSelections'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'CakeFilterDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CakeFilterDataStruct &&
        listEquality.equals(
            foodprovidertypeSelections, other.foodprovidertypeSelections) &&
        listEquality.equals(
            menurestrictionsSelections, other.menurestrictionsSelections) &&
        listEquality.equals(
            cakeflavorsSelections, other.cakeflavorsSelections) &&
        listEquality.equals(themesSelections, other.themesSelections) &&
        listEquality.equals(
            mindeliveryfeeSelections, other.mindeliveryfeeSelections) &&
        listEquality.equals(fillingsSelections, other.fillingsSelections) &&
        listEquality.equals(townSelections, other.townSelections) &&
        listEquality.equals(
            priceFactorSelections, other.priceFactorSelections) &&
        listEquality.equals(
            icecreamflavorsSelections, other.icecreamflavorsSelections) &&
        listEquality.equals(rankingSelections, other.rankingSelections);
  }

  @override
  int get hashCode => const ListEquality().hash([
        foodprovidertypeSelections,
        menurestrictionsSelections,
        cakeflavorsSelections,
        themesSelections,
        mindeliveryfeeSelections,
        fillingsSelections,
        townSelections,
        priceFactorSelections,
        icecreamflavorsSelections,
        rankingSelections
      ]);
}

CakeFilterDataStruct createCakeFilterDataStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CakeFilterDataStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CakeFilterDataStruct? updateCakeFilterDataStruct(
  CakeFilterDataStruct? cakeFilterData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cakeFilterData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCakeFilterDataStructData(
  Map<String, dynamic> firestoreData,
  CakeFilterDataStruct? cakeFilterData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cakeFilterData == null) {
    return;
  }
  if (cakeFilterData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cakeFilterData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cakeFilterDataData =
      getCakeFilterDataFirestoreData(cakeFilterData, forFieldValue);
  final nestedData =
      cakeFilterDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cakeFilterData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCakeFilterDataFirestoreData(
  CakeFilterDataStruct? cakeFilterData, [
  bool forFieldValue = false,
]) {
  if (cakeFilterData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cakeFilterData.toMap());

  // Add any Firestore field values
  cakeFilterData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCakeFilterDataListFirestoreData(
  List<CakeFilterDataStruct>? cakeFilterDatas,
) =>
    cakeFilterDatas
        ?.map((e) => getCakeFilterDataFirestoreData(e, true))
        .toList() ??
    [];
