import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'venue_filter_comp_widget.dart' show VenueFilterCompWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class VenueFilterCompModel extends FlutterFlowModel<VenueFilterCompWidget> {
  ///  Local state fields for this component.

  List<String> priceSelect = [];
  void addToPriceSelect(String item) => priceSelect.add(item);
  void removeFromPriceSelect(String item) => priceSelect.remove(item);
  void removeAtIndexFromPriceSelect(int index) => priceSelect.removeAt(index);
  void insertAtIndexInPriceSelect(int index, String item) =>
      priceSelect.insert(index, item);
  void updatePriceSelectAtIndex(int index, Function(String) updateFn) =>
      priceSelect[index] = updateFn(priceSelect[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for venueTypeSelections widget.
  FormFieldController<List<String>>? venueTypeSelectionsValueController;

  List<String>? get venueTypeSelectionsValues =>
      venueTypeSelectionsValueController?.value;
  set venueTypeSelectionsValues(List<String>? v) =>
      venueTypeSelectionsValueController?.value = v;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for activityTypeSelections widget.
  FormFieldController<List<String>>? activityTypeSelectionsValueController;

  List<String>? get activityTypeSelectionsValues =>
      activityTypeSelectionsValueController?.value;
  set activityTypeSelectionsValues(List<String>? v) =>
      activityTypeSelectionsValueController?.value = v;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for sportSelections widget.
  FormFieldController<List<String>>? sportSelectionsValueController;

  List<String>? get sportSelectionsValues =>
      sportSelectionsValueController?.value;
  set sportSelectionsValues(List<String>? v) =>
      sportSelectionsValueController?.value = v;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // State field(s) for rankSelections widget.
  FormFieldController<List<String>>? rankSelectionsValueController;

  List<String>? get rankSelectionsValues =>
      rankSelectionsValueController?.value;
  set rankSelectionsValues(List<String>? v) =>
      rankSelectionsValueController?.value = v;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // State field(s) for ageSelections widget.
  FormFieldController<List<String>>? ageSelectionsValueController;

  List<String>? get ageSelectionsValues => ageSelectionsValueController?.value;
  set ageSelectionsValues(List<String>? v) =>
      ageSelectionsValueController?.value = v;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController7;

  // State field(s) for townSelections widget.
  FormFieldController<List<String>>? townSelectionsValueController;

  List<String>? get townSelectionsValues =>
      townSelectionsValueController?.value;
  set townSelectionsValues(List<String>? v) =>
      townSelectionsValueController?.value = v;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController8;

  // State field(s) for capacitytySelections widget.
  FormFieldController<List<String>>? capacitytySelectionsValueController;

  List<String>? get capacitytySelectionsValues =>
      capacitytySelectionsValueController?.value;
  set capacitytySelectionsValues(List<String>? v) =>
      capacitytySelectionsValueController?.value = v;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController9;

  // State field(s) for genderSelections widget.
  FormFieldController<List<String>>? genderSelectionsValueController;

  List<String>? get genderSelectionsValues =>
      genderSelectionsValueController?.value;
  set genderSelectionsValues(List<String>? v) =>
      genderSelectionsValueController?.value = v;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController10;

  // State field(s) for activityTypeCatgaorySelections widget.
  FormFieldController<List<String>>?
      activityTypeCatgaorySelectionsValueController;

  List<String>? get activityTypeCatgaorySelectionsValues =>
      activityTypeCatgaorySelectionsValueController?.value;
  set activityTypeCatgaorySelectionsValues(List<String>? v) =>
      activityTypeCatgaorySelectionsValueController?.value = v;

  @override
  void initState(BuildContext context) {}

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
  }
}
