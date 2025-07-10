import '/compoents/account_comp/login_comp/login_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LoginComp component.
  late LoginCompModel loginCompModel;

  @override
  void initState(BuildContext context) {
    loginCompModel = createModel(context, () => LoginCompModel());
  }

  @override
  void dispose() {
    loginCompModel.dispose();
  }
}
