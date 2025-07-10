import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/page_viewc_o_m_p/page_viewc_o_m_p_widget.dart';
import '/compoents/common_comp/rating_comp/rating_comp_widget.dart';
import '/components/location_search_comp_all_vendor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_cakes_widget.dart' show AllCakesWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllCakesModel extends FlutterFlowModel<AllCakesWidget> {
  ///  Local state fields for this page.

  String? sortOrder = 'asc';

  String? sortType = 'relevance';

  String cakeSerchQuery = '*';

  String? themeId;

  List<String> priceFactor = [];
  void addToPriceFactor(String item) => priceFactor.add(item);
  void removeFromPriceFactor(String item) => priceFactor.remove(item);
  void removeAtIndexFromPriceFactor(int index) => priceFactor.removeAt(index);
  void insertAtIndexInPriceFactor(int index, String item) =>
      priceFactor.insert(index, item);
  void updatePriceFactorAtIndex(int index, Function(String) updateFn) =>
      priceFactor[index] = updateFn(priceFactor[index]);

  List<String> foodProviderType = [];
  void addToFoodProviderType(String item) => foodProviderType.add(item);
  void removeFromFoodProviderType(String item) => foodProviderType.remove(item);
  void removeAtIndexFromFoodProviderType(int index) =>
      foodProviderType.removeAt(index);
  void insertAtIndexInFoodProviderType(int index, String item) =>
      foodProviderType.insert(index, item);
  void updateFoodProviderTypeAtIndex(int index, Function(String) updateFn) =>
      foodProviderType[index] = updateFn(foodProviderType[index]);

  List<String> town = [];
  void addToTown(String item) => town.add(item);
  void removeFromTown(String item) => town.remove(item);
  void removeAtIndexFromTown(int index) => town.removeAt(index);
  void insertAtIndexInTown(int index, String item) => town.insert(index, item);
  void updateTownAtIndex(int index, Function(String) updateFn) =>
      town[index] = updateFn(town[index]);

  List<String> themecategory = [];
  void addToThemecategory(String item) => themecategory.add(item);
  void removeFromThemecategory(String item) => themecategory.remove(item);
  void removeAtIndexFromThemecategory(int index) =>
      themecategory.removeAt(index);
  void insertAtIndexInThemecategory(int index, String item) =>
      themecategory.insert(index, item);
  void updateThemecategoryAtIndex(int index, Function(String) updateFn) =>
      themecategory[index] = updateFn(themecategory[index]);

  List<String> ranking = [];
  void addToRanking(String item) => ranking.add(item);
  void removeFromRanking(String item) => ranking.remove(item);
  void removeAtIndexFromRanking(int index) => ranking.removeAt(index);
  void insertAtIndexInRanking(int index, String item) =>
      ranking.insert(index, item);
  void updateRankingAtIndex(int index, Function(String) updateFn) =>
      ranking[index] = updateFn(ranking[index]);

  String? themeName;

  bool showSuggestion = false;

  List<String> menuRestriction = [];
  void addToMenuRestriction(String item) => menuRestriction.add(item);
  void removeFromMenuRestriction(String item) => menuRestriction.remove(item);
  void removeAtIndexFromMenuRestriction(int index) =>
      menuRestriction.removeAt(index);
  void insertAtIndexInMenuRestriction(int index, String item) =>
      menuRestriction.insert(index, item);
  void updateMenuRestrictionAtIndex(int index, Function(String) updateFn) =>
      menuRestriction[index] = updateFn(menuRestriction[index]);

  List<String> cakeFlavors = [];
  void addToCakeFlavors(String item) => cakeFlavors.add(item);
  void removeFromCakeFlavors(String item) => cakeFlavors.remove(item);
  void removeAtIndexFromCakeFlavors(int index) => cakeFlavors.removeAt(index);
  void insertAtIndexInCakeFlavors(int index, String item) =>
      cakeFlavors.insert(index, item);
  void updateCakeFlavorsAtIndex(int index, Function(String) updateFn) =>
      cakeFlavors[index] = updateFn(cakeFlavors[index]);

  List<String> fillings = [];
  void addToFillings(String item) => fillings.add(item);
  void removeFromFillings(String item) => fillings.remove(item);
  void removeAtIndexFromFillings(int index) => fillings.removeAt(index);
  void insertAtIndexInFillings(int index, String item) =>
      fillings.insert(index, item);
  void updateFillingsAtIndex(int index, Function(String) updateFn) =>
      fillings[index] = updateFn(fillings[index]);

  List<String> icecremeFlavors = [];
  void addToIcecremeFlavors(String item) => icecremeFlavors.add(item);
  void removeFromIcecremeFlavors(String item) => icecremeFlavors.remove(item);
  void removeAtIndexFromIcecremeFlavors(int index) =>
      icecremeFlavors.removeAt(index);
  void insertAtIndexInIcecremeFlavors(int index, String item) =>
      icecremeFlavors.insert(index, item);
  void updateIcecremeFlavorsAtIndex(int index, Function(String) updateFn) =>
      icecremeFlavors[index] = updateFn(icecremeFlavors[index]);

  List<String> mindeliveryfee = [];
  void addToMindeliveryfee(String item) => mindeliveryfee.add(item);
  void removeFromMindeliveryfee(String item) => mindeliveryfee.remove(item);
  void removeAtIndexFromMindeliveryfee(int index) =>
      mindeliveryfee.removeAt(index);
  void insertAtIndexInMindeliveryfee(int index, String item) =>
      mindeliveryfee.insert(index, item);
  void updateMindeliveryfeeAtIndex(int index, Function(String) updateFn) =>
      mindeliveryfee[index] = updateFn(mindeliveryfee[index]);

  bool pageload = false;

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
  // State field(s) for cakeSearchField widget.
  FocusNode? cakeSearchFieldFocusNode;
  TextEditingController? cakeSearchFieldTextController;
  String? Function(BuildContext, String?)?
      cakeSearchFieldTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Stores action output result for [Backend Call - API (CakeThemes)] action in Button widget.
  ApiCallResponse? cakeThemesOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  PlaceTypeSelectedListStruct? themeAltertBoxOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  SortingDataStruct? viewSelectionOutput1;
  // State field(s) for CakeListView widget.

  PagingController<ApiPagingParams, dynamic>? cakeListViewPagingController;
  Function(ApiPagingParams nextPageMarker)? cakeListViewApiCall;

  // Models for PageViewcOMP dynamic component.
  late FlutterFlowDynamicModels<PageViewcOMPModel> pageViewcOMPModels;
  // Models for ratingComp dynamic component.
  late FlutterFlowDynamicModels<RatingCompModel> ratingCompModels;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in mapIconButton widget.
  ApiCallResponse? cakeOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  CakeFilterDataStruct? cakeaggreation;

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
    cakeSearchFieldFocusNode?.dispose();
    cakeSearchFieldTextController?.dispose();

    cakeListViewPagingController?.dispose();
    pageViewcOMPModels.dispose();
    ratingCompModels.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForCakeListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (cakeListViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
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

  PagingController<ApiPagingParams, dynamic> setCakeListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    cakeListViewApiCall = apiCall;
    return cakeListViewPagingController ??=
        _createCakeListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createCakeListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(cakeListViewGelAllCakePage);
  }

  void cakeListViewGelAllCakePage(ApiPagingParams nextPageMarker) =>
      cakeListViewApiCall!(nextPageMarker)
          .then((cakeListViewGelAllCakeResponse) {
        final pageItems = (CakeGroup.gelAllCakeCall.details(
                  cakeListViewGelAllCakeResponse.jsonBody,
                )! ??
                [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        cakeListViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: cakeListViewGelAllCakeResponse,
                )
              : null,
        );
      });
}
