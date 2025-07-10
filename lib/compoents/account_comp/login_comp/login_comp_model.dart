import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_comp_widget.dart' show LoginCompWidget;
import 'package:flutter/material.dart';

class LoginCompModel extends FlutterFlowModel<LoginCompWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1khkv9uw' /* Email is required */,
      );
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9v0kbzn7' /* Password is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (loginAccount)] action in Button widget.
  ApiCallResponse? apiResultLoginAction;
  // Stores action output result for [Backend Call - API (MyInformation)] action in Button widget.
  ApiCallResponse? myInformation;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? currentUserResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? currentUserBeforeAddResponse;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UsersRecord? createUserResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? currentUserResponse2;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
