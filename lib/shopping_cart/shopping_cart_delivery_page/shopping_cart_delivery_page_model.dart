import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'shopping_cart_delivery_page_widget.dart'
    show ShoppingCartDeliveryPageWidget;
import 'package:flutter/material.dart';

class ShoppingCartDeliveryPageModel
    extends FlutterFlowModel<ShoppingCartDeliveryPageWidget> {
  ///  Local state fields for this page.

  String? ocKey;

  String? standDistance;

  String? standRate;

  String? currentTravelDistance;

  String? travelDeliveryRate;

  String? travelFees;

  String? totalPrice;

  bool showAddressSuggesstions = false;

  String? bldgNum = ' ';

  String? floorSection = ' ';

  String? street = ' ';

  String? localArea;

  String? cityTown = ' ';

  String? state = ' ';

  String? postalCode = ' ';

  bool apiLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (DeliveryPageCursor)] action in ShoppingCartDeliveryPage widget.
  ApiCallResponse? deliveryCursorResponse;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (DeliveryTypeChanged)] action in Switch widget.
  ApiCallResponse? deliveryTypechanged;
  // Stores action output result for [Backend Call - API (DeliveryTypeChanged)] action in Switch widget.
  ApiCallResponse? deliveryTypechangedCopy;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // Stores action output result for [Backend Call - API (DeliveryPopulateAddress)] action in Row widget.
  ApiCallResponse? populateAddressResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
