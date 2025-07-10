import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'date_and_time_tab1_copy_widget.dart' show DateAndTimeTab1CopyWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DateAndTimeTab1CopyModel
    extends FlutterFlowModel<DateAndTimeTab1CopyWidget> {
  ///  Local state fields for this page.

  List<int> disabledDays = [];
  void addToDisabledDays(int item) => disabledDays.add(item);
  void removeFromDisabledDays(int item) => disabledDays.remove(item);
  void removeAtIndexFromDisabledDays(int index) => disabledDays.removeAt(index);
  void insertAtIndexInDisabledDays(int index, int item) =>
      disabledDays.insert(index, item);
  void updateDisabledDaysAtIndex(int index, Function(int) updateFn) =>
      disabledDays[index] = updateFn(disabledDays[index]);

  /// keyForStoringFormStateInServer
  String ocKey = ' ';

  String endTime = '7:00 PM';

  String totalPrice = 'NA';

  int kids = 0;

  int adults = 0;

  int? totalInvitees = 0;

  DateTime? onDate;

  int toastMessageIndex = 0;

  List<NameIdSearchableStruct> dateRestrictionResponse = [];
  void addToDateRestrictionResponse(NameIdSearchableStruct item) =>
      dateRestrictionResponse.add(item);
  void removeFromDateRestrictionResponse(NameIdSearchableStruct item) =>
      dateRestrictionResponse.remove(item);
  void removeAtIndexFromDateRestrictionResponse(int index) =>
      dateRestrictionResponse.removeAt(index);
  void insertAtIndexInDateRestrictionResponse(
          int index, NameIdSearchableStruct item) =>
      dateRestrictionResponse.insert(index, item);
  void updateDateRestrictionResponseAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      dateRestrictionResponse[index] = updateFn(dateRestrictionResponse[index]);

  bool variationDropDownPresent = false;

  bool isDateDefined = false;

  VenueEditParamsTemplateStruct? addOnTemplate;
  void updateAddOnTemplateStruct(
      Function(VenueEditParamsTemplateStruct) updateFn) {
    updateFn(addOnTemplate ??= VenueEditParamsTemplateStruct());
  }

  bool apiLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (dateAndTimeTabCursor)] action in DateAndTimeTab1Copy widget.
  ApiCallResponse? dateAndTimeTabCursorResponse;
  // Stores action output result for [Backend Call - API (dateRestriction)] action in DateAndTimeTab1Copy widget.
  ApiCallResponse? dateRestrictionApiOutput;
  // Stores action output result for [Backend Call - API (setDenominator)] action in DateAndTimeTab1Copy widget.
  ApiCallResponse? setDenomResponse;
  // State field(s) for VariationDropDown widget.
  String? variationDropDownValue;
  FormFieldController<String>? variationDropDownValueController;
  // Stores action output result for [Backend Call - API (setDenominator)] action in VariationDropDown widget.
  ApiCallResponse? setDenomFromDropDown;
  // Stores action output result for [Backend Call - API (DateNTimeTabOnDatechange)] action in ItemDate widget.
  ApiCallResponse? onDateChangedApiResponse;
  // State field(s) for startTimeToggle widget.
  bool? startTimeToggleValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (startTimeChanged)] action in ChoiceChips widget.
  ApiCallResponse? startTimeChangedResponse;
  // State field(s) for daysDP widget.
  String? daysDPValue;
  FormFieldController<String>? daysDPValueController;
  // Stores action output result for [Backend Call - API (onDayChangedRental)] action in daysDP widget.
  ApiCallResponse? dayChangedResponse;
  // State field(s) for HoursDp widget.
  String? hoursDpValue;
  FormFieldController<String>? hoursDpValueController;
  // Stores action output result for [Backend Call - API (onHourChanged)] action in HoursDp widget.
  ApiCallResponse? hourChanged;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (timeSlotChanged)] action in CustomChoiceChips widget.
  ApiCallResponse? timeSlotChangedResponse;
  // State field(s) for CountController widget.
  int? countControllerValue1;
  // Stores action output result for [Backend Call - API (KidsChanged)] action in CountController widget.
  ApiCallResponse? kidsChangedResponse;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // Stores action output result for [Backend Call - API (AdultsChanged)] action in CountController widget.
  ApiCallResponse? adultChangedResponse;
  // State field(s) for CountController widget.
  int? countControllerValue3;
  // State field(s) for cakeMessage widget.
  FocusNode? cakeMessageFocusNode;
  TextEditingController? cakeMessageTextController;
  String? Function(BuildContext, String?)? cakeMessageTextControllerValidator;
  // State field(s) for cakeMsgColorDp widget.
  String? cakeMsgColorDpValue;
  FormFieldController<String>? cakeMsgColorDpValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Stores action output result for [Backend Call - API (save)] action in Button widget.
  ApiCallResponse? dateNTimeSaveResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cakeMessageFocusNode?.dispose();
    cakeMessageTextController?.dispose();

    expandableExpandableController.dispose();
  }
}
