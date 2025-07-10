import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'icing_page_widget.dart' show IcingPageWidget;
import 'package:flutter/material.dart';

class IcingPageModel extends FlutterFlowModel<IcingPageWidget> {
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

  // Stores action output result for [Backend Call - API (cakeIcings)] action in icingPage widget.
  ApiCallResponse? cakeFlavourResponse;
  // Stores action output result for [Backend Call - API (icingListPicker)] action in icingPage widget.
  ApiCallResponse? flavourOptionsResponse;
  // Stores action output result for [Backend Call - API (iciingCheckboxSelection)] action in Icon widget.
  ApiCallResponse? checkboxChanged;
  // Stores action output result for [Backend Call - API (iciingCheckboxSelection)] action in Icon widget.
  ApiCallResponse? checkboxChanged2;
  // Stores action output result for [Backend Call - API (iciingCheckboxSelection)] action in Container widget.
  ApiCallResponse? checkboxChanged3;
  // Stores action output result for [Backend Call - API (icingNext)] action in Button widget.
  ApiCallResponse? nextResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
