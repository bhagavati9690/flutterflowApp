import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/detail_pagecomp/award_comp/award_comp_widget.dart';
import '/compoents/detail_pagecomp/booking_policy/booking_policy_widget.dart';
import '/compoents/detail_pagecomp/delivery_comp/delivery_comp_widget.dart';
import '/compoents/detail_pagecomp/review_comp/review_comp_widget.dart';
import '/compoents/detail_pagecomp/similar_vendor_comp/similar_vendor_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'rental_details_widget.dart' show RentalDetailsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class RentalDetailsModel extends FlutterFlowModel<RentalDetailsWidget> {
  ///  Local state fields for this page.

  bool isPageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (rentalDetails)] action in RentalDetails widget.
  ApiCallResponse? rentalDetailOutput;
  // Stores action output result for [Backend Call - API (resourcePhoto)] action in RentalDetails widget.
  ApiCallResponse? rentalPhotoOutput;
  // Stores action output result for [Backend Call - API (rentalItemCategory)] action in RentalDetails widget.
  ApiCallResponse? arentalItemTypeOutput;
  // Stores action output result for [Backend Call - API (resourceDelivery)] action in RentalDetails widget.
  ApiCallResponse? rentalDelivery;
  // Stores action output result for [Backend Call - API (resourceopHours)] action in RentalDetails widget.
  ApiCallResponse? rentalOpsHourOutput;
  // Stores action output result for [Backend Call - API (resourcereview)] action in RentalDetails widget.
  ApiCallResponse? rentalReviewOutput;
  // Stores action output result for [Backend Call - API (resourceCancellationPolicy)] action in RentalDetails widget.
  ApiCallResponse? rentalCancllationPolicyOutput;
  // Stores action output result for [Backend Call - API (rentaSimilarVendor)] action in RentalDetails widget.
  ApiCallResponse? rentalSimillarOutput;
  // Stores action output result for [Backend Call - API (resourceAward)] action in RentalDetails widget.
  ApiCallResponse? rentalAwardOutput;
  // Stores action output result for [Backend Call - API (resourceFAQ)] action in RentalDetails widget.
  ApiCallResponse? fAQapiResponce;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel2;
  // State field(s) for ExpandablePayment widget.
  late ExpandableController expandablePaymentExpandableController1;

  // Models for DeliveryComp dynamic component.
  late FlutterFlowDynamicModels<DeliveryCompModel> deliveryCompModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for ExpandablePayment widget.
  late ExpandableController expandablePaymentExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // Models for reviewComp dynamic component.
  late FlutterFlowDynamicModels<ReviewCompModel> reviewCompModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // Model for BookingPolicy component.
  late BookingPolicyModel bookingPolicyModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // Models for awardComp dynamic component.
  late FlutterFlowDynamicModels<AwardCompModel> awardCompModels;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Models for similarVendorComp dynamic component.
  late FlutterFlowDynamicModels<SimilarVendorCompModel> similarVendorCompModels;

  @override
  void initState(BuildContext context) {
    descriptionCompModel1 = createModel(context, () => DescriptionCompModel());
    descriptionCompModel2 = createModel(context, () => DescriptionCompModel());
    deliveryCompModels = FlutterFlowDynamicModels(() => DeliveryCompModel());
    reviewCompModels = FlutterFlowDynamicModels(() => ReviewCompModel());
    bookingPolicyModel = createModel(context, () => BookingPolicyModel());
    awardCompModels = FlutterFlowDynamicModels(() => AwardCompModel());
    similarVendorCompModels =
        FlutterFlowDynamicModels(() => SimilarVendorCompModel());
  }

  @override
  void dispose() {
    descriptionCompModel1.dispose();
    tabBarController?.dispose();
    expandableExpandableController1.dispose();
    descriptionCompModel2.dispose();
    expandablePaymentExpandableController1.dispose();
    deliveryCompModels.dispose();
    expandableExpandableController2.dispose();
    expandablePaymentExpandableController2.dispose();
    expandableExpandableController3.dispose();
    reviewCompModels.dispose();
    expandableExpandableController4.dispose();
    bookingPolicyModel.dispose();
    expandableExpandableController5.dispose();
    awardCompModels.dispose();
    similarVendorCompModels.dispose();
  }
}
