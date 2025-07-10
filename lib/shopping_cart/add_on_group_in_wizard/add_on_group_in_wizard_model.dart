import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_on_group_in_wizard_widget.dart' show AddOnGroupInWizardWidget;
import 'package:flutter/material.dart';

class AddOnGroupInWizardModel
    extends FlutterFlowModel<AddOnGroupInWizardWidget> {
  ///  Local state fields for this page.

  bool apiLoaded = false;

  String? ocKey;

  bool enableRadioButton = false;

  String totalPrice = ' ';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (addOnGroupGrid)] action in AddOnGroupInWizard widget.
  ApiCallResponse? gridCursorResponse;
  // Stores action output result for [Backend Call - API (addOnGroupCheckboxCursor)] action in AddOnGroupInWizard widget.
  ApiCallResponse? checkboxresponse;
  // Stores action output result for [Backend Call - API (radioButtonCursor)] action in AddOnGroupInWizard widget.
  ApiCallResponse? radioCursorResponse;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // Stores action output result for [Backend Call - API (radioButtonChanged)] action in CustomChoiceChips widget.
  ApiCallResponse? radioChangedResponse;
  // Stores action output result for [Backend Call - API (addOnGroupNext)] action in Button widget.
  ApiCallResponse? nextResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
