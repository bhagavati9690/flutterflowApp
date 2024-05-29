// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaginationStruct extends BaseStruct {
  PaginationStruct({
    int? pageNo,
  }) : _pageNo = pageNo;

  // "pageNo" field.
  int? _pageNo;
  int get pageNo => _pageNo ?? 0;
  set pageNo(int? val) => _pageNo = val;
  void incrementPageNo(int amount) => _pageNo = pageNo + amount;
  bool hasPageNo() => _pageNo != null;

  static PaginationStruct fromMap(Map<String, dynamic> data) =>
      PaginationStruct(
        pageNo: castToType<int>(data['pageNo']),
      );

  static PaginationStruct? maybeFromMap(dynamic data) => data is Map
      ? PaginationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pageNo': _pageNo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pageNo': serializeParam(
          _pageNo,
          ParamType.int,
        ),
      }.withoutNulls;

  static PaginationStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaginationStruct(
        pageNo: deserializeParam(
          data['pageNo'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PaginationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaginationStruct && pageNo == other.pageNo;
  }

  @override
  int get hashCode => const ListEquality().hash([pageNo]);
}

PaginationStruct createPaginationStruct({
  int? pageNo,
}) =>
    PaginationStruct(
      pageNo: pageNo,
    );
