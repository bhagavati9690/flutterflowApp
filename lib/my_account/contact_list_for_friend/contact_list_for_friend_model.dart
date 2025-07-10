import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'contact_list_for_friend_widget.dart' show ContactListForFriendWidget;
import 'package:flutter/material.dart';

class ContactListForFriendModel
    extends FlutterFlowModel<ContactListForFriendWidget> {
  ///  Local state fields for this page.

  int counter = 0;

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

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchContacts] action in TextField widget.
  List<ContactStruct>? serchContacts;
  // Stores action output result for [Backend Call - API (familyMemberEdit)] action in Button widget.
  ApiCallResponse? apiResultFamilyMemberInfo;
  // Stores action output result for [Backend Call - API (saveFamilyMember)] action in Button widget.
  ApiCallResponse? familyMemberSaveOutput;
  // Stores action output result for [Backend Call - API (myFriendEdit)] action in Button widget.
  ApiCallResponse? apiResultFriendInfo;
  // Stores action output result for [Backend Call - API (saveFriend)] action in Button widget.
  ApiCallResponse? friendSaveOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
