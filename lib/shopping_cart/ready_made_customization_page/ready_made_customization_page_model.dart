import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ready_made_customization_page_widget.dart'
    show ReadyMadeCustomizationPageWidget;
import 'package:flutter/material.dart';

class ReadyMadeCustomizationPageModel
    extends FlutterFlowModel<ReadyMadeCustomizationPageWidget> {
  ///  Local state fields for this page.

  bool apiLoaded = false;

  String? ocKey;

  bool enableRadioButton = false;

  String totalPrice = ' ';

  String? optionsPrice;

  List<ContactStruct> list = [];
  void addToList(ContactStruct item) => list.add(item);
  void removeFromList(ContactStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, ContactStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(ContactStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  String? nextTabName;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (readyMakeCakeCustomCursor)] action in readyMadeCustomizationPage widget.
  ApiCallResponse? customizationCursor;
  // Stores action output result for [Backend Call - API (rMCustomPageCheckboxChanged)] action in Icon widget.
  ApiCallResponse? checkboxChanged;
  // Stores action output result for [Backend Call - API (rMCustomPageCheckboxChanged)] action in Icon widget.
  ApiCallResponse? checkboxChanged2;
  // Stores action output result for [Backend Call - API (rMCustomPageCheckboxChanged)] action in Container widget.
  ApiCallResponse? checkboxChanged3;
  // Stores action output result for [Backend Call - API (rMCustomPageNext)] action in Button widget.
  ApiCallResponse? nextResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
