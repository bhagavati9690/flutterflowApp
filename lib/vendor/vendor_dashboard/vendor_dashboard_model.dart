import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'vendor_dashboard_widget.dart' show VendorDashboardWidget;
import 'package:flutter/material.dart';

class VendorDashboardModel extends FlutterFlowModel<VendorDashboardWidget> {
  ///  Local state fields for this page.

  String orders = '0';

  String request = '0';

  String revenue = ' (\$ 0.00)';

  String notifications = '0';

  String prospects = '0';

  String customer = '0';

  bool apiLoaded = false;

  List<NameIdSearchableStruct> listpicker = [];
  void addToListpicker(NameIdSearchableStruct item) => listpicker.add(item);
  void removeFromListpicker(NameIdSearchableStruct item) =>
      listpicker.remove(item);
  void removeAtIndexFromListpicker(int index) => listpicker.removeAt(index);
  void insertAtIndexInListpicker(int index, NameIdSearchableStruct item) =>
      listpicker.insert(index, item);
  void updateListpickerAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      listpicker[index] = updateFn(listpicker[index]);

  String inquiry = '0';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (dateSpanListpicker)] action in vendorDashboard widget.
  ApiCallResponse? listpickerResponse;
  // Stores action output result for [Backend Call - API (vendorDashboardCursor)] action in vendorDashboard widget.
  ApiCallResponse? dashBoardResponse;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (vendorDashboardCursor)] action in DropDown widget.
  ApiCallResponse? filterChangedResponse;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
