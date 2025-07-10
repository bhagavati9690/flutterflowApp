import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'rental_filter_comp_widget.dart' show RentalFilterCompWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class RentalFilterCompModel extends FlutterFlowModel<RentalFilterCompWidget> {
  ///  Local state fields for this component.

  List<String> rentalCategorySelected = [];
  void addToRentalCategorySelected(String item) =>
      rentalCategorySelected.add(item);
  void removeFromRentalCategorySelected(String item) =>
      rentalCategorySelected.remove(item);
  void removeAtIndexFromRentalCategorySelected(int index) =>
      rentalCategorySelected.removeAt(index);
  void insertAtIndexInRentalCategorySelected(int index, String item) =>
      rentalCategorySelected.insert(index, item);
  void updateRentalCategorySelectedAtIndex(
          int index, Function(String) updateFn) =>
      rentalCategorySelected[index] = updateFn(rentalCategorySelected[index]);

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

  bool? isPageLoad = false;

  List<String> rentalCategory = [];
  void addToRentalCategory(String item) => rentalCategory.add(item);
  void removeFromRentalCategory(String item) => rentalCategory.remove(item);
  void removeAtIndexFromRentalCategory(int index) =>
      rentalCategory.removeAt(index);
  void insertAtIndexInRentalCategory(int index, String item) =>
      rentalCategory.insert(index, item);
  void updateRentalCategoryAtIndex(int index, Function(String) updateFn) =>
      rentalCategory[index] = updateFn(rentalCategory[index]);

  List<int> rentalCategoryCount = [];
  void addToRentalCategoryCount(int item) => rentalCategoryCount.add(item);
  void removeFromRentalCategoryCount(int item) =>
      rentalCategoryCount.remove(item);
  void removeAtIndexFromRentalCategoryCount(int index) =>
      rentalCategoryCount.removeAt(index);
  void insertAtIndexInRentalCategoryCount(int index, int item) =>
      rentalCategoryCount.insert(index, item);
  void updateRentalCategoryCountAtIndex(int index, Function(int) updateFn) =>
      rentalCategoryCount[index] = updateFn(rentalCategoryCount[index]);

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

  int? total;

  List<String> theme = [];
  void addToTheme(String item) => theme.add(item);
  void removeFromTheme(String item) => theme.remove(item);
  void removeAtIndexFromTheme(int index) => theme.removeAt(index);
  void insertAtIndexInTheme(int index, String item) =>
      theme.insert(index, item);
  void updateThemeAtIndex(int index, Function(String) updateFn) =>
      theme[index] = updateFn(theme[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (gelAllRental)] action in rentalFilterComp widget.
  ApiCallResponse? apiResultAll;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in Text widget.
  ApiCallResponse? apiResultAllClear;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for rentalCategory widget.
  FormFieldController<List<String>>? rentalCategoryValueController;
  List<String>? get rentalCategoryValues =>
      rentalCategoryValueController?.value;
  set rentalCategoryValues(List<String>? val) =>
      rentalCategoryValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in rentalCategory widget.
  ApiCallResponse? apiResultAll11;
  // State field(s) for rentalCategorySelections widget.
  FormFieldController<List<String>>? rentalCategorySelectionsValueController;
  List<String>? get rentalCategorySelectionsValues =>
      rentalCategorySelectionsValueController?.value;
  set rentalCategorySelectionsValues(List<String>? val) =>
      rentalCategorySelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in rentalCategorySelections widget.
  ApiCallResponse? apiResultAll1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for price widget.
  FormFieldController<List<String>>? priceValueController;
  List<String>? get priceValues => priceValueController?.value;
  set priceValues(List<String>? val) => priceValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in price widget.
  ApiCallResponse? apiResultAll14;
  // State field(s) for priceChoiceChips widget.
  FormFieldController<List<String>>? priceChoiceChipsValueController;
  List<String>? get priceChoiceChipsValues =>
      priceChoiceChipsValueController?.value;
  set priceChoiceChipsValues(List<String>? val) =>
      priceChoiceChipsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in priceChoiceChips widget.
  ApiCallResponse? apiResultAll4;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for rank widget.
  FormFieldController<List<String>>? rankValueController;
  List<String>? get rankValues => rankValueController?.value;
  set rankValues(List<String>? val) => rankValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in rank widget.
  ApiCallResponse? apiResultAll15;
  // State field(s) for rankSelections widget.
  FormFieldController<List<String>>? rankSelectionsValueController;
  List<String>? get rankSelectionsValues =>
      rankSelectionsValueController?.value;
  set rankSelectionsValues(List<String>? val) =>
      rankSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in rankSelections widget.
  ApiCallResponse? apiResultAll5;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for age widget.
  FormFieldController<List<String>>? ageValueController;
  List<String>? get ageValues => ageValueController?.value;
  set ageValues(List<String>? val) => ageValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in age widget.
  ApiCallResponse? apiResultAll16;
  // State field(s) for ageSelections widget.
  FormFieldController<List<String>>? ageSelectionsValueController;
  List<String>? get ageSelectionsValues => ageSelectionsValueController?.value;
  set ageSelectionsValues(List<String>? val) =>
      ageSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in ageSelections widget.
  ApiCallResponse? apiResultAll6;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // State field(s) for town widget.
  FormFieldController<List<String>>? townValueController;
  List<String>? get townValues => townValueController?.value;
  set townValues(List<String>? val) => townValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in town widget.
  ApiCallResponse? apiResultAll17;
  // State field(s) for townSelections widget.
  FormFieldController<List<String>>? townSelectionsValueController;
  List<String>? get townSelectionsValues =>
      townSelectionsValueController?.value;
  set townSelectionsValues(List<String>? val) =>
      townSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllRental)] action in townSelections widget.
  ApiCallResponse? apiResultAll7;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
  }
}
