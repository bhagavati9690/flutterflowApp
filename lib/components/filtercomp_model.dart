import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filtercomp_widget.dart' show FiltercompWidget;
import 'package:flutter/material.dart';

class FiltercompModel extends FlutterFlowModel<FiltercompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for distanceSelection widget.
  FormFieldController<String>? distanceSelectionValueController;
  // State field(s) for sortSelection widget.
  FormFieldController<String>? sortSelectionValueController;
  // State field(s) for viewSelection widget.
  FormFieldController<String>? viewSelectionValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get distanceSelectionValue => distanceSelectionValueController?.value;
  String? get sortSelectionValue => sortSelectionValueController?.value;
  String? get viewSelectionValue => viewSelectionValueController?.value;
}
