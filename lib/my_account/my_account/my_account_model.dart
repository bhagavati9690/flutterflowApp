import '/compoents/account_comp/guest_account_compoent/guest_account_compoent_widget.dart';
import '/compoents/account_comp/user_my_account_comp/user_my_account_comp_widget.dart';
import '/compoents/account_comp/vendor_my_account_comp/vendor_my_account_comp_widget.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_account_widget.dart' show MyAccountWidget;
import 'package:flutter/material.dart';

class MyAccountModel extends FlutterFlowModel<MyAccountWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for GuestAccountCompoent component.
  late GuestAccountCompoentModel guestAccountCompoentModel;
  // Model for UserMyAccountComp component.
  late UserMyAccountCompModel userMyAccountCompModel;
  // Model for VendorMyAccountComp component.
  late VendorMyAccountCompModel vendorMyAccountCompModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    guestAccountCompoentModel =
        createModel(context, () => GuestAccountCompoentModel());
    userMyAccountCompModel =
        createModel(context, () => UserMyAccountCompModel());
    vendorMyAccountCompModel =
        createModel(context, () => VendorMyAccountCompModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    guestAccountCompoentModel.dispose();
    userMyAccountCompModel.dispose();
    vendorMyAccountCompModel.dispose();
    navBarModel.dispose();
  }
}
