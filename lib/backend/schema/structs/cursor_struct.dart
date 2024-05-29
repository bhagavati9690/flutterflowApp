// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CursorStruct extends BaseStruct {
  CursorStruct({
    String? parentRecordKey,
  }) : _parentRecordKey = parentRecordKey;

  // "parentRecordKey" field.
  String? _parentRecordKey;
  String get parentRecordKey => _parentRecordKey ?? '4563';
  set parentRecordKey(String? val) => _parentRecordKey = val;
  bool hasParentRecordKey() => _parentRecordKey != null;

  static CursorStruct fromMap(Map<String, dynamic> data) => CursorStruct(
        parentRecordKey: data['parentRecordKey'] as String?,
      );

  static CursorStruct? maybeFromMap(dynamic data) =>
      data is Map ? CursorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'parentRecordKey': _parentRecordKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'parentRecordKey': serializeParam(
          _parentRecordKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static CursorStruct fromSerializableMap(Map<String, dynamic> data) =>
      CursorStruct(
        parentRecordKey: deserializeParam(
          data['parentRecordKey'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CursorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CursorStruct && parentRecordKey == other.parentRecordKey;
  }

  @override
  int get hashCode => const ListEquality().hash([parentRecordKey]);
}

CursorStruct createCursorStruct({
  String? parentRecordKey,
}) =>
    CursorStruct(
      parentRecordKey: parentRecordKey,
    );
