import '/backend/api_requests/api_calls.dart';
import '/compoents/allvendor_search_comp/filter_not_found_comp/filter_not_found_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'venue_filter_comp_widget.dart' show VenueFilterCompWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class VenueFilterCompModel extends FlutterFlowModel<VenueFilterCompWidget> {
  ///  Local state fields for this component.

  List<String> venuetypeSelected = [];
  void addToVenuetypeSelected(String item) => venuetypeSelected.add(item);
  void removeFromVenuetypeSelected(String item) =>
      venuetypeSelected.remove(item);
  void removeAtIndexFromVenuetypeSelected(int index) =>
      venuetypeSelected.removeAt(index);
  void insertAtIndexInVenuetypeSelected(int index, String item) =>
      venuetypeSelected.insert(index, item);
  void updateVenuetypeSelectedAtIndex(int index, Function(String) updateFn) =>
      venuetypeSelected[index] = updateFn(venuetypeSelected[index]);

  List<String> activityTypeSecleted = [];
  void addToActivityTypeSecleted(String item) => activityTypeSecleted.add(item);
  void removeFromActivityTypeSecleted(String item) =>
      activityTypeSecleted.remove(item);
  void removeAtIndexFromActivityTypeSecleted(int index) =>
      activityTypeSecleted.removeAt(index);
  void insertAtIndexInActivityTypeSecleted(int index, String item) =>
      activityTypeSecleted.insert(index, item);
  void updateActivityTypeSecletedAtIndex(
          int index, Function(String) updateFn) =>
      activityTypeSecleted[index] = updateFn(activityTypeSecleted[index]);

  List<String> sportTypeSelected = [];
  void addToSportTypeSelected(String item) => sportTypeSelected.add(item);
  void removeFromSportTypeSelected(String item) =>
      sportTypeSelected.remove(item);
  void removeAtIndexFromSportTypeSelected(int index) =>
      sportTypeSelected.removeAt(index);
  void insertAtIndexInSportTypeSelected(int index, String item) =>
      sportTypeSelected.insert(index, item);
  void updateSportTypeSelectedAtIndex(int index, Function(String) updateFn) =>
      sportTypeSelected[index] = updateFn(sportTypeSelected[index]);

  List<String> priceSelected = [];
  void addToPriceSelected(String item) => priceSelected.add(item);
  void removeFromPriceSelected(String item) => priceSelected.remove(item);
  void removeAtIndexFromPriceSelected(int index) =>
      priceSelected.removeAt(index);
  void insertAtIndexInPriceSelected(int index, String item) =>
      priceSelected.insert(index, item);
  void updatePriceSelectedAtIndex(int index, Function(String) updateFn) =>
      priceSelected[index] = updateFn(priceSelected[index]);

  List<String> rankSelected = [];
  void addToRankSelected(String item) => rankSelected.add(item);
  void removeFromRankSelected(String item) => rankSelected.remove(item);
  void removeAtIndexFromRankSelected(int index) => rankSelected.removeAt(index);
  void insertAtIndexInRankSelected(int index, String item) =>
      rankSelected.insert(index, item);
  void updateRankSelectedAtIndex(int index, Function(String) updateFn) =>
      rankSelected[index] = updateFn(rankSelected[index]);

  List<String> ageSelected = [];
  void addToAgeSelected(String item) => ageSelected.add(item);
  void removeFromAgeSelected(String item) => ageSelected.remove(item);
  void removeAtIndexFromAgeSelected(int index) => ageSelected.removeAt(index);
  void insertAtIndexInAgeSelected(int index, String item) =>
      ageSelected.insert(index, item);
  void updateAgeSelectedAtIndex(int index, Function(String) updateFn) =>
      ageSelected[index] = updateFn(ageSelected[index]);

  List<String> townSelected = [];
  void addToTownSelected(String item) => townSelected.add(item);
  void removeFromTownSelected(String item) => townSelected.remove(item);
  void removeAtIndexFromTownSelected(int index) => townSelected.removeAt(index);
  void insertAtIndexInTownSelected(int index, String item) =>
      townSelected.insert(index, item);
  void updateTownSelectedAtIndex(int index, Function(String) updateFn) =>
      townSelected[index] = updateFn(townSelected[index]);

  List<String> capacitySelected = [];
  void addToCapacitySelected(String item) => capacitySelected.add(item);
  void removeFromCapacitySelected(String item) => capacitySelected.remove(item);
  void removeAtIndexFromCapacitySelected(int index) =>
      capacitySelected.removeAt(index);
  void insertAtIndexInCapacitySelected(int index, String item) =>
      capacitySelected.insert(index, item);
  void updateCapacitySelectedAtIndex(int index, Function(String) updateFn) =>
      capacitySelected[index] = updateFn(capacitySelected[index]);

  List<String> genderSelected = [];
  void addToGenderSelected(String item) => genderSelected.add(item);
  void removeFromGenderSelected(String item) => genderSelected.remove(item);
  void removeAtIndexFromGenderSelected(int index) =>
      genderSelected.removeAt(index);
  void insertAtIndexInGenderSelected(int index, String item) =>
      genderSelected.insert(index, item);
  void updateGenderSelectedAtIndex(int index, Function(String) updateFn) =>
      genderSelected[index] = updateFn(genderSelected[index]);

  List<String> activityCategorySelected = [];
  void addToActivityCategorySelected(String item) =>
      activityCategorySelected.add(item);
  void removeFromActivityCategorySelected(String item) =>
      activityCategorySelected.remove(item);
  void removeAtIndexFromActivityCategorySelected(int index) =>
      activityCategorySelected.removeAt(index);
  void insertAtIndexInActivityCategorySelected(int index, String item) =>
      activityCategorySelected.insert(index, item);
  void updateActivityCategorySelectedAtIndex(
          int index, Function(String) updateFn) =>
      activityCategorySelected[index] =
          updateFn(activityCategorySelected[index]);

  bool? isPageLoad = false;

  List<String> venueType = [];
  void addToVenueType(String item) => venueType.add(item);
  void removeFromVenueType(String item) => venueType.remove(item);
  void removeAtIndexFromVenueType(int index) => venueType.removeAt(index);
  void insertAtIndexInVenueType(int index, String item) =>
      venueType.insert(index, item);
  void updateVenueTypeAtIndex(int index, Function(String) updateFn) =>
      venueType[index] = updateFn(venueType[index]);

  List<int> venueTypeCount = [];
  void addToVenueTypeCount(int item) => venueTypeCount.add(item);
  void removeFromVenueTypeCount(int item) => venueTypeCount.remove(item);
  void removeAtIndexFromVenueTypeCount(int index) =>
      venueTypeCount.removeAt(index);
  void insertAtIndexInVenueTypeCount(int index, int item) =>
      venueTypeCount.insert(index, item);
  void updateVenueTypeCountAtIndex(int index, Function(int) updateFn) =>
      venueTypeCount[index] = updateFn(venueTypeCount[index]);

  List<String> activityType = [];
  void addToActivityType(String item) => activityType.add(item);
  void removeFromActivityType(String item) => activityType.remove(item);
  void removeAtIndexFromActivityType(int index) => activityType.removeAt(index);
  void insertAtIndexInActivityType(int index, String item) =>
      activityType.insert(index, item);
  void updateActivityTypeAtIndex(int index, Function(String) updateFn) =>
      activityType[index] = updateFn(activityType[index]);

  List<int> activityTypeCount = [];
  void addToActivityTypeCount(int item) => activityTypeCount.add(item);
  void removeFromActivityTypeCount(int item) => activityTypeCount.remove(item);
  void removeAtIndexFromActivityTypeCount(int index) =>
      activityTypeCount.removeAt(index);
  void insertAtIndexInActivityTypeCount(int index, int item) =>
      activityTypeCount.insert(index, item);
  void updateActivityTypeCountAtIndex(int index, Function(int) updateFn) =>
      activityTypeCount[index] = updateFn(activityTypeCount[index]);

  List<String> sportType = [];
  void addToSportType(String item) => sportType.add(item);
  void removeFromSportType(String item) => sportType.remove(item);
  void removeAtIndexFromSportType(int index) => sportType.removeAt(index);
  void insertAtIndexInSportType(int index, String item) =>
      sportType.insert(index, item);
  void updateSportTypeAtIndex(int index, Function(String) updateFn) =>
      sportType[index] = updateFn(sportType[index]);

  List<int> sportTypeCount = [];
  void addToSportTypeCount(int item) => sportTypeCount.add(item);
  void removeFromSportTypeCount(int item) => sportTypeCount.remove(item);
  void removeAtIndexFromSportTypeCount(int index) =>
      sportTypeCount.removeAt(index);
  void insertAtIndexInSportTypeCount(int index, int item) =>
      sportTypeCount.insert(index, item);
  void updateSportTypeCountAtIndex(int index, Function(int) updateFn) =>
      sportTypeCount[index] = updateFn(sportTypeCount[index]);

  List<String> price = [];
  void addToPrice(String item) => price.add(item);
  void removeFromPrice(String item) => price.remove(item);
  void removeAtIndexFromPrice(int index) => price.removeAt(index);
  void insertAtIndexInPrice(int index, String item) =>
      price.insert(index, item);
  void updatePriceAtIndex(int index, Function(String) updateFn) =>
      price[index] = updateFn(price[index]);

  List<int> priceCount = [];
  void addToPriceCount(int item) => priceCount.add(item);
  void removeFromPriceCount(int item) => priceCount.remove(item);
  void removeAtIndexFromPriceCount(int index) => priceCount.removeAt(index);
  void insertAtIndexInPriceCount(int index, int item) =>
      priceCount.insert(index, item);
  void updatePriceCountAtIndex(int index, Function(int) updateFn) =>
      priceCount[index] = updateFn(priceCount[index]);

  List<String> rank = [];
  void addToRank(String item) => rank.add(item);
  void removeFromRank(String item) => rank.remove(item);
  void removeAtIndexFromRank(int index) => rank.removeAt(index);
  void insertAtIndexInRank(int index, String item) => rank.insert(index, item);
  void updateRankAtIndex(int index, Function(String) updateFn) =>
      rank[index] = updateFn(rank[index]);

  List<int> rankCount = [];
  void addToRankCount(int item) => rankCount.add(item);
  void removeFromRankCount(int item) => rankCount.remove(item);
  void removeAtIndexFromRankCount(int index) => rankCount.removeAt(index);
  void insertAtIndexInRankCount(int index, int item) =>
      rankCount.insert(index, item);
  void updateRankCountAtIndex(int index, Function(int) updateFn) =>
      rankCount[index] = updateFn(rankCount[index]);

  List<String> age = [];
  void addToAge(String item) => age.add(item);
  void removeFromAge(String item) => age.remove(item);
  void removeAtIndexFromAge(int index) => age.removeAt(index);
  void insertAtIndexInAge(int index, String item) => age.insert(index, item);
  void updateAgeAtIndex(int index, Function(String) updateFn) =>
      age[index] = updateFn(age[index]);

  List<int> ageCount = [];
  void addToAgeCount(int item) => ageCount.add(item);
  void removeFromAgeCount(int item) => ageCount.remove(item);
  void removeAtIndexFromAgeCount(int index) => ageCount.removeAt(index);
  void insertAtIndexInAgeCount(int index, int item) =>
      ageCount.insert(index, item);
  void updateAgeCountAtIndex(int index, Function(int) updateFn) =>
      ageCount[index] = updateFn(ageCount[index]);

  List<String> town = [];
  void addToTown(String item) => town.add(item);
  void removeFromTown(String item) => town.remove(item);
  void removeAtIndexFromTown(int index) => town.removeAt(index);
  void insertAtIndexInTown(int index, String item) => town.insert(index, item);
  void updateTownAtIndex(int index, Function(String) updateFn) =>
      town[index] = updateFn(town[index]);

  List<int> townCount = [];
  void addToTownCount(int item) => townCount.add(item);
  void removeFromTownCount(int item) => townCount.remove(item);
  void removeAtIndexFromTownCount(int index) => townCount.removeAt(index);
  void insertAtIndexInTownCount(int index, int item) =>
      townCount.insert(index, item);
  void updateTownCountAtIndex(int index, Function(int) updateFn) =>
      townCount[index] = updateFn(townCount[index]);

  List<String> capacity = [];
  void addToCapacity(String item) => capacity.add(item);
  void removeFromCapacity(String item) => capacity.remove(item);
  void removeAtIndexFromCapacity(int index) => capacity.removeAt(index);
  void insertAtIndexInCapacity(int index, String item) =>
      capacity.insert(index, item);
  void updateCapacityAtIndex(int index, Function(String) updateFn) =>
      capacity[index] = updateFn(capacity[index]);

  List<int> capacityCount = [];
  void addToCapacityCount(int item) => capacityCount.add(item);
  void removeFromCapacityCount(int item) => capacityCount.remove(item);
  void removeAtIndexFromCapacityCount(int index) =>
      capacityCount.removeAt(index);
  void insertAtIndexInCapacityCount(int index, int item) =>
      capacityCount.insert(index, item);
  void updateCapacityCountAtIndex(int index, Function(int) updateFn) =>
      capacityCount[index] = updateFn(capacityCount[index]);

  List<String> gender = [];
  void addToGender(String item) => gender.add(item);
  void removeFromGender(String item) => gender.remove(item);
  void removeAtIndexFromGender(int index) => gender.removeAt(index);
  void insertAtIndexInGender(int index, String item) =>
      gender.insert(index, item);
  void updateGenderAtIndex(int index, Function(String) updateFn) =>
      gender[index] = updateFn(gender[index]);

  List<int> genderCount = [];
  void addToGenderCount(int item) => genderCount.add(item);
  void removeFromGenderCount(int item) => genderCount.remove(item);
  void removeAtIndexFromGenderCount(int index) => genderCount.removeAt(index);
  void insertAtIndexInGenderCount(int index, int item) =>
      genderCount.insert(index, item);
  void updateGenderCountAtIndex(int index, Function(int) updateFn) =>
      genderCount[index] = updateFn(genderCount[index]);

  List<String> activityTypeCategory = [];
  void addToActivityTypeCategory(String item) => activityTypeCategory.add(item);
  void removeFromActivityTypeCategory(String item) =>
      activityTypeCategory.remove(item);
  void removeAtIndexFromActivityTypeCategory(int index) =>
      activityTypeCategory.removeAt(index);
  void insertAtIndexInActivityTypeCategory(int index, String item) =>
      activityTypeCategory.insert(index, item);
  void updateActivityTypeCategoryAtIndex(
          int index, Function(String) updateFn) =>
      activityTypeCategory[index] = updateFn(activityTypeCategory[index]);

  List<int> activityTypeCategoryCount = [];
  void addToActivityTypeCategoryCount(int item) =>
      activityTypeCategoryCount.add(item);
  void removeFromActivityTypeCategoryCount(int item) =>
      activityTypeCategoryCount.remove(item);
  void removeAtIndexFromActivityTypeCategoryCount(int index) =>
      activityTypeCategoryCount.removeAt(index);
  void insertAtIndexInActivityTypeCategoryCount(int index, int item) =>
      activityTypeCategoryCount.insert(index, item);
  void updateActivityTypeCategoryCountAtIndex(
          int index, Function(int) updateFn) =>
      activityTypeCategoryCount[index] =
          updateFn(activityTypeCategoryCount[index]);

  int? total;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getAllVenues)] action in venueFilterComp widget.
  ApiCallResponse? apiResultAll;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in Text widget.
  ApiCallResponse? apiResultAllClear;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for venueType widget.
  FormFieldController<List<String>>? venueTypeValueController;
  List<String>? get venueTypeValues => venueTypeValueController?.value;
  set venueTypeValues(List<String>? val) =>
      venueTypeValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in venueType widget.
  ApiCallResponse? apiResultAll11;
  // State field(s) for venueTypeSelections widget.
  FormFieldController<List<String>>? venueTypeSelectionsValueController;
  List<String>? get venueTypeSelectionsValues =>
      venueTypeSelectionsValueController?.value;
  set venueTypeSelectionsValues(List<String>? val) =>
      venueTypeSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in venueTypeSelections widget.
  ApiCallResponse? apiResultAll1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for activityType widget.
  FormFieldController<List<String>>? activityTypeValueController;
  List<String>? get activityTypeValues => activityTypeValueController?.value;
  set activityTypeValues(List<String>? val) =>
      activityTypeValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in activityType widget.
  ApiCallResponse? apiResultAll12;
  // State field(s) for activityTypeSelections widget.
  FormFieldController<List<String>>? activityTypeSelectionsValueController;
  List<String>? get activityTypeSelectionsValues =>
      activityTypeSelectionsValueController?.value;
  set activityTypeSelectionsValues(List<String>? val) =>
      activityTypeSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in activityTypeSelections widget.
  ApiCallResponse? apiResultAll2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for sport widget.
  FormFieldController<List<String>>? sportValueController;
  List<String>? get sportValues => sportValueController?.value;
  set sportValues(List<String>? val) => sportValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in sport widget.
  ApiCallResponse? apiResultAll13;
  // State field(s) for sportSelections widget.
  FormFieldController<List<String>>? sportSelectionsValueController;
  List<String>? get sportSelectionsValues =>
      sportSelectionsValueController?.value;
  set sportSelectionsValues(List<String>? val) =>
      sportSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in sportSelections widget.
  ApiCallResponse? apiResultAll3;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for price widget.
  FormFieldController<List<String>>? priceValueController;
  List<String>? get priceValues => priceValueController?.value;
  set priceValues(List<String>? val) => priceValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in price widget.
  ApiCallResponse? apiResultAll14;
  // State field(s) for priceChoiceChips widget.
  FormFieldController<List<String>>? priceChoiceChipsValueController;
  List<String>? get priceChoiceChipsValues =>
      priceChoiceChipsValueController?.value;
  set priceChoiceChipsValues(List<String>? val) =>
      priceChoiceChipsValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in priceChoiceChips widget.
  ApiCallResponse? apiResultAll4;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // State field(s) for rank widget.
  FormFieldController<List<String>>? rankValueController;
  List<String>? get rankValues => rankValueController?.value;
  set rankValues(List<String>? val) => rankValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in rank widget.
  ApiCallResponse? apiResultAll15;
  // State field(s) for rankSelections widget.
  FormFieldController<List<String>>? rankSelectionsValueController;
  List<String>? get rankSelectionsValues =>
      rankSelectionsValueController?.value;
  set rankSelectionsValues(List<String>? val) =>
      rankSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in rankSelections widget.
  ApiCallResponse? apiResultAll5;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // State field(s) for age widget.
  FormFieldController<List<String>>? ageValueController;
  List<String>? get ageValues => ageValueController?.value;
  set ageValues(List<String>? val) => ageValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in age widget.
  ApiCallResponse? apiResultAll16;
  // State field(s) for ageSelections widget.
  FormFieldController<List<String>>? ageSelectionsValueController;
  List<String>? get ageSelectionsValues => ageSelectionsValueController?.value;
  set ageSelectionsValues(List<String>? val) =>
      ageSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in ageSelections widget.
  ApiCallResponse? apiResultAll6;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController7;

  // State field(s) for town widget.
  FormFieldController<List<String>>? townValueController;
  List<String>? get townValues => townValueController?.value;
  set townValues(List<String>? val) => townValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in town widget.
  ApiCallResponse? apiResultAll17;
  // State field(s) for townSelections widget.
  FormFieldController<List<String>>? townSelectionsValueController;
  List<String>? get townSelectionsValues =>
      townSelectionsValueController?.value;
  set townSelectionsValues(List<String>? val) =>
      townSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in townSelections widget.
  ApiCallResponse? apiResultAll7;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController8;

  // State field(s) for capacity widget.
  FormFieldController<List<String>>? capacityValueController;
  List<String>? get capacityValues => capacityValueController?.value;
  set capacityValues(List<String>? val) => capacityValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in capacity widget.
  ApiCallResponse? apiResultAll18;
  // State field(s) for capacitytySelections widget.
  FormFieldController<List<String>>? capacitytySelectionsValueController;
  List<String>? get capacitytySelectionsValues =>
      capacitytySelectionsValueController?.value;
  set capacitytySelectionsValues(List<String>? val) =>
      capacitytySelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in capacitytySelections widget.
  ApiCallResponse? apiResultAll8;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController9;

  // State field(s) for gender widget.
  FormFieldController<List<String>>? genderValueController;
  List<String>? get genderValues => genderValueController?.value;
  set genderValues(List<String>? val) => genderValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in gender widget.
  ApiCallResponse? apiResultAll19;
  // State field(s) for genderSelections widget.
  FormFieldController<List<String>>? genderSelectionsValueController;
  List<String>? get genderSelectionsValues =>
      genderSelectionsValueController?.value;
  set genderSelectionsValues(List<String>? val) =>
      genderSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in genderSelections widget.
  ApiCallResponse? apiResultAll9;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController10;

  // State field(s) for activityTypeCatgaory widget.
  FormFieldController<List<String>>? activityTypeCatgaoryValueController;
  List<String>? get activityTypeCatgaoryValues =>
      activityTypeCatgaoryValueController?.value;
  set activityTypeCatgaoryValues(List<String>? val) =>
      activityTypeCatgaoryValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in activityTypeCatgaory widget.
  ApiCallResponse? apiResultAll20;
  // State field(s) for activityTypeCatgaorySelections widget.
  FormFieldController<List<String>>?
      activityTypeCatgaorySelectionsValueController;
  List<String>? get activityTypeCatgaorySelectionsValues =>
      activityTypeCatgaorySelectionsValueController?.value;
  set activityTypeCatgaorySelectionsValues(List<String>? val) =>
      activityTypeCatgaorySelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (getAllVenues)] action in activityTypeCatgaorySelections widget.
  ApiCallResponse? apiResultAll10;
  // Model for filterNotFoundComp component.
  late FilterNotFoundCompModel filterNotFoundCompModel;

  @override
  void initState(BuildContext context) {
    filterNotFoundCompModel =
        createModel(context, () => FilterNotFoundCompModel());
  }

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
    expandableExpandableController6.dispose();
    expandableExpandableController7.dispose();
    expandableExpandableController8.dispose();
    expandableExpandableController9.dispose();
    expandableExpandableController10.dispose();
    filterNotFoundCompModel.dispose();
  }
}
