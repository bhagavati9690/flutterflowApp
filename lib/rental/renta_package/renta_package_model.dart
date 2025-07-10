import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/error_page_view_compoent/error_page_view_compoent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'renta_package_widget.dart' show RentaPackageWidget;
import 'package:flutter/material.dart';

class RentaPackageModel extends FlutterFlowModel<RentaPackageWidget> {
  ///  Local state fields for this page.

  bool isPageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (rentalPackage)] action in RentaPackage widget.
  ApiCallResponse? rentalPackageOuput;
  // Model for errorPageViewCompoent component.
  late ErrorPageViewCompoentModel errorPageViewCompoentModel;
  // Models for DescriptionComp dynamic component.
  late FlutterFlowDynamicModels<DescriptionCompModel> descriptionCompModels;

  @override
  void initState(BuildContext context) {
    errorPageViewCompoentModel =
        createModel(context, () => ErrorPageViewCompoentModel());
    descriptionCompModels =
        FlutterFlowDynamicModels(() => DescriptionCompModel());
  }

  @override
  void dispose() {
    errorPageViewCompoentModel.dispose();
    descriptionCompModels.dispose();
  }
}
