// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhotoQueryStruct extends BaseStruct {
  PhotoQueryStruct({
    String? clientId,
    CursorStruct? cursor,
    List<int>? selection,
  })  : _clientId = clientId,
        _cursor = cursor,
        _selection = selection;

  // "clientId" field.
  String? _clientId;
  String get clientId => _clientId ?? 'viewVenueDetail__photoViewer';
  set clientId(String? val) => _clientId = val;
  bool hasClientId() => _clientId != null;

  // "cursor" field.
  CursorStruct? _cursor;
  CursorStruct get cursor => _cursor ?? CursorStruct();
  set cursor(CursorStruct? val) => _cursor = val;
  void updateCursor(Function(CursorStruct) updateFn) =>
      updateFn(_cursor ??= CursorStruct());
  bool hasCursor() => _cursor != null;

  // "selection" field.
  List<int>? _selection;
  List<int> get selection => _selection ?? const [];
  set selection(List<int>? val) => _selection = val;
  void updateSelection(Function(List<int>) updateFn) =>
      updateFn(_selection ??= []);
  bool hasSelection() => _selection != null;

  static PhotoQueryStruct fromMap(Map<String, dynamic> data) =>
      PhotoQueryStruct(
        clientId: data['clientId'] as String?,
        cursor: CursorStruct.maybeFromMap(data['cursor']),
        selection: getDataList(data['selection']),
      );

  static PhotoQueryStruct? maybeFromMap(dynamic data) => data is Map
      ? PhotoQueryStruct.fromMap(data.cast<String, dynamic>())
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
          ParamType.int,
          true,
        ),
      }.withoutNulls;

  static PhotoQueryStruct fromSerializableMap(Map<String, dynamic> data) =>
      PhotoQueryStruct(
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
        selection: deserializeParam<int>(
          data['selection'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'PhotoQueryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PhotoQueryStruct &&
        clientId == other.clientId &&
        cursor == other.cursor &&
        listEquality.equals(selection, other.selection);
  }

  @override
  int get hashCode => const ListEquality().hash([clientId, cursor, selection]);
}

PhotoQueryStruct createPhotoQueryStruct({
  String? clientId,
  CursorStruct? cursor,
}) =>
    PhotoQueryStruct(
      clientId: clientId,
      cursor: cursor ?? CursorStruct(),
    );
