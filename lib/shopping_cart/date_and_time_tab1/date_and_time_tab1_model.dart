import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'date_and_time_tab1_widget.dart' show DateAndTimeTab1Widget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DateAndTimeTab1Model extends FlutterFlowModel<DateAndTimeTab1Widget> {
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

  String? duration;

  String? startTime;

  bool durationSet = false;

  List<String> startTimeList = [
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM'
  ];
  void addToStartTimeList(String item) => startTimeList.add(item);
  void removeFromStartTimeList(String item) => startTimeList.remove(item);
  void removeAtIndexFromStartTimeList(int index) =>
      startTimeList.removeAt(index);
  void insertAtIndexInStartTimeList(int index, String item) =>
      startTimeList.insert(index, item);
  void updateStartTimeListAtIndex(int index, Function(String) updateFn) =>
      startTimeList[index] = updateFn(startTimeList[index]);

  String? altDate1;

  String? altDate2;

  List<NameIdSearchableStruct> colorEnum = [];
  void addToColorEnum(NameIdSearchableStruct item) => colorEnum.add(item);
  void removeFromColorEnum(NameIdSearchableStruct item) =>
      colorEnum.remove(item);
  void removeAtIndexFromColorEnum(int index) => colorEnum.removeAt(index);
  void insertAtIndexInColorEnum(int index, NameIdSearchableStruct item) =>
      colorEnum.insert(index, item);
  void updateColorEnumAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      colorEnum[index] = updateFn(colorEnum[index]);

  String? minDeposit;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (dateAndTimeTabCursor)] action in DateAndTimeTab1 widget.
  ApiCallResponse? dateAndTimeTabCursorResponse;
  // Stores action output result for [Backend Call - API (dateRestriction)] action in DateAndTimeTab1 widget.
  ApiCallResponse? dateRestrictionApiOutput;
  // Stores action output result for [Backend Call - API (setDenominator)] action in DateAndTimeTab1 widget.
  ApiCallResponse? setDenomResponse;
  // Stores action output result for [Backend Call - API (CLBXEnColorType)] action in DateAndTimeTab1 widget.
  ApiCallResponse? colourEnumResponse;
  // Stores action output result for [Backend Call - API (dateNTimeTabStartTime)] action in DateAndTimeTab1 widget.
  ApiCallResponse? startTimeResponse;
  // State field(s) for VariationDropDown widget.
  String? variationDropDownValue;
  FormFieldController<String>? variationDropDownValueController;
  // Stores action output result for [Backend Call - API (setDenominator)] action in VariationDropDown widget.
  ApiCallResponse? setDenomFromDropDown;
  // Stores action output result for [Backend Call - API (DateNTimeTabOnDatechange)] action in ItemDate widget.
  ApiCallResponse? onDateChangedApiResponse;
  // Stores action output result for [Backend Call - API (dateNTimeTabStartTime)] action in ItemDate widget.
  ApiCallResponse? startTimeChangeForDate;
  // State field(s) for startTimeToggle widget.
  bool? startTimeToggleValue;
  // State field(s) for startTimeChoiceChips widget.
  FormFieldController<List<String>>? startTimeChoiceChipsValueController;
  String? get startTimeChoiceChipsValue =>
      startTimeChoiceChipsValueController?.value?.firstOrNull;
  set startTimeChoiceChipsValue(String? val) =>
      startTimeChoiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (startTimeChanged)] action in startTimeChoiceChips widget.
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
  // Stores action output result for [Backend Call - API (dateNTimeTabStartTime)] action in HoursDp widget.
  ApiCallResponse? startTimeChangedForHour;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (timeSlotChanged)] action in CustomChoiceChips widget.
  ApiCallResponse? timeSlotChangedResponse;
  // State field(s) for kidsCountController widget.
  int? kidsCountControllerValue;
  // Stores action output result for [Backend Call - API (KidsChanged)] action in kidsCountController widget.
  ApiCallResponse? kidsChangedResponse;
  // State field(s) for adultsCountController widget.
  int? adultsCountControllerValue;
  // Stores action output result for [Backend Call - API (AdultsChanged)] action in adultsCountController widget.
  ApiCallResponse? adultChangedResponse;
  // State field(s) for totalCountController widget.
  int? totalCountControllerValue;
  // Stores action output result for [Backend Call - API (TotalInviteeChanged)] action in totalCountController widget.
  ApiCallResponse? totalInviteesChangedResponse;
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
