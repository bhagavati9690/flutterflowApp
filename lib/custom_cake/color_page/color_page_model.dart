import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'color_page_widget.dart' show ColorPageWidget;
import 'package:flutter/material.dart';

class ColorPageModel extends FlutterFlowModel<ColorPageWidget> {
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

  List<NameIdSearchableStruct> nextParams = [];
  void addToNextParams(NameIdSearchableStruct item) => nextParams.add(item);
  void removeFromNextParams(NameIdSearchableStruct item) =>
      nextParams.remove(item);
  void removeAtIndexFromNextParams(int index) => nextParams.removeAt(index);
  void insertAtIndexInNextParams(int index, NameIdSearchableStruct item) =>
      nextParams.insert(index, item);
  void updateNextParamsAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      nextParams[index] = updateFn(nextParams[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (cakeColour)] action in colorPage widget.
  ApiCallResponse? cakeFlavourResponse;
  // Stores action output result for [Backend Call - API (colorListPicker)] action in colorPage widget.
  ApiCallResponse? flavourOptionsResponse;
  // Stores action output result for [Backend Call - API (colorNext)] action in Button widget.
  ApiCallResponse? nextResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
