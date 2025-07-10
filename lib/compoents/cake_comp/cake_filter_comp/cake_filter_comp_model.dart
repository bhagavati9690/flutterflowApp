import '/backend/api_requests/api_calls.dart';
import '/compoents/allvendor_search_comp/filter_not_found_comp/filter_not_found_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cake_filter_comp_widget.dart' show CakeFilterCompWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CakeFilterCompModel extends FlutterFlowModel<CakeFilterCompWidget> {
  ///  Local state fields for this component.

  List<String> bakeryTypeSelected = [];
  void addToBakeryTypeSelected(String item) => bakeryTypeSelected.add(item);
  void removeFromBakeryTypeSelected(String item) =>
      bakeryTypeSelected.remove(item);
  void removeAtIndexFromBakeryTypeSelected(int index) =>
      bakeryTypeSelected.removeAt(index);
  void insertAtIndexInBakeryTypeSelected(int index, String item) =>
      bakeryTypeSelected.insert(index, item);
  void updateBakeryTypeSelectedAtIndex(int index, Function(String) updateFn) =>
      bakeryTypeSelected[index] = updateFn(bakeryTypeSelected[index]);

  List<String> menuRestrictionSecleted = [];
  void addToMenuRestrictionSecleted(String item) =>
      menuRestrictionSecleted.add(item);
  void removeFromMenuRestrictionSecleted(String item) =>
      menuRestrictionSecleted.remove(item);
  void removeAtIndexFromMenuRestrictionSecleted(int index) =>
      menuRestrictionSecleted.removeAt(index);
  void insertAtIndexInMenuRestrictionSecleted(int index, String item) =>
      menuRestrictionSecleted.insert(index, item);
  void updateMenuRestrictionSecletedAtIndex(
          int index, Function(String) updateFn) =>
      menuRestrictionSecleted[index] = updateFn(menuRestrictionSecleted[index]);

  List<String> cakeFlavorsSelected = [];
  void addToCakeFlavorsSelected(String item) => cakeFlavorsSelected.add(item);
  void removeFromCakeFlavorsSelected(String item) =>
      cakeFlavorsSelected.remove(item);
  void removeAtIndexFromCakeFlavorsSelected(int index) =>
      cakeFlavorsSelected.removeAt(index);
  void insertAtIndexInCakeFlavorsSelected(int index, String item) =>
      cakeFlavorsSelected.insert(index, item);
  void updateCakeFlavorsSelectedAtIndex(int index, Function(String) updateFn) =>
      cakeFlavorsSelected[index] = updateFn(cakeFlavorsSelected[index]);

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

  List<String> themeSelected = [];
  void addToThemeSelected(String item) => themeSelected.add(item);
  void removeFromThemeSelected(String item) => themeSelected.remove(item);
  void removeAtIndexFromThemeSelected(int index) =>
      themeSelected.removeAt(index);
  void insertAtIndexInThemeSelected(int index, String item) =>
      themeSelected.insert(index, item);
  void updateThemeSelectedAtIndex(int index, Function(String) updateFn) =>
      themeSelected[index] = updateFn(themeSelected[index]);

  List<String> townSelected = [];
  void addToTownSelected(String item) => townSelected.add(item);
  void removeFromTownSelected(String item) => townSelected.remove(item);
  void removeAtIndexFromTownSelected(int index) => townSelected.removeAt(index);
  void insertAtIndexInTownSelected(int index, String item) =>
      townSelected.insert(index, item);
  void updateTownSelectedAtIndex(int index, Function(String) updateFn) =>
      townSelected[index] = updateFn(townSelected[index]);

  List<String> fillingSelected = [];
  void addToFillingSelected(String item) => fillingSelected.add(item);
  void removeFromFillingSelected(String item) => fillingSelected.remove(item);
  void removeAtIndexFromFillingSelected(int index) =>
      fillingSelected.removeAt(index);
  void insertAtIndexInFillingSelected(int index, String item) =>
      fillingSelected.insert(index, item);
  void updateFillingSelectedAtIndex(int index, Function(String) updateFn) =>
      fillingSelected[index] = updateFn(fillingSelected[index]);

  List<String> iceCremeFlavorSelected = [];
  void addToIceCremeFlavorSelected(String item) =>
      iceCremeFlavorSelected.add(item);
  void removeFromIceCremeFlavorSelected(String item) =>
      iceCremeFlavorSelected.remove(item);
  void removeAtIndexFromIceCremeFlavorSelected(int index) =>
      iceCremeFlavorSelected.removeAt(index);
  void insertAtIndexInIceCremeFlavorSelected(int index, String item) =>
      iceCremeFlavorSelected.insert(index, item);
  void updateIceCremeFlavorSelectedAtIndex(
          int index, Function(String) updateFn) =>
      iceCremeFlavorSelected[index] = updateFn(iceCremeFlavorSelected[index]);

  List<String> deliveryFeeRangeSelected = [];
  void addToDeliveryFeeRangeSelected(String item) =>
      deliveryFeeRangeSelected.add(item);
  void removeFromDeliveryFeeRangeSelected(String item) =>
      deliveryFeeRangeSelected.remove(item);
  void removeAtIndexFromDeliveryFeeRangeSelected(int index) =>
      deliveryFeeRangeSelected.removeAt(index);
  void insertAtIndexInDeliveryFeeRangeSelected(int index, String item) =>
      deliveryFeeRangeSelected.insert(index, item);
  void updateDeliveryFeeRangeSelectedAtIndex(
          int index, Function(String) updateFn) =>
      deliveryFeeRangeSelected[index] =
          updateFn(deliveryFeeRangeSelected[index]);

  bool? isPageLoad = false;

  List<String> bakeryType = [];
  void addToBakeryType(String item) => bakeryType.add(item);
  void removeFromBakeryType(String item) => bakeryType.remove(item);
  void removeAtIndexFromBakeryType(int index) => bakeryType.removeAt(index);
  void insertAtIndexInBakeryType(int index, String item) =>
      bakeryType.insert(index, item);
  void updateBakeryTypeAtIndex(int index, Function(String) updateFn) =>
      bakeryType[index] = updateFn(bakeryType[index]);

  List<int> bakeryTypeCount = [];
  void addToBakeryTypeCount(int item) => bakeryTypeCount.add(item);
  void removeFromBakeryTypeCount(int item) => bakeryTypeCount.remove(item);
  void removeAtIndexFromBakeryTypeCount(int index) =>
      bakeryTypeCount.removeAt(index);
  void insertAtIndexInBakeryTypeCount(int index, int item) =>
      bakeryTypeCount.insert(index, item);
  void updateBakeryTypeCountAtIndex(int index, Function(int) updateFn) =>
      bakeryTypeCount[index] = updateFn(bakeryTypeCount[index]);

  List<String> menuRestriction = [];
  void addToMenuRestriction(String item) => menuRestriction.add(item);
  void removeFromMenuRestriction(String item) => menuRestriction.remove(item);
  void removeAtIndexFromMenuRestriction(int index) =>
      menuRestriction.removeAt(index);
  void insertAtIndexInMenuRestriction(int index, String item) =>
      menuRestriction.insert(index, item);
  void updateMenuRestrictionAtIndex(int index, Function(String) updateFn) =>
      menuRestriction[index] = updateFn(menuRestriction[index]);

  List<int> menuRestrictionCount = [];
  void addToMenuRestrictionCount(int item) => menuRestrictionCount.add(item);
  void removeFromMenuRestrictionCount(int item) =>
      menuRestrictionCount.remove(item);
  void removeAtIndexFromMenuRestrictionCount(int index) =>
      menuRestrictionCount.removeAt(index);
  void insertAtIndexInMenuRestrictionCount(int index, int item) =>
      menuRestrictionCount.insert(index, item);
  void updateMenuRestrictionCountAtIndex(int index, Function(int) updateFn) =>
      menuRestrictionCount[index] = updateFn(menuRestrictionCount[index]);

  List<String> cakeFlavors = [];
  void addToCakeFlavors(String item) => cakeFlavors.add(item);
  void removeFromCakeFlavors(String item) => cakeFlavors.remove(item);
  void removeAtIndexFromCakeFlavors(int index) => cakeFlavors.removeAt(index);
  void insertAtIndexInCakeFlavors(int index, String item) =>
      cakeFlavors.insert(index, item);
  void updateCakeFlavorsAtIndex(int index, Function(String) updateFn) =>
      cakeFlavors[index] = updateFn(cakeFlavors[index]);

  List<int> cakeFlavorsCount = [];
  void addToCakeFlavorsCount(int item) => cakeFlavorsCount.add(item);
  void removeFromCakeFlavorsCount(int item) => cakeFlavorsCount.remove(item);
  void removeAtIndexFromCakeFlavorsCount(int index) =>
      cakeFlavorsCount.removeAt(index);
  void insertAtIndexInCakeFlavorsCount(int index, int item) =>
      cakeFlavorsCount.insert(index, item);
  void updateCakeFlavorsCountAtIndex(int index, Function(int) updateFn) =>
      cakeFlavorsCount[index] = updateFn(cakeFlavorsCount[index]);

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

  List<String> theme = [];
  void addToTheme(String item) => theme.add(item);
  void removeFromTheme(String item) => theme.remove(item);
  void removeAtIndexFromTheme(int index) => theme.removeAt(index);
  void insertAtIndexInTheme(int index, String item) =>
      theme.insert(index, item);
  void updateThemeAtIndex(int index, Function(String) updateFn) =>
      theme[index] = updateFn(theme[index]);

  List<int> themeCount = [];
  void addToThemeCount(int item) => themeCount.add(item);
  void removeFromThemeCount(int item) => themeCount.remove(item);
  void removeAtIndexFromThemeCount(int index) => themeCount.removeAt(index);
  void insertAtIndexInThemeCount(int index, int item) =>
      themeCount.insert(index, item);
  void updateThemeCountAtIndex(int index, Function(int) updateFn) =>
      themeCount[index] = updateFn(themeCount[index]);

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

  List<String> filling = [];
  void addToFilling(String item) => filling.add(item);
  void removeFromFilling(String item) => filling.remove(item);
  void removeAtIndexFromFilling(int index) => filling.removeAt(index);
  void insertAtIndexInFilling(int index, String item) =>
      filling.insert(index, item);
  void updateFillingAtIndex(int index, Function(String) updateFn) =>
      filling[index] = updateFn(filling[index]);

  List<int> fillingCount = [];
  void addToFillingCount(int item) => fillingCount.add(item);
  void removeFromFillingCount(int item) => fillingCount.remove(item);
  void removeAtIndexFromFillingCount(int index) => fillingCount.removeAt(index);
  void insertAtIndexInFillingCount(int index, int item) =>
      fillingCount.insert(index, item);
  void updateFillingCountAtIndex(int index, Function(int) updateFn) =>
      fillingCount[index] = updateFn(fillingCount[index]);

  List<String> iceCremeFlavor = [];
  void addToIceCremeFlavor(String item) => iceCremeFlavor.add(item);
  void removeFromIceCremeFlavor(String item) => iceCremeFlavor.remove(item);
  void removeAtIndexFromIceCremeFlavor(int index) =>
      iceCremeFlavor.removeAt(index);
  void insertAtIndexInIceCremeFlavor(int index, String item) =>
      iceCremeFlavor.insert(index, item);
  void updateIceCremeFlavorAtIndex(int index, Function(String) updateFn) =>
      iceCremeFlavor[index] = updateFn(iceCremeFlavor[index]);

  List<int> iceCremeFlavorCount = [];
  void addToIceCremeFlavorCount(int item) => iceCremeFlavorCount.add(item);
  void removeFromIceCremeFlavorCount(int item) =>
      iceCremeFlavorCount.remove(item);
  void removeAtIndexFromIceCremeFlavorCount(int index) =>
      iceCremeFlavorCount.removeAt(index);
  void insertAtIndexInIceCremeFlavorCount(int index, int item) =>
      iceCremeFlavorCount.insert(index, item);
  void updateIceCremeFlavorCountAtIndex(int index, Function(int) updateFn) =>
      iceCremeFlavorCount[index] = updateFn(iceCremeFlavorCount[index]);

  List<String> deliveryFeeRange = [];
  void addToDeliveryFeeRange(String item) => deliveryFeeRange.add(item);
  void removeFromDeliveryFeeRange(String item) => deliveryFeeRange.remove(item);
  void removeAtIndexFromDeliveryFeeRange(int index) =>
      deliveryFeeRange.removeAt(index);
  void insertAtIndexInDeliveryFeeRange(int index, String item) =>
      deliveryFeeRange.insert(index, item);
  void updateDeliveryFeeRangeAtIndex(int index, Function(String) updateFn) =>
      deliveryFeeRange[index] = updateFn(deliveryFeeRange[index]);

  List<int> deliveryFeeRangeCount = [];
  void addToDeliveryFeeRangeCount(int item) => deliveryFeeRangeCount.add(item);
  void removeFromDeliveryFeeRangeCount(int item) =>
      deliveryFeeRangeCount.remove(item);
  void removeAtIndexFromDeliveryFeeRangeCount(int index) =>
      deliveryFeeRangeCount.removeAt(index);
  void insertAtIndexInDeliveryFeeRangeCount(int index, int item) =>
      deliveryFeeRangeCount.insert(index, item);
  void updateDeliveryFeeRangeCountAtIndex(int index, Function(int) updateFn) =>
      deliveryFeeRangeCount[index] = updateFn(deliveryFeeRangeCount[index]);

  int? total;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (gelAllCake)] action in cakeFilterComp widget.
  ApiCallResponse? apiResultAll;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in Text widget.
  ApiCallResponse? apiResultAllClear;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for bekeryType widget.
  FormFieldController<List<String>>? bekeryTypeValueController;
  List<String>? get bekeryTypeValues => bekeryTypeValueController?.value;
  set bekeryTypeValues(List<String>? val) =>
      bekeryTypeValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in bekeryType widget.
  ApiCallResponse? apiResultAll11;
  // State field(s) for bekeryTypeSelections widget.
  FormFieldController<List<String>>? bekeryTypeSelectionsValueController;
  List<String>? get bekeryTypeSelectionsValues =>
      bekeryTypeSelectionsValueController?.value;
  set bekeryTypeSelectionsValues(List<String>? val) =>
      bekeryTypeSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in bekeryTypeSelections widget.
  ApiCallResponse? apiResultAll1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for MenuRestriction widget.
  FormFieldController<List<String>>? menuRestrictionValueController;
  List<String>? get menuRestrictionValues =>
      menuRestrictionValueController?.value;
  set menuRestrictionValues(List<String>? val) =>
      menuRestrictionValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in MenuRestriction widget.
  ApiCallResponse? apiResultAll12;
  // State field(s) for MenuRestrictionSelections widget.
  FormFieldController<List<String>>? menuRestrictionSelectionsValueController;
  List<String>? get menuRestrictionSelectionsValues =>
      menuRestrictionSelectionsValueController?.value;
  set menuRestrictionSelectionsValues(List<String>? val) =>
      menuRestrictionSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in MenuRestrictionSelections widget.
  ApiCallResponse? apiResultAllVennue4;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for CakeFlavors widget.
  FormFieldController<List<String>>? cakeFlavorsValueController;
  List<String>? get cakeFlavorsValues => cakeFlavorsValueController?.value;
  set cakeFlavorsValues(List<String>? val) =>
      cakeFlavorsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in CakeFlavors widget.
  ApiCallResponse? apiResultAll13;
  // State field(s) for CakeFlavorsSelections widget.
  FormFieldController<List<String>>? cakeFlavorsSelectionsValueController;
  List<String>? get cakeFlavorsSelectionsValues =>
      cakeFlavorsSelectionsValueController?.value;
  set cakeFlavorsSelectionsValues(List<String>? val) =>
      cakeFlavorsSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in CakeFlavorsSelections widget.
  ApiCallResponse? apiResultAll3;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Theme widget.
  FormFieldController<List<String>>? themeValueController;
  List<String>? get themeValues => themeValueController?.value;
  set themeValues(List<String>? val) => themeValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in Theme widget.
  ApiCallResponse? apiResultAll16;
  // State field(s) for ThemeSelections widget.
  FormFieldController<List<String>>? themeSelectionsValueController;
  List<String>? get themeSelectionsValues =>
      themeSelectionsValueController?.value;
  set themeSelectionsValues(List<String>? val) =>
      themeSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in ThemeSelections widget.
  ApiCallResponse? apiResultAll6;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // State field(s) for Filling widget.
  FormFieldController<List<String>>? fillingValueController;
  List<String>? get fillingValues => fillingValueController?.value;
  set fillingValues(List<String>? val) => fillingValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in Filling widget.
  ApiCallResponse? apiResultAll18;
  // State field(s) for FillingSelections widget.
  FormFieldController<List<String>>? fillingSelectionsValueController;
  List<String>? get fillingSelectionsValues =>
      fillingSelectionsValueController?.value;
  set fillingSelectionsValues(List<String>? val) =>
      fillingSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in FillingSelections widget.
  ApiCallResponse? apiResultAll8;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // State field(s) for IceCremeFlavors widget.
  FormFieldController<List<String>>? iceCremeFlavorsValueController;
  List<String>? get iceCremeFlavorsValues =>
      iceCremeFlavorsValueController?.value;
  set iceCremeFlavorsValues(List<String>? val) =>
      iceCremeFlavorsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in IceCremeFlavors widget.
  ApiCallResponse? apiResultAll19;
  // State field(s) for IceCremeFlavorsSelections widget.
  FormFieldController<List<String>>? iceCremeFlavorsSelectionsValueController;
  List<String>? get iceCremeFlavorsSelectionsValues =>
      iceCremeFlavorsSelectionsValueController?.value;
  set iceCremeFlavorsSelectionsValues(List<String>? val) =>
      iceCremeFlavorsSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in IceCremeFlavorsSelections widget.
  ApiCallResponse? apiResultAll9;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController7;

  // State field(s) for rank widget.
  FormFieldController<List<String>>? rankValueController;
  List<String>? get rankValues => rankValueController?.value;
  set rankValues(List<String>? val) => rankValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in rank widget.
  ApiCallResponse? apiResultAll15;
  // State field(s) for rankSelections widget.
  FormFieldController<List<String>>? rankSelectionsValueController;
  List<String>? get rankSelectionsValues =>
      rankSelectionsValueController?.value;
  set rankSelectionsValues(List<String>? val) =>
      rankSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in rankSelections widget.
  ApiCallResponse? apiResultAll5;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController8;

  // State field(s) for town widget.
  FormFieldController<List<String>>? townValueController;
  List<String>? get townValues => townValueController?.value;
  set townValues(List<String>? val) => townValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in town widget.
  ApiCallResponse? apiResultAll17;
  // State field(s) for townSelections widget.
  FormFieldController<List<String>>? townSelectionsValueController;
  List<String>? get townSelectionsValues =>
      townSelectionsValueController?.value;
  set townSelectionsValues(List<String>? val) =>
      townSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in townSelections widget.
  ApiCallResponse? apiResultAll7;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController9;

  // State field(s) for DeliveryFeesRange widget.
  FormFieldController<List<String>>? deliveryFeesRangeValueController;
  List<String>? get deliveryFeesRangeValues =>
      deliveryFeesRangeValueController?.value;
  set deliveryFeesRangeValues(List<String>? val) =>
      deliveryFeesRangeValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in DeliveryFeesRange widget.
  ApiCallResponse? apiResultAll20;
  // State field(s) for DeliveryFeesRangeSelections widget.
  FormFieldController<List<String>>? deliveryFeesRangeSelectionsValueController;
  List<String>? get deliveryFeesRangeSelectionsValues =>
      deliveryFeesRangeSelectionsValueController?.value;
  set deliveryFeesRangeSelectionsValues(List<String>? val) =>
      deliveryFeesRangeSelectionsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in DeliveryFeesRangeSelections widget.
  ApiCallResponse? apiResultAll10;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController10;

  // State field(s) for price widget.
  FormFieldController<List<String>>? priceValueController;
  List<String>? get priceValues => priceValueController?.value;
  set priceValues(List<String>? val) => priceValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in price widget.
  ApiCallResponse? apiResultAll14;
  // State field(s) for priceChoiceChips widget.
  FormFieldController<List<String>>? priceChoiceChipsValueController;
  List<String>? get priceChoiceChipsValues =>
      priceChoiceChipsValueController?.value;
  set priceChoiceChipsValues(List<String>? val) =>
      priceChoiceChipsValueController?.value = val;
  // Stores action output result for [Backend Call - API (gelAllCake)] action in priceChoiceChips widget.
  ApiCallResponse? apiResultAll4;
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
