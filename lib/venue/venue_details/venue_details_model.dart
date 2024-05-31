import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'venue_details_widget.dart' show VenueDetailsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class VenueDetailsModel extends FlutterFlowModel<VenueDetailsWidget> {
  ///  Local state fields for this page.

  bool isVenueLike = true;

  PhotoQueryStruct photoQuery =
      PhotoQueryStruct.fromSerializableMap(jsonDecode('{}'));
  void updatePhotoQueryStruct(Function(PhotoQueryStruct) updateFn) =>
      updateFn(photoQuery);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (venueDetails)] action in VenueDetails widget.
  ApiCallResponse? apiResultVenueResult;
  // Stores action output result for [Backend Call - API (venuePhoto)] action in VenueDetails widget.
  ApiCallResponse? apiResultVenuePhoto;
  // Stores action output result for [Backend Call - API (venuePackage)] action in VenueDetails widget.
  ApiCallResponse? apiResultVenuePackage;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // State field(s) for RatingBar widget.
  double? ratingBarValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableExpandableController1.dispose();
    tabBarController?.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
    expandableExpandableController6.dispose();
  }
}
