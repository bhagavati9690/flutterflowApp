import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/read_only_chop_chips/read_only_chop_chips_widget.dart';
import '/compoents/detail_pagecomp/award_comp/award_comp_widget.dart';
import '/compoents/detail_pagecomp/booking_policy/booking_policy_widget.dart';
import '/compoents/detail_pagecomp/delivery_comp/delivery_comp_widget.dart';
import '/compoents/detail_pagecomp/review_comp/review_comp_widget.dart';
import '/compoents/detail_pagecomp/similar_vendor_comp/similar_vendor_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cake_details_widget.dart' show CakeDetailsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CakeDetailsModel extends FlutterFlowModel<CakeDetailsWidget> {
  ///  Local state fields for this page.

  bool isPageLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (CakeDetails)] action in CakeDetails widget.
  ApiCallResponse? cakeDetailOutput;
  // Stores action output result for [Backend Call - API (resourcePhoto)] action in CakeDetails widget.
  ApiCallResponse? cakePhotoOutput;
  // Stores action output result for [Backend Call - API (CakeItemSections)] action in CakeDetails widget.
  ApiCallResponse? cakeSectionNameOutput;
  // Stores action output result for [Backend Call - API (resourceDelivery)] action in CakeDetails widget.
  ApiCallResponse? cakeDelivery;
  // Stores action output result for [Backend Call - API (resourceopHours)] action in CakeDetails widget.
  ApiCallResponse? cakeOpsHourOutput;
  // Stores action output result for [Backend Call - API (resourcereview)] action in CakeDetails widget.
  ApiCallResponse? cakeReviewOutput;
  // Stores action output result for [Backend Call - API (resourceCancellationPolicy)] action in CakeDetails widget.
  ApiCallResponse? cakeCancllationPolicyOutput;
  // Stores action output result for [Backend Call - API (CakeSimilarVendor)] action in CakeDetails widget.
  ApiCallResponse? cakeSimillarOutput;
  // Stores action output result for [Backend Call - API (resourceAward)] action in CakeDetails widget.
  ApiCallResponse? cakeAwardOutput;
  // Stores action output result for [Backend Call - API (resourceFAQ)] action in CakeDetails widget.
  ApiCallResponse? cakeFAQapiResponce;
  // Stores action output result for [Backend Call - API (CakeFlavors)] action in CakeDetails widget.
  ApiCallResponse? cakeFlavors;
  // Stores action output result for [Backend Call - API (CakeFilling)] action in CakeDetails widget.
  ApiCallResponse? cakeFilling;
  // Stores action output result for [Backend Call - API (cakeShapes)] action in CakeDetails widget.
  ApiCallResponse? cakeShape;
  // Stores action output result for [Backend Call - API (cakeSizes)] action in CakeDetails widget.
  ApiCallResponse? cakeSizes;
  // Stores action output result for [Backend Call - API (cakeColors)] action in CakeDetails widget.
  ApiCallResponse? cakeColors;
  // Stores action output result for [Backend Call - API (cakeIcing)] action in CakeDetails widget.
  ApiCallResponse? cakeIcing;
  // Stores action output result for [Backend Call - API (bakeryMenuSections)] action in CakeDetails widget.
  ApiCallResponse? cakeCustomSection;
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
  // Stores action output result for [Backend Call - API (customizeAction)] action in Button widget.
  ApiCallResponse? customizeAction;
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
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // Model for readOnlyChopChips component.
  late ReadOnlyChopChipsModel readOnlyChopChipsModel3;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // Model for readOnlyChopChips component.
  late ReadOnlyChopChipsModel readOnlyChopChipsModel4;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // Model for readOnlyChopChips component.
  late ReadOnlyChopChipsModel readOnlyChopChipsModel5;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController7;

  // Model for readOnlyChopChips component.
  late ReadOnlyChopChipsModel readOnlyChopChipsModel6;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController8;

  // Model for readOnlyChopChips component.
  late ReadOnlyChopChipsModel readOnlyChopChipsModel7;
  // State field(s) for ExpandablePayment widget.
  late ExpandableController expandablePaymentExpandableController1;

  // Models for DeliveryComp dynamic component.
  late FlutterFlowDynamicModels<DeliveryCompModel> deliveryCompModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController9;

  // State field(s) for ExpandablePayment widget.
  late ExpandableController expandablePaymentExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController10;

  // Models for reviewComp dynamic component.
  late FlutterFlowDynamicModels<ReviewCompModel> reviewCompModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController11;

  // Model for BookingPolicy component.
  late BookingPolicyModel bookingPolicyModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Models for similarVendorComp dynamic component.
  late FlutterFlowDynamicModels<SimilarVendorCompModel> similarVendorCompModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController12;

  // Models for awardComp dynamic component.
  late FlutterFlowDynamicModels<AwardCompModel> awardCompModels;

  @override
  void initState(BuildContext context) {
    descriptionCompModel1 = createModel(context, () => DescriptionCompModel());
    descriptionCompModel2 = createModel(context, () => DescriptionCompModel());
    readOnlyChopChipsModel1 =
        createModel(context, () => ReadOnlyChopChipsModel());
    readOnlyChopChipsModel2 =
        createModel(context, () => ReadOnlyChopChipsModel());
    readOnlyChopChipsModel3 =
        createModel(context, () => ReadOnlyChopChipsModel());
    readOnlyChopChipsModel4 =
        createModel(context, () => ReadOnlyChopChipsModel());
    readOnlyChopChipsModel5 =
        createModel(context, () => ReadOnlyChopChipsModel());
    readOnlyChopChipsModel6 =
        createModel(context, () => ReadOnlyChopChipsModel());
    readOnlyChopChipsModel7 =
        createModel(context, () => ReadOnlyChopChipsModel());
    deliveryCompModels = FlutterFlowDynamicModels(() => DeliveryCompModel());
    reviewCompModels = FlutterFlowDynamicModels(() => ReviewCompModel());
    bookingPolicyModel = createModel(context, () => BookingPolicyModel());
    similarVendorCompModels =
        FlutterFlowDynamicModels(() => SimilarVendorCompModel());
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
    expandableExpandableController4.dispose();
    readOnlyChopChipsModel3.dispose();
    expandableExpandableController5.dispose();
    readOnlyChopChipsModel4.dispose();
    expandableExpandableController6.dispose();
    readOnlyChopChipsModel5.dispose();
    expandableExpandableController7.dispose();
    readOnlyChopChipsModel6.dispose();
    expandableExpandableController8.dispose();
    readOnlyChopChipsModel7.dispose();
    expandablePaymentExpandableController1.dispose();
    deliveryCompModels.dispose();
    expandableExpandableController9.dispose();
    expandablePaymentExpandableController2.dispose();
    expandableExpandableController10.dispose();
    reviewCompModels.dispose();
    expandableExpandableController11.dispose();
    bookingPolicyModel.dispose();
    similarVendorCompModels.dispose();
    expandableExpandableController12.dispose();
    awardCompModels.dispose();
  }
}
