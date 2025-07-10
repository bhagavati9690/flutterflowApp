import '/flutter_flow/flutter_flow_util.dart';
import 'addon_count_change_comp_widget.dart' show AddonCountChangeCompWidget;
import 'package:flutter/material.dart';

class AddonCountChangeCompModel
    extends FlutterFlowModel<AddonCountChangeCompWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
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
