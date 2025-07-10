import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'vendor_inquiry_comp_widget.dart' show VendorInquiryCompWidget;
import 'package:flutter/material.dart';

class VendorInquiryCompModel extends FlutterFlowModel<VendorInquiryCompWidget> {
  ///  Local state fields for this component.

  String? cartStatusId;

  String? cartStatusLabel;

  String? submissionDateId;

  String? submissionDateLabel;

  String? prospectName;

  String? email;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (enquiryDateListpicker)] action in Button widget.
  ApiCallResponse? submissionDateListPickerResponse;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  PlaceTypeSelectedListStruct? dateAlertBoxResponse;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (CLBXEnProspectInquiryStatus)] action in Button widget.
  ApiCallResponse? shoppingCartStatusResponse;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  PlaceTypeSelectedListStruct? cartStatusAlertBoxResponse;
  // Stores action output result for [Backend Call - API (closeInquiryAction)] action in Button widget.
  ApiCallResponse? closeInquiryResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

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
