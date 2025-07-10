import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'friend_form_widget.dart' show FriendFormWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendFormModel extends FlutterFlowModel<FriendFormWidget> {
  ///  Local state fields for this page.

  String? idForm;

  bool? showSuggestion = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (myFriendEdit)] action in FriendForm widget.
  ApiCallResponse? apiResultFriendInfo;
  // State field(s) for friendOfdropdown widget.
  String? friendOfdropdownValue;
  FormFieldController<String>? friendOfdropdownValueController;
  // State field(s) for GenderdropDown widget.
  String? genderdropDownValue;
  FormFieldController<String>? genderdropDownValueController;
  // State field(s) for DOB widget.
  FocusNode? dobFocusNode;
  TextEditingController? dobTextController;
  String? Function(BuildContext, String?)? dobTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ug9ulwpd' /* FirstName is  required */,
      );
    }

    return null;
  }

  // State field(s) for MiddleName widget.
  FocusNode? middleNameFocusNode;
  TextEditingController? middleNameTextController;
  String? Function(BuildContext, String?)? middleNameTextControllerValidator;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for MobileNumber widget.
  FocusNode? mobileNumberFocusNode;
  TextEditingController? mobileNumberTextController;
  String? Function(BuildContext, String?)? mobileNumberTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for Adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressTextController;
  String? Function(BuildContext, String?)? adressTextControllerValidator;
  // Stores action output result for [Backend Call - API (myfriendAddressesSuggestion)] action in Adress widget.
  ApiCallResponse? apiResultAdressSuggestion;
  // Stores action output result for [Backend Call - API (myFriendPopulateAddress)] action in Adress widget.
  ApiCallResponse? apiResultPoulateAddress1;
  // Stores action output result for [Backend Call - API (myFriendPopulateAddress)] action in Row widget.
  ApiCallResponse? apiResultPoulateAddress2;
  // State field(s) for BuildingNumber widget.
  FocusNode? buildingNumberFocusNode;
  TextEditingController? buildingNumberTextController;
  String? Function(BuildContext, String?)?
      buildingNumberTextControllerValidator;
  // State field(s) for PostalCode widget.
  FocusNode? postalCodeFocusNode;
  TextEditingController? postalCodeTextController;
  String? Function(BuildContext, String?)? postalCodeTextControllerValidator;
  // State field(s) for Floor widget.
  FocusNode? floorFocusNode;
  TextEditingController? floorTextController;
  String? Function(BuildContext, String?)? floorTextControllerValidator;
  // State field(s) for StreetName widget.
  FocusNode? streetNameFocusNode;
  TextEditingController? streetNameTextController;
  String? Function(BuildContext, String?)? streetNameTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
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
  // State field(s) for SpecialNeeds widget.
  bool? specialNeedsValue;
  // State field(s) for allergy widget.
  bool? allergyValue;
  // State field(s) for Educationdropdown widget.
  String? educationdropdownValue;
  FormFieldController<String>? educationdropdownValueController;
  // State field(s) for Interstes widget.
  FocusNode? interstesFocusNode;
  TextEditingController? interstesTextController;
  String? Function(BuildContext, String?)? interstesTextControllerValidator;
  // State field(s) for NoteTextField widget.
  FocusNode? noteTextFieldFocusNode;
  TextEditingController? noteTextFieldTextController;
  String? Function(BuildContext, String?)? noteTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (saveFriend)] action in Button widget.
  ApiCallResponse? friendSaveOutput;

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
  }

  @override
  void dispose() {
    dobFocusNode?.dispose();
    dobTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    middleNameFocusNode?.dispose();
    middleNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    mobileNumberFocusNode?.dispose();
    mobileNumberTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    expandableExpandableController.dispose();
    adressFocusNode?.dispose();
    adressTextController?.dispose();

    buildingNumberFocusNode?.dispose();
    buildingNumberTextController?.dispose();

    postalCodeFocusNode?.dispose();
    postalCodeTextController?.dispose();

    floorFocusNode?.dispose();
    floorTextController?.dispose();

    streetNameFocusNode?.dispose();
    streetNameTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();

    loacalAreaFocusNode?.dispose();
    loacalAreaTextController?.dispose();

    interstesFocusNode?.dispose();
    interstesTextController?.dispose();

    noteTextFieldFocusNode?.dispose();
    noteTextFieldTextController?.dispose();
  }
}
