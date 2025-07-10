import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'timer_picker_comp_widget.dart' show TimerPickerCompWidget;
import 'package:flutter/material.dart';

class TimerPickerCompModel extends FlutterFlowModel<TimerPickerCompWidget> {
  ///  Local state fields for this component.

  DateTime? selectedTime;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
