import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'food_single_page_cart_details_widget.dart'
    show FoodSinglePageCartDetailsWidget;
import 'package:flutter/material.dart';

class FoodSinglePageCartDetailsModel
    extends FlutterFlowModel<FoodSinglePageCartDetailsWidget> {
  ///  Local state fields for this page.

  bool isPageLoad = false;

  String denomId = '-1';

  String? personServed = '';

  String unitPrice = 'NA';

  String totalPrice = 'NA';

  String? variationName;

  dynamic data;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (foodSinglePageDetail)] action in foodSinglePageCartDetails widget.
  ApiCallResponse? foodSinglePageDetailsouput;
  // Stores action output result for [Backend Call - API (rentalPackageVariationUpdate)] action in Container widget.
  ApiCallResponse? rentalPackageVariationUpdateOutput;
  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Backend Call - API (rentalPackageQuantityUpdate)] action in CountController widget.
  ApiCallResponse? rentalPackageQuantityUpdateOutput;
  // Stores action output result for [Backend Call - API (foodSinglePageNext)] action in Button widget.
  ApiCallResponse? nextResponse;

  @override
  void initState(BuildContext context) {
    descriptionCompModel = createModel(context, () => DescriptionCompModel());
  }

  @override
  void dispose() {
    descriptionCompModel.dispose();
  }
}
