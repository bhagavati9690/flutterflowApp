import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'description_comp_widget.dart' show DescriptionCompWidget;
import 'package:flutter/material.dart';

class DescriptionCompModel extends FlutterFlowModel<DescriptionCompWidget> {
  ///  Local state fields for this component.

  NameIdSearchableStruct? content;
  void updateContentStruct(Function(NameIdSearchableStruct) updateFn) {
    updateFn(content ??= NameIdSearchableStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
