import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  Local state fields for this page.

  bool ispageload = false;

  String? imagePath;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (MyInformation)] action in myProfile widget.
  ApiCallResponse? myInformation;
  bool isDataUploading_uploadProfilePic = false;
  FFUploadedFile uploadedLocalFile_uploadProfilePic =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (profilePic)] action in IconButton widget.
  ApiCallResponse? profilepicApiload;
  // Stores action output result for [Backend Call - API (saveProfilePic)] action in IconButton widget.
  ApiCallResponse? saveProfilePic;
  // Stores action output result for [Backend Call - API (MyInformation)] action in IconButton widget.
  ApiCallResponse? innfo;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
