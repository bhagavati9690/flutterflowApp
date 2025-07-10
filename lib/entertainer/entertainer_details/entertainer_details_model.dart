import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/read_only_chop_chips/read_only_chop_chips_widget.dart';
import '/compoents/detail_pagecomp/award_comp/award_comp_widget.dart';
import '/compoents/detail_pagecomp/booking_policy/booking_policy_widget.dart';
import '/compoents/detail_pagecomp/delivery_comp/delivery_comp_widget.dart';
import '/compoents/detail_pagecomp/review_comp/review_comp_widget.dart';
import '/compoents/detail_pagecomp/traval_comp/traval_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'entertainer_details_widget.dart' show EntertainerDetailsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class EntertainerDetailsModel
    extends FlutterFlowModel<EntertainerDetailsWidget> {
  ///  Local state fields for this page.

  bool isPageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (entertainerDetails)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerDetailOutput;
  // Stores action output result for [Backend Call - API (resourcePhoto)] action in EntertainerDetails widget.
  ApiCallResponse? rentalPhotoOutput;
  // Stores action output result for [Backend Call - API (entertainerItemSectionName)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerSectionNameOutput;
  // Stores action output result for [Backend Call - API (resourceDelivery)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerDelivery;
  // Stores action output result for [Backend Call - API (resourceopHours)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerOpsHourOutput;
  // Stores action output result for [Backend Call - API (resourcereview)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerReviewOutput;
  // Stores action output result for [Backend Call - API (resourceCancellationPolicy)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerCancllationPolicyOutput;
  // Stores action output result for [Backend Call - API (entertainerSimilarVendor)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerSimillarOutput;
  // Stores action output result for [Backend Call - API (resourceAward)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerAwardOutput;
  // Stores action output result for [Backend Call - API (resourceFAQ)] action in EntertainerDetails widget.
  ApiCallResponse? fAQapiResponce;
  // Stores action output result for [Backend Call - API (entertainerActivities)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerActivities;
  // Stores action output result for [Backend Call - API (entertainerTravalInfo)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerTravalInfo;
  // Stores action output result for [Backend Call - API (entertainerAddon)] action in EntertainerDetails widget.
  ApiCallResponse? entertainerAddON;
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
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // Model for readOnlyChopChips component.
  late ReadOnlyChopChipsModel readOnlyChopChipsModel1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // Model for readOnlyChopChips component.
  late ReadOnlyChopChipsModel readOnlyChopChipsModel2;
  // State field(s) for ExpandablePayment widget.
  late ExpandableController expandablePaymentExpandableController1;

  // Models for DeliveryComp dynamic component.
  late FlutterFlowDynamicModels<DeliveryCompModel> deliveryCompModels;
  // State field(s) for ExpandablePayment widget.
  late ExpandableController expandablePaymentExpandableController2;

  // Models for TravalComp dynamic component.
  late FlutterFlowDynamicModels<TravalCompModel> travalCompModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for ExpandablePayment widget.
  late ExpandableController expandablePaymentExpandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // Models for reviewComp dynamic component.
  late FlutterFlowDynamicModels<ReviewCompModel> reviewCompModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // Model for BookingPolicy component.
  late BookingPolicyModel bookingPolicyModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController7;

  // Models for awardComp dynamic component.
  late FlutterFlowDynamicModels<AwardCompModel> awardCompModels;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {
    descriptionCompModel1 = createModel(context, () => DescriptionCompModel());
    descriptionCompModel2 = createModel(context, () => DescriptionCompModel());
    readOnlyChopChipsModel1 =
        createModel(context, () => ReadOnlyChopChipsModel());
    readOnlyChopChipsModel2 =
        createModel(context, () => ReadOnlyChopChipsModel());
    deliveryCompModels = FlutterFlowDynamicModels(() => DeliveryCompModel());
    travalCompModels = FlutterFlowDynamicModels(() => TravalCompModel());
    reviewCompModels = FlutterFlowDynamicModels(() => ReviewCompModel());
    bookingPolicyModel = createModel(context, () => BookingPolicyModel());
    awardCompModels = FlutterFlowDynamicModels(() => AwardCompModel());
  }

  @override
  void dispose() {
    descriptionCompModel1.dispose();
    tabBarController?.dispose();
    expandableExpandableController1.dispose();
    descriptionCompModel2.dispose();
    expandableExpandableController2.dispose();
    readOnlyChopChipsModel1.dispose();
    expandableExpandableController3.dispose();
    readOnlyChopChipsModel2.dispose();
    expandablePaymentExpandableController1.dispose();
    deliveryCompModels.dispose();
    expandablePaymentExpandableController2.dispose();
    travalCompModels.dispose();
    expandableExpandableController4.dispose();
    expandablePaymentExpandableController3.dispose();
    expandableExpandableController5.dispose();
    reviewCompModels.dispose();
    expandableExpandableController6.dispose();
    bookingPolicyModel.dispose();
    expandableExpandableController7.dispose();
    awardCompModels.dispose();
  }
}
