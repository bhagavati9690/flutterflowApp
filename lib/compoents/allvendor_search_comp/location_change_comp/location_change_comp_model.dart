import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_change_comp_widget.dart' show LocationChangeCompWidget;
import 'package:flutter/material.dart';

class LocationChangeCompModel
    extends FlutterFlowModel<LocationChangeCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for LocationTextField widget.
  FocusNode? locationTextFieldFocusNode;
  TextEditingController? locationTextFieldTextController;
  String? Function(BuildContext, String?)?
      locationTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (locationSuggestion)] action in LocationTextField widget.
  ApiCallResponse? apiResultLocationSuggestion;
  // Stores action output result for [Custom Action - determinePosition] action in Container widget.
  LatLng? currentPosition1;
  // Stores action output result for [Backend Call - API (getLocationFromLatLong)] action in Container widget.
  ApiCallResponse? apiResultLocation2;
  // Stores action output result for [Backend Call - API (retriveSuggestion)] action in Container widget.
  ApiCallResponse? apiResultRetriveLocation;
  // Stores action output result for [Backend Call - API (GetAddressFromLatLong)] action in Container widget.
  ApiCallResponse? apiResultLocationUpdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    locationTextFieldFocusNode?.dispose();
    locationTextFieldTextController?.dispose();
  }
}
