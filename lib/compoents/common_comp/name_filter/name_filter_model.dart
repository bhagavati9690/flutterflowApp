import '/flutter_flow/flutter_flow_util.dart';
import 'name_filter_widget.dart' show NameFilterWidget;
import 'package:flutter/material.dart';

class NameFilterModel extends FlutterFlowModel<NameFilterWidget> {
  ///  Local state fields for this component.

  String? selectionId;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
