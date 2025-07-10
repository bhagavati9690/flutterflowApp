import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/error_page_view_compoent/error_page_view_compoent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'entertainer_item_widget.dart' show EntertainerItemWidget;
import 'package:flutter/material.dart';

class EntertainerItemModel extends FlutterFlowModel<EntertainerItemWidget> {
  ///  Local state fields for this page.

  bool isPageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (entertainerItemBySection)] action in EntertainerItem widget.
  ApiCallResponse? entertainerItemOutput;
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
