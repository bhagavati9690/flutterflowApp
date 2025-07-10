import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/email_comp/email_comp_widget.dart';
import '/compoents/common_comp/read_only_chop_chips/read_only_chop_chips_widget.dart';
import '/compoents/detail_pagecomp/award_comp/award_comp_widget.dart';
import '/compoents/detail_pagecomp/booking_policy/booking_policy_widget.dart';
import '/compoents/detail_pagecomp/delivery_comp/delivery_comp_widget.dart';
import '/compoents/detail_pagecomp/faq/faq_widget.dart';
import '/compoents/detail_pagecomp/review_comp/review_comp_widget.dart';
import '/compoents/detail_pagecomp/similar_vendor_comp/similar_vendor_comp_widget.dart';
import '/compoents/detail_pagecomp/traval_comp/traval_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'entertainer_details_model.dart';
export 'entertainer_details_model.dart';

class EntertainerDetailsWidget extends StatefulWidget {
  const EntertainerDetailsWidget({
    super.key,
    required this.id,
  });

  final String? id;

  static String routeName = 'EntertainerDetails';
  static String routePath = 'entertainerDetails';

  @override
  State<EntertainerDetailsWidget> createState() =>
      _EntertainerDetailsWidgetState();
}

class _EntertainerDetailsWidgetState extends State<EntertainerDetailsWidget>
    with TickerProviderStateMixin {
  late EntertainerDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntertainerDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.entertainerDetailOutput =
          await EntertainerGroup.entertainerDetailsCall.call(
        key: widget.id,
      );

      if ((_model.entertainerDetailOutput?.succeeded ?? true)) {
        await Future.wait([
          Future(() async {
            _model.rentalPhotoOutput =
                await ResourceLevalGroup.resourcePhotoCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail_photoViewer\",\"cursor\":{\"parentRecordKey\":\"${EntertainerGroup.entertainerDetailsCall.resourceId(
                (_model.entertainerDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[0]}',
            );
          }),
          Future(() async {
            _model.entertainerSectionNameOutput =
                await EntertainerGroup.entertainerItemSectionNameCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail__itemsGrid\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.entertainerDelivery =
                await ResourceLevalGroup.resourceDeliveryCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail__resourceDeliveryUIGrid\",\"cursor\":{\"parentRecordKey\":\"${EntertainerGroup.entertainerDetailsCall.resourceId(
                (_model.entertainerDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.entertainerOpsHourOutput =
                await ResourceLevalGroup.resourceopHoursCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail__hoursGrid\",\"cursor\":{\"parentRecordKey\":\"${EntertainerGroup.entertainerDetailsCall.resourceId(
                (_model.entertainerDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.entertainerReviewOutput =
                await ResourceLevalGroup.resourcereviewCall.call(
              query:
                  '{\"clientId\":\"viewEntertainServiceDetail__resourceReviewGrid\",\"cursor\":{\"parentRecordKey\":\"${EntertainerGroup.entertainerDetailsCall.resourceId(
                (_model.entertainerDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.entertainerCancllationPolicyOutput =
                await ResourceLevalGroup.resourceCancellationPolicyCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail__ResourceCancellationPolicyUI1\",\"cursor\":{\"parentRecordKey\":\"${EntertainerGroup.entertainerDetailsCall.resourceId(
                (_model.entertainerDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.entertainerSimillarOutput =
                await EntertainerGroup.entertainerSimilarVendorCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail__similarGrid\",\"cursor\":{\"dist\":\"${functions.distanceSelectionConverter(FFAppState().distance)}\",\"parentRecordKey\":\"${widget.id}\"},\"selection\":[],\"currentPage\":1}',
            );
          }),
          Future(() async {
            _model.entertainerAwardOutput =
                await ResourceLevalGroup.resourceAwardCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail__resourceAwardUIGrid\",\"cursor\":{\"parentRecordKey\":\"${EntertainerGroup.entertainerDetailsCall.resourceId(
                (_model.entertainerDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.fAQapiResponce =
                await ResourceLevalGroup.resourceFAQCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail__resourceFaqUIGrid\",\"cursor\":{\"parentRecordKey\":\"${EntertainerGroup.entertainerDetailsCall.resourceId(
                (_model.entertainerDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.entertainerActivities =
                await EntertainerGroup.entertainerActivitiesCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail__ActivityBulleted\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.entertainerTravalInfo =
                await EntertainerGroup.entertainerTravalInfoCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail__resourceDeliveryUIGrid\",\"cursor\":{\"parentRecordKey\":\"${EntertainerGroup.entertainerDetailsCall.resourceId(
                (_model.entertainerDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.entertainerAddON =
                await EntertainerGroup.entertainerAddonCall.call(
              clientState:
                  '{\"clientId\":\"viewEntertainServiceDetail__ActivityBulleted\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
        ]);
        _model.isPageLoad = true;
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
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandablePaymentExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandablePaymentExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandablePaymentExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController6 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController7 =
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Visibility(
            visible: _model.isPageLoad,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
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
                                        EntertainerGroup.entertainerDetailsCall
                                            .name(
                                          (_model.entertainerDetailOutput
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
                                        EntertainerGroup.entertainerDetailsCall
                                            .category(
                                          (_model.entertainerDetailOutput
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        'entServiceProviderCategory',
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
                            ].divide(SizedBox(width: 14.0)),
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
                                  if (functions.checkJsonValue(getJsonField(
                                    (_model.entertainerDetailOutput?.jsonBody ??
                                        ''),
                                    r'''$.details[:]['resource-_-celebrationTypes']''',
                                  )))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              EntertainerGroup
                                                  .entertainerDetailsCall
                                                  .celebrationTypes(
                                                (_model.entertainerDetailOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              'Celebration Type',
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                      ],
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '${valueOrDefault<String>(
                                              EntertainerGroup
                                                  .entertainerDetailsCall
                                                  .price(
                                                    (_model.entertainerDetailOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  .toString(),
                                              'NA',
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeFamily,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeIsCustom,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 6.0)),
                                      ),
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) =>
                                            safeSetState(() => _model
                                                .ratingBarValue = newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating: _model.ratingBarValue ??=
                                            functions.stringToIntegerConversion(
                                                valueOrDefault<String>(
                                          EntertainerGroup
                                              .entertainerDetailsCall
                                              .rank(
                                            (_model.entertainerDetailOutput
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
                                        glowColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ],
                                  ),
                                  if (functions.checkJsonValue(getJsonField(
                                    (_model.entertainerDetailOutput?.jsonBody ??
                                        ''),
                                    r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-description']''',
                                  )))
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
                                            input: EntertainerGroup
                                                .entertainerDetailsCall
                                                .description(
                                              (_model.entertainerDetailOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!,
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
                                                    '744iwywf' /* Photo */,
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
                                                    '55dt7ab3' /* Map */,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                          controller: _model.tabBarController,
                                          onTap: (i) async {
                                            [() async {}, () async {}][i]();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          controller: _model.tabBarController,
                                          children: [
                                            Stack(
                                              children: [
                                                if ((_model.rentalPhotoOutput
                                                        ?.succeeded ??
                                                    true))
                                                  Builder(
                                                    builder: (context) {
                                                      final imagePath =
                                                          ResourceLevalGroup
                                                                  .resourcePhotoCall
                                                                  .imageUrl(
                                                                    (_model.rentalPhotoOutput
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
                                                                        .pageViewController ??=
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
                                                                        functions.validateAndFormatUrl(
                                                                            imagePathItem,
                                                                            FFDevEnvironmentValues().BaseUrl)!,
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
                                                                        .pageViewController ??=
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
                                                                      .pageViewController!
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
                                                if (!(_model.rentalPhotoOutput
                                                        ?.succeeded ??
                                                    true))
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/Adobe_Express_-_file.png',
                                                      width: double.infinity,
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
                                                        EntertainerGroup
                                                            .entertainerDetailsCall
                                                            .detail(
                                                              (_model.entertainerDetailOutput
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
                              if (valueOrDefault<String>(
                                    EntertainerGroup.entertainerDetailsCall
                                        .packageCount(
                                      (_model.entertainerDetailOutput
                                              ?.jsonBody ??
                                          ''),
                                    ),
                                    '0',
                                  ) !=
                                  '0') {
                                return !true;
                              } else if (valueOrDefault<String>(
                                    EntertainerGroup.entertainerDetailsCall
                                        .itemCount(
                                      (_model.entertainerDetailOutput
                                              ?.jsonBody ??
                                          ''),
                                    ),
                                    '0',
                                  ) !=
                                  '0') {
                                return !true;
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
                                                  widget.id,
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
                                                  'entertainment',
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
                                                  widget.id,
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
                                                  'entertainment',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '4utf89he' /* Inquiry to Book */,
                                        ),
                                        icon: Icon(
                                          Icons.bookmark_add,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              await showDialog(
                                                barrierColor:
                                                    FlutterFlowTheme.of(context)
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
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.7,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              EmailCompWidget(
                                                            to: valueOrDefault<
                                                                String>(
                                                              EntertainerGroup
                                                                  .entertainerDetailsCall
                                                                  .email(
                                                                (_model.entertainerDetailOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              '0',
                                                            ),
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
                                              'g1q381cr' /* Email */,
                                            ),
                                            icon: Icon(
                                              Icons.email,
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
                                      ),
                                      Flexible(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await launchUrl(Uri(
                                              scheme: 'tel',
                                              path: valueOrDefault<String>(
                                                EntertainerGroup
                                                    .entertainerDetailsCall
                                                    .phone(
                                                  (_model.entertainerDetailOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                '0',
                                              ),
                                            ));
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'n3h3jn0g' /* Call */,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            await launchURL(EntertainerGroup
                                                .entertainerDetailsCall
                                                .website(
                                              (_model.entertainerDetailOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'gjino9sc' /* Website */,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconAlignment: IconAlignment.start,
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                    ].divide(SizedBox(width: 15.0)),
                                  ),
                                  if (valueOrDefault<String>(
                                            EntertainerGroup
                                                .entertainerDetailsCall
                                                .location(
                                              (_model.entertainerDetailOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            '0',
                                          ) !=
                                          '')
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
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
                                                  EntertainerGroup
                                                      .entertainerDetailsCall
                                                      .location(
                                                    (_model.entertainerDetailOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  'Location',
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
                                ].divide(SizedBox(height: 18.0)),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(6.0),
                                                  child: Icon(
                                                    Icons.description_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'scocf1p2' /* About this Entertainer */,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                          collapsed: Container(
                                            decoration: BoxDecoration(),
                                          ),
                                          expanded: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (functions
                                                  .checkJsonValue(getJsonField(
                                                (_model.entertainerDetailOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
                                              )))
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .descriptionCompModel2,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            DescriptionCompWidget(
                                                          input: EntertainerGroup
                                                              .entertainerDetailsCall
                                                              .longDescription(
                                                            (_model.entertainerDetailOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (functions
                                                  .checkJsonValue(getJsonField(
                                                (_model.entertainerDetailOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.details[:]['minTimeToBook']''',
                                              )))
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.timer_sharp,
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
                                                        's84p3u3y' /* Minimum time to book : */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        EntertainerGroup
                                                            .entertainerDetailsCall
                                                            .minTImeTOBook(
                                                          (_model.entertainerDetailOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                            ].divide(SizedBox(height: 14.0)),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: false,
                                            tapBodyToExpand: true,
                                            tapBodyToCollapse: true,
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
                            if (EntertainerGroup.entertainerActivitiesCall
                                        .detail(
                                      (_model.entertainerActivities?.jsonBody ??
                                          ''),
                                    ) !=
                                    null &&
                                (EntertainerGroup.entertainerActivitiesCall
                                        .detail(
                                  (_model.entertainerActivities?.jsonBody ??
                                      ''),
                                ))!
                                    .isNotEmpty)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (EntertainerGroup.entertainerActivitiesCall
                                              .detail(
                                            (_model.entertainerActivities
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (EntertainerGroup
                                              .entertainerActivitiesCall
                                              .detail(
                                        (_model.entertainerActivities
                                                ?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty)
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
                                                .expandableExpandableController2,
                                            child: ExpandablePanel(
                                              header: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Icon(
                                                      Icons
                                                          .accessibility_new_sharp,
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
                                                      '30fb7zt2' /* Activities */,
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
                                              collapsed: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              expanded: wrapWithModel(
                                                model: _model
                                                    .readOnlyChopChipsModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ReadOnlyChopChipsWidget(
                                                  parameter1: EntertainerGroup
                                                      .entertainerActivitiesCall
                                                      .name(
                                                    (_model.entertainerActivities
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                ),
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: false,
                                                tapBodyToExpand: true,
                                                tapBodyToCollapse: true,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            if (EntertainerGroup.entertainerAddonCall.details(
                                      (_model.entertainerAddON?.jsonBody ?? ''),
                                    ) !=
                                    null &&
                                (EntertainerGroup.entertainerAddonCall.details(
                                  (_model.entertainerAddON?.jsonBody ?? ''),
                                ))!
                                    .isNotEmpty)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (EntertainerGroup.entertainerAddonCall
                                              .details(
                                            (_model.entertainerAddON
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (EntertainerGroup.entertainerAddonCall
                                              .details(
                                        (_model.entertainerAddON?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty)
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
                                                .expandableExpandableController3,
                                            child: ExpandablePanel(
                                              header: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Icon(
                                                      Icons.add_to_photos,
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
                                                      '5cug9mfx' /* AddOns */,
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
                                              collapsed: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              expanded: Container(
                                                child: wrapWithModel(
                                                  model: _model
                                                      .readOnlyChopChipsModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      ReadOnlyChopChipsWidget(
                                                    parameter1: EntertainerGroup
                                                        .entertainerAddonCall
                                                        .name(
                                                      (_model.entertainerAddON
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: false,
                                                tapBodyToExpand: true,
                                                tapBodyToCollapse: true,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            if (valueOrDefault<String>(
                                  EntertainerGroup.entertainerDetailsCall
                                      .packageCount(
                                    (_model.entertainerDetailOutput?.jsonBody ??
                                        ''),
                                  ),
                                  '0',
                                ) !=
                                '0')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            EntertainerPackageWidget.routeName,
                                            queryParameters: {
                                              'id': serializeParam(
                                                widget.id,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Icon(
                                                          Icons.pages,
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
                                                          'oj4vzb5f' /* Package */,
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
                                                ),
                                                Flexible(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.navigate_next,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
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
                            if ((_model
                                    .entertainerSectionNameOutput?.succeeded ??
                                true))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (valueOrDefault<String>(
                                          EntertainerGroup
                                              .entertainerDetailsCall
                                              .itemCount(
                                            (_model.entertainerDetailOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          '0',
                                        ) !=
                                        '0')
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
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
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'h1fdb9lw' /* Entertainer Items */,
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
                                            Builder(
                                              builder: (context) {
                                                final entertainertem =
                                                    EntertainerGroup
                                                            .entertainerItemSectionNameCall
                                                            .name(
                                                              (_model.entertainerSectionNameOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            ?.toList() ??
                                                        [];

                                                return ListView.separated(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      entertainertem.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 10.0),
                                                  itemBuilder: (context,
                                                      entertainertemIndex) {
                                                    final entertainertemItem =
                                                        entertainertem[
                                                            entertainertemIndex];
                                                    return Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
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
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                              child: Container(
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
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              6.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            EntertainerItemWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'id': serializeParam(
                                                                                widget.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'name': serializeParam(
                                                                                Uri.encodeComponent(entertainertemItem),
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(12.0),
                                                                                child: Text(
                                                                                  entertainertemItem,
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
                                                                              ),
                                                                            ),
                                                                            FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 40.0,
                                                                              icon: Icon(
                                                                                Icons.navigate_next,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                context.pushNamed(
                                                                                  EntertainerItemWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'id': serializeParam(
                                                                                      widget.id,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'name': serializeParam(
                                                                                      Uri.encodeComponent(entertainertemItem),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            if ((_model.entertainerTravalInfo?.succeeded ??
                                true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (EntertainerGroup.entertainerTravalInfoCall
                                              .detail(
                                            (_model.entertainerTravalInfo
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (EntertainerGroup
                                              .entertainerTravalInfoCall
                                              .detail(
                                        (_model.entertainerTravalInfo
                                                ?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty)
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
                                                          'p5zrk144' /* Delivery Info */,
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
                                                                        (_model.entertainerDelivery?.jsonBody ??
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
                                                                    'Keysvk_${develiveryItemIndex.toString()}',
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
                            if ((_model.entertainerDelivery?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (ResourceLevalGroup.resourceDeliveryCall
                                              .details(
                                            (_model.entertainerDelivery
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ResourceLevalGroup.resourceDeliveryCall
                                              .details(
                                        (_model.entertainerDelivery?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty)
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
                                                    .expandablePaymentExpandableController2,
                                                child: ExpandablePanel(
                                                  header: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .biking,
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
                                                          'mi6vb4ya' /* Traval Info */,
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
                                                          final travaltem =
                                                              EntertainerGroup
                                                                      .entertainerTravalInfoCall
                                                                      .detail(
                                                                        (_model.entertainerTravalInfo?.jsonBody ??
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
                                                            itemCount: travaltem
                                                                .length,
                                                            itemBuilder: (context,
                                                                travaltemIndex) {
                                                              final travaltemItem =
                                                                  travaltem[
                                                                      travaltemIndex];
                                                              return wrapWithModel(
                                                                model: _model
                                                                    .travalCompModels
                                                                    .getModel(
                                                                  travaltemIndex
                                                                      .toString(),
                                                                  travaltemIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    TravalCompWidget(
                                                                  key: Key(
                                                                    'Key0ho_${travaltemIndex.toString()}',
                                                                  ),
                                                                  currentDistance:
                                                                      getJsonField(
                                                                    travaltemItem,
                                                                    r'''$['rangeOfMaxDistance']''',
                                                                  ),
                                                                  standeredFee:
                                                                      getJsonField(
                                                                    travaltemItem,
                                                                    r'''$.deliveryFeePerUnit''',
                                                                  ),
                                                                  maxTravalDistance:
                                                                      getJsonField(
                                                                    travaltemItem,
                                                                    r'''$.rangeOfStandardDistance''',
                                                                  ),
                                                                  travalFee:
                                                                      getJsonField(
                                                                    travaltemItem,
                                                                    r'''$.standardRate''',
                                                                  ),
                                                                ),
                                                              );
                                                            },
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
                            if ((_model.entertainerOpsHourOutput?.succeeded ??
                                true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (ResourceLevalGroup.resourceopHoursCall
                                              .details(
                                            (_model.entertainerOpsHourOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ResourceLevalGroup.resourceopHoursCall
                                              .details(
                                        (_model.entertainerOpsHourOutput
                                                ?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty)
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
                                                  .expandableExpandableController4,
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
                                                            'ztts1fz3' /* Hours */,
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
                                                              (_model.entertainerOpsHourOutput
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
                                                                  'tgtf4o46' /* Regular Hours */,
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
                                                                          (_model.entertainerOpsHourOutput?.jsonBody ??
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
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.4,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              hourDetailItem,
                                                                              r'''$.day''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.4,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              hourDetailItem,
                                                                              r'''$.time''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    if (ResourceLevalGroup
                                                            .resourceopHoursCall
                                                            .details(
                                                              (_model.entertainerOpsHourOutput
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
                                                                  '51c0l2ia' /* Celebration Hours */,
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
                                                                          (_model.entertainerOpsHourOutput?.jsonBody ??
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
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.4,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              hourDetailItem,
                                                                              r'''$.day''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.4,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              hourDetailItem,
                                                                              r'''$.time''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
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
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (() {
                                  if (functions.checkJsonValue(getJsonField(
                                    (_model.entertainerDetailOutput?.jsonBody ??
                                        ''),
                                    r'''$.details[:]['creditCardAccepted']''',
                                  ))) {
                                    return true;
                                  } else if (functions
                                      .checkJsonValue(getJsonField(
                                    (_model.entertainerDetailOutput?.jsonBody ??
                                        ''),
                                    r'''$.details[:]['paymentModes']''',
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
                                                            'm81ny16t' /* Payment */,
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
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .ccMastercard,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  EntertainerGroup
                                                                      .entertainerDetailsCall
                                                                      .creditCardAccpted(
                                                                    (_model.entertainerDetailOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  'Cards',
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
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .solidCreditCard,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  EntertainerGroup
                                                                      .entertainerDetailsCall
                                                                      .paymentModes(
                                                                    (_model.entertainerDetailOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  'modes',
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
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
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
                            if ((_model.entertainerReviewOutput?.succeeded ??
                                true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (functions.checkListOfDynamic(getJsonField(
                                    (_model.entertainerReviewOutput?.jsonBody ??
                                        ''),
                                    r'''$.details''',
                                    true,
                                  )))
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
                                                    .expandableExpandableController5,
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
                                                            'k052u5td' /* Review & Rating */,
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
                                                                        (_model.entertainerReviewOutput?.jsonBody ??
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
                                                                      'Keyfha_${getJsonField(
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
                            if ((_model.entertainerCancllationPolicyOutput
                                    ?.succeeded ??
                                true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (functions.checkListOfDynamic(getJsonField(
                                    (_model.entertainerCancllationPolicyOutput
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.details''',
                                    true,
                                  )))
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
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  color: Color(0x00000000),
                                                  child: ExpandableNotifier(
                                                    controller: _model
                                                        .expandableExpandableController6,
                                                    child: ExpandablePanel(
                                                      header: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .info_outline_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'h7luix9h' /* Booking Policies */,
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
                                                        ].divide(SizedBox(
                                                            width: 5.0)),
                                                      ),
                                                      collapsed: Container(
                                                        width: double.infinity,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
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
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                BookingPolicyWidget(
                                                              data: ResourceLevalGroup
                                                                  .resourceCancellationPolicyCall
                                                                  .details(
                                                                    (_model.entertainerCancllationPolicyOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .firstOrNull!,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
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
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
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
                            if (ResourceLevalGroup.resourceFAQCall.details(
                                      (_model.fAQapiResponce?.jsonBody ?? ''),
                                    ) !=
                                    null &&
                                (ResourceLevalGroup.resourceFAQCall.details(
                                  (_model.fAQapiResponce?.jsonBody ?? ''),
                                ))!
                                    .isNotEmpty)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (ResourceLevalGroup.resourceFAQCall
                                              .details(
                                            (_model.fAQapiResponce?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ResourceLevalGroup.resourceFAQCall
                                              .details(
                                        (_model.fAQapiResponce?.jsonBody ?? ''),
                                      ))!
                                          .isNotEmpty)
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
                                                                  valueOrDefault<
                                                                      String>(
                                                                EntertainerGroup
                                                                    .entertainerDetailsCall
                                                                    .name(
                                                                  (_model.entertainerDetailOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                'Name',
                                                              ),
                                                              venueType: EntertainerGroup
                                                                  .entertainerDetailsCall
                                                                  .celebrationTypes(
                                                                (_model.entertainerDetailOutput
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
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 10.0),
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
                                                              'fmeinjh8' /* Frequently Asked Questions */,
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
                                            mainAxisSize: MainAxisSize.min,
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
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (functions.checkListOfDynamic(getJsonField(
                                  (_model.entertainerAwardOutput?.jsonBody ??
                                      ''),
                                  r'''$.details''',
                                  true,
                                )))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          child: Container(
                                            width: double.infinity,
                                            color: Color(0x00000000),
                                            child: ExpandableNotifier(
                                              controller: _model
                                                  .expandableExpandableController7,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                          'r86dd30s' /* Awards */,
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
                                                    ),
                                                  ],
                                                ),
                                                collapsed: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                expanded: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
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
                                                                        (_model.entertainerAwardOutput?.jsonBody ??
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
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children:
                                                                List.generate(
                                                                    itemw
                                                                        .length,
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
                                                                    itemwIndex
                                                                        .toString(),
                                                                    itemwIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      AwardCompWidget(
                                                                    key: Key(
                                                                      'Keybvz_${itemwIndex.toString()}',
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
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                              ].divide(SizedBox(height: 3.0)),
                            ),
                            if ((_model.entertainerSimillarOutput?.succeeded ??
                                true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (EntertainerGroup
                                              .entertainerSimilarVendorCall
                                              .details(
                                            (_model.entertainerSimillarOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (EntertainerGroup
                                              .entertainerSimilarVendorCall
                                              .details(
                                        (_model.entertainerSimillarOutput
                                                ?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty)
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Icon(
                                                  Icons.share,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 7.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2pr9ungn' /* Similar */,
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Builder(
                                            builder: (context) {
                                              final similarVenueDetails =
                                                  EntertainerGroup
                                                          .entertainerSimilarVendorCall
                                                          .details(
                                                            (_model.entertainerSimillarOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          ?.toList() ??
                                                      [];

                                              return Container(
                                                width: double.infinity,
                                                child: CarouselSlider.builder(
                                                  itemCount: similarVenueDetails
                                                      .length,
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
                                                          EntertainerDetailsWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'id':
                                                                serializeParam(
                                                              getJsonField(
                                                                similarVenueDetailsItem,
                                                                r'''$._id''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child:
                                                          SimilarVendorCompWidget(
                                                        key: Key(
                                                            'Keyomu_${similarVenueDetailsIndex}_of_${similarVenueDetails.length}'),
                                                        price: getJsonField(
                                                          similarVenueDetailsItem,
                                                          r'''$.price''',
                                                        ),
                                                        name: getJsonField(
                                                          similarVenueDetailsItem,
                                                          r'''$.name''',
                                                        ),
                                                        image: getJsonField(
                                                          similarVenueDetailsItem,
                                                          r'''$.logo''',
                                                        ),
                                                        rank: getJsonField(
                                                          similarVenueDetailsItem,
                                                          r'''$.overallRank''',
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
                                                    autoPlayCurve:
                                                        Curves.linear,
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
                                      ].divide(SizedBox(height: 3.0)),
                                    ),
                                ],
                              ),
                          ].divide(SizedBox(height: 10.0)),
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
