import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'friend_list_widget.dart' show FriendListWidget;
import 'package:flutter/material.dart';

class FriendListModel extends FlutterFlowModel<FriendListWidget> {
  ///  Local state fields for this page.

  bool isPageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (friendList)] action in FriendList widget.
  ApiCallResponse? friendList;
  // Stores action output result for [Backend Call - API (friendDeleteAction)] action in IconButton widget.
  ApiCallResponse? friendDelete;
  // Stores action output result for [Custom Action - getAllContacts] action in Button widget.
  List<ContactStruct>? allContacts;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
