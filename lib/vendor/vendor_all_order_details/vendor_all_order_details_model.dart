import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vendor_all_order_details_widget.dart' show VendorAllOrderDetailsWidget;
import 'package:flutter/material.dart';

class VendorAllOrderDetailsModel
    extends FlutterFlowModel<VendorAllOrderDetailsWidget> {
  ///  Local state fields for this page.

  bool apiLoaded = false;

  String selectedTab = 'Item';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (vendorAllInstanceList)] action in vendorAllOrderDetails widget.
  ApiCallResponse? vendorAllEmployeesResponse;
  // Stores action output result for [Backend Call - API (vendorAllAddonInstanceList)] action in vendorAllOrderDetails widget.
  ApiCallResponse? addonListResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
