import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/detail_pagecomp/award_comp/award_comp_widget.dart';
import '/compoents/detail_pagecomp/booking_policy/booking_policy_widget.dart';
import '/compoents/detail_pagecomp/delivery_comp/delivery_comp_widget.dart';
import '/compoents/detail_pagecomp/document_comp/document_comp_widget.dart';
import '/compoents/detail_pagecomp/hour_comp_detail_page/hour_comp_detail_page_widget.dart';
import '/compoents/detail_pagecomp/review_comp/review_comp_widget.dart';
import '/compoents/detail_pagecomp/similar_vendor_comp/similar_vendor_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'venue_details_widget.dart' show VenueDetailsWidget;
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class VenueDetailsModel extends FlutterFlowModel<VenueDetailsWidget> {
  ///  Local state fields for this page.

  bool isVenueLike = true;

  bool isPageLoaded = false;

  String? resourceId;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (venueDetails)] action in VenueDetails widget.
  ApiCallResponse? apiResultVenueDetailsResult;
  // Stores action output result for [Backend Call - API (resourcePhoto)] action in VenueDetails widget.
  ApiCallResponse? photoOutput;
  // Stores action output result for [Backend Call - API (resourceVideo)] action in VenueDetails widget.
  ApiCallResponse? resourceVideo;
  // Stores action output result for [Backend Call - API (resourceDelivery)] action in VenueDetails widget.
  ApiCallResponse? deliveryOutput;
  // Stores action output result for [Backend Call - API (resourceopHours)] action in VenueDetails widget.
  ApiCallResponse? opsHourOutput;
  // Stores action output result for [Backend Call - API (resourcereview)] action in VenueDetails widget.
  ApiCallResponse? reviewOutput;
  // Stores action output result for [Backend Call - API (resourceCancellationPolicy)] action in VenueDetails widget.
  ApiCallResponse? cancllationPolicyOutput;
  // Stores action output result for [Backend Call - API (venueSimilar)] action in VenueDetails widget.
  ApiCallResponse? simillarVendorOutput;
  // Stores action output result for [Backend Call - API (resourceAward)] action in VenueDetails widget.
  ApiCallResponse? awardOutput;
  // Stores action output result for [Backend Call - API (resourceFAQ)] action in VenueDetails widget.
  ApiCallResponse? fAQapiResponce;
  // Stores action output result for [Backend Call - API (venueDocumentList)] action in VenueDetails widget.
  ApiCallResponse? venueDocumentOutput;
  // Stores action output result for [Backend Call - API (venuePackage)] action in VenueDetails widget.
  ApiCallResponse? venuePackageOutput;
  // Stores action output result for [Backend Call - API (venueHallAndRooms)] action in VenueDetails widget.
  ApiCallResponse? venueHallOutput;
  // Stores action output result for [Backend Call - API (venueAnemities)] action in VenueDetails widget.
  ApiCallResponse? venueAnnimattiesOutput;
  // State field(s) for VendorsDetails widget.
  ScrollController? vendorsDetails;
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
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? vendorUserResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatRecord>? chatResponse2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatRecord? newChatReponse2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for PackageListView widget.
  ScrollController? packageListView;
  // State field(s) for HallListView widget.
  ScrollController? hallListView;
  // State field(s) for ExpandablePayment widget.
  late ExpandableController expandablePaymentExpandableController1;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for HourListView widget.
  ScrollController? hourListView;
  // Models for hourCompDetailPage dynamic component.
  late FlutterFlowDynamicModels<HourCompDetailPageModel>
      hourCompDetailPageModels1;
  // State field(s) for HourCelbrationListView widget.
  ScrollController? hourCelbrationListView;
  // Models for hourCompDetailPage dynamic component.
  late FlutterFlowDynamicModels<HourCompDetailPageModel>
      hourCompDetailPageModels2;
  // State field(s) for ExpandablePayment widget.
  late ExpandableController expandablePaymentExpandableController2;

  // State field(s) for ExpandablePayment widget.
  late ExpandableController expandablePaymentExpandableController3;

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Models for DeliveryComp dynamic component.
  late FlutterFlowDynamicModels<DeliveryCompModel> deliveryCompModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for ReviewListView widget.
  ScrollController? reviewListView;
  // Models for reviewComp dynamic component.
  late FlutterFlowDynamicModels<ReviewCompModel> reviewCompModels;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // Model for BookingPolicy component.
  late BookingPolicyModel bookingPolicyModel;
  // Model for documentComp component.
  late DocumentCompModel documentCompModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // Models for awardComp dynamic component.
  late FlutterFlowDynamicModels<AwardCompModel> awardCompModels;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Models for similarVendorComp dynamic component.
  late FlutterFlowDynamicModels<SimilarVendorCompModel> similarVendorCompModels;

  @override
  void initState(BuildContext context) {
    vendorsDetails = ScrollController();
    descriptionCompModel1 = createModel(context, () => DescriptionCompModel());
    descriptionCompModel2 = createModel(context, () => DescriptionCompModel());
    packageListView = ScrollController();
    hallListView = ScrollController();
    hourListView = ScrollController();
    hourCompDetailPageModels1 =
        FlutterFlowDynamicModels(() => HourCompDetailPageModel());
    hourCelbrationListView = ScrollController();
    hourCompDetailPageModels2 =
        FlutterFlowDynamicModels(() => HourCompDetailPageModel());
    listViewController = ScrollController();
    deliveryCompModels = FlutterFlowDynamicModels(() => DeliveryCompModel());
    reviewListView = ScrollController();
    reviewCompModels = FlutterFlowDynamicModels(() => ReviewCompModel());
    bookingPolicyModel = createModel(context, () => BookingPolicyModel());
    documentCompModel = createModel(context, () => DocumentCompModel());
    awardCompModels = FlutterFlowDynamicModels(() => AwardCompModel());
    similarVendorCompModels =
        FlutterFlowDynamicModels(() => SimilarVendorCompModel());
  }

  @override
  void dispose() {
    vendorsDetails?.dispose();
    descriptionCompModel1.dispose();
    tabBarController?.dispose();
    expandableExpandableController1.dispose();
    descriptionCompModel2.dispose();
    expandableExpandableController2.dispose();
    packageListView?.dispose();
    hallListView?.dispose();
    expandablePaymentExpandableController1.dispose();
    expandableExpandableController3.dispose();
    hourListView?.dispose();
    hourCompDetailPageModels1.dispose();
    hourCelbrationListView?.dispose();
    hourCompDetailPageModels2.dispose();
    expandablePaymentExpandableController2.dispose();
    expandablePaymentExpandableController3.dispose();
    listViewController?.dispose();
    deliveryCompModels.dispose();
    expandableExpandableController4.dispose();
    reviewListView?.dispose();
    reviewCompModels.dispose();
    expandableExpandableController5.dispose();
    bookingPolicyModel.dispose();
    documentCompModel.dispose();
    expandableExpandableController6.dispose();
    awardCompModels.dispose();
    similarVendorCompModels.dispose();
  }
}
