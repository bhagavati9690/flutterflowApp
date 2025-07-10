import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'venue_package_details_widget.dart' show VenuePackageDetailsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class VenuePackageDetailsModel
    extends FlutterFlowModel<VenuePackageDetailsWidget> {
  ///  Local state fields for this page.

  bool isVariationPresent = false;

  List<NameIdSearchableStruct> variationMap = [];
  void addToVariationMap(NameIdSearchableStruct item) => variationMap.add(item);
  void removeFromVariationMap(NameIdSearchableStruct item) =>
      variationMap.remove(item);
  void removeAtIndexFromVariationMap(int index) => variationMap.removeAt(index);
  void insertAtIndexInVariationMap(int index, NameIdSearchableStruct item) =>
      variationMap.insert(index, item);
  void updateVariationMapAtIndex(
          int index, Function(NameIdSearchableStruct) updateFn) =>
      variationMap[index] = updateFn(variationMap[index]);

  bool isPageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (venuePackegeDetails)] action in venuePackageDetails widget.
  ApiCallResponse? packageDetailResponse;
  // Stores action output result for [Backend Call - API (venueSpaceVariationDetails)] action in venuePackageDetails widget.
  ApiCallResponse? packageVariationResponse;
  // Stores action output result for [Backend Call - API (venuePackageDetailsOpsHours)] action in venuePackageDetails widget.
  ApiCallResponse? packageOPHoursResponse;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // Models for DescriptionComp dynamic component.
  late FlutterFlowDynamicModels<DescriptionCompModel> descriptionCompModels2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // Stores action output result for [Backend Call - API (venuePackageRequestToBook)] action in Button widget.
  ApiCallResponse? requestToBook;

  @override
  void initState(BuildContext context) {
    descriptionCompModel1 = createModel(context, () => DescriptionCompModel());
    descriptionCompModels2 =
        FlutterFlowDynamicModels(() => DescriptionCompModel());
  }

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    descriptionCompModel1.dispose();
    expandableExpandableController2.dispose();
    descriptionCompModels2.dispose();
    expandableExpandableController3.dispose();
  }
}
