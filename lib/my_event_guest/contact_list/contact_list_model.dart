import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'contact_list_widget.dart' show ContactListWidget;
import 'package:flutter/material.dart';

class ContactListModel extends FlutterFlowModel<ContactListWidget> {
  ///  Local state fields for this page.

  int counter = 0;

  ClientQueryStruct? addGuestQuery;
  void updateAddGuestQueryStruct(Function(ClientQueryStruct) updateFn) {
    updateFn(addGuestQuery ??= ClientQueryStruct());
  }

  List<ContactStruct> selectedContact = [];
  void addToSelectedContact(ContactStruct item) => selectedContact.add(item);
  void removeFromSelectedContact(ContactStruct item) =>
      selectedContact.remove(item);
  void removeAtIndexFromSelectedContact(int index) =>
      selectedContact.removeAt(index);
  void insertAtIndexInSelectedContact(int index, ContactStruct item) =>
      selectedContact.insert(index, item);
  void updateSelectedContactAtIndex(
          int index, Function(ContactStruct) updateFn) =>
      selectedContact[index] = updateFn(selectedContact[index]);

  List<String> id = [];
  void addToId(String item) => id.add(item);
  void removeFromId(String item) => id.remove(item);
  void removeAtIndexFromId(int index) => id.removeAt(index);
  void insertAtIndexInId(int index, String item) => id.insert(index, item);
  void updateIdAtIndex(int index, Function(String) updateFn) =>
      id[index] = updateFn(id[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchContacts] action in TextField widget.
  List<ContactStruct>? serchContacts;
  // Stores action output result for [Backend Call - API (AddGuestCursor)] action in Button widget.
  ApiCallResponse? addGuestCursorOutput;
  // Stores action output result for [Backend Call - API (AddGuest)] action in Button widget.
  ApiCallResponse? guestSaveOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
