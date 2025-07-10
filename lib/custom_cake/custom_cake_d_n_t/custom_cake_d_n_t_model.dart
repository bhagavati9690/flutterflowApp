import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'custom_cake_d_n_t_widget.dart' show CustomCakeDNTWidget;
import 'package:flutter/material.dart';

class CustomCakeDNTModel extends FlutterFlowModel<CustomCakeDNTWidget> {
  ///  Local state fields for this page.

  String? ocKey;

  bool apiLoaded = false;

  DateTime? onDate;

  List<int> disabledDays = [];
  void addToDisabledDays(int item) => disabledDays.add(item);
  void removeFromDisabledDays(int item) => disabledDays.remove(item);
  void removeAtIndexFromDisabledDays(int index) => disabledDays.removeAt(index);
  void insertAtIndexInDisabledDays(int index, int item) =>
      disabledDays.insert(index, item);
  void updateDisabledDaysAtIndex(int index, Function(int) updateFn) =>
      disabledDays[index] = updateFn(disabledDays[index]);

  String? ocForDate;

  String? totalPrice;

  List<NameIdSearchableStruct> nextParams = [];
  void addToNextParams(NameIdSearchableStruct item) => nextParams.add(item);
  void removeFromNextParams(NameIdSearchableStruct item) =>
      nextParams.remove(item);
  void removeAtIndexFromNextParams(int index) => nextParams.removeAt(index);
  void insertAtIndexInNextParams(int index, NameIdSearchableStruct item) =>
      nextParams.insert(index, item);
  void updateNextParamsAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      nextParams[index] = updateFn(nextParams[index]);

  bool variationPresent = false;

  List<NameIdSearchableStruct> variationLP = [];
  void addToVariationLP(NameIdSearchableStruct item) => variationLP.add(item);
  void removeFromVariationLP(NameIdSearchableStruct item) =>
      variationLP.remove(item);
  void removeAtIndexFromVariationLP(int index) => variationLP.removeAt(index);
  void insertAtIndexInVariationLP(int index, NameIdSearchableStruct item) =>
      variationLP.insert(index, item);
  void updateVariationLPAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      variationLP[index] = updateFn(variationLP[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (menuSectionAndVariationCusor)] action in customCakeDNT widget.
  ApiCallResponse? menuSectionCursorResponse;
  // Stores action output result for [Backend Call - API (menuSectionsListPickerCursor)] action in customCakeDNT widget.
  ApiCallResponse? menuSectionListpickerResponse;
  // Stores action output result for [Backend Call - API (customDateNtimeTabCursor)] action in customCakeDNT widget.
  ApiCallResponse? dateandTimeResponse;
  // Stores action output result for [Backend Call - API (menuSectionChanged)] action in customCakeDNT widget.
  ApiCallResponse? menuSectionChangedonPageLoad;
  // Stores action output result for [Backend Call - API (customCakeDNTVariationListpicker)] action in customCakeDNT widget.
  ApiCallResponse? variationLispickerResponse;
  // Stores action output result for [Backend Call - API (menuSectionChangedToSetInSession Copy)] action in CustomChoiceChips widget.
  ApiCallResponse? menuSectionSetResponse;
  // Stores action output result for [Backend Call - API (menuSectionChanged)] action in CustomChoiceChips widget.
  ApiCallResponse? menuSectionChanged;
  // Stores action output result for [Backend Call - API (customCakeDNTVariationListpicker)] action in CustomChoiceChips widget.
  ApiCallResponse? newVariationListResponse;
  // Stores action output result for [Backend Call - API (menuSectionChanged)] action in CustomChoiceChips widget.
  ApiCallResponse? asssasd;
  // Stores action output result for [Backend Call - API (menuSectionDenomChangedToSetInSession)] action in CustomChoiceChipsTwo widget.
  ApiCallResponse? variationChangedResponse;
  // Stores action output result for [Backend Call - API (dateChanged)] action in ItemDate widget.
  ApiCallResponse? dateChangedResponse;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (startTimeChange)] action in ChoiceChips widget.
  ApiCallResponse? startTimeChanged;
  // Stores action output result for [Backend Call - API (customCakeNext)] action in Button widget.
  ApiCallResponse? nextResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
