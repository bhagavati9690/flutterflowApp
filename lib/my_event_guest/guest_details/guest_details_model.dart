import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'guest_details_widget.dart' show GuestDetailsWidget;
import 'package:flutter/material.dart';

class GuestDetailsModel extends FlutterFlowModel<GuestDetailsWidget> {
  ///  Local state fields for this page.

  ClientQueryStruct? guestDetailQuery;
  void updateGuestDetailQueryStruct(Function(ClientQueryStruct) updateFn) {
    updateFn(guestDetailQuery ??= ClientQueryStruct());
  }

  ClientQueryStruct? guestDeleteQuery;
  void updateGuestDeleteQueryStruct(Function(ClientQueryStruct) updateFn) {
    updateFn(guestDeleteQuery ??= ClientQueryStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (deleteGuest)] action in IconButton widget.
  ApiCallResponse? apiResult7bq;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
