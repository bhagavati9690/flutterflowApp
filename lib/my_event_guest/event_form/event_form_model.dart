import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/timer_picker_comp/timer_picker_comp_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'event_form_widget.dart' show EventFormWidget;
import 'package:flutter/material.dart';

class EventFormModel extends FlutterFlowModel<EventFormWidget> {
  ///  Local state fields for this page.

  bool first = true;

  bool second = true;

  bool third = true;

  bool fourth = true;

  String? formId;

  DateTimeRange? date;

  bool showAddressesSuggestion = false;

  String? idealDate;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (eventEditFormCursor)] action in EventForm widget.
  ApiCallResponse? eventEditFromCursorOutput;
  // State field(s) for EventName widget.
  FocusNode? eventNameFocusNode;
  TextEditingController? eventNameTextController;
  String? Function(BuildContext, String?)? eventNameTextControllerValidator;
  String? _eventNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bwfv02yv' /* Event Name is required */,
      );
    }

    return null;
  }

  // State field(s) for CelebrationType widget.
  String? celebrationTypeValue;
  FormFieldController<String>? celebrationTypeValueController;
  // State field(s) for kids widget.
  int? kidsValue;
  // State field(s) for Adults widget.
  int? adultsValue;
  // State field(s) for TotalInvitee widget.
  FocusNode? totalInviteeFocusNode;
  TextEditingController? totalInviteeTextController;
  String? Function(BuildContext, String?)? totalInviteeTextControllerValidator;
  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for GendetDropDown widget.
  String? gendetDropDownValue;
  FormFieldController<String>? gendetDropDownValueController;
  // State field(s) for Age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Model for TimerPickerCompStartTime.
  late TimerPickerCompModel timerPickerCompStartTimeModel;
  // Model for TimerPickerCompEndTime.
  late TimerPickerCompModel timerPickerCompEndTimeModel;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // Stores action output result for [Backend Call - API (eventPoplateaddress)] action in Address widget.
  ApiCallResponse? populateAddressOutput;
  // Stores action output result for [Backend Call - API (eventPoplateaddress)] action in Row widget.
  ApiCallResponse? populateAddressOutput2;
  // State field(s) for BuildingNumber widget.
  FocusNode? buildingNumberFocusNode;
  TextEditingController? buildingNumberTextController;
  String? Function(BuildContext, String?)?
      buildingNumberTextControllerValidator;
  // State field(s) for PostalCode widget.
  FocusNode? postalCodeFocusNode;
  TextEditingController? postalCodeTextController;
  String? Function(BuildContext, String?)? postalCodeTextControllerValidator;
  // State field(s) for Floore widget.
  FocusNode? flooreFocusNode;
  TextEditingController? flooreTextController;
  String? Function(BuildContext, String?)? flooreTextControllerValidator;
  // State field(s) for StrretName widget.
  FocusNode? strretNameFocusNode;
  TextEditingController? strretNameTextController;
  String? Function(BuildContext, String?)? strretNameTextControllerValidator;
  // State field(s) for CityTown widget.
  FocusNode? cityTownFocusNode;
  TextEditingController? cityTownTextController;
  String? Function(BuildContext, String?)? cityTownTextControllerValidator;
  // State field(s) for State widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // State field(s) for country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  // State field(s) for loacalArea widget.
  FocusNode? loacalAreaFocusNode;
  TextEditingController? loacalAreaTextController;
  String? Function(BuildContext, String?)? loacalAreaTextControllerValidator;
  // State field(s) for AlterNateDate1 widget.
  FocusNode? alterNateDate1FocusNode;
  TextEditingController? alterNateDate1TextController;
  String? Function(BuildContext, String?)?
      alterNateDate1TextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for AlterNateDate2 widget.
  FocusNode? alterNateDate2FocusNode;
  TextEditingController? alterNateDate2TextController;
  String? Function(BuildContext, String?)?
      alterNateDate2TextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for ThemeCategory widget.
  String? themeCategoryValue;
  FormFieldController<String>? themeCategoryValueController;
  // State field(s) for Theme widget.
  FocusNode? themeFocusNode;
  TextEditingController? themeTextController;
  String? Function(BuildContext, String?)? themeTextControllerValidator;
  // State field(s) for EventStatus widget.
  String? eventStatusValue;
  FormFieldController<String>? eventStatusValueController;
  // State field(s) for TotalCost widget.
  FocusNode? totalCostFocusNode;
  TextEditingController? totalCostTextController;
  String? Function(BuildContext, String?)? totalCostTextControllerValidator;
  // State field(s) for Budget widget.
  FocusNode? budgetFocusNode;
  TextEditingController? budgetTextController;
  String? Function(BuildContext, String?)? budgetTextControllerValidator;
  // Stores action output result for [Backend Call - API (saveEvent)] action in Button widget.
  ApiCallResponse? saveEventOutput;

  @override
  void initState(BuildContext context) {
    eventNameTextControllerValidator = _eventNameTextControllerValidator;
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    timerPickerCompStartTimeModel =
        createModel(context, () => TimerPickerCompModel());
    timerPickerCompEndTimeModel =
        createModel(context, () => TimerPickerCompModel());
  }

  @override
  void dispose() {
    eventNameFocusNode?.dispose();
    eventNameTextController?.dispose();

    totalInviteeFocusNode?.dispose();
    totalInviteeTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    timerPickerCompStartTimeModel.dispose();
    timerPickerCompEndTimeModel.dispose();
    addressFocusNode?.dispose();
    addressTextController?.dispose();

    buildingNumberFocusNode?.dispose();
    buildingNumberTextController?.dispose();

    postalCodeFocusNode?.dispose();
    postalCodeTextController?.dispose();

    flooreFocusNode?.dispose();
    flooreTextController?.dispose();

    strretNameFocusNode?.dispose();
    strretNameTextController?.dispose();

    cityTownFocusNode?.dispose();
    cityTownTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();

    loacalAreaFocusNode?.dispose();
    loacalAreaTextController?.dispose();

    alterNateDate1FocusNode?.dispose();
    alterNateDate1TextController?.dispose();

    alterNateDate2FocusNode?.dispose();
    alterNateDate2TextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    themeFocusNode?.dispose();
    themeTextController?.dispose();

    totalCostFocusNode?.dispose();
    totalCostTextController?.dispose();

    budgetFocusNode?.dispose();
    budgetTextController?.dispose();
  }
}
