import '/flutter_flow/flutter_flow_util.dart';
import 'email_comp_widget.dart' show EmailCompWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class EmailCompModel extends FlutterFlowModel<EmailCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for to widget.
  FocusNode? toFocusNode;
  TextEditingController? toTextController;
  String? Function(BuildContext, String?)? toTextControllerValidator;
  // State field(s) for subject widget.
  FocusNode? subjectFocusNode;
  TextEditingController? subjectTextController;
  String? Function(BuildContext, String?)? subjectTextControllerValidator;
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    toFocusNode?.dispose();
    toTextController?.dispose();

    subjectFocusNode?.dispose();
    subjectTextController?.dispose();

    messageFocusNode?.dispose();
    messageTextController?.dispose();
  }
}
