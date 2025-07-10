import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_comp_with_guest_widget.dart' show LoginCompWithGuestWidget;
import 'package:flutter/material.dart';

class LoginCompWithGuestModel
    extends FlutterFlowModel<LoginCompWithGuestWidget> {
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
        '64o4eqs0' /* Email is required */,
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
        'lbx19v1l' /* Password is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (loginAccount)] action in Button widget.
  ApiCallResponse? apiResultLoginAction;
  // Stores action output result for [Backend Call - API (MyInformation)] action in Button widget.
  ApiCallResponse? myInformation;
  // Stores action output result for [Backend Call - API (guestAction)] action in Button widget.
  ApiCallResponse? guestAction;

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
