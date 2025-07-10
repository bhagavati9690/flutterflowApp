import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vendor_inquiry_response_widget.dart' show VendorInquiryResponseWidget;
import 'package:flutter/material.dart';

class VendorInquiryResponseModel
    extends FlutterFlowModel<VendorInquiryResponseWidget> {
  ///  Local state fields for this page.

  List<ContactStruct> options = [];
  void addToOptions(ContactStruct item) => options.add(item);
  void removeFromOptions(ContactStruct item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, ContactStruct item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(ContactStruct) updateFn) =>
      options[index] = updateFn(options[index]);

  String? ocKey;

  bool apiLoaded = false;

  String? selectionPrice;

  String? totalPrice;

  List<NameIdSearchableStruct> nextParms = [];
  void addToNextParms(NameIdSearchableStruct item) => nextParms.add(item);
  void removeFromNextParms(NameIdSearchableStruct item) =>
      nextParms.remove(item);
  void removeAtIndexFromNextParms(int index) => nextParms.removeAt(index);
  void insertAtIndexInNextParms(int index, NameIdSearchableStruct item) =>
      nextParms.insert(index, item);
  void updateNextParmsAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      nextParms[index] = updateFn(nextParms[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (vendorInquiryResponseCusror)] action in vendorInquiryResponse widget.
  ApiCallResponse? inquiryCursor;
  // State field(s) for acceptComments widget.
  FocusNode? acceptCommentsFocusNode;
  TextEditingController? acceptCommentsTextController;
  String? Function(BuildContext, String?)?
      acceptCommentsTextControllerValidator;
  // Stores action output result for [Backend Call - API (vendorInquiryResponseSubmit)] action in Button widget.
  ApiCallResponse? submitAction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    acceptCommentsFocusNode?.dispose();
    acceptCommentsTextController?.dispose();
  }
}
