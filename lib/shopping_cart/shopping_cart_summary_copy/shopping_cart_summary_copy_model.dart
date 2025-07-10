import '/backend/api_requests/api_calls.dart';
import '/compoents/summary_page_comp/cake_shopping_cart_counter/cake_shopping_cart_counter_widget.dart';
import '/compoents/summary_page_comp/custom_cake_shopping_cart_counter/custom_cake_shopping_cart_counter_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'shopping_cart_summary_copy_widget.dart'
    show ShoppingCartSummaryCopyWidget;
import 'package:flutter/material.dart';

class ShoppingCartSummaryCopyModel
    extends FlutterFlowModel<ShoppingCartSummaryCopyWidget> {
  ///  Local state fields for this page.

  bool venuesPresent = false;

  String? checkoutOcKeys;

  bool deliveryFeePresent = false;

  bool installationFeePresent = false;

  bool insuranceFeePresent = false;

  bool cleaningFeePresent = false;

  bool taxesFeePresent = false;

  bool eventFeePresent = false;

  bool rentalPresent = false;

  bool entertainerPresent = false;

  bool cakePresent = false;

  bool customCakePresent = false;

  bool payMinVisible = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (eventInfo)] action in ShoppingCartSummaryCopy widget.
  ApiCallResponse? eventInfoResponse;
  // Stores action output result for [Backend Call - API (taxBoxCursor)] action in ShoppingCartSummaryCopy widget.
  ApiCallResponse? taxBoxResponse;
  // Stores action output result for [Backend Call - API (checkoutItemCursor)] action in ShoppingCartSummaryCopy widget.
  ApiCallResponse? checkoutItemCursorResponse;
  // Stores action output result for [Backend Call - API (allCakeItems)] action in ShoppingCartSummaryCopy widget.
  ApiCallResponse? allCakeResponse;
  // Stores action output result for [Backend Call - API (allCustomCakes)] action in ShoppingCartSummaryCopy widget.
  ApiCallResponse? allCustomCakeResponse;
  // Stores action output result for [Backend Call - API (allEntertainerItems)] action in ShoppingCartSummaryCopy widget.
  ApiCallResponse? allEntertainerResponse;
  // Stores action output result for [Backend Call - API (allRentalItems)] action in ShoppingCartSummaryCopy widget.
  ApiCallResponse? allRentalResponse;
  // Stores action output result for [Backend Call - API (allVenueItems)] action in ShoppingCartSummaryCopy widget.
  ApiCallResponse? venueAllItems;
  // Stores action output result for [Backend Call - API (clearCart)] action in Row widget.
  ApiCallResponse? apiResultikfCopy;
  // Stores action output result for [Backend Call - API (NavigateToVendor)] action in Row widget.
  ApiCallResponse? navigateResponse;
  // Stores action output result for [Backend Call - API (venueEditAction)] action in Row widget.
  ApiCallResponse? venueEditaAction;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Row widget.
  bool? deleteConfirmationBool;
  // Stores action output result for [Backend Call - API (deleteVenueItem)] action in Row widget.
  ApiCallResponse? deleteActionResponse;
  // Stores action output result for [Backend Call - API (NavigateToVendor)] action in Row widget.
  ApiCallResponse? rentalNavigateResponse;
  // Stores action output result for [Backend Call - API (rentalEditAction)] action in Row widget.
  ApiCallResponse? rentalEditAction;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Row widget.
  bool? deleteRentalConfirmationBool;
  // Stores action output result for [Backend Call - API (deleteRentalItem)] action in Row widget.
  ApiCallResponse? deleteRentalActionResponse;
  // Stores action output result for [Backend Call - API (NavigateToVendor)] action in Row widget.
  ApiCallResponse? entertainerNavigateResponse;
  // Stores action output result for [Backend Call - API (rentalEditAction)] action in Row widget.
  ApiCallResponse? entertainerEditResponse;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Row widget.
  bool? deleteEntertainerConfirmationBool;
  // Stores action output result for [Backend Call - API (deleteEntertainerItem)] action in Row widget.
  ApiCallResponse? deleteEntertainerResponse;
  // Stores action output result for [Backend Call - API (customCakeEdit)] action in Row widget.
  ApiCallResponse? editCustomCakeResponse;
  // Models for customCakeShoppingCartCounter dynamic component.
  late FlutterFlowDynamicModels<CustomCakeShoppingCartCounterModel>
      customCakeShoppingCartCounterModels;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Row widget.
  bool? deleteCustomConfirmation;
  // Stores action output result for [Backend Call - API (customCakeDeleteAction)] action in Row widget.
  ApiCallResponse? deleteCustomCakeResponse;
  // Stores action output result for [Backend Call - API (NavigateToVendor)] action in Row widget.
  ApiCallResponse? cakeNavigateResponse;
  // Stores action output result for [Backend Call - API (cakeEditAction)] action in Row widget.
  ApiCallResponse? cakeEditResponse;
  // Models for cakeShoppingCartCounter dynamic component.
  late FlutterFlowDynamicModels<CakeShoppingCartCounterModel>
      cakeShoppingCartCounterModels;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Row widget.
  bool? deleteCakeConfirmationBoolCopy;
  // Stores action output result for [Backend Call - API (deleteCakeItem)] action in Row widget.
  ApiCallResponse? deleteCakeResponse;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd33gd8fd' /* Email  is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for minDepositCheckbox widget.
  bool? minDepositCheckboxValue;
  // State field(s) for smsCheckbox widget.
  bool? smsCheckboxValue;
  // Stores action output result for [Backend Call - API (SubmitRequests)] action in Button widget.
  ApiCallResponse? submitResponse;
  // Stores action output result for [Backend Call - API (cartPaymentCursor)] action in Button widget.
  ApiCallResponse? cartPaymentCursorResponse;

  @override
  void initState(BuildContext context) {
    customCakeShoppingCartCounterModels =
        FlutterFlowDynamicModels(() => CustomCakeShoppingCartCounterModel());
    cakeShoppingCartCounterModels =
        FlutterFlowDynamicModels(() => CakeShoppingCartCounterModel());
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    customCakeShoppingCartCounterModels.dispose();
    cakeShoppingCartCounterModels.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
