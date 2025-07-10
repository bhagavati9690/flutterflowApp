import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'photo_upload_comp_widget.dart' show PhotoUploadCompWidget;
import 'package:flutter/material.dart';

class PhotoUploadCompModel extends FlutterFlowModel<PhotoUploadCompWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadProfilePic1 = false;
  FFUploadedFile uploadedLocalFile_uploadProfilePic1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (profilePic)] action in Button widget.
  ApiCallResponse? profilepicApiload;
  // Stores action output result for [Backend Call - API (saveProfilePic)] action in Button widget.
  ApiCallResponse? saveProfilePic;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
