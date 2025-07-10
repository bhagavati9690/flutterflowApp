import '/compoents/account_comp/contact_u_s/contact_u_s_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_my_account_comp_widget.dart' show UserMyAccountCompWidget;
import 'package:flutter/material.dart';

class UserMyAccountCompModel extends FlutterFlowModel<UserMyAccountCompWidget> {
  ///  Local state fields for this component.

  bool compLoad = false;

  ///  State fields for stateful widgets in this component.

  // Model for ContactUS component.
  late ContactUSModel contactUSModel;

  @override
  void initState(BuildContext context) {
    contactUSModel = createModel(context, () => ContactUSModel());
  }

  @override
  void dispose() {
    contactUSModel.dispose();
  }
}
