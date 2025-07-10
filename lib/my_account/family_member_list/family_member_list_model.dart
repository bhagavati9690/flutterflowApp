import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'family_member_list_widget.dart' show FamilyMemberListWidget;
import 'package:flutter/material.dart';

class FamilyMemberListModel extends FlutterFlowModel<FamilyMemberListWidget> {
  ///  Local state fields for this page.

  bool isPageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (familyMemberList)] action in FamilyMemberList widget.
  ApiCallResponse? familyMember;
  // Stores action output result for [Backend Call - API (deleteFamilyMember)] action in IconButton widget.
  ApiCallResponse? familyMemberDelete;
  // Stores action output result for [Custom Action - getAllContacts] action in Button widget.
  List<ContactStruct>? allContacts;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
