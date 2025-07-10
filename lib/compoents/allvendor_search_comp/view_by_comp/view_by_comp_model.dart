import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'view_by_comp_widget.dart' show ViewByCompWidget;
import 'package:flutter/material.dart';

class ViewByCompModel extends FlutterFlowModel<ViewByCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SortSelection widget.
  FormFieldController<List<String>>? sortSelectionValueController;
  String? get sortSelectionValue =>
      sortSelectionValueController?.value?.firstOrNull;
  set sortSelectionValue(String? val) =>
      sortSelectionValueController?.value = val != null ? [val] : [];
  // State field(s) for viewSortSelection widget.
  FormFieldController<List<String>>? viewSortSelectionValueController;
  String? get viewSortSelectionValue =>
      viewSortSelectionValueController?.value?.firstOrNull;
  set viewSortSelectionValue(String? val) =>
      viewSortSelectionValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
