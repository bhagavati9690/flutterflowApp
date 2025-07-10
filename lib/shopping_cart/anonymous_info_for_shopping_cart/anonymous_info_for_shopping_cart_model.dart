import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/timer_picker_comp/timer_picker_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'anonymous_info_for_shopping_cart_widget.dart'
    show AnonymousInfoForShoppingCartWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AnonymousInfoForShoppingCartModel
    extends FlutterFlowModel<AnonymousInfoForShoppingCartWidget> {
  ///  Local state fields for this page.

  bool first = false;

  bool second = false;

  bool third = false;

  List<int> disabledDays = [];
  void addToDisabledDays(int item) => disabledDays.add(item);
  void removeFromDisabledDays(int item) => disabledDays.remove(item);
  void removeAtIndexFromDisabledDays(int index) => disabledDays.removeAt(index);
  void insertAtIndexInDisabledDays(int index, int item) =>
      disabledDays.insert(index, item);
  void updateDisabledDaysAtIndex(int index, Function(int) updateFn) =>
      disabledDays[index] = updateFn(disabledDays[index]);

  bool apiLoaded = false;

  bool fourth = false;

  bool showAddressSuggestion = false;

  String? ocKey;

  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (anonymousEventCursor)] action in AnonymousInfoForShoppingCart widget.
  ApiCallResponse? eventCursorOutput;
  // State field(s) for EventName widget.
  FocusNode? eventNameFocusNode;
  TextEditingController? eventNameTextController;
  String? Function(BuildContext, String?)? eventNameTextControllerValidator;
  String? _eventNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qqmw1fhz' /*  Event Name is required */,
      );
    }

    return null;
  }

  // State field(s) for celebrationTypeDropdown widget.
  String? celebrationTypeDropdownValue;
  FormFieldController<String>? celebrationTypeDropdownValueController;
  // Stores action output result for [Backend Call - API (celebrationTypeChanged)] action in celebrationTypeDropdown widget.
  ApiCallResponse? apiResult9kx;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g4wkp0z9' /*  First Name is required */,
      );
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8eyefs92' /*  Last Name is required */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ta2lvhns' /*  Email is required */,
      );
    }

    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '868eoamh' /*  Phone number is required */,
      );
    }

    return null;
  }

  // State field(s) for inquiryComments widget.
  FocusNode? inquiryCommentsFocusNode;
  TextEditingController? inquiryCommentsTextController;
  String? Function(BuildContext, String?)?
      inquiryCommentsTextControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // State field(s) for CountController widget.
  int? countControllerValue3;
  // Model for TimerPickerComp component.
  late TimerPickerCompModel timerPickerCompModel1;
  // Model for TimerPickerComp component.
  late TimerPickerCompModel timerPickerCompModel2;
  // State field(s) for celebrateeFirstName widget.
  FocusNode? celebrateeFirstNameFocusNode;
  TextEditingController? celebrateeFirstNameTextController;
  String? Function(BuildContext, String?)?
      celebrateeFirstNameTextControllerValidator;
  // State field(s) for genderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // State field(s) for celebrateeAge widget.
  FocusNode? celebrateeAgeFocusNode;
  TextEditingController? celebrateeAgeTextController;
  String? Function(BuildContext, String?)? celebrateeAgeTextControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for themeCatDropDown widget.
  String? themeCatDropDownValue;
  FormFieldController<String>? themeCatDropDownValueController;
  // State field(s) for EnterThemeTxt widget.
  FocusNode? enterThemeTxtFocusNode;
  TextEditingController? enterThemeTxtTextController;
  String? Function(BuildContext, String?)? enterThemeTxtTextControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for eventDescription widget.
  FocusNode? eventDescriptionFocusNode;
  TextEditingController? eventDescriptionTextController;
  String? Function(BuildContext, String?)?
      eventDescriptionTextControllerValidator;
  // Stores action output result for [Backend Call - API (anonymousInfoFormNext)] action in Button widget.
  ApiCallResponse? nextResponse;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // Stores action output result for [Backend Call - API (anonEventPopulation)] action in Address widget.
  ApiCallResponse? populateAddressOutput;
  // Stores action output result for [Backend Call - API (anonEventPopulation)] action in Row widget.
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

  @override
  void initState(BuildContext context) {
    eventNameTextControllerValidator = _eventNameTextControllerValidator;
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    timerPickerCompModel1 = createModel(context, () => TimerPickerCompModel());
    timerPickerCompModel2 = createModel(context, () => TimerPickerCompModel());
  }

  @override
  void dispose() {
    eventNameFocusNode?.dispose();
    eventNameTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    inquiryCommentsFocusNode?.dispose();
    inquiryCommentsTextController?.dispose();

    timerPickerCompModel1.dispose();
    timerPickerCompModel2.dispose();
    celebrateeFirstNameFocusNode?.dispose();
    celebrateeFirstNameTextController?.dispose();

    celebrateeAgeFocusNode?.dispose();
    celebrateeAgeTextController?.dispose();

    expandableExpandableController1.dispose();
    enterThemeTxtFocusNode?.dispose();
    enterThemeTxtTextController?.dispose();

    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    eventDescriptionFocusNode?.dispose();
    eventDescriptionTextController?.dispose();

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
  }
}
