import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_venue_widget.dart' show AllVenueWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllVenueModel extends FlutterFlowModel<AllVenueWidget> {
  ///  Local state fields for this page.

  List<String> venueAggregation = [''];
  void addToVenueAggregation(String item) => venueAggregation.add(item);
  void removeFromVenueAggregation(String item) => venueAggregation.remove(item);
  void removeAtIndexFromVenueAggregation(int index) =>
      venueAggregation.removeAt(index);
  void insertAtIndexInVenueAggregation(int index, String item) =>
      venueAggregation.insert(index, item);
  void updateVenueAggregationAtIndex(int index, Function(String) updateFn) =>
      venueAggregation[index] = updateFn(venueAggregation[index]);

  List<String> activityTypeAggregation = [''];
  void addToActivityTypeAggregation(String item) =>
      activityTypeAggregation.add(item);
  void removeFromActivityTypeAggregation(String item) =>
      activityTypeAggregation.remove(item);
  void removeAtIndexFromActivityTypeAggregation(int index) =>
      activityTypeAggregation.removeAt(index);
  void insertAtIndexInActivityTypeAggregation(int index, String item) =>
      activityTypeAggregation.insert(index, item);
  void updateActivityTypeAggregationAtIndex(
          int index, Function(String) updateFn) =>
      activityTypeAggregation[index] = updateFn(activityTypeAggregation[index]);

  List<String> townAggregation = [''];
  void addToTownAggregation(String item) => townAggregation.add(item);
  void removeFromTownAggregation(String item) => townAggregation.remove(item);
  void removeAtIndexFromTownAggregation(int index) =>
      townAggregation.removeAt(index);
  void insertAtIndexInTownAggregation(int index, String item) =>
      townAggregation.insert(index, item);
  void updateTownAggregationAtIndex(int index, Function(String) updateFn) =>
      townAggregation[index] = updateFn(townAggregation[index]);

  List<String> activityCategoryAggregation = [''];
  void addToActivityCategoryAggregation(String item) =>
      activityCategoryAggregation.add(item);
  void removeFromActivityCategoryAggregation(String item) =>
      activityCategoryAggregation.remove(item);
  void removeAtIndexFromActivityCategoryAggregation(int index) =>
      activityCategoryAggregation.removeAt(index);
  void insertAtIndexInActivityCategoryAggregation(int index, String item) =>
      activityCategoryAggregation.insert(index, item);
  void updateActivityCategoryAggregationAtIndex(
          int index, Function(String) updateFn) =>
      activityCategoryAggregation[index] =
          updateFn(activityCategoryAggregation[index]);

  List<String> sportstypeAggregation = [''];
  void addToSportstypeAggregation(String item) =>
      sportstypeAggregation.add(item);
  void removeFromSportstypeAggregation(String item) =>
      sportstypeAggregation.remove(item);
  void removeAtIndexFromSportstypeAggregation(int index) =>
      sportstypeAggregation.removeAt(index);
  void insertAtIndexInSportstypeAggregation(int index, String item) =>
      sportstypeAggregation.insert(index, item);
  void updateSportstypeAggregationAtIndex(
          int index, Function(String) updateFn) =>
      sportstypeAggregation[index] = updateFn(sportstypeAggregation[index]);

  List<String> capacityAggregation = [''];
  void addToCapacityAggregation(String item) => capacityAggregation.add(item);
  void removeFromCapacityAggregation(String item) =>
      capacityAggregation.remove(item);
  void removeAtIndexFromCapacityAggregation(int index) =>
      capacityAggregation.removeAt(index);
  void insertAtIndexInCapacityAggregation(int index, String item) =>
      capacityAggregation.insert(index, item);
  void updateCapacityAggregationAtIndex(int index, Function(String) updateFn) =>
      capacityAggregation[index] = updateFn(capacityAggregation[index]);

  List<String> rankingAggregation = [''];
  void addToRankingAggregation(String item) => rankingAggregation.add(item);
  void removeFromRankingAggregation(String item) =>
      rankingAggregation.remove(item);
  void removeAtIndexFromRankingAggregation(int index) =>
      rankingAggregation.removeAt(index);
  void insertAtIndexInRankingAggregation(int index, String item) =>
      rankingAggregation.insert(index, item);
  void updateRankingAggregationAtIndex(int index, Function(String) updateFn) =>
      rankingAggregation[index] = updateFn(rankingAggregation[index]);

  List<String> pricefactorAggregation = [''];
  void addToPricefactorAggregation(String item) =>
      pricefactorAggregation.add(item);
  void removeFromPricefactorAggregation(String item) =>
      pricefactorAggregation.remove(item);
  void removeAtIndexFromPricefactorAggregation(int index) =>
      pricefactorAggregation.removeAt(index);
  void insertAtIndexInPricefactorAggregation(int index, String item) =>
      pricefactorAggregation.insert(index, item);
  void updatePricefactorAggregationAtIndex(
          int index, Function(String) updateFn) =>
      pricefactorAggregation[index] = updateFn(pricefactorAggregation[index]);

  List<String> demographicsAggregation = [''];
  void addToDemographicsAggregation(String item) =>
      demographicsAggregation.add(item);
  void removeFromDemographicsAggregation(String item) =>
      demographicsAggregation.remove(item);
  void removeAtIndexFromDemographicsAggregation(int index) =>
      demographicsAggregation.removeAt(index);
  void insertAtIndexInDemographicsAggregation(int index, String item) =>
      demographicsAggregation.insert(index, item);
  void updateDemographicsAggregationAtIndex(
          int index, Function(String) updateFn) =>
      demographicsAggregation[index] = updateFn(demographicsAggregation[index]);

  List<String> ageRangeAggregation = [''];
  void addToAgeRangeAggregation(String item) => ageRangeAggregation.add(item);
  void removeFromAgeRangeAggregation(String item) =>
      ageRangeAggregation.remove(item);
  void removeAtIndexFromAgeRangeAggregation(int index) =>
      ageRangeAggregation.removeAt(index);
  void insertAtIndexInAgeRangeAggregation(int index, String item) =>
      ageRangeAggregation.insert(index, item);
  void updateAgeRangeAggregationAtIndex(int index, Function(String) updateFn) =>
      ageRangeAggregation[index] = updateFn(ageRangeAggregation[index]);

  String totlcount = '';

  String searchuery = '*';

  bool showMap = false;

  bool showSerchResult = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? distanceSelectionOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  SortingDataStruct? viewSelectionOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? placeSelectionOutput;
  // State field(s) for VenueListView widget.

  PagingController<ApiPagingParams, dynamic>? venueListViewPagingController;
  Function(ApiPagingParams nextPageMarker)? venueListViewApiCall;

  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  FilterSelectionDataStruct? aggreSelection;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    venueListViewPagingController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForVenueListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (venueListViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setVenueListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    venueListViewApiCall = apiCall;
    return venueListViewPagingController ??=
        _createVenueListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createVenueListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(venueListViewGetAllVenuesPage);
  }

  void venueListViewGetAllVenuesPage(ApiPagingParams nextPageMarker) =>
      venueListViewApiCall!(nextPageMarker)
          .then((venueListViewGetAllVenuesResponse) {
        final pageItems = (VenuesGroup.getAllVenuesCall.details(
                  venueListViewGetAllVenuesResponse.jsonBody,
                )! ??
                [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        venueListViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: venueListViewGetAllVenuesResponse,
                )
              : null,
        );
      });
}
