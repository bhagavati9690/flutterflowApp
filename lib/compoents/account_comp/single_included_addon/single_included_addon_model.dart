import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'single_included_addon_widget.dart' show SingleIncludedAddonWidget;
import 'package:flutter/material.dart';

class SingleIncludedAddonModel
    extends FlutterFlowModel<SingleIncludedAddonWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel;

  @override
  void initState(BuildContext context) {
    descriptionCompModel = createModel(context, () => DescriptionCompModel());
  }

  @override
  void dispose() {
    descriptionCompModel.dispose();
  }
}
