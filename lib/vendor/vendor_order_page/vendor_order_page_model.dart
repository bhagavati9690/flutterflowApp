import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/compoents/vendor_comp/vendor_customer_comp/vendor_customer_comp_widget.dart';
import '/compoents/vendor_comp/vendor_inquiry_comp/vendor_inquiry_comp_widget.dart';
import '/compoents/vendor_comp/vendor_order_comp/vendor_order_comp_widget.dart';
import '/compoents/vendor_comp/vendor_prospects/vendor_prospects_widget.dart';
import '/compoents/vendor_comp/vendor_request_comp/vendor_request_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vendor_order_page_widget.dart' show VendorOrderPageWidget;
import 'package:flutter/material.dart';

class VendorOrderPageModel extends FlutterFlowModel<VendorOrderPageWidget> {
  ///  Local state fields for this page.

  bool apiLoaded = false;

  bool requestPresent = false;

  bool ordersPresent = false;

  bool prospectsPresent = false;

  bool customerPresent = false;

  bool inquiryPresent = false;

  bool mailPresent = false;

  String? selectedTab;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (vendorDashboardCursor)] action in vendorOrderPage widget.
  ApiCallResponse? dashBoardResponse;
  // Model for vendorRequestComp component.
  late VendorRequestCompModel vendorRequestCompModel1;
  // Model for vendorOrderComp component.
  late VendorOrderCompModel vendorOrderCompModel1;
  // Model for vendorCustomerComp component.
  late VendorCustomerCompModel vendorCustomerCompModel1;
  // Model for vendorProspects component.
  late VendorProspectsModel vendorProspectsModel1;
  // Model for vendorInquiryComp component.
  late VendorInquiryCompModel vendorInquiryCompModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for vendorRequestComp component.
  late VendorRequestCompModel vendorRequestCompModel2;
  // Model for vendorOrderComp component.
  late VendorOrderCompModel vendorOrderCompModel2;
  // Model for vendorProspects component.
  late VendorProspectsModel vendorProspectsModel2;
  // Model for vendorCustomerComp component.
  late VendorCustomerCompModel vendorCustomerCompModel2;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    vendorRequestCompModel1 =
        createModel(context, () => VendorRequestCompModel());
    vendorOrderCompModel1 = createModel(context, () => VendorOrderCompModel());
    vendorCustomerCompModel1 =
        createModel(context, () => VendorCustomerCompModel());
    vendorProspectsModel1 = createModel(context, () => VendorProspectsModel());
    vendorInquiryCompModel =
        createModel(context, () => VendorInquiryCompModel());
    vendorRequestCompModel2 =
        createModel(context, () => VendorRequestCompModel());
    vendorOrderCompModel2 = createModel(context, () => VendorOrderCompModel());
    vendorProspectsModel2 = createModel(context, () => VendorProspectsModel());
    vendorCustomerCompModel2 =
        createModel(context, () => VendorCustomerCompModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    vendorRequestCompModel1.dispose();
    vendorOrderCompModel1.dispose();
    vendorCustomerCompModel1.dispose();
    vendorProspectsModel1.dispose();
    vendorInquiryCompModel.dispose();
    tabBarController?.dispose();
    vendorRequestCompModel2.dispose();
    vendorOrderCompModel2.dispose();
    vendorProspectsModel2.dispose();
    vendorCustomerCompModel2.dispose();
    navBarModel.dispose();
  }
}
