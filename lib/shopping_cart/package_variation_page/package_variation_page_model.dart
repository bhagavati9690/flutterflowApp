import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package_variation_page_widget.dart' show PackageVariationPageWidget;
import 'package:flutter/material.dart';

class PackageVariationPageModel
    extends FlutterFlowModel<PackageVariationPageWidget> {
  ///  Local state fields for this page.

  ClientQueryStruct? variationQuery;
  void updateVariationQueryStruct(Function(ClientQueryStruct) updateFn) {
    updateFn(variationQuery ??= ClientQueryStruct());
  }

  List<NameIdSearchableStruct> variationList = [];
  void addToVariationList(NameIdSearchableStruct item) =>
      variationList.add(item);
  void removeFromVariationList(NameIdSearchableStruct item) =>
      variationList.remove(item);
  void removeAtIndexFromVariationList(int index) =>
      variationList.removeAt(index);
  void insertAtIndexInVariationList(int index, NameIdSearchableStruct item) =>
      variationList.insert(index, item);
  void updateVariationListAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      variationList[index] = updateFn(variationList[index]);

  bool apiLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (venuePackageVariation)] action in PackageVariationPage widget.
  ApiCallResponse? apiResultx08;
  // Stores action output result for [Backend Call - API (venueSpaceVariationDetails)] action in PackageVariationPage widget.
  ApiCallResponse? spaceVariationDetails;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  NameIdSearchableStruct? selectedVariation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
