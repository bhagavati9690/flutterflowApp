import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'booking_policy_widget.dart' show BookingPolicyWidget;
import 'package:flutter/material.dart';

class BookingPolicyModel extends FlutterFlowModel<BookingPolicyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel1;
  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel2;
  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel3;
  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel4;

  @override
  void initState(BuildContext context) {
    descriptionCompModel1 = createModel(context, () => DescriptionCompModel());
    descriptionCompModel2 = createModel(context, () => DescriptionCompModel());
    descriptionCompModel3 = createModel(context, () => DescriptionCompModel());
    descriptionCompModel4 = createModel(context, () => DescriptionCompModel());
  }

  @override
  void dispose() {
    descriptionCompModel1.dispose();
    descriptionCompModel2.dispose();
    descriptionCompModel3.dispose();
    descriptionCompModel4.dispose();
  }
}
