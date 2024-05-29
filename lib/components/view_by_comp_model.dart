import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'view_by_comp_widget.dart' show ViewByCompWidget;
import 'package:flutter/material.dart';

class ViewByCompModel extends FlutterFlowModel<ViewByCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for viewSortSelection widget.
  FormFieldController<String>? viewSortSelectionValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get viewSortSelectionValue => viewSortSelectionValueController?.value;
}
