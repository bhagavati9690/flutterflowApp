import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'vendor_order_comp_widget.dart' show VendorOrderCompWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class VendorOrderCompModel extends FlutterFlowModel<VendorOrderCompWidget> {
  ///  Local state fields for this component.

  String? cartStatusId;

  String? cartStatusLabel;

  String? submissionDateId;

  String? submissionDateLabel;

  String? prospectName;

  String? email;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (RequestPageSubmissionDateListPicker)] action in Button widget.
  ApiCallResponse? submissionDateListPickerResponse;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  PlaceTypeSelectedListStruct? dateAlertBoxResponse;
  // Stores action output result for [Backend Call - API (clbxEnShoppingCartStatusCursor)] action in Button widget.
  ApiCallResponse? shoppingCartStatusResponse;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  PlaceTypeSelectedListStruct? cartStatusAlertBoxResponse;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? nameResponse;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? emailFilterResponse;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(listViewVendorAllOrdersCursorPage);
  }

  void listViewVendorAllOrdersCursorPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker)
          .then((listViewVendorAllOrdersCursorResponse) {
        final pageItems = (VendorGroup.vendorAllOrdersCursorCall.details(
                  listViewVendorAllOrdersCursorResponse.jsonBody,
                )! ??
                [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewVendorAllOrdersCursorResponse,
                )
              : null,
        );
      });
}
