import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/email_comp/email_comp_widget.dart';
import '/compoents/detail_pagecomp/award_comp/award_comp_widget.dart';
import '/compoents/detail_pagecomp/booking_policy/booking_policy_widget.dart';
import '/compoents/detail_pagecomp/delivery_comp/delivery_comp_widget.dart';
import '/compoents/detail_pagecomp/document_comp/document_comp_widget.dart';
import '/compoents/detail_pagecomp/faq/faq_widget.dart';
import '/compoents/detail_pagecomp/hour_comp_detail_page/hour_comp_detail_page_widget.dart';
import '/compoents/detail_pagecomp/review_comp/review_comp_widget.dart';
import '/compoents/detail_pagecomp/similar_vendor_comp/similar_vendor_comp_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'venue_details_model.dart';
export 'venue_details_model.dart';

class VenueDetailsWidget extends StatefulWidget {
  const VenueDetailsWidget({
    super.key,
    required this.venueId,
  });

  final int? venueId;

  static String routeName = 'VenueDetails';
  static String routePath = 'venueDetails';

  @override
  State<VenueDetailsWidget> createState() => _VenueDetailsWidgetState();
}

class _VenueDetailsWidgetState extends State<VenueDetailsWidget>
    with TickerProviderStateMixin {
  late VenueDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultVenueDetailsResult =
          await VenuesGroup.venueDetailsCall.call(
        venueId: widget.venueId,
      );

      if ((_model.apiResultVenueDetailsResult?.succeeded ?? true)) {
        await Future.wait([
          Future(() async {
            _model.photoOutput =
                await ResourceLevalGroup.resourcePhotoCall.call(
              clientState:
                  '{\"clientId\":\"viewVenueDetail__photoViewer\",\"cursor\":{\"parentRecordKey\":\"${VenuesGroup.venueDetailsCall.resourceId(
                (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
              )}\"},\"selection\":[0]}',
            );
          }),
          Future(() async {
            _model.resourceVideo =
                await ResourceLevalGroup.resourceVideoCall.call(
              query:
                  '{\"clientId\":\"viewVenueDetail__resourceOverviewVideoCursor\",\"cursor\":{\"parentRecordKey\":\"${VenuesGroup.venueDetailsCall.resourceId(
                (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
              )}\"}}',
            );
          }),
          Future(() async {
            _model.deliveryOutput =
                await ResourceLevalGroup.resourceDeliveryCall.call(
              clientState:
                  '{\"clientId\":\"viewVenueDetail__resourceDeliveryUIGrid\",\"cursor\":{\"parentRecordKey\":\"${VenuesGroup.venueDetailsCall.resourceId(
                (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.opsHourOutput =
                await ResourceLevalGroup.resourceopHoursCall.call(
              clientState:
                  '{\"clientId\":\"viewVenueDetail__hoursGrid\",\"cursor\":{\"parentRecordKey\":\"${VenuesGroup.venueDetailsCall.resourceId(
                (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.reviewOutput =
                await ResourceLevalGroup.resourcereviewCall.call(
              query:
                  '{\"clientId\":\"viewVenueDetail__resourceReviewGrid\",\"cursor\":{\"parentRecordKey\":\"${VenuesGroup.venueDetailsCall.resourceId(
                (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cancllationPolicyOutput =
                await ResourceLevalGroup.resourceCancellationPolicyCall.call(
              clientState:
                  '{\"clientId\":\"viewVenueDetail__ResourceCancellationPolicyUI\",\"cursor\":{\"parentRecordKey\":\"${VenuesGroup.venueDetailsCall.resourceId(
                (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.simillarVendorOutput =
                await VenuesGroup.venueSimilarCall.call(
              clientState:
                  '{\"clientId\":\"viewVenueDetail__similarVenuesGrid\",\"cursor\":{\"dist\":\"${functions.distanceSelectionConverter(FFAppState().distance)}\",\"parentRecordKey\":\"${widget.venueId?.toString()}\"},\"selection\":[],\"currentPage\":1}',
              token: FFAppState().SessionToken,
            );
          }),
          Future(() async {
            _model.awardOutput =
                await ResourceLevalGroup.resourceAwardCall.call(
              clientState:
                  '{\"clientId\":\"viewVenueDetail__resourceAwardUIGrid\",\"cursor\":{\"parentRecordKey\":\"${VenuesGroup.venueDetailsCall.resourceId(
                (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.fAQapiResponce =
                await ResourceLevalGroup.resourceFAQCall.call(
              clientState:
                  '{\"clientId\":\"viewVenueDetail__resourceFaqUIGrid\",\"cursor\":{\"parentRecordKey\":\"${VenuesGroup.venueDetailsCall.resourceId(
                (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.venueDocumentOutput =
                await VenuesGroup.venueDocumentListCall.call(
              clientState:
                  '{\"clientId\":\"viewVenueDetail__ResourceDocsLinksGrid\",\"cursor\":{\"parentRecordKey\":\"${widget.venueId?.toString()}\"}}',
            );
          }),
          Future(() async {
            _model.venuePackageOutput = await VenuesGroup.venuePackageCall.call(
              query:
                  '{\"clientId\":\"viewVenueDetail__venuePackagesGrid\",\"cursor\":{\"parentRecordKey\":\"${widget.venueId?.toString()}\"}}',
            );
          }),
          Future(() async {
            _model.venueHallOutput =
                await VenuesGroup.venueHallAndRoomsCall.call(
              query:
                  '{\"clientId\":\"viewVenueDetail__venueSpacesGrid\",\"cursor\":{\"parentRecordKey\":\"${widget.venueId?.toString()}\"}}',
            );
          }),
          Future(() async {
            _model.venueAnnimattiesOutput =
                await VenuesGroup.venueAnemitiesCall.call(
              query:
                  '{\"clientId\":\"viewVenueDetail__ListOfValuesInNColumnsUIComponentInGridspaceAmenitiesGridsCursor\",\"cursor\":{\"parentRecordKey\":\"${widget.venueId?.toString()}\"}}',
            );
          }),
        ]);
        _model.isPageLoaded = true;
        safeSetState(() {});
      } else {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: CustomErrorrAltertBoxWidget(),
                ),
              ),
            );
          },
        );
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: true);
    _model.expandablePaymentExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandablePaymentExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandablePaymentExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController6 =
        ExpandableController(initialExpanded: true);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          body: Visibility(
            visible: _model.isPageLoaded,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).lemonLime,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        VenuesGroup.venueDetailsCall.name(
                                          (_model.apiResultVenueDetailsResult
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        'Name',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleLargeIsCustom,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        VenuesGroup.venueDetailsCall.venueType(
                                          (_model.apiResultVenueDetailsResult
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        'venueType',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 6.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        controller: _model.vendorsDetails,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (valueOrDefault<String>(
                                            VenuesGroup.venueDetailsCall
                                                .partyPlace(
                                              (_model.apiResultVenueDetailsResult
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            'Party Place Type',
                                          ) !=
                                          '')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              VenuesGroup.venueDetailsCall
                                                  .partyPlace(
                                                (_model.apiResultVenueDetailsResult
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              'partyPlace',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'SF Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  VenuesGroup.venueDetailsCall
                                                      .price(
                                                    (_model.apiResultVenueDetailsResult
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  'Price on request',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'SF Pro',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 6.0)),
                                        ),
                                      ),
                                      Flexible(
                                        child: RatingBar.builder(
                                          onRatingUpdate: (newValue) =>
                                              safeSetState(() => _model
                                                  .ratingBarValue = newValue),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          direction: Axis.horizontal,
                                          initialRating: _model
                                                  .ratingBarValue ??=
                                              functions
                                                  .stringToIntegerConversion(
                                                      valueOrDefault<String>(
                                            VenuesGroup.venueDetailsCall.rank(
                                              (_model.apiResultVenueDetailsResult
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            '0',
                                          ))!,
                                          unratedColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          itemCount: 5,
                                          itemSize: 24.0,
                                          glowColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (functions.isHtmlDataValid(VenuesGroup
                                          .venueDetailsCall
                                          .description(
                                        (_model.apiResultVenueDetailsResult
                                                ?.jsonBody ??
                                            ''),
                                      )) ??
                                      true)
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        wrapWithModel(
                                          model: _model.descriptionCompModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DescriptionCompWidget(
                                            input: valueOrDefault<String>(
                                              VenuesGroup.venueDetailsCall
                                                  .description(
                                                (_model.apiResultVenueDetailsResult
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              'Description',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ].divide(SizedBox(height: 6.0)),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.33,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: TabBar(
                                          labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLargeIsCustom,
                                              ),
                                          unselectedLabelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeIsCustom,
                                                  ),
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          tabs: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.insert_photo,
                                                  size: 22.0,
                                                ),
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'tz07g3fc' /* Photo */,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.video_camera_back,
                                                ),
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ou3iysdx' /* Video */,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.location_pin,
                                                ),
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '5rpx7iu5' /* Map */,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                          controller: _model.tabBarController,
                                          onTap: (i) async {
                                            [
                                              () async {},
                                              () async {},
                                              () async {}
                                            ][i]();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          controller: _model.tabBarController,
                                          children: [
                                            Stack(
                                              children: [
                                                if ((_model.photoOutput
                                                        ?.succeeded ??
                                                    true))
                                                  Builder(
                                                    builder: (context) {
                                                      final imagePath =
                                                          ResourceLevalGroup
                                                                  .resourcePhotoCall
                                                                  .imageUrl(
                                                                    (_model.photoOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                  ?.toList() ??
                                                              [];
                                                      if (imagePath.isEmpty) {
                                                        return Center(
                                                          child: Image.asset(
                                                            'assets/images/images_(1).png',
                                                          ),
                                                        );
                                                      }

                                                      return Container(
                                                        width: double.infinity,
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          17.0),
                                                              child: PageView
                                                                  .builder(
                                                                controller: _model
                                                                        .pageViewController1 ??=
                                                                    PageController(
                                                                        initialPage: max(
                                                                            0,
                                                                            min(0,
                                                                                imagePath.length - 1))),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    imagePath
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        imagePathIndex) {
                                                                  final imagePathItem =
                                                                      imagePath[
                                                                          imagePathIndex];
                                                                  return Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: Image
                                                                          .network(
                                                                        imagePathItem,
                                                                        width: double
                                                                            .infinity,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.png',
                                                                          width:
                                                                              double.infinity,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: smooth_page_indicator
                                                                  .SmoothPageIndicator(
                                                                controller: _model
                                                                        .pageViewController1 ??=
                                                                    PageController(
                                                                        initialPage: max(
                                                                            0,
                                                                            min(0,
                                                                                imagePath.length - 1))),
                                                                count: imagePath
                                                                    .length,
                                                                axisDirection: Axis
                                                                    .horizontal,
                                                                onDotClicked:
                                                                    (i) async {
                                                                  await _model
                                                                      .pageViewController1!
                                                                      .animateToPage(
                                                                    i,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            500),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                effect: smooth_page_indicator
                                                                    .ExpandingDotsEffect(
                                                                  expansionFactor:
                                                                      3.0,
                                                                  spacing: 8.0,
                                                                  radius: 16.0,
                                                                  dotWidth:
                                                                      16.0,
                                                                  dotHeight:
                                                                      8.0,
                                                                  dotColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  activeDotColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  paintStyle:
                                                                      PaintingStyle
                                                                          .fill,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                if (!(_model.photoOutput
                                                        ?.succeeded ??
                                                    true))
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Adobe_Express_-_file.png',
                                                      width: double.infinity,
                                                      height: 200.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((_model.resourceVideo
                                                        ?.succeeded ??
                                                    true))
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final videoPath =
                                                            ResourceLevalGroup
                                                                    .resourceVideoCall
                                                                    .url(
                                                                      (_model.resourceVideo
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                    ?.toList() ??
                                                                [];
                                                        if (videoPath.isEmpty) {
                                                          return Center(
                                                            child: Image.asset(
                                                              'assets/images/download.jpeg',
                                                            ),
                                                          );
                                                        }

                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          child: Stack(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            17.0),
                                                                child: PageView
                                                                    .builder(
                                                                  controller: _model
                                                                          .pageViewController2 ??=
                                                                      PageController(
                                                                          initialPage: max(
                                                                              0,
                                                                              min(0, videoPath.length - 1))),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  itemCount:
                                                                      videoPath
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          videoPathIndex) {
                                                                    final videoPathItem =
                                                                        videoPath[
                                                                            videoPathIndex];
                                                                    return FlutterFlowYoutubePlayer(
                                                                      url: valueOrDefault<
                                                                          String>(
                                                                        videoPathItem,
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/celebratix-u9fafm/assets/sq8t3b082h92/Add_a_subheading.mp4',
                                                                      ),
                                                                      autoPlay:
                                                                          false,
                                                                      looping:
                                                                          true,
                                                                      mute:
                                                                          false,
                                                                      showControls:
                                                                          true,
                                                                      showFullScreen:
                                                                          false,
                                                                      strictRelatedVideos:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: smooth_page_indicator
                                                                    .SmoothPageIndicator(
                                                                  controller: _model
                                                                          .pageViewController2 ??=
                                                                      PageController(
                                                                          initialPage: max(
                                                                              0,
                                                                              min(0, videoPath.length - 1))),
                                                                  count: videoPath
                                                                      .length,
                                                                  axisDirection:
                                                                      Axis.horizontal,
                                                                  onDotClicked:
                                                                      (i) async {
                                                                    await _model
                                                                        .pageViewController2!
                                                                        .animateToPage(
                                                                      i,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              500),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  effect: smooth_page_indicator
                                                                      .ExpandingDotsEffect(
                                                                    expansionFactor:
                                                                        3.0,
                                                                    spacing:
                                                                        8.0,
                                                                    radius:
                                                                        16.0,
                                                                    dotWidth:
                                                                        16.0,
                                                                    dotHeight:
                                                                        8.0,
                                                                    dotColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                    activeDotColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    paintStyle:
                                                                        PaintingStyle
                                                                            .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if (!(_model.resourceVideo
                                                        ?.succeeded ??
                                                    true))
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Adobe_Express_-_file.png',
                                                      width: double.infinity,
                                                      height: 200.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: custom_widgets
                                                  .SingleMapWidget(
                                                width: double.infinity,
                                                height: double.infinity,
                                                startingZoom: 15.0,
                                                markerData: functions
                                                    .singlemapLoadInformation(
                                                        VenuesGroup
                                                            .venueDetailsCall
                                                            .details(
                                                              (_model.apiResultVenueDetailsResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            ?.firstOrNull),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (() {
                              if (VenuesGroup.venueDetailsCall.packageCount(
                                    (_model.apiResultVenueDetailsResult
                                            ?.jsonBody ??
                                        ''),
                                  ) !=
                                  '0') {
                                return false;
                              } else if (VenuesGroup.venueDetailsCall
                                      .spaceCount(
                                    (_model.apiResultVenueDetailsResult
                                            ?.jsonBody ??
                                        ''),
                                  ) !=
                                  '0') {
                                return false;
                              } else {
                                return true;
                              }
                            }())
                              Container(
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (FFAppState().IsLoggedInUser) {
                                            context.pushNamed(
                                              EventInfoForShoppingCartWidget
                                                  .routeName,
                                              queryParameters: {
                                                'recordKey': serializeParam(
                                                  widget.venueId?.toString(),
                                                  ParamType.String,
                                                ),
                                                'type': serializeParam(
                                                  '0',
                                                  ParamType.String,
                                                ),
                                                'nextUI': serializeParam(
                                                  'checkoutGreetingUI',
                                                  ParamType.String,
                                                ),
                                                'from': serializeParam(
                                                  'venue',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            context.pushNamed(
                                              AnonymousInfoForShoppingCartWidget
                                                  .routeName,
                                              queryParameters: {
                                                'recordKey': serializeParam(
                                                  widget.venueId?.toString(),
                                                  ParamType.String,
                                                ),
                                                'type': serializeParam(
                                                  '0',
                                                  ParamType.String,
                                                ),
                                                'nextUI': serializeParam(
                                                  'checkoutGreetingUI',
                                                  ParamType.String,
                                                ),
                                                'denominatorId': serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                                'from': serializeParam(
                                                  'venue',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '4fj1qov3' /* Inquiry to Book */,
                                        ),
                                        icon: Icon(
                                          Icons.question_answer,
                                          size: 16.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.53,
                                          height: 41.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if ((FFAppState().currentUserId != null) &&
                                (VenuesGroup.venueDetailsCall.mobileUserEmail(
                                      (_model.apiResultVenueDetailsResult
                                              ?.jsonBody ??
                                          ''),
                                    ) !=
                                    ''))
                              Container(
                                decoration: BoxDecoration(),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if ((FFAppState().currentUserId != null) &&
                                      (VenuesGroup.venueDetailsCall
                                              .mobileUserEmail(
                                            (_model.apiResultVenueDetailsResult
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.vendorUserResponse =
                                                await queryUsersRecordOnce(
                                              queryBuilder: (usersRecord) =>
                                                  usersRecord.where(
                                                'email',
                                                isEqualTo: VenuesGroup
                                                    .venueDetailsCall
                                                    .mobileUserEmail(
                                                  (_model.apiResultVenueDetailsResult
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _model.chatResponse2 =
                                                await queryChatRecordOnce(
                                              queryBuilder: (chatRecord) =>
                                                  chatRecord.whereArrayContainsAny(
                                                      'userIds',
                                                      functions.generateListOfUsers(
                                                          FFAppState()
                                                              .currentUserId!,
                                                          _model
                                                              .vendorUserResponse!
                                                              .reference)),
                                            );
                                            if (functions.matchExactForFireBase(
                                                    _model.chatResponse2!
                                                        .toList(),
                                                    FFAppState().currentUserId!,
                                                    _model.vendorUserResponse!
                                                        .reference) !=
                                                null) {
                                              context.pushNamed(
                                                ChatDetailWidget.routeName,
                                                queryParameters: {
                                                  'receivedChat':
                                                      serializeParam(
                                                    functions
                                                        .matchExactForFireBase(
                                                            _model
                                                                .chatResponse2!
                                                                .toList(),
                                                            FFAppState()
                                                                .currentUserId!,
                                                            _model
                                                                .vendorUserResponse!
                                                                .reference)
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              var chatRecordReference =
                                                  ChatRecord.collection.doc();
                                              await chatRecordReference.set({
                                                ...createChatRecordData(
                                                  lastMessage: ' ',
                                                  timeStamp:
                                                      getCurrentTimestamp,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'userIds': functions
                                                        .generateListOfUsers(
                                                            FFAppState()
                                                                .currentUserId!,
                                                            _model
                                                                .vendorUserResponse!
                                                                .reference),
                                                    'userNames': functions
                                                        .generateListOfNames(
                                                            FFAppState()
                                                                .currentUser
                                                                .displayName,
                                                            _model
                                                                .vendorUserResponse!
                                                                .displayName),
                                                    'lastMessageSeenBy': [
                                                      FFAppState().currentUserId
                                                    ],
                                                  },
                                                ),
                                              });
                                              _model.newChatReponse2 =
                                                  ChatRecord
                                                      .getDocumentFromData({
                                                ...createChatRecordData(
                                                  lastMessage: ' ',
                                                  timeStamp:
                                                      getCurrentTimestamp,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'userIds': functions
                                                        .generateListOfUsers(
                                                            FFAppState()
                                                                .currentUserId!,
                                                            _model
                                                                .vendorUserResponse!
                                                                .reference),
                                                    'userNames': functions
                                                        .generateListOfNames(
                                                            FFAppState()
                                                                .currentUser
                                                                .displayName,
                                                            _model
                                                                .vendorUserResponse!
                                                                .displayName),
                                                    'lastMessageSeenBy': [
                                                      FFAppState().currentUserId
                                                    ],
                                                  },
                                                ),
                                              }, chatRecordReference);

                                              context.pushNamed(
                                                ChatDetailWidget.routeName,
                                                queryParameters: {
                                                  'receivedChat':
                                                      serializeParam(
                                                    _model.newChatReponse2
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ri2t8769' /* Start a conversation */,
                                          ),
                                          icon: Icon(
                                            Icons.chat,
                                            size: 16.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.53,
                                            height: 41.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Builder(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                await showDialog(
                                                  barrierColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.9,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            child:
                                                                EmailCompWidget(
                                                              to: VenuesGroup
                                                                  .venueDetailsCall
                                                                  .email(
                                                                (_model.apiResultVenueDetailsResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'g6bet4uk' /* Email */,
                                              ),
                                              icon: Icon(
                                                Icons.email,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.05,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await launchUrl(Uri(
                                                scheme: 'tel',
                                                path: VenuesGroup
                                                    .venueDetailsCall
                                                    .phoneNo(
                                                  (_model.apiResultVenueDetailsResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                              ));
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'd6zbo7m7' /* Call */,
                                            ),
                                            icon: Icon(
                                              Icons.call,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.05,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily,
                                                    letterSpacing: 0.0,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeIsCustom,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await launchURL(VenuesGroup
                                                  .venueDetailsCall
                                                  .website(
                                                (_model.apiResultVenueDetailsResult
                                                        ?.jsonBody ??
                                                    ''),
                                              )!);
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'wld6se15' /* Website */,
                                            ),
                                            icon: Icon(
                                              Icons.language,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.05,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconAlignment:
                                                  IconAlignment.start,
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily,
                                                    letterSpacing: 0.0,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeIsCustom,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 14.0)),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Visibility(
                                      visible: valueOrDefault<String>(
                                                VenuesGroup.venueDetailsCall
                                                    .address(
                                                  (_model.apiResultVenueDetailsResult
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'Address',
                                              ) !=
                                              '',
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 5.0, 0.0, 5.0),
                                            child: Icon(
                                              Icons.place,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 5.0, 5.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  VenuesGroup.venueDetailsCall
                                                      .address(
                                                    (_model.apiResultVenueDetailsResult
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  'Address',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 2.0))
                                            .around(SizedBox(width: 2.0)),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (() {
                                  if (functions.isHtmlDataValid(VenuesGroup
                                      .venueDetailsCall
                                      .longDescription(
                                    (_model.apiResultVenueDetailsResult
                                            ?.jsonBody ??
                                        ''),
                                  ))!) {
                                    return true;
                                  } else if (valueOrDefault<String>(
                                            VenuesGroup.venueDetailsCall
                                                .availableDay(
                                              (_model.apiResultVenueDetailsResult
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            'All Days',
                                          ) !=
                                          '') {
                                    return true;
                                  } else if (valueOrDefault<String>(
                                            VenuesGroup.venueDetailsCall
                                                .categories(
                                              (_model.apiResultVenueDetailsResult
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            'Category',
                                          ) !=
                                          '') {
                                    return true;
                                  } else if (functions
                                      .checkJsonValue(getJsonField(
                                    (_model.apiResultVenueDetailsResult
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.details[:]['accomodates']''',
                                  ))) {
                                    return true;
                                  } else if (valueOrDefault<String>(
                                            VenuesGroup.venueDetailsCall.gender(
                                              (_model.apiResultVenueDetailsResult
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            ' All',
                                          ) !=
                                          '') {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }())
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        width: double.infinity,
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller: _model
                                              .expandableExpandableController1,
                                          child: ExpandablePanel(
                                            header: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                    child: Icon(
                                                      Icons.description_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'jyncwfhp' /* About this Venue */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            collapsed: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                ),
                                              ].divide(SizedBox(height: 3.0)),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (functions.isHtmlDataValid(
                                                        VenuesGroup
                                                            .venueDetailsCall
                                                            .longDescription(
                                                      (_model.apiResultVenueDetailsResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )) ??
                                                    true)
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tabletLandscape:
                                                              false,
                                                        ))
                                                          MarkdownBody(
                                                            data: functions
                                                                .convertDescriptionToMarkdown(
                                                                    getJsonField(
                                                              (_model.apiResultVenueDetailsResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
                                                            )),
                                                            selectable: false,
                                                            onTapLink: (_, url,
                                                                    __) =>
                                                                launchURL(url!),
                                                          ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          wrapWithModel(
                                                            model: _model
                                                                .descriptionCompModel2,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                DescriptionCompWidget(
                                                              input:
                                                                  getJsonField(
                                                                (_model.apiResultVenueDetailsResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                if (valueOrDefault<String>(
                                                          VenuesGroup
                                                              .venueDetailsCall
                                                              .availableDay(
                                                            (_model.apiResultVenueDetailsResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          'All Days',
                                                        ) !=
                                                        '')
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      if (valueOrDefault<
                                                                  String>(
                                                                VenuesGroup
                                                                    .venueDetailsCall
                                                                    .availableDay(
                                                                  (_model.apiResultVenueDetailsResult
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                'All Days',
                                                              ) !=
                                                              '')
                                                        Flexible(
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'h8952zzu' /* Available On :  */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    VenuesGroup
                                                                        .venueDetailsCall
                                                                        .availableDay(
                                                                      (_model.apiResultVenueDetailsResult
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    'All Days',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 6.0)),
                                                  ),
                                                if (valueOrDefault<String>(
                                                          VenuesGroup
                                                              .venueDetailsCall
                                                              .categories(
                                                            (_model.apiResultVenueDetailsResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          'Category',
                                                        ) !=
                                                        '')
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '8lgz6rw0' /* Category :  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            VenuesGroup
                                                                .venueDetailsCall
                                                                .categories(
                                                              (_model.apiResultVenueDetailsResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            'Category',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                if ((valueOrDefault<String>(
                                                              VenuesGroup
                                                                  .venueDetailsCall
                                                                  .activityType(
                                                                (_model.apiResultVenueDetailsResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              'Party Place',
                                                            ) !=
                                                            '') ||
                                                    (valueOrDefault<String>(
                                                              VenuesGroup
                                                                  .venueDetailsCall
                                                                  .activityCategories(
                                                                (_model.apiResultVenueDetailsResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              'Party Place',
                                                            ) !=
                                                            ''))
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '2kgcxe1b' /* Activities :  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              '${valueOrDefault<String>(
                                                            VenuesGroup
                                                                .venueDetailsCall
                                                                .activityType(
                                                              (_model.apiResultVenueDetailsResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            'Party Place',
                                                          )} ${valueOrDefault<String>(
                                                            VenuesGroup
                                                                .venueDetailsCall
                                                                .activityCategories(
                                                              (_model.apiResultVenueDetailsResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            'Activity Category',
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                if (functions.checkJsonValue(
                                                    getJsonField(
                                                  (_model.apiResultVenueDetailsResult
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.details[:]['accomodates']''',
                                                )))
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            't4bgy6lj' /* Accomodates   */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            VenuesGroup
                                                                .venueDetailsCall
                                                                .accomodates(
                                                              (_model.apiResultVenueDetailsResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            '_ People',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                if (valueOrDefault<String>(
                                                          VenuesGroup
                                                              .venueDetailsCall
                                                              .gender(
                                                            (_model.apiResultVenueDetailsResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          ' All',
                                                        ) !=
                                                        '')
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'oue0fcsm' /* Suitable For  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            VenuesGroup
                                                                .venueDetailsCall
                                                                .gender(
                                                              (_model.apiResultVenueDetailsResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            ' All',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                if (functions.isHtmlDataValid(
                                                        VenuesGroup
                                                            .venueDetailsCall
                                                            .longDescription(
                                                      (_model.apiResultVenueDetailsResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )) ??
                                                    true)
                                                  Container(
                                                    width: double.infinity,
                                                    color: Color(0x00000000),
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController2,
                                                      child: ExpandablePanel(
                                                        header: Container(
                                                          height: 0.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                        collapsed: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child:
                                                                  MarkdownBody(
                                                                data: functions
                                                                    .truncateHtmlPreservingTags(
                                                                        functions
                                                                            .convertDescriptionToMarkdown(getJsonField(
                                                                          (_model.apiResultVenueDetailsResult?.jsonBody ??
                                                                              ''),
                                                                          r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
                                                                        )),
                                                                        50)
                                                                    .name,
                                                                selectable:
                                                                    true,
                                                                onTapLink: (_,
                                                                        url,
                                                                        __) =>
                                                                    launchURL(
                                                                        url!),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 1.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '00kr092q' /* .... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .headlineSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        expanded: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            MarkdownBody(
                                                              data: functions
                                                                  .convertDescriptionToMarkdown(
                                                                      getJsonField(
                                                                (_model.apiResultVenueDetailsResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
                                                              )),
                                                              selectable: true,
                                                              onTapLink: (_,
                                                                      url,
                                                                      __) =>
                                                                  launchURL(
                                                                      url!),
                                                            ),
                                                          ],
                                                        ),
                                                        theme:
                                                            ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand: true,
                                                          tapBodyToCollapse:
                                                              true,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if ((_model.venuePackageOutput?.succeeded ?? true))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (VenuesGroup.venueDetailsCall
                                            .packageCount(
                                          (_model.apiResultVenueDetailsResult
                                                  ?.jsonBody ??
                                              ''),
                                        ) !=
                                        '0')
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Icon(
                                                    Icons.pages,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'g9noqt5e' /* Package */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final pakageDetails =
                                                          VenuesGroup
                                                                  .venuePackageCall
                                                                  .details(
                                                                    (_model.venuePackageOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                  ?.toList() ??
                                                              [];

                                                      return ListView.separated(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.0),
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: pakageDetails
                                                            .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 10.0),
                                                        itemBuilder: (context,
                                                            pakageDetailsIndex) {
                                                          final pakageDetailsItem =
                                                              pakageDetails[
                                                                  pakageDetailsIndex];
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        VenuePackageDetailsWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'packageId':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              pakageDetailsItem,
                                                                              r'''$._id''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'resourseId':
                                                                              serializeParam(
                                                                            VenuesGroup.venueDetailsCall.resourceId(
                                                                              (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
                                                                            ),
                                                                            ParamType.String,
                                                                          ),
                                                                          'resouceItemId':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              pakageDetailsItem,
                                                                              r'''$['venue_package-_-resourcePackage-_-resourceItem-_-id']''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFFCFEEB),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              2.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                pakageDetailsItem,
                                                                                r'''$['venue_package-_-resourcePackage-_-resourceItem-_-name']''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Divider(
                                                                                  thickness: 2.0,
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                    child: Image.network(
                                                                                      functions.validateAndFormatUrl(
                                                                                          getJsonField(
                                                                                            pakageDetailsItem,
                                                                                            r'''$.imageURL''',
                                                                                          ).toString(),
                                                                                          FFDevEnvironmentValues().BaseUrl)!,
                                                                                      fit: BoxFit.contain,
                                                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.png',
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                          pakageDetailsItem,
                                                                                          r'''$['formatedPrice']''',
                                                                                        )))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.monetization_on,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    functions.priceFormat(getJsonField(
                                                                                                      pakageDetailsItem,
                                                                                                      r'''$['formatedPrice']''',
                                                                                                    ).toString()),
                                                                                                    'NA',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                          pakageDetailsItem,
                                                                                          r'''$['venue_package-_-resourceItemDuartionFormatted']''',
                                                                                        )))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.timer,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    pakageDetailsItem,
                                                                                                    r'''$['venue_package-_-resourceItemDuartionFormatted']''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                          pakageDetailsItem,
                                                                                          r'''$['venue_package-_-venuePackageSection-_-resItemSection-_-name']''',
                                                                                        )))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.notes,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    pakageDetailsItem,
                                                                                                    r'''$['venue_package-_-venuePackageSection-_-resItemSection-_-name']''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                              pakageDetailsItem,
                                                                                              r'''$['venue_package-_-resourcePackage-_-resourceItem-_-ageRange']''',
                                                                                            )) &&
                                                                                            responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                              tabletLandscape: false,
                                                                                              desktop: false,
                                                                                            ))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.family_restroom,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    pakageDetailsItem,
                                                                                                    r'''$['venue_package-_-resourcePackage-_-resourceItem-_-ageRange']''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                          pakageDetailsItem,
                                                                                          r'''$['venue_package-_-resourcePackage-_-defaultInvitee']''',
                                                                                        )))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.people,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    pakageDetailsItem,
                                                                                                    r'''$['venue_package-_-resourcePackage-_-defaultInvitee']''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'mo9ce7pl' /*  People */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                      ].divide(SizedBox(height: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        context.pushNamed(
                                                                                          VenuePackageDetailsWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'packageId': serializeParam(
                                                                                              getJsonField(
                                                                                                pakageDetailsItem,
                                                                                                r'''$._id''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'resourseId': serializeParam(
                                                                                              VenuesGroup.venueDetailsCall.resourceId(
                                                                                                (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
                                                                                              ),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'resouceItemId': serializeParam(
                                                                                              getJsonField(
                                                                                                pakageDetailsItem,
                                                                                                r'''$['venue_package-_-resourcePackage-_-resourceItem-_-id']''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'urc08pom' /* View  Package */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 32.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.plusJakartaSans(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 2.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                        controller: _model
                                                            .packageListView,
                                                      );
                                                    },
                                                  ),
                                                ].divide(SizedBox(height: 6.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            if ((_model.venueHallOutput?.succeeded ?? true))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (VenuesGroup.venueDetailsCall.spaceCount(
                                          (_model.apiResultVenueDetailsResult
                                                  ?.jsonBody ??
                                              ''),
                                        ) !=
                                        '0')
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await _model.hourListView?.animateTo(
                                            _model.hourListView!.position
                                                .maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 2.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                        Icons.space_dashboard,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'mgnc8ota' /* Hall/Space */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumIsCustom,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final halldetails = VenuesGroup
                                                          .venueHallAndRoomsCall
                                                          .details(
                                                            (_model.venueHallOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          ?.toList() ??
                                                      [];

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.0),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        halldetails.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 10.0),
                                                    itemBuilder: (context,
                                                        halldetailsIndex) {
                                                      final halldetailsItem =
                                                          halldetails[
                                                              halldetailsIndex];
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            10.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      VenueSpaceDetailsWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'resourseId':
                                                                            serializeParam(
                                                                          VenuesGroup
                                                                              .venueDetailsCall
                                                                              .resourceId(
                                                                            (_model.apiResultVenueDetailsResult?.jsonBody ??
                                                                                ''),
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'par1':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            halldetailsItem,
                                                                            r'''$._id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'par2':
                                                                            serializeParam(
                                                                          VenuesGroup
                                                                              .venueDetailsCall
                                                                              .id(
                                                                            (_model.apiResultVenueDetailsResult?.jsonBody ??
                                                                                ''),
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'par3':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            halldetailsItem,
                                                                            r'''$['VenueSpace-_-resourceItem-_-id']''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFFCFEEB),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            getJsonField(
                                                                              halldetailsItem,
                                                                              r'''$['VenueSpace-_-resourceItem-_-name']''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  font: GoogleFonts.plusJakartaSans(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF14181B),
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Divider(
                                                                                thickness: 2.0,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                  child: Image.network(
                                                                                    functions.validateAndFormatUrl(
                                                                                        getJsonField(
                                                                                          halldetailsItem,
                                                                                          r'''$.imageURL''',
                                                                                        ).toString(),
                                                                                        FFDevEnvironmentValues().BaseUrl)!,
                                                                                    fit: BoxFit.contain,
                                                                                    errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                      'assets/images/error_image.png',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                          halldetailsItem,
                                                                                          r'''$.formatedPrice''',
                                                                                        )))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.monetization_on_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    functions.priceFormat(getJsonField(
                                                                                                      halldetailsItem,
                                                                                                      r'''$.formatedPrice''',
                                                                                                    ).toString()),
                                                                                                    'NA',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                          halldetailsItem,
                                                                                          r'''$['VenueSpace-_-seatingCapacity']''',
                                                                                        )))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.chair,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    halldetailsItem,
                                                                                                    r'''$['VenueSpace-_-seatingCapacity']''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                          halldetailsItem,
                                                                                          r'''$['VenueSpace-_-standingCapacity']''',
                                                                                        )))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.emoji_people,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    halldetailsItem,
                                                                                                    r'''$['VenueSpace-_-standingCapacity']''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                          halldetailsItem,
                                                                                          r'''$['VenueSpace-_-theaterCapacity']''',
                                                                                        )))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.groups_3_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    halldetailsItem,
                                                                                                    r'''$['VenueSpace-_-theaterCapacity']''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                          halldetailsItem,
                                                                                          r'''$['VenueSpace-_-resourceItem-_-additionalInfo-_-minPersons']''',
                                                                                        )))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.person_2_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    halldetailsItem,
                                                                                                    r'''$['VenueSpace-_-resourceItem-_-additionalInfo-_-minPersons']''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        if (functions.checkJsonValue(getJsonField(
                                                                                          halldetailsItem,
                                                                                          r'''$['VenueSpace-_-resourceItemDuartionFormatted']''',
                                                                                        )))
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.timer_rounded,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    halldetailsItem,
                                                                                                    r'''$['VenueSpace-_-resourceItemDuartionFormatted']''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                      ].divide(SizedBox(height: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    context.pushNamed(
                                                                                      VenueSpaceDetailsWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'resourseId': serializeParam(
                                                                                          VenuesGroup.venueDetailsCall.resourceId(
                                                                                            (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
                                                                                          ),
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'par1': serializeParam(
                                                                                          getJsonField(
                                                                                            halldetailsItem,
                                                                                            r'''$._id''',
                                                                                          ).toString(),
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'par2': serializeParam(
                                                                                          VenuesGroup.venueDetailsCall.id(
                                                                                            (_model.apiResultVenueDetailsResult?.jsonBody ?? ''),
                                                                                          ),
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'par3': serializeParam(
                                                                                          getJsonField(
                                                                                            halldetailsItem,
                                                                                            r'''$['VenueSpace-_-resourceItem-_-id']''',
                                                                                          ).toString(),
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'gzuo7jhk' /* View  Space */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 32.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          font: GoogleFonts.plusJakartaSans(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 10.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    controller:
                                                        _model.hallListView,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            if ((_model.venueAnnimattiesOutput?.succeeded ??
                                true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (functions.checkListOfDynamic(
                                      VenuesGroup.venueAnemitiesCall
                                          .details(
                                            (_model.venueAnnimattiesOutput
                                                    ?.jsonBody ??
                                                ''),
                                          )
                                          ?.toList()))
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              color: Color(0x00000000),
                                              child: ExpandableNotifier(
                                                controller: _model
                                                    .expandablePaymentExpandableController1,
                                                child: ExpandablePanel(
                                                  header: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Icon(
                                                          Icons.ac_unit,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'unaq1nbv' /* Amenities */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMediumIsCustom,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  collapsed: Container(
                                                    width: double.infinity,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  expanded: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      FlutterFlowChoiceChips(
                                                        options: VenuesGroup
                                                            .venueAnemitiesCall
                                                            .name(
                                                              (_model.venueAnnimattiesOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .unique((e) => e)
                                                            .map((label) =>
                                                                ChipData(label))
                                                            .toList(),
                                                        onChanged: (val) =>
                                                            safeSetState(() => _model
                                                                    .choiceChipsValue =
                                                                val?.firstOrNull),
                                                        selectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                          iconSize: 16.0,
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        unselectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                          iconColor:
                                                              Color(0x00000000),
                                                          iconSize: 16.0,
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        chipSpacing: 8.0,
                                                        rowSpacing: 8.0,
                                                        multiselect: false,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        controller: _model
                                                                .choiceChipsValueController ??=
                                                            FormFieldController<
                                                                List<String>>(
                                                          [],
                                                        ),
                                                        wrapped: true,
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 6.0))
                                                        .addToStart(SizedBox(
                                                            height: 6.0))
                                                        .addToEnd(SizedBox(
                                                            height: 6.0)),
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: true,
                                                    tapBodyToCollapse: true,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            if ((_model.opsHourOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (() {
                                    if (!(_model.opsHourOutput?.succeeded ??
                                        true)) {
                                      return false;
                                    } else if (ResourceLevalGroup
                                                .resourceopHoursCall
                                                .details(
                                              (_model.opsHourOutput?.jsonBody ??
                                                  ''),
                                            ) !=
                                            null &&
                                        (ResourceLevalGroup.resourceopHoursCall
                                                .details(
                                          (_model.opsHourOutput?.jsonBody ??
                                              ''),
                                        ))!
                                            .isNotEmpty) {
                                      return true;
                                    } else {
                                      return false;
                                    }
                                  }())
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            color: Color(0x00000000),
                                            child: ExpandableNotifier(
                                              controller: _model
                                                  .expandableExpandableController3,
                                              child: ExpandablePanel(
                                                header: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 2.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .hourglassStart,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    7.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'jcwc5kzn' /* Hours */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                collapsed: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                ),
                                                expanded: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (ResourceLevalGroup
                                                            .resourceopHoursCall
                                                            .details(
                                                              (_model.opsHourOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .where((e) =>
                                                                (String var1) {
                                                                  return var1 ==
                                                                      'Regular';
                                                                }(getJsonField(
                                                                  e,
                                                                  r'''$.opHoursContext''',
                                                                ).toString()))
                                                            .toList()
                                                            .length >
                                                        0)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ahcpn0fk' /* Regular Hours */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  SizedBox(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.6,
                                                                    child:
                                                                        Divider(
                                                                      thickness:
                                                                          2.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final hourDetail = ResourceLevalGroup
                                                                        .resourceopHoursCall
                                                                        .details(
                                                                          (_model.opsHourOutput?.jsonBody ??
                                                                              ''),
                                                                        )
                                                                        ?.where((e) =>
                                                                            (String
                                                                                var1) {
                                                                              return var1 == 'Regular';
                                                                            }(getJsonField(
                                                                              e,
                                                                              r'''$.opHoursContext''',
                                                                            ).toString()))
                                                                        .toList()
                                                                        .toList() ??
                                                                    [];

                                                                return ListView
                                                                    .separated(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              7.0),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      hourDetail
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          height:
                                                                              7.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          hourDetailIndex) {
                                                                    final hourDetailItem =
                                                                        hourDetail[
                                                                            hourDetailIndex];
                                                                    return wrapWithModel(
                                                                      model: _model
                                                                          .hourCompDetailPageModels1
                                                                          .getModel(
                                                                        hourDetailIndex
                                                                            .toString(),
                                                                        hourDetailIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          HourCompDetailPageWidget(
                                                                        key:
                                                                            Key(
                                                                          'Key70o_${hourDetailIndex.toString()}',
                                                                        ),
                                                                        parameter1:
                                                                            getJsonField(
                                                                          hourDetailItem,
                                                                          r'''$.day''',
                                                                        ),
                                                                        parameter2:
                                                                            getJsonField(
                                                                          hourDetailItem,
                                                                          r'''$.time''',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  controller: _model
                                                                      .hourListView,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    if (ResourceLevalGroup
                                                            .resourceopHoursCall
                                                            .details(
                                                              (_model.opsHourOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .where((e) =>
                                                                (String var1) {
                                                                  return var1 ==
                                                                      'Celebration';
                                                                }(getJsonField(
                                                                  e,
                                                                  r'''$.opHoursContext''',
                                                                ).toString()))
                                                            .toList()
                                                            .length >
                                                        0)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'zuh9i37z' /* Celebration Hours */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  SizedBox(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.6,
                                                                    child:
                                                                        Divider(
                                                                      thickness:
                                                                          2.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final hourDetail = ResourceLevalGroup
                                                                        .resourceopHoursCall
                                                                        .details(
                                                                          (_model.opsHourOutput?.jsonBody ??
                                                                              ''),
                                                                        )
                                                                        ?.where((e) =>
                                                                            (String
                                                                                var1) {
                                                                              return var1 == 'Celebration';
                                                                            }(getJsonField(
                                                                              e,
                                                                              r'''$.opHoursContext''',
                                                                            ).toString()))
                                                                        .toList()
                                                                        .toList() ??
                                                                    [];

                                                                return ListView
                                                                    .separated(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              7.0),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      hourDetail
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          height:
                                                                              7.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          hourDetailIndex) {
                                                                    final hourDetailItem =
                                                                        hourDetail[
                                                                            hourDetailIndex];
                                                                    return wrapWithModel(
                                                                      model: _model
                                                                          .hourCompDetailPageModels2
                                                                          .getModel(
                                                                        hourDetailIndex
                                                                            .toString(),
                                                                        hourDetailIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          HourCompDetailPageWidget(
                                                                        key:
                                                                            Key(
                                                                          'Key1sd_${hourDetailIndex.toString()}',
                                                                        ),
                                                                        parameter1:
                                                                            getJsonField(
                                                                          hourDetailItem,
                                                                          r'''$.day''',
                                                                        ),
                                                                        parameter2:
                                                                            getJsonField(
                                                                          hourDetailItem,
                                                                          r'''$.time''',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  controller: _model
                                                                      .hourCelbrationListView,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ].divide(
                                                      SizedBox(height: 7.0)),
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: true,
                                                  tapBodyToCollapse: true,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (() {
                                  if (functions.checkJsonValue(getJsonField(
                                    (_model.apiResultVenueDetailsResult
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.details[:]['resource-_-creditCardAccepted']''',
                                  ))) {
                                    return true;
                                  } else if (functions
                                      .checkJsonValue(getJsonField(
                                    (_model.apiResultVenueDetailsResult
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.details[:]['resource-_-paymentModes']''',
                                  ))) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }())
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Container(
                                              width: double.infinity,
                                              color: Color(0x00000000),
                                              child: ExpandableNotifier(
                                                controller: _model
                                                    .expandablePaymentExpandableController2,
                                                child: ExpandablePanel(
                                                  header: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Icon(
                                                          Icons.paid,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    7.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'gb5rb2h9' /* Payment */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  collapsed: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  expanded: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Visibility(
                                                          visible: VenuesGroup
                                                                      .venueDetailsCall
                                                                      .paymentMode(
                                                                    (_model.apiResultVenueDetailsResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) !=
                                                                  null &&
                                                              VenuesGroup
                                                                      .venueDetailsCall
                                                                      .paymentMode(
                                                                    (_model.apiResultVenueDetailsResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) !=
                                                                  '',
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .ccMastercard,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    VenuesGroup
                                                                        .venueDetailsCall
                                                                        .paymentMode(
                                                                      (_model.apiResultVenueDetailsResult
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    'Payment Mode',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Visibility(
                                                          visible: VenuesGroup
                                                                      .venueDetailsCall
                                                                      .cardAccepted(
                                                                    (_model.apiResultVenueDetailsResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) !=
                                                                  null &&
                                                              VenuesGroup
                                                                      .venueDetailsCall
                                                                      .cardAccepted(
                                                                    (_model.apiResultVenueDetailsResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) !=
                                                                  '',
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidCreditCard,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    VenuesGroup
                                                                        .venueDetailsCall
                                                                        .cardAccepted(
                                                                      (_model.apiResultVenueDetailsResult
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    'Card',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 6.0))
                                                        .addToStart(SizedBox(
                                                            height: 6.0))
                                                        .addToEnd(SizedBox(
                                                            height: 6.0)),
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: true,
                                                    tapBodyToCollapse: true,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            if ((_model.deliveryOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (_model.deliveryOutput == null
                                      ? false
                                      : (ResourceLevalGroup.resourceDeliveryCall
                                                  .details(
                                                (_model.deliveryOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          (ResourceLevalGroup
                                                  .resourceDeliveryCall
                                                  .details(
                                            (_model.deliveryOutput?.jsonBody ??
                                                ''),
                                          ))!
                                              .isNotEmpty))
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              color: Color(0x00000000),
                                              child: ExpandableNotifier(
                                                controller: _model
                                                    .expandablePaymentExpandableController3,
                                                child: ExpandablePanel(
                                                  header: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Icon(
                                                          Icons.delivery_dining,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4rpodpsk' /* Delivery Info */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMediumIsCustom,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  collapsed: Container(
                                                    width: double.infinity,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  expanded: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final develiveryItem =
                                                              ResourceLevalGroup
                                                                      .resourceDeliveryCall
                                                                      .details(
                                                                        (_model.deliveryOutput?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.toList() ??
                                                                  [];

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                develiveryItem
                                                                    .length,
                                                            itemBuilder: (context,
                                                                develiveryItemIndex) {
                                                              final develiveryItemItem =
                                                                  develiveryItem[
                                                                      develiveryItemIndex];
                                                              return wrapWithModel(
                                                                model: _model
                                                                    .deliveryCompModels
                                                                    .getModel(
                                                                  develiveryItemIndex
                                                                      .toString(),
                                                                  develiveryItemIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    DeliveryCompWidget(
                                                                  key: Key(
                                                                    'Keyra5_${develiveryItemIndex.toString()}',
                                                                  ),
                                                                  stanDistance:
                                                                      getJsonField(
                                                                    develiveryItemItem,
                                                                    r'''$['standarddistance']''',
                                                                  ),
                                                                  maxDistance:
                                                                      getJsonField(
                                                                    develiveryItemItem,
                                                                    r'''$['maxDistanceWithUnit']''',
                                                                  ),
                                                                  stanFee:
                                                                      getJsonField(
                                                                    develiveryItemItem,
                                                                    r'''$['standardPlusdeliveryRate']''',
                                                                  ),
                                                                  availableDayTime:
                                                                      getJsonField(
                                                                    develiveryItemItem,
                                                                    r'''$['deliveryHours-_-timeFormatted']''',
                                                                  ),
                                                                  availableTown:
                                                                      getJsonField(
                                                                    develiveryItemItem,
                                                                    r'''$['colonSeparatedtowns']''',
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            controller: _model
                                                                .listViewController,
                                                          );
                                                        },
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 6.0))
                                                        .addToStart(SizedBox(
                                                            height: 6.0))
                                                        .addToEnd(SizedBox(
                                                            height: 6.0)),
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: true,
                                                    tapBodyToCollapse: true,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            if ((_model.reviewOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (functions.checkListOfDynamic(
                                      ResourceLevalGroup.resourcereviewCall
                                          .detail(
                                            (_model.reviewOutput?.jsonBody ??
                                                ''),
                                          )
                                          ?.toList()))
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              color: Color(0x00000000),
                                              child: ExpandableNotifier(
                                                controller: _model
                                                    .expandableExpandableController4,
                                                child: ExpandablePanel(
                                                  header: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Icon(
                                                          Icons
                                                              .rate_review_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    7.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'moowkiiv' /* Review & Rating */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  collapsed: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  expanded: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final reviewDetail =
                                                              ResourceLevalGroup
                                                                      .resourcereviewCall
                                                                      .detail(
                                                                        (_model.reviewOutput?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.toList() ??
                                                                  [];

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                reviewDetail
                                                                    .length,
                                                            itemBuilder: (context,
                                                                reviewDetailIndex) {
                                                              final reviewDetailItem =
                                                                  reviewDetail[
                                                                      reviewDetailIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .reviewCompModels
                                                                      .getModel(
                                                                    getJsonField(
                                                                      reviewDetailItem,
                                                                      r'''$.socialMediaType''',
                                                                    ).toString(),
                                                                    reviewDetailIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ReviewCompWidget(
                                                                    key: Key(
                                                                      'Keyqm0_${getJsonField(
                                                                        reviewDetailItem,
                                                                        r'''$.socialMediaType''',
                                                                      ).toString()}',
                                                                    ),
                                                                    name:
                                                                        getJsonField(
                                                                      reviewDetailItem,
                                                                      r'''$.socialMediaType''',
                                                                    ).toString(),
                                                                    rating:
                                                                        getJsonField(
                                                                      reviewDetailItem,
                                                                      r'''$.currentRating''',
                                                                    ).toString(),
                                                                    likes:
                                                                        getJsonField(
                                                                      reviewDetailItem,
                                                                      r'''$.reviewAndLike''',
                                                                    ).toString(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            controller: _model
                                                                .reviewListView,
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: true,
                                                    tapBodyToCollapse: true,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            if ((_model.cancllationPolicyOutput?.succeeded ??
                                true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (functions.checkListOfDynamic(
                                      ResourceLevalGroup
                                          .resourceCancellationPolicyCall
                                          .details(
                                            (_model.cancllationPolicyOutput
                                                    ?.jsonBody ??
                                                ''),
                                          )
                                          ?.toList()))
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              color: Color(0x00000000),
                                              child: ExpandableNotifier(
                                                controller: _model
                                                    .expandableExpandableController5,
                                                child: ExpandablePanel(
                                                  header: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .info_outline_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '3xtz8037' /* Booking Policies */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMediumIsCustom,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                  collapsed: Container(
                                                    width: double.infinity,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  expanded: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .bookingPolicyModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            BookingPolicyWidget(
                                                          data: ResourceLevalGroup
                                                              .resourceCancellationPolicyCall
                                                              .details(
                                                                (_model.cancllationPolicyOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!
                                                              .firstOrNull!,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: true,
                                                    tapBodyToCollapse: true,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 0.0)),
                                      ),
                                    ),
                                ],
                              ),
                            if ((_model.venueDocumentOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (functions.checkListOfDynamic(
                                      VenuesGroup.venueDocumentListCall
                                          .details(
                                            (_model.venueDocumentOutput
                                                    ?.jsonBody ??
                                                ''),
                                          )
                                          ?.toList()))
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.document_scanner,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ebx7xjby' /* Documents */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumIsCustom,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .documentCompModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: DocumentCompWidget(
                                                        data: VenuesGroup
                                                            .venueDocumentListCall
                                                            .details(
                                                          (_model.venueDocumentOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            if ((_model.fAQapiResponce?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (functions.checkListOfDynamic(
                                      ResourceLevalGroup.resourceFAQCall
                                          .details(
                                            (_model.fAQapiResponce?.jsonBody ??
                                                ''),
                                          )
                                          ?.toList()))
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 1.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            width:
                                                                double.infinity,
                                                            child: FaqWidget(
                                                              parameter1:
                                                                  ResourceLevalGroup
                                                                      .resourceFAQCall
                                                                      .details(
                                                                (_model.fAQapiResponce
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              name:
                                                                  getJsonField(
                                                                (_model.apiResultVenueDetailsResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-name']''',
                                                              ).toString(),
                                                              venueType:
                                                                  getJsonField(
                                                                (_model.apiResultVenueDetailsResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.details[:]['venueType-_-name']''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .question_answer_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'phxukwyb' /* Frequently Asked Questions */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 5.0)),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            if ((_model.awardOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (functions.checkListOfDynamic(
                                      ResourceLevalGroup.resourceAwardCall
                                          .details(
                                            (_model.awardOutput?.jsonBody ??
                                                ''),
                                          )
                                          ?.toList()))
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            child: Container(
                                              width: double.infinity,
                                              color: Color(0x00000000),
                                              child: ExpandableNotifier(
                                                controller: _model
                                                    .expandableExpandableController6,
                                                child: ExpandablePanel(
                                                  header: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    5.0),
                                                        child: Icon(
                                                          Icons.emoji_events,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    7.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '1yy9xdto' /* Awards */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  collapsed: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  expanded: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final itemw =
                                                                ResourceLevalGroup
                                                                        .resourceAwardCall
                                                                        .details(
                                                                          (_model.awardOutput?.jsonBody ??
                                                                              ''),
                                                                        )
                                                                        ?.toList() ??
                                                                    [];

                                                            return Wrap(
                                                              spacing: 4.0,
                                                              runSpacing: 3.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: List.generate(
                                                                  itemw.length,
                                                                  (itemwIndex) {
                                                                final itemwItem =
                                                                    itemw[
                                                                        itemwIndex];
                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.299,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.26,
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .awardCompModels
                                                                        .getModel(
                                                                      itemwItem
                                                                          .toString(),
                                                                      itemwIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        AwardCompWidget(
                                                                      key: Key(
                                                                        'Keycj8_${itemwItem.toString()}',
                                                                      ),
                                                                      parameter1:
                                                                          itemwItem,
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: false,
                                                    tapBodyToCollapse: false,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ].divide(SizedBox(height: 3.0)),
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if ((_model.simillarVendorOutput?.succeeded ??
                                        true)
                                    ? (VenuesGroup.venueSimilarCall.details(
                                                  (_model.simillarVendorOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                ) !=
                                                null &&
                                            (VenuesGroup.venueSimilarCall
                                                    .details(
                                              (_model.simillarVendorOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ))!
                                                .isNotEmpty
                                        ? true
                                        : false)
                                    : false)
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                Icons.share,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 7.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kiwp8b0o' /* Similar */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Builder(
                                          builder: (context) {
                                            final similarVenueDetails =
                                                VenuesGroup.venueSimilarCall
                                                        .details(
                                                          (_model.simillarVendorOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        ?.toList() ??
                                                    [];
                                            if (similarVenueDetails.isEmpty) {
                                              return Image.asset(
                                                'assets/images/images_(1).png',
                                              );
                                            }

                                            return Container(
                                              width: double.infinity,
                                              child: CarouselSlider.builder(
                                                itemCount:
                                                    similarVenueDetails.length,
                                                itemBuilder: (context,
                                                    similarVenueDetailsIndex,
                                                    _) {
                                                  final similarVenueDetailsItem =
                                                      similarVenueDetails[
                                                          similarVenueDetailsIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        VenueDetailsWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'venueId':
                                                              serializeParam(
                                                            getJsonField(
                                                              similarVenueDetailsItem,
                                                              r'''$._id''',
                                                            ),
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .bottomToTop,
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .similarVendorCompModels
                                                          .getModel(
                                                        similarVenueDetailsIndex
                                                            .toString(),
                                                        similarVenueDetailsIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          SimilarVendorCompWidget(
                                                        key: Key(
                                                          'Keyev4_${similarVenueDetailsIndex.toString()}',
                                                        ),
                                                        price: getJsonField(
                                                          similarVenueDetailsItem,
                                                          r'''$['venueMoreFields-_-price']''',
                                                        ),
                                                        name: getJsonField(
                                                          similarVenueDetailsItem,
                                                          r'''$.name''',
                                                        ),
                                                        rank: getJsonField(
                                                          similarVenueDetailsItem,
                                                          r'''$.overallrank''',
                                                        ),
                                                        image: getJsonField(
                                                          similarVenueDetailsItem,
                                                          r'''$.logo''',
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                carouselController: _model
                                                        .carouselController ??=
                                                    CarouselSliderController(),
                                                options: CarouselOptions(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          1,
                                                          similarVenueDetails
                                                                  .length -
                                                              1)),
                                                  viewportFraction: 0.5,
                                                  disableCenter: false,
                                                  enlargeCenterPage: true,
                                                  enlargeFactor: 0.25,
                                                  enableInfiniteScroll: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  autoPlay: true,
                                                  autoPlayAnimationDuration:
                                                      Duration(
                                                          milliseconds: 800),
                                                  autoPlayInterval: Duration(
                                                      milliseconds:
                                                          (800 + 4000)),
                                                  autoPlayCurve: Curves.linear,
                                                  pauseAutoPlayInFiniteScroll:
                                                      true,
                                                  onPageChanged: (index, _) =>
                                                      _model.carouselCurrentIndex =
                                                          index,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 3.0)),
                                  ),
                                if (!(_model.simillarVendorOutput?.succeeded ??
                                        true) &&
                                    responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                    ))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                Icons.share,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 7.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'w3x6ciwf' /* Similar */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF4D2D4),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24.0,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '21igywad' /* Error: Failed to load data  */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 10.0))
                                                  .around(
                                                      SizedBox(width: 10.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ]
                              .divide(SizedBox(height: 8.0))
                              .addToEnd(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
