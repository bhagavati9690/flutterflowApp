import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'place_activity_comp_widget.dart' show PlaceActivityCompWidget;
import 'package:flutter/material.dart';

class PlaceActivityCompModel extends FlutterFlowModel<PlaceActivityCompWidget> {
  ///  Local state fields for this component.

  String? slection;

  ///  State fields for stateful widgets in this component.

  // State field(s) for placeSelection widget.
  FormFieldController<String>? placeSelectionValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get placeSelectionValue => placeSelectionValueController?.value;
}
