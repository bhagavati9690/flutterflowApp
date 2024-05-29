import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'loc_widget.dart' show LocWidget;
import 'package:flutter/material.dart';

class LocModel extends FlutterFlowModel<LocWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - determinePosition] action in loc widget.
  LatLng? location;
  // Stores action output result for [Custom Action - newCustomAction] action in loc widget.
  String? hi;
  // Stores action output result for [Custom Action - determinePosition] action in Button widget.
  LatLng? latlng;
  // Stores action output result for [Backend Call - API (GetAddressFromLatLong)] action in Button widget.
  ApiCallResponse? apiResultp8t;
  // Stores action output result for [Custom Action - determinePosition] action in Button widget.
  LatLng? t1;
  // Stores action output result for [Custom Action - newCustomAction] action in Button widget.
  String? t2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
