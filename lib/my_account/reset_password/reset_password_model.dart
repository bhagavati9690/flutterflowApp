import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_password_widget.dart' show ResetPasswordWidget;
import 'package:flutter/material.dart';

class ResetPasswordModel extends FlutterFlowModel<ResetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for passwordNew widget.
  FocusNode? passwordNewFocusNode1;
  TextEditingController? passwordNewTextController1;
  String? Function(BuildContext, String?)? passwordNewTextController1Validator;
  // State field(s) for passwordNew widget.
  FocusNode? passwordNewFocusNode2;
  TextEditingController? passwordNewTextController2;
  String? Function(BuildContext, String?)? passwordNewTextController2Validator;
  // Stores action output result for [Backend Call - API (resetPassword)] action in Button-Login widget.
  ApiCallResponse? apiResultResetPassword;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    passwordNewFocusNode1?.dispose();
    passwordNewTextController1?.dispose();

    passwordNewFocusNode2?.dispose();
    passwordNewTextController2?.dispose();
  }
}
