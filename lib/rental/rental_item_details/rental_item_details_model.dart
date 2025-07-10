import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'rental_item_details_widget.dart' show RentalItemDetailsWidget;
import 'package:flutter/material.dart';

class RentalItemDetailsModel extends FlutterFlowModel<RentalItemDetailsWidget> {
  ///  Local state fields for this page.

  bool isPageLoad = false;

  String denomId = '-1';

  String? variationName;

  dynamic data;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (rentalItemDetails)] action in RentalItemDetails widget.
  ApiCallResponse? rentalItemDetailsouput;
  // Stores action output result for [Backend Call - API (rentalItemVariationUpdate)] action in Container widget.
  ApiCallResponse? rentalItemVariationUpdateOutput;
  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Backend Call - API (rentalItemQuantityUpdate)] action in CountController widget.
  ApiCallResponse? rentalItemQuantityUpdateOutput;
  // Stores action output result for [Backend Call - API (rentalFirstPageNext)] action in Button widget.
  ApiCallResponse? nextActionResponse;

  @override
  void initState(BuildContext context) {
    descriptionCompModel = createModel(context, () => DescriptionCompModel());
  }

  @override
  void dispose() {
    descriptionCompModel.dispose();
  }
}
