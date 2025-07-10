import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'description_comp_copy_widget.dart' show DescriptionCompCopyWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DescriptionCompCopyModel
    extends FlutterFlowModel<DescriptionCompCopyWidget> {
  ///  Local state fields for this component.

  NameIdSearchableStruct? content;
  void updateContentStruct(Function(NameIdSearchableStruct) updateFn) {
    updateFn(content ??= NameIdSearchableStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
