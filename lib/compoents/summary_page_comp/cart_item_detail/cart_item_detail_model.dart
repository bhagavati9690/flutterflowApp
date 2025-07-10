import '/backend/api_requests/api_calls.dart';
import '/compoents/account_comp/single_addon/single_addon_widget.dart';
import '/compoents/account_comp/single_included_addon/single_included_addon_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_item_detail_widget.dart' show CartItemDetailWidget;
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CartItemDetailModel extends FlutterFlowModel<CartItemDetailWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // Stores action output result for [Backend Call - API (addOnDelete)] action in Icon widget.
  ApiCallResponse? includedAddonDelete1;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for singleAddon dynamic component.
  late FlutterFlowDynamicModels<SingleAddonModel> singleAddonModels1;
  // Models for singleAddon dynamic component.
  late FlutterFlowDynamicModels<SingleAddonModel> singleAddonModels2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // Models for singleIncludedAddon dynamic component.
  late FlutterFlowDynamicModels<SingleIncludedAddonModel>
      singleIncludedAddonModels1;
  // Models for singleIncludedAddon dynamic component.
  late FlutterFlowDynamicModels<SingleIncludedAddonModel>
      singleIncludedAddonModels2;

  @override
  void initState(BuildContext context) {
    descriptionCompModel = createModel(context, () => DescriptionCompModel());
    singleAddonModels1 = FlutterFlowDynamicModels(() => SingleAddonModel());
    singleAddonModels2 = FlutterFlowDynamicModels(() => SingleAddonModel());
    singleIncludedAddonModels1 =
        FlutterFlowDynamicModels(() => SingleIncludedAddonModel());
    singleIncludedAddonModels2 =
        FlutterFlowDynamicModels(() => SingleIncludedAddonModel());
  }

  @override
  void dispose() {
    descriptionCompModel.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    singleAddonModels1.dispose();
    singleAddonModels2.dispose();
    expandableExpandableController5.dispose();
    singleIncludedAddonModels1.dispose();
    singleIncludedAddonModels2.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
