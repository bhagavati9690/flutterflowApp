import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/counter_comp/counter_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_on_page_in_wizard_widget.dart' show AddOnPageInWizardWidget;
import 'package:flutter/material.dart';

class AddOnPageInWizardModel extends FlutterFlowModel<AddOnPageInWizardWidget> {
  ///  Local state fields for this page.

  bool apiLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (addOnGrid)] action in addOnPageInWizard widget.
  ApiCallResponse? gridResponse;
  // Models for CounterComp dynamic component.
  late FlutterFlowDynamicModels<CounterCompModel> counterCompModels;
  // Stores action output result for [Backend Call - API (addOnNext)] action in Button widget.
  ApiCallResponse? addOnNextResponse;

  @override
  void initState(BuildContext context) {
    counterCompModels = FlutterFlowDynamicModels(() => CounterCompModel());
  }

  @override
  void dispose() {
    counterCompModels.dispose();
  }
}
