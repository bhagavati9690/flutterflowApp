// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SortingDataStruct extends BaseStruct {
  SortingDataStruct({
    String? viewSelection,
    String? sortSelection,
  })  : _viewSelection = viewSelection,
        _sortSelection = sortSelection;

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
}) =>
    SortingDataStruct(
      viewSelection: viewSelection,
      sortSelection: sortSelection,
    );
