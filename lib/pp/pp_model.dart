import '/flutter_flow/flutter_flow_util.dart';
import 'pp_widget.dart' show PpWidget;
import 'package:flutter/material.dart';

class PpModel extends FlutterFlowModel<PpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
