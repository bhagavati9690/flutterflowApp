import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'venue_space_details_widget.dart' show VenueSpaceDetailsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class VenueSpaceDetailsModel extends FlutterFlowModel<VenueSpaceDetailsWidget> {
  ///  Local state fields for this page.

  bool isVariationPresent = false;

  bool isPageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (venueSpaceDetails)] action in venueSpaceDetails widget.
  ApiCallResponse? spaceDetailResponse;
  // Stores action output result for [Backend Call - API (venueSpaceVariationDetails)] action in venueSpaceDetails widget.
  ApiCallResponse? spaceVariationResponse;
  // Stores action output result for [Backend Call - API (venueSpaceOpHours)] action in venueSpaceDetails widget.
  ApiCallResponse? spaceOpHoursResponse;
  // Stores action output result for [Backend Call - API (SpaceAmenities)] action in venueSpaceDetails widget.
  ApiCallResponse? spaceAmenitiesResponse;
  // Stores action output result for [Backend Call - API (spaceConfigration)] action in venueSpaceDetails widget.
  ApiCallResponse? configrationResponse;
  // State field(s) for description widget.
  late ExpandableController descriptionExpandableController;

  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Models for DescriptionComp dynamic component.
  late FlutterFlowDynamicModels<DescriptionCompModel> descriptionCompModels2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // Stores action output result for [Backend Call - API (venueSpaceRequestToBook)] action in Button widget.
  ApiCallResponse? requestToBook;

  @override
  void initState(BuildContext context) {
    descriptionCompModel1 = createModel(context, () => DescriptionCompModel());
    descriptionCompModels2 =
        FlutterFlowDynamicModels(() => DescriptionCompModel());
  }

  @override
  void dispose() {
    descriptionExpandableController.dispose();
    descriptionCompModel1.dispose();
    expandableExpandableController1.dispose();
    descriptionCompModels2.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
  }
}
