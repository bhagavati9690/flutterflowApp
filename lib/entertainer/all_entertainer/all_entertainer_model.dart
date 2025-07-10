import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/page_viewc_o_m_p/page_viewc_o_m_p_widget.dart';
import '/compoents/common_comp/rating_comp/rating_comp_widget.dart';
import '/components/location_search_comp_all_vendor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_entertainer_widget.dart' show AllEntertainerWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllEntertainerModel extends FlutterFlowModel<AllEntertainerWidget> {
  ///  Local state fields for this page.

  String? sortOrder = 'asc';

  String? sortType = 'relevance';

  String entertainerSerchQuery = '*';

  String? categoryId;

  List<String> priceFactor = [];
  void addToPriceFactor(String item) => priceFactor.add(item);
  void removeFromPriceFactor(String item) => priceFactor.remove(item);
  void removeAtIndexFromPriceFactor(int index) => priceFactor.removeAt(index);
  void insertAtIndexInPriceFactor(int index, String item) =>
      priceFactor.insert(index, item);
  void updatePriceFactorAtIndex(int index, Function(String) updateFn) =>
      priceFactor[index] = updateFn(priceFactor[index]);

  List<String> ageRange = [];
  void addToAgeRange(String item) => ageRange.add(item);
  void removeFromAgeRange(String item) => ageRange.remove(item);
  void removeAtIndexFromAgeRange(int index) => ageRange.removeAt(index);
  void insertAtIndexInAgeRange(int index, String item) =>
      ageRange.insert(index, item);
  void updateAgeRangeAtIndex(int index, Function(String) updateFn) =>
      ageRange[index] = updateFn(ageRange[index]);

  List<String> town = [];
  void addToTown(String item) => town.add(item);
  void removeFromTown(String item) => town.remove(item);
  void removeAtIndexFromTown(int index) => town.removeAt(index);
  void insertAtIndexInTown(int index, String item) => town.insert(index, item);
  void updateTownAtIndex(int index, Function(String) updateFn) =>
      town[index] = updateFn(town[index]);

  List<String> entertainercategory = [];
  void addToEntertainercategory(String item) => entertainercategory.add(item);
  void removeFromEntertainercategory(String item) =>
      entertainercategory.remove(item);
  void removeAtIndexFromEntertainercategory(int index) =>
      entertainercategory.removeAt(index);
  void insertAtIndexInEntertainercategory(int index, String item) =>
      entertainercategory.insert(index, item);
  void updateEntertainercategoryAtIndex(int index, Function(String) updateFn) =>
      entertainercategory[index] = updateFn(entertainercategory[index]);

  List<String> ranking = [];
  void addToRanking(String item) => ranking.add(item);
  void removeFromRanking(String item) => ranking.remove(item);
  void removeAtIndexFromRanking(int index) => ranking.removeAt(index);
  void insertAtIndexInRanking(int index, String item) =>
      ranking.insert(index, item);
  void updateRankingAtIndex(int index, Function(String) updateFn) =>
      ranking[index] = updateFn(ranking[index]);

  String? categoryName;

  bool showSuggestion = false;

  bool pageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Model for locationSearchCompAllVendor component.
  late LocationSearchCompAllVendorModel locationSearchCompAllVendorModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in locationSearchCompAllVendor widget.
  LocationReturnStruct? locationUpdateOutput;
  // Stores action output result for [Backend Call - API (assignLocation)] action in locationSearchCompAllVendor widget.
  ApiCallResponse? assignLocation;
  // Stores action output result for [Backend Call - API (VisibleTab)] action in locationSearchCompAllVendor widget.
  ApiCallResponse? visibleTabResponse;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? distanceSelectionOutput2;
  // State field(s) for EntertainerSearchField widget.
  FocusNode? entertainerSearchFieldFocusNode;
  TextEditingController? entertainerSearchFieldTextController;
  String? Function(BuildContext, String?)?
      entertainerSearchFieldTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Stores action output result for [Backend Call - API (entertainerCategory)] action in Button widget.
  ApiCallResponse? entertainerCategory;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  PlaceTypeSelectedListStruct? categoryAltertBoxOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  SortingDataStruct? viewSelectionOutput1;
  // State field(s) for EntertainerListView widget.

  PagingController<ApiPagingParams, dynamic>?
      entertainerListViewPagingController;
  Function(ApiPagingParams nextPageMarker)? entertainerListViewApiCall;

  // Models for PageViewcOMP dynamic component.
  late FlutterFlowDynamicModels<PageViewcOMPModel> pageViewcOMPModels;
  // Models for ratingComp dynamic component.
  late FlutterFlowDynamicModels<RatingCompModel> ratingCompModels;
  // Stores action output result for [Backend Call - API (gelAllEntertainer)] action in mapIconButton widget.
  ApiCallResponse? entrainerOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  FilterSelectionDataStruct? aggreSelection;

  @override
  void initState(BuildContext context) {
    locationSearchCompAllVendorModel =
        createModel(context, () => LocationSearchCompAllVendorModel());
    pageViewcOMPModels = FlutterFlowDynamicModels(() => PageViewcOMPModel());
    ratingCompModels = FlutterFlowDynamicModels(() => RatingCompModel());
  }

  @override
  void dispose() {
    locationSearchCompAllVendorModel.dispose();
    entertainerSearchFieldFocusNode?.dispose();
    entertainerSearchFieldTextController?.dispose();

    entertainerListViewPagingController?.dispose();
    pageViewcOMPModels.dispose();
    ratingCompModels.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForEntertainerListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (entertainerListViewPagingController?.nextPageKey?.nextPageNumber ??
                  0) >
              0;
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

  PagingController<ApiPagingParams, dynamic> setEntertainerListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    entertainerListViewApiCall = apiCall;
    return entertainerListViewPagingController ??=
        _createEntertainerListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic>
      _createEntertainerListViewController(
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
      ..addPageRequestListener(entertainerListViewGelAllEntertainerPage);
  }

  void entertainerListViewGelAllEntertainerPage(
          ApiPagingParams nextPageMarker) =>
      entertainerListViewApiCall!(nextPageMarker)
          .then((entertainerListViewGelAllEntertainerResponse) {
        final pageItems = (EntertainerGroup.gelAllEntertainerCall.details(
                  entertainerListViewGelAllEntertainerResponse.jsonBody,
                )! ??
                [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        entertainerListViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: entertainerListViewGelAllEntertainerResponse,
                )
              : null,
        );
      });
}
