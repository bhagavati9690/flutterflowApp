import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_serchbar_p_o_c_widget.dart' show LocationSerchbarPOCWidget;
import 'package:flutter/material.dart';

class LocationSerchbarPOCModel
    extends FlutterFlowModel<LocationSerchbarPOCWidget> {
  ///  Local state fields for this page.

  String? contry;

  String? place;

  String? pincode;

  String? co;

  String? pin;

  String? pl;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - determinePosition] action in locationSerchbarPOC widget.
  LatLng? currentPosition;
  // Stores action output result for [Backend Call - API (GetAddressFromLatLong)] action in locationSerchbarPOC widget.
  ApiCallResponse? apiResultLocation;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (locationSuggestion)] action in TextField widget.
  ApiCallResponse? apiResultSuggestion;
  // Stores action output result for [Backend Call - API (retriveSuggestion)] action in Text widget.
  ApiCallResponse? apiResultRetriveLocation;
  // Stores action output result for [Backend Call - API (GetAddressFromLatLong)] action in Text widget.
  ApiCallResponse? apiResultLocationUpdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
