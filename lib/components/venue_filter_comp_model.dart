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
  List<String>? venueTypeSelectionsValues;
  FormFieldController<List<String>>? venueTypeSelectionsValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for activityTypeSelections widget.
  List<String>? activityTypeSelectionsValues;
  FormFieldController<List<String>>? activityTypeSelectionsValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for sportSelections widget.
  List<String>? sportSelectionsValues;
  FormFieldController<List<String>>? sportSelectionsValueController;
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
  List<String>? rankSelectionsValues;
  FormFieldController<List<String>>? rankSelectionsValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // State field(s) for ageSelections widget.
  List<String>? ageSelectionsValues;
  FormFieldController<List<String>>? ageSelectionsValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController7;

  // State field(s) for townSelections widget.
  List<String>? townSelectionsValues;
  FormFieldController<List<String>>? townSelectionsValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController8;

  // State field(s) for capacitytySelections widget.
  List<String>? capacitytySelectionsValues;
  FormFieldController<List<String>>? capacitytySelectionsValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController9;

  // State field(s) for genderSelections widget.
  List<String>? genderSelectionsValues;
  FormFieldController<List<String>>? genderSelectionsValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController10;

  // State field(s) for activityTypeCatgaorySelections widget.
  List<String>? activityTypeCatgaorySelectionsValues;
  FormFieldController<List<String>>?
      activityTypeCatgaorySelectionsValueController;

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
