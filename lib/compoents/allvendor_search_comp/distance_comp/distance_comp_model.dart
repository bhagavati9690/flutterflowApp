import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'distance_comp_widget.dart' show DistanceCompWidget;
import 'package:flutter/material.dart';

class DistanceCompModel extends FlutterFlowModel<DistanceCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for distanceSelected widget.
  FormFieldController<List<String>>? distanceSelectedValueController;
  String? get distanceSelectedValue =>
      distanceSelectedValueController?.value?.firstOrNull;
  set distanceSelectedValue(String? val) =>
      distanceSelectedValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
