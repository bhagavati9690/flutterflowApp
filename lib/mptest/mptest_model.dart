import '/flutter_flow/flutter_flow_util.dart';
import 'mptest_widget.dart' show MptestWidget;
import 'package:flutter/material.dart';

class MptestModel extends FlutterFlowModel<MptestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
