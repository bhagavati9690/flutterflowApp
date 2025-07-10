import '/compoents/entertainer_comp/entertainer_search_comp/entertainer_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'entertainer_search_widget.dart' show EntertainerSearchWidget;
import 'package:flutter/material.dart';

class EntertainerSearchModel extends FlutterFlowModel<EntertainerSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EntertainerSearchComp component.
  late EntertainerSearchCompModel entertainerSearchCompModel;

  @override
  void initState(BuildContext context) {
    entertainerSearchCompModel =
        createModel(context, () => EntertainerSearchCompModel());
  }

  @override
  void dispose() {
    entertainerSearchCompModel.dispose();
  }
}
