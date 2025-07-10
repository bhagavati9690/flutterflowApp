import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/error_page_view_compoent/error_page_view_compoent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cake_item_widget.dart' show CakeItemWidget;
import 'package:flutter/material.dart';

class CakeItemModel extends FlutterFlowModel<CakeItemWidget> {
  ///  Local state fields for this page.

  bool isPageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (CakeItemOfSection)] action in CakeItem widget.
  ApiCallResponse? cakeItemOutput;
  // Model for errorPageViewCompoent component.
  late ErrorPageViewCompoentModel errorPageViewCompoentModel;

  @override
  void initState(BuildContext context) {
    errorPageViewCompoentModel =
        createModel(context, () => ErrorPageViewCompoentModel());
  }

  @override
  void dispose() {
    errorPageViewCompoentModel.dispose();
  }
}
