import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'event_read_only_page_widget.dart' show EventReadOnlyPageWidget;
import 'package:flutter/material.dart';

class EventReadOnlyPageModel extends FlutterFlowModel<EventReadOnlyPageWidget> {
  ///  Local state fields for this page.

  bool apiLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (eventInfo)] action in EventReadOnlyPage widget.
  ApiCallResponse? eventInfoRespones;
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
