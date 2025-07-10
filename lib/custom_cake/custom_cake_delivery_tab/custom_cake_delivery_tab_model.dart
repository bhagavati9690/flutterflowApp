import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'custom_cake_delivery_tab_widget.dart' show CustomCakeDeliveryTabWidget;
import 'package:flutter/material.dart';

class CustomCakeDeliveryTabModel
    extends FlutterFlowModel<CustomCakeDeliveryTabWidget> {
  ///  Local state fields for this page.

  String? unitPrice;

  String? totalPrice;

  String? standDist;

  String? standRate;

  String? currentTravelDistance;

  String? travelDeliveryFees;

  String? travelFees;

  String? buildingNo;

  String? floorSection;

  String? localArea;

  String? street;

  String? city;

  String? state;

  String? postal;

  String? ocKey;

  bool showAddressSuggestions = false;

  bool apiLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (cakeItemPriceAndDeliveryCursorForCustomItem)] action in customCakeDeliveryTab widget.
  ApiCallResponse? deliveryCursor;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Backend Call - API (deliveryPageQuantityChanged)] action in CountController widget.
  ApiCallResponse? countChanged;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (deliveryTypeChangd)] action in Switch widget.
  ApiCallResponse? deliveryTypechanged;
  // Stores action output result for [Backend Call - API (deliveryTypeChangd)] action in Switch widget.
  ApiCallResponse? deliveryTypechangedCopy;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // Stores action output result for [Backend Call - API (populateAddressInCustom)] action in Row widget.
  ApiCallResponse? populateAddressResponse;
  // Stores action output result for [Backend Call - API (deliveryNext)] action in Button widget.
  ApiCallResponse? nextResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
