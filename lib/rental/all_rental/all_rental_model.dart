import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/page_viewc_o_m_p/page_viewc_o_m_p_widget.dart';
import '/compoents/common_comp/rating_comp/rating_comp_widget.dart';
import '/components/location_search_comp_all_vendor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_rental_widget.dart' show AllRentalWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllRentalModel extends FlutterFlowModel<AllRentalWidget> {
  ///  Local state fields for this page.

  String? sortOrder = 'asc';

  String? sortType = 'relevance';

  String rentalSerchQuery = '*';

  String? categoryId;

  List<String> themes = [];
  void addToThemes(String item) => themes.add(item);
  void removeFromThemes(String item) => themes.remove(item);
  void removeAtIndexFromThemes(int index) => themes.removeAt(index);
  void insertAtIndexInThemes(int index, String item) =>
      themes.insert(index, item);
  void updateThemesAtIndex(int index, Function(String) updateFn) =>
      themes[index] = updateFn(themes[index]);

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

  List<String> rentalsectioncategory = [];
  void addToRentalsectioncategory(String item) =>
      rentalsectioncategory.add(item);
  void removeFromRentalsectioncategory(String item) =>
      rentalsectioncategory.remove(item);
  void removeAtIndexFromRentalsectioncategory(int index) =>
      rentalsectioncategory.removeAt(index);
  void insertAtIndexInRentalsectioncategory(int index, String item) =>
      rentalsectioncategory.insert(index, item);
  void updateRentalsectioncategoryAtIndex(
          int index, Function(String) updateFn) =>
      rentalsectioncategory[index] = updateFn(rentalsectioncategory[index]);

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
  // State field(s) for RentalSearchField widget.
  FocusNode? rentalSearchFieldFocusNode;
  TextEditingController? rentalSearchFieldTextController;
  String? Function(BuildContext, String?)?
      rentalSearchFieldTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Stores action output result for [Backend Call - API (rentalCategory)] action in Button widget.
  ApiCallResponse? retalCategory;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  PlaceTypeSelectedListStruct? categoryAltertBoxOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  SortingDataStruct? viewSelectionOutput1;
  // State field(s) for RentalListView widget.

  PagingController<ApiPagingParams, dynamic>? rentalListViewPagingController;
  Function(ApiPagingParams nextPageMarker)? rentalListViewApiCall;

  // Models for PageViewcOMP dynamic component.
  late FlutterFlowDynamicModels<PageViewcOMPModel> pageViewcOMPModels;
  // Models for ratingComp dynamic component.
  late FlutterFlowDynamicModels<RatingCompModel> ratingCompModels;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in mapIconButton widget.
  ApiCallResponse? rntalallOutput;
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
    rentalSearchFieldFocusNode?.dispose();
    rentalSearchFieldTextController?.dispose();

    rentalListViewPagingController?.dispose();
    pageViewcOMPModels.dispose();
    ratingCompModels.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForRentalListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (rentalListViewPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

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

  PagingController<ApiPagingParams, dynamic> setRentalListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    rentalListViewApiCall = apiCall;
    return rentalListViewPagingController ??=
        _createRentalListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createRentalListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(rentalListViewGelAllRentalPage);
  }

  void rentalListViewGelAllRentalPage(ApiPagingParams nextPageMarker) =>
      rentalListViewApiCall!(nextPageMarker)
          .then((rentalListViewGelAllRentalResponse) {
        final pageItems = (RentalGroup.gelAllRentalCall.details(
                  rentalListViewGelAllRentalResponse.jsonBody,
                )! ??
                [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        rentalListViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: rentalListViewGelAllRentalResponse,
                )
              : null,
        );
      });
}
