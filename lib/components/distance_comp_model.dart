import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'distance_comp_widget.dart' show DistanceCompWidget;
import 'package:flutter/material.dart';

class DistanceCompModel extends FlutterFlowModel<DistanceCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for distanceSelection widget.
  FormFieldController<String>? distanceSelectionValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get distanceSelectionValue => distanceSelectionValueController?.value;
}
