import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'flavours_page_widget.dart' show FlavoursPageWidget;
import 'package:flutter/material.dart';

class FlavoursPageModel extends FlutterFlowModel<FlavoursPageWidget> {
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

  // Stores action output result for [Backend Call - API (cakeFlavours)] action in flavoursPage widget.
  ApiCallResponse? cakeFlavourResponse;
  // Stores action output result for [Backend Call - API (flavourListPickerCursor)] action in flavoursPage widget.
  ApiCallResponse? flavourOptionsResponse;
  // Stores action output result for [Backend Call - API (flavourCheckBoxSelection)] action in Icon widget.
  ApiCallResponse? checkboxChanged;
  // Stores action output result for [Backend Call - API (flavourCheckBoxSelection)] action in Icon widget.
  ApiCallResponse? checkboxChanged2;
  // Stores action output result for [Backend Call - API (flavourCheckBoxSelection)] action in Container widget.
  ApiCallResponse? checkboxChanged3;
  // Stores action output result for [Backend Call - API (flavourNext)] action in Button widget.
  ApiCallResponse? nextResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
