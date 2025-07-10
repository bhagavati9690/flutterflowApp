import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_sample2_widget.dart' show FilterSample2Widget;
import 'package:flutter/material.dart';

class FilterSample2Model extends FlutterFlowModel<FilterSample2Widget> {
  ///  Local state fields for this component.

  bool isVenueType = true;

  bool isActivityType = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
