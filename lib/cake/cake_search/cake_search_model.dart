import '/compoents/cake_comp/cake_search_comp/cake_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cake_search_widget.dart' show CakeSearchWidget;
import 'package:flutter/material.dart';

class CakeSearchModel extends FlutterFlowModel<CakeSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CakeSearchComp component.
  late CakeSearchCompModel cakeSearchCompModel;

  @override
  void initState(BuildContext context) {
    cakeSearchCompModel = createModel(context, () => CakeSearchCompModel());
  }

  @override
  void dispose() {
    cakeSearchCompModel.dispose();
  }
}
