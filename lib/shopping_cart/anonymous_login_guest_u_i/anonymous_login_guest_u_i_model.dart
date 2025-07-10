import '/compoents/account_comp/login_comp_with_guest/login_comp_with_guest_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'anonymous_login_guest_u_i_widget.dart' show AnonymousLoginGuestUIWidget;
import 'package:flutter/material.dart';

class AnonymousLoginGuestUIModel
    extends FlutterFlowModel<AnonymousLoginGuestUIWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LoginCompWithGuest component.
  late LoginCompWithGuestModel loginCompWithGuestModel;

  @override
  void initState(BuildContext context) {
    loginCompWithGuestModel =
        createModel(context, () => LoginCompWithGuestModel());
  }

  @override
  void dispose() {
    loginCompWithGuestModel.dispose();
  }
}
