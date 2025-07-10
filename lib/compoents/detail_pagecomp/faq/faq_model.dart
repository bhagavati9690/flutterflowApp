import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'faq_widget.dart' show FaqWidget;
import 'package:flutter/material.dart';

class FaqModel extends FlutterFlowModel<FaqWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for DescriptionComp dynamic component.
  late FlutterFlowDynamicModels<DescriptionCompModel> descriptionCompModels;

  @override
  void initState(BuildContext context) {
    descriptionCompModels =
        FlutterFlowDynamicModels(() => DescriptionCompModel());
  }

  @override
  void dispose() {
    descriptionCompModels.dispose();
  }
}
