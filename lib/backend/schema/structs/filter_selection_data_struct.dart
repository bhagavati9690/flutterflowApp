// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterSelectionDataStruct extends BaseStruct {
  FilterSelectionDataStruct({
    List<String>? venueTypeSelections,
    List<String>? activityTypeSelections,
    List<String>? sportTypeSelections,
    List<String>? activityTypeCategorySelections,
    List<String>? capacitySelections,
    List<String>? ageRangeSelections,
    List<String>? townSelections,
    List<String>? priceFactorSelections,
    List<String>? demographicsSelections,
    List<String>? rankingSelections,
  })  : _venueTypeSelections = venueTypeSelections,
        _activityTypeSelections = activityTypeSelections,
        _sportTypeSelections = sportTypeSelections,
        _activityTypeCategorySelections = activityTypeCategorySelections,
        _capacitySelections = capacitySelections,
        _ageRangeSelections = ageRangeSelections,
        _townSelections = townSelections,
        _priceFactorSelections = priceFactorSelections,
        _demographicsSelections = demographicsSelections,
        _rankingSelections = rankingSelections;

  // "venueTypeSelections" field.
  List<String>? _venueTypeSelections;
  List<String> get venueTypeSelections => _venueTypeSelections ?? const [];
  set venueTypeSelections(List<String>? val) => _venueTypeSelections = val;
  void updateVenueTypeSelections(Function(List<String>) updateFn) =>
      updateFn(_venueTypeSelections ??= []);
  bool hasVenueTypeSelections() => _venueTypeSelections != null;

  // "activityTypeSelections" field.
  List<String>? _activityTypeSelections;
  List<String> get activityTypeSelections =>
      _activityTypeSelections ?? const [];
  set activityTypeSelections(List<String>? val) =>
      _activityTypeSelections = val;
  void updateActivityTypeSelections(Function(List<String>) updateFn) =>
      updateFn(_activityTypeSelections ??= []);
  bool hasActivityTypeSelections() => _activityTypeSelections != null;

  // "sportTypeSelections" field.
  List<String>? _sportTypeSelections;
  List<String> get sportTypeSelections => _sportTypeSelections ?? const [];
  set sportTypeSelections(List<String>? val) => _sportTypeSelections = val;
  void updateSportTypeSelections(Function(List<String>) updateFn) =>
      updateFn(_sportTypeSelections ??= []);
  bool hasSportTypeSelections() => _sportTypeSelections != null;

  // "activityTypeCategorySelections" field.
  List<String>? _activityTypeCategorySelections;
  List<String> get activityTypeCategorySelections =>
      _activityTypeCategorySelections ?? const [];
  set activityTypeCategorySelections(List<String>? val) =>
      _activityTypeCategorySelections = val;
  void updateActivityTypeCategorySelections(Function(List<String>) updateFn) =>
      updateFn(_activityTypeCategorySelections ??= []);
  bool hasActivityTypeCategorySelections() =>
      _activityTypeCategorySelections != null;

  // "capacitySelections" field.
  List<String>? _capacitySelections;
  List<String> get capacitySelections => _capacitySelections ?? const [];
  set capacitySelections(List<String>? val) => _capacitySelections = val;
  void updateCapacitySelections(Function(List<String>) updateFn) =>
      updateFn(_capacitySelections ??= []);
  bool hasCapacitySelections() => _capacitySelections != null;

  // "ageRangeSelections" field.
  List<String>? _ageRangeSelections;
  List<String> get ageRangeSelections => _ageRangeSelections ?? const [];
  set ageRangeSelections(List<String>? val) => _ageRangeSelections = val;
  void updateAgeRangeSelections(Function(List<String>) updateFn) =>
      updateFn(_ageRangeSelections ??= []);
  bool hasAgeRangeSelections() => _ageRangeSelections != null;

  // "townSelections" field.
  List<String>? _townSelections;
  List<String> get townSelections => _townSelections ?? const [];
  set townSelections(List<String>? val) => _townSelections = val;
  void updateTownSelections(Function(List<String>) updateFn) =>
      updateFn(_townSelections ??= []);
  bool hasTownSelections() => _townSelections != null;

  // "priceFactorSelections" field.
  List<String>? _priceFactorSelections;
  List<String> get priceFactorSelections => _priceFactorSelections ?? const [];
  set priceFactorSelections(List<String>? val) => _priceFactorSelections = val;
  void updatePriceFactorSelections(Function(List<String>) updateFn) =>
      updateFn(_priceFactorSelections ??= []);
  bool hasPriceFactorSelections() => _priceFactorSelections != null;

  // "demographicsSelections" field.
  List<String>? _demographicsSelections;
  List<String> get demographicsSelections =>
      _demographicsSelections ?? const [];
  set demographicsSelections(List<String>? val) =>
      _demographicsSelections = val;
  void updateDemographicsSelections(Function(List<String>) updateFn) =>
      updateFn(_demographicsSelections ??= []);
  bool hasDemographicsSelections() => _demographicsSelections != null;

  // "rankingSelections" field.
  List<String>? _rankingSelections;
  List<String> get rankingSelections => _rankingSelections ?? const [];
  set rankingSelections(List<String>? val) => _rankingSelections = val;
  void updateRankingSelections(Function(List<String>) updateFn) =>
      updateFn(_rankingSelections ??= []);
  bool hasRankingSelections() => _rankingSelections != null;

  static FilterSelectionDataStruct fromMap(Map<String, dynamic> data) =>
      FilterSelectionDataStruct(
        venueTypeSelections: getDataList(data['venueTypeSelections']),
        activityTypeSelections: getDataList(data['activityTypeSelections']),
        sportTypeSelections: getDataList(data['sportTypeSelections']),
        activityTypeCategorySelections:
            getDataList(data['activityTypeCategorySelections']),
        capacitySelections: getDataList(data['capacitySelections']),
        ageRangeSelections: getDataList(data['ageRangeSelections']),
        townSelections: getDataList(data['townSelections']),
        priceFactorSelections: getDataList(data['priceFactorSelections']),
        demographicsSelections: getDataList(data['demographicsSelections']),
        rankingSelections: getDataList(data['rankingSelections']),
      );

  static FilterSelectionDataStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterSelectionDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'venueTypeSelections': _venueTypeSelections,
        'activityTypeSelections': _activityTypeSelections,
        'sportTypeSelections': _sportTypeSelections,
        'activityTypeCategorySelections': _activityTypeCategorySelections,
        'capacitySelections': _capacitySelections,
        'ageRangeSelections': _ageRangeSelections,
        'townSelections': _townSelections,
        'priceFactorSelections': _priceFactorSelections,
        'demographicsSelections': _demographicsSelections,
        'rankingSelections': _rankingSelections,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'venueTypeSelections': serializeParam(
          _venueTypeSelections,
          ParamType.String,
          true,
        ),
        'activityTypeSelections': serializeParam(
          _activityTypeSelections,
          ParamType.String,
          true,
        ),
        'sportTypeSelections': serializeParam(
          _sportTypeSelections,
          ParamType.String,
          true,
        ),
        'activityTypeCategorySelections': serializeParam(
          _activityTypeCategorySelections,
          ParamType.String,
          true,
        ),
        'capacitySelections': serializeParam(
          _capacitySelections,
          ParamType.String,
          true,
        ),
        'ageRangeSelections': serializeParam(
          _ageRangeSelections,
          ParamType.String,
          true,
        ),
        'townSelections': serializeParam(
          _townSelections,
          ParamType.String,
          true,
        ),
        'priceFactorSelections': serializeParam(
          _priceFactorSelections,
          ParamType.String,
          true,
        ),
        'demographicsSelections': serializeParam(
          _demographicsSelections,
          ParamType.String,
          true,
        ),
        'rankingSelections': serializeParam(
          _rankingSelections,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static FilterSelectionDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FilterSelectionDataStruct(
        venueTypeSelections: deserializeParam<String>(
          data['venueTypeSelections'],
          ParamType.String,
          true,
        ),
        activityTypeSelections: deserializeParam<String>(
          data['activityTypeSelections'],
          ParamType.String,
          true,
        ),
        sportTypeSelections: deserializeParam<String>(
          data['sportTypeSelections'],
          ParamType.String,
          true,
        ),
        activityTypeCategorySelections: deserializeParam<String>(
          data['activityTypeCategorySelections'],
          ParamType.String,
          true,
        ),
        capacitySelections: deserializeParam<String>(
          data['capacitySelections'],
          ParamType.String,
          true,
        ),
        ageRangeSelections: deserializeParam<String>(
          data['ageRangeSelections'],
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
        demographicsSelections: deserializeParam<String>(
          data['demographicsSelections'],
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
  String toString() => 'FilterSelectionDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FilterSelectionDataStruct &&
        listEquality.equals(venueTypeSelections, other.venueTypeSelections) &&
        listEquality.equals(
            activityTypeSelections, other.activityTypeSelections) &&
        listEquality.equals(sportTypeSelections, other.sportTypeSelections) &&
        listEquality.equals(activityTypeCategorySelections,
            other.activityTypeCategorySelections) &&
        listEquality.equals(capacitySelections, other.capacitySelections) &&
        listEquality.equals(ageRangeSelections, other.ageRangeSelections) &&
        listEquality.equals(townSelections, other.townSelections) &&
        listEquality.equals(
            priceFactorSelections, other.priceFactorSelections) &&
        listEquality.equals(
            demographicsSelections, other.demographicsSelections) &&
        listEquality.equals(rankingSelections, other.rankingSelections);
  }

  @override
  int get hashCode => const ListEquality().hash([
        venueTypeSelections,
        activityTypeSelections,
        sportTypeSelections,
        activityTypeCategorySelections,
        capacitySelections,
        ageRangeSelections,
        townSelections,
        priceFactorSelections,
        demographicsSelections,
        rankingSelections
      ]);
}

FilterSelectionDataStruct createFilterSelectionDataStruct() =>
    FilterSelectionDataStruct();
