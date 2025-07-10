import '/backend/api_requests/api_calls.dart';
import '/compoents/account_comp/single_addon/single_addon_widget.dart';
import '/compoents/account_comp/single_included_addon/single_included_addon_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'request_details_widget.dart' show RequestDetailsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class RequestDetailsModel extends FlutterFlowModel<RequestDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Stores action output result for [Backend Call - API (DeleteAddon)] action in Icon widget.
  ApiCallResponse? includedAddonDelete1;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Models for singleAddon dynamic component.
  late FlutterFlowDynamicModels<SingleAddonModel> singleAddonModels1;
  // Stores action output result for [Backend Call - API (DeleteAddon)] action in Icon widget.
  ApiCallResponse? includedAddonDelete2;
  Completer<ApiCallResponse>? apiRequestCompleter3;
  // Models for singleAddon dynamic component.
  late FlutterFlowDynamicModels<SingleAddonModel> singleAddonModels2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // Stores action output result for [Backend Call - API (DeleteAddon)] action in Icon widget.
  ApiCallResponse? includedAddonDelete4;
  Completer<ApiCallResponse>? apiRequestCompleter4;
  // Models for singleIncludedAddon dynamic component.
  late FlutterFlowDynamicModels<SingleIncludedAddonModel>
      singleIncludedAddonModels1;
  // Stores action output result for [Backend Call - API (DeleteAddon)] action in Icon widget.
  ApiCallResponse? includedAddonDelete3;
  Completer<ApiCallResponse>? apiRequestCompleter2;
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
    singleAddonModels1.dispose();
    singleAddonModels2.dispose();
    expandableExpandableController2.dispose();
    singleIncludedAddonModels1.dispose();
    singleIncludedAddonModels2.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
