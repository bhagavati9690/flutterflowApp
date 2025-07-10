import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/timer_picker_comp/timer_picker_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'event_info_for_shopping_cart_widget.dart'
    show EventInfoForShoppingCartWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class EventInfoForShoppingCartModel
    extends FlutterFlowModel<EventInfoForShoppingCartWidget> {
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

  List<NameIdSearchableStruct> celebrationTypeEnum = [];
  void addToCelebrationTypeEnum(NameIdSearchableStruct item) =>
      celebrationTypeEnum.add(item);
  void removeFromCelebrationTypeEnum(NameIdSearchableStruct item) =>
      celebrationTypeEnum.remove(item);
  void removeAtIndexFromCelebrationTypeEnum(int index) =>
      celebrationTypeEnum.removeAt(index);
  void insertAtIndexInCelebrationTypeEnum(
          int index, NameIdSearchableStruct item) =>
      celebrationTypeEnum.insert(index, item);
  void updateCelebrationTypeEnumAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      celebrationTypeEnum[index] = updateFn(celebrationTypeEnum[index]);

  List<NameIdSearchableStruct> genderEnum = [];
  void addToGenderEnum(NameIdSearchableStruct item) => genderEnum.add(item);
  void removeFromGenderEnum(NameIdSearchableStruct item) =>
      genderEnum.remove(item);
  void removeAtIndexFromGenderEnum(int index) => genderEnum.removeAt(index);
  void insertAtIndexInGenderEnum(int index, NameIdSearchableStruct item) =>
      genderEnum.insert(index, item);
  void updateGenderEnumAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      genderEnum[index] = updateFn(genderEnum[index]);

  List<NameIdSearchableStruct> themeCategoryEnum = [];
  void addToThemeCategoryEnum(NameIdSearchableStruct item) =>
      themeCategoryEnum.add(item);
  void removeFromThemeCategoryEnum(NameIdSearchableStruct item) =>
      themeCategoryEnum.remove(item);
  void removeAtIndexFromThemeCategoryEnum(int index) =>
      themeCategoryEnum.removeAt(index);
  void insertAtIndexInThemeCategoryEnum(
          int index, NameIdSearchableStruct item) =>
      themeCategoryEnum.insert(index, item);
  void updateThemeCategoryEnumAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      themeCategoryEnum[index] = updateFn(themeCategoryEnum[index]);

  List<NameIdSearchableStruct> eventStatusEnum = [];
  void addToEventStatusEnum(NameIdSearchableStruct item) =>
      eventStatusEnum.add(item);
  void removeFromEventStatusEnum(NameIdSearchableStruct item) =>
      eventStatusEnum.remove(item);
  void removeAtIndexFromEventStatusEnum(int index) =>
      eventStatusEnum.removeAt(index);
  void insertAtIndexInEventStatusEnum(int index, NameIdSearchableStruct item) =>
      eventStatusEnum.insert(index, item);
  void updateEventStatusEnumAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      eventStatusEnum[index] = updateFn(eventStatusEnum[index]);

  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (shoppingCartEventEditCursor)] action in EventInfoForShoppingCart widget.
  ApiCallResponse? eventCursorOutput;
  // Stores action output result for [Backend Call - API (CLBXEnCelebrationType)] action in EventInfoForShoppingCart widget.
  ApiCallResponse? celebrationTypeEnumReponse;
  // State field(s) for EventName widget.
  FocusNode? eventNameFocusNode;
  TextEditingController? eventNameTextController;
  String? Function(BuildContext, String?)? eventNameTextControllerValidator;
  String? _eventNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'f68p2j2f' /* Enter Event Name is required */,
      );
    }

    return null;
  }

  // State field(s) for celebrationTypeDropdown widget.
  String? celebrationTypeDropdownValue;
  FormFieldController<String>? celebrationTypeDropdownValueController;
  // Stores action output result for [Backend Call - API (EventChangedCelebrationType)] action in celebrationTypeDropdown widget.
  ApiCallResponse? setCelebrationTypeResponse;
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
  // State field(s) for celebrateeFirstName widget.
  FocusNode? celebrateeFirstNameFocusNode;
  TextEditingController? celebrateeFirstNameTextController;
  String? Function(BuildContext, String?)?
      celebrateeFirstNameTextControllerValidator;
  // State field(s) for celebrateeLastName widget.
  FocusNode? celebrateeLastNameFocusNode;
  TextEditingController? celebrateeLastNameTextController;
  String? Function(BuildContext, String?)?
      celebrateeLastNameTextControllerValidator;
  // State field(s) for genderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // State field(s) for celebrateeAge widget.
  FocusNode? celebrateeAgeFocusNode;
  TextEditingController? celebrateeAgeTextController;
  String? Function(BuildContext, String?)? celebrateeAgeTextControllerValidator;
  // Model for TimerPickerComp component.
  late TimerPickerCompModel timerPickerCompModel1;
  // Model for TimerPickerComp component.
  late TimerPickerCompModel timerPickerCompModel2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
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
  // State field(s) for eventStatusDropDown widget.
  String? eventStatusDropDownValue;
  FormFieldController<String>? eventStatusDropDownValueController;
  // Stores action output result for [Backend Call - API (eventFormNextAction)] action in Button widget.
  ApiCallResponse? eventSaveResponse;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // Stores action output result for [Backend Call - API (EventAddress)] action in Address widget.
  ApiCallResponse? populateAddressOutput;
  // Stores action output result for [Backend Call - API (EventAddress)] action in Row widget.
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
    timerPickerCompModel1 = createModel(context, () => TimerPickerCompModel());
    timerPickerCompModel2 = createModel(context, () => TimerPickerCompModel());
  }

  @override
  void dispose() {
    eventNameFocusNode?.dispose();
    eventNameTextController?.dispose();

    inquiryCommentsFocusNode?.dispose();
    inquiryCommentsTextController?.dispose();

    celebrateeFirstNameFocusNode?.dispose();
    celebrateeFirstNameTextController?.dispose();

    celebrateeLastNameFocusNode?.dispose();
    celebrateeLastNameTextController?.dispose();

    celebrateeAgeFocusNode?.dispose();
    celebrateeAgeTextController?.dispose();

    timerPickerCompModel1.dispose();
    timerPickerCompModel2.dispose();
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
