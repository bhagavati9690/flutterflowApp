import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/email_comp/email_comp_widget.dart';
import '/compoents/detail_pagecomp/award_comp/award_comp_widget.dart';
import '/compoents/detail_pagecomp/booking_policy/booking_policy_widget.dart';
import '/compoents/detail_pagecomp/delivery_comp/delivery_comp_widget.dart';
import '/compoents/detail_pagecomp/faq/faq_widget.dart';
import '/compoents/detail_pagecomp/review_comp/review_comp_widget.dart';
import '/compoents/detail_pagecomp/similar_vendor_comp/similar_vendor_comp_widget.dart';
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
import 'rental_details_model.dart';
export 'rental_details_model.dart';

class RentalDetailsWidget extends StatefulWidget {
  const RentalDetailsWidget({
    super.key,
    required this.id,
  });

  final String? id;

  static String routeName = 'RentalDetails';
  static String routePath = 'rentalDetails';

  @override
  State<RentalDetailsWidget> createState() => _RentalDetailsWidgetState();
}

class _RentalDetailsWidgetState extends State<RentalDetailsWidget>
    with TickerProviderStateMixin {
  late RentalDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RentalDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.rentalDetailOutput = await RentalGroup.rentalDetailsCall.call(
        recordKey: widget.id,
      );

      if ((_model.rentalDetailOutput?.succeeded ?? true)) {
        await Future.wait([
          Future(() async {
            _model.rentalPhotoOutput =
                await ResourceLevalGroup.resourcePhotoCall.call(
              clientState:
                  '{\"clientId\":\"viewRentalDetail__photoViewer\",\"cursor\":{\"parentRecordKey\":\"${RentalGroup.rentalDetailsCall.resourceId(
                (_model.rentalDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[0]}',
            );
          }),
          Future(() async {
            _model.arentalItemTypeOutput =
                await RentalGroup.rentalItemCategoryCall.call(
              clientState:
                  '{\"clientId\":\"viewRentalDetail__rentalItemGrid1\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.rentalDelivery =
                await ResourceLevalGroup.resourceDeliveryCall.call(
              clientState:
                  '{\"clientId\":\"viewRentalDetail__resourceDeliveryUIGrid\",\"cursor\":{\"parentRecordKey\":\"${RentalGroup.rentalDetailsCall.resourceId(
                (_model.rentalDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.rentalOpsHourOutput =
                await ResourceLevalGroup.resourceopHoursCall.call(
              clientState:
                  '{\"clientId\":\"viewRentalDetail__hoursGrid\",\"cursor\":{\"parentRecordKey\":\"${RentalGroup.rentalDetailsCall.resourceId(
                (_model.rentalDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.rentalReviewOutput =
                await ResourceLevalGroup.resourcereviewCall.call(
              query:
                  '{\"clientId\":\"viewRentalDetail__resourceReviewGrid\",\"cursor\":{\"parentRecordKey\":\"${RentalGroup.rentalDetailsCall.resourceId(
                (_model.rentalDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.rentalCancllationPolicyOutput =
                await ResourceLevalGroup.resourceCancellationPolicyCall.call(
              clientState:
                  '{\"clientId\":\"viewRentalDetail__ResourceCancellationPolicyUI1\",\"cursor\":{\"parentRecordKey\":\"${RentalGroup.rentalDetailsCall.resourceId(
                (_model.rentalDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.rentalSimillarOutput =
                await RentalGroup.rentaSimilarVendorCall.call(
              clientState:
                  '{\"clientId\":\"viewRentalDetail__similarRentalProvider\",\"cursor\":{\"dist\":\"${functions.distanceSelectionConverter(FFAppState().distance)}\"},\"selection\":[],\"currentPage\":1}',
            );
          }),
          Future(() async {
            _model.rentalAwardOutput =
                await ResourceLevalGroup.resourceAwardCall.call(
              clientState:
                  '{\"clientId\":\"viewRentalDetail__resourceAwardUIGrid\",\"cursor\":{\"parentRecordKey\":\"${RentalGroup.rentalDetailsCall.resourceId(
                (_model.rentalDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.fAQapiResponce =
                await ResourceLevalGroup.resourceFAQCall.call(
              clientState:
                  '{\"clientId\":\"viewRentalDetail__resourceFaqUIGrid\",\"cursor\":{\"parentRecordKey\":\"${RentalGroup.rentalDetailsCall.resourceId(
                (_model.rentalDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
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
              alignment: AlignmentDirectional(0.0, 1.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: CustomErrorrAltertBoxWidget(),
                  ),
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
    _model.expandablePaymentExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandablePaymentExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
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
                                        RentalGroup.rentalDetailsCall.name(
                                          (_model.rentalDetailOutput
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
                                        RentalGroup.rentalDetailsCall
                                            .rentalProviderName(
                                          (_model.rentalDetailOutput
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        'rentalProviderName',
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
                                    (_model.rentalDetailOutput?.jsonBody ?? ''),
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
                                              RentalGroup.rentalDetailsCall
                                                  .celebrationType(
                                                (_model.rentalDetailOutput
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
                                              RentalGroup.rentalDetailsCall
                                                  .price(
                                                (_model.rentalDetailOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
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
                                          RentalGroup.rentalDetailsCall.rank(
                                            (_model.rentalDetailOutput
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
                                    (_model.rentalDetailOutput?.jsonBody ?? ''),
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
                                            input: RentalGroup.rentalDetailsCall
                                                .description(
                                              (_model.rentalDetailOutput
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
                                                    'by0qkzr4' /* Photo */,
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
                                                    'mkf0tby3' /* Map */,
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
                                                                            .contain,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.png',
                                                                          width:
                                                                              double.infinity,
                                                                          fit: BoxFit
                                                                              .contain,
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
                                                            8.0),
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
                                                        RentalGroup
                                                            .rentalDetailsCall
                                                            .detail(
                                                              (_model.rentalDetailOutput
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
                                    RentalGroup.rentalDetailsCall.rentalCount(
                                      (_model.rentalDetailOutput?.jsonBody ??
                                          ''),
                                    ),
                                    '0',
                                  ) !=
                                  '0') {
                                return !true;
                              } else if (valueOrDefault<String>(
                                    RentalGroup.rentalDetailsCall.packageCount(
                                      (_model.rentalDetailOutput?.jsonBody ??
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
                                                  'rental',
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
                                                  'rental',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'av8qptfz' /* Inquiry to Book */,
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
                                        MainAxisAlignment.spaceEvenly,
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
                                                              RentalGroup
                                                                  .rentalDetailsCall
                                                                  .email(
                                                                (_model.rentalDetailOutput
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
                                              'wr4bj2tq' /* Email */,
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
                                                RentalGroup.rentalDetailsCall
                                                    .phone(
                                                  (_model.rentalDetailOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                '0',
                                              ),
                                            ));
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ioi839qq' /* Call */,
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
                                            await launchURL(RentalGroup
                                                .rentalDetailsCall
                                                .website(
                                              (_model.rentalDetailOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'g62g36jc' /* Website */,
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
                                    ].divide(SizedBox(width: 14.0)),
                                  ),
                                  if (valueOrDefault<String>(
                                            RentalGroup.rentalDetailsCall
                                                .location(
                                              (_model.rentalDetailOutput
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                              size: 30.0,
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 5.0, 5.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  RentalGroup.rentalDetailsCall
                                                      .location(
                                                    (_model.rentalDetailOutput
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
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xfos8vks' /* About this Party Rental */,
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
                                                (_model.rentalDetailOutput
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
                                                          input: RentalGroup
                                                              .rentalDetailsCall
                                                              .longDescription(
                                                            (_model.rentalDetailOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (valueOrDefault<String>(
                                                        RentalGroup
                                                            .rentalDetailsCall
                                                            .availDays(
                                                          (_model.rentalDetailOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        '0',
                                                      ) !=
                                                      '')
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_month,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          RentalGroup
                                                              .rentalDetailsCall
                                                              .availDays(
                                                            (_model.rentalDetailOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          'All Days',
                                                        ),
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
                                              if (functions
                                                  .checkJsonValue(getJsonField(
                                                (_model.rentalDetailOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.details[:]['minTimeToBook']''',
                                              )))
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'h0opdf4b' /* Minimum time to Book : */,
                                                        ),
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
                                                        text: RentalGroup
                                                            .rentalDetailsCall
                                                            .minTimeToBook(
                                                          (_model.rentalDetailOutput
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
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                              if (functions
                                                  .checkJsonValue(getJsonField(
                                                (_model.rentalDetailOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.details[:]['resource-_-fullAmountTimeframe']''',
                                              )))
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'pfur83l2' /* Full amount to be paid : */,
                                                        ),
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
                                                          RentalGroup
                                                              .rentalDetailsCall
                                                              .fullAmountTimeFrame(
                                                            (_model.rentalDetailOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          'Cards',
                                                        ),
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
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                              if (functions
                                                  .checkJsonValue(getJsonField(
                                                (_model.rentalDetailOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.details[:]['resource-_-resourceCosting-_-minDepositPolicy-_-name']''',
                                              )))
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'aq3njgyr' /* Minimum Deposite : */,
                                                        ),
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
                                                        text: RentalGroup
                                                            .rentalDetailsCall
                                                            .minDepositePolicy(
                                                          (_model.rentalDetailOutput
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
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                            if (valueOrDefault<String>(
                                  RentalGroup.rentalDetailsCall.packageCount(
                                    (_model.rentalDetailOutput?.jsonBody ?? ''),
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
                                            RentaPackageWidget.routeName,
                                            queryParameters: {
                                              'id': serializeParam(
                                                widget.id,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
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
                                                          'd7yc40w6' /* Package */,
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
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            RentaPackageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'id':
                                                                  serializeParam(
                                                                widget.id,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .bottomToTop,
                                                              ),
                                                            },
                                                          );
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
                            if ((_model.arentalItemTypeOutput?.succeeded ??
                                true))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (valueOrDefault<String>(
                                          RentalGroup.rentalDetailsCall
                                              .rentalCount(
                                            (_model.rentalDetailOutput
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
                                                      'oyfuq1k9' /* Rental Items */,
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
                                            if (RentalGroup
                                                        .rentalItemCategoryCall
                                                        .detail(
                                                      (_model.arentalItemTypeOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    null &&
                                                (RentalGroup
                                                        .rentalItemCategoryCall
                                                        .detail(
                                                  (_model.arentalItemTypeOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                ))!
                                                    .isNotEmpty)
                                              Builder(
                                                builder: (context) {
                                                  final rentalItem = RentalGroup
                                                          .rentalItemCategoryCall
                                                          .name(
                                                            (_model.arentalItemTypeOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          ?.unique((e) => e)
                                                          .toList() ??
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
                                                        rentalItem.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 10.0),
                                                    itemBuilder: (context,
                                                        rentalItemIndex) {
                                                      final rentalItemItem =
                                                          rentalItem[
                                                              rentalItemIndex];
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
                                                                            0.0,
                                                                            3.0),
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
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            6.0),
                                                                    child:
                                                                        Column(
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
                                                                            context.pushNamed(
                                                                              RentalItemWidget.routeName,
                                                                              queryParameters: {
                                                                                'id': serializeParam(
                                                                                  widget.id,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'name': serializeParam(
                                                                                  Uri.encodeComponent(rentalItemItem),
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
                                                                                    rentalItemItem,
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
                                                                                    RentalItemWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'id': serializeParam(
                                                                                        widget.id,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'name': serializeParam(
                                                                                        Uri.encodeComponent(rentalItemItem),
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
                            if ((_model.rentalDelivery?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (ResourceLevalGroup.resourceDeliveryCall
                                              .details(
                                            (_model.rentalDelivery?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ResourceLevalGroup.resourceDeliveryCall
                                              .details(
                                        (_model.rentalDelivery?.jsonBody ?? ''),
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
                                                          'sb2gabod' /* Delivery Info */,
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
                                                                        (_model.rentalDelivery?.jsonBody ??
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
                                                                    'Key60o_${develiveryItemIndex.toString()}',
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
                            if ((_model.rentalOpsHourOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (ResourceLevalGroup.resourceopHoursCall
                                              .details(
                                            (_model.rentalOpsHourOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ResourceLevalGroup.resourceopHoursCall
                                              .details(
                                        (_model.rentalOpsHourOutput?.jsonBody ??
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
                                                  .expandableExpandableController2,
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
                                                            '2gc2lcpo' /* Hours */,
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
                                                              (_model.rentalOpsHourOutput
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
                                                                  '0p8h47p0' /* Regular Hours */,
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
                                                                          (_model.rentalOpsHourOutput?.jsonBody ??
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
                                                              (_model.rentalOpsHourOutput
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
                                                                  'oi9sdq11' /* Celebration Hours */,
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
                                                                          (_model.rentalOpsHourOutput?.jsonBody ??
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
                                    (_model.rentalDetailOutput?.jsonBody ?? ''),
                                    r'''$.details[:]['resource-_-creditCardAccepted']''',
                                  ))) {
                                    return true;
                                  } else if (functions
                                      .checkJsonValue(getJsonField(
                                    (_model.rentalDetailOutput?.jsonBody ?? ''),
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
                                                            'o3e9n7x6' /* Payment */,
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
                                                                  RentalGroup
                                                                      .rentalDetailsCall
                                                                      .creditCardAccpted(
                                                                    (_model.rentalDetailOutput
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
                                                                  RentalGroup
                                                                      .rentalDetailsCall
                                                                      .paymentModes(
                                                                    (_model.rentalDetailOutput
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
                            if ((_model.rentalReviewOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (functions.checkListOfDynamic(getJsonField(
                                    (_model.rentalReviewOutput?.jsonBody ?? ''),
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
                                                    .expandableExpandableController3,
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
                                                            '22tewtx9' /* Review & Rating */,
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
                                                                        (_model.rentalReviewOutput?.jsonBody ??
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
                                                                    reviewDetailIndex
                                                                        .toString(),
                                                                    reviewDetailIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ReviewCompWidget(
                                                                    key: Key(
                                                                      'Keys5u_${reviewDetailIndex.toString()}',
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
                            if ((_model
                                    .rentalCancllationPolicyOutput?.succeeded ??
                                true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (functions.checkListOfDynamic(
                                      ResourceLevalGroup
                                          .resourceCancellationPolicyCall
                                          .details(
                                            (_model.rentalCancllationPolicyOutput
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
                                                        .expandableExpandableController4,
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
                                                              'zem1ec1o' /* Booking Policies */,
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
                                                                    (_model.rentalCancllationPolicyOutput
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
                            if ((_model.fAQapiResponce?.succeeded ?? true))
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
                                                                RentalGroup
                                                                    .rentalDetailsCall
                                                                    .name(
                                                                  (_model.rentalDetailOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                'Name',
                                                              ),
                                                              venueType: RentalGroup
                                                                  .rentalDetailsCall
                                                                  .rentalProviderName(
                                                                (_model.rentalDetailOutput
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
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'k1vh6zg6' /* Frequently Asked Questions */,
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
                            if ((_model.rentalAwardOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (functions.checkListOfDynamic(getJsonField(
                                    (_model.rentalAwardOutput?.jsonBody ?? ''),
                                    r'''$.details''',
                                    true,
                                  )))
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
                                                    .expandableExpandableController5,
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
                                                            'qo7pmyq2' /* Awards */,
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
                                                                          (_model.rentalAwardOutput?.jsonBody ??
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
                                                                        'Keyp5i_${itemwIndex.toString()}',
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
                            if ((_model.rentalSimillarOutput?.succeeded ??
                                true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (RentalGroup.rentaSimilarVendorCall
                                              .details(
                                            (_model.rentalSimillarOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (RentalGroup.rentaSimilarVendorCall
                                              .details(
                                        (_model.rentalSimillarOutput
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
                                                    'shs3h3bn' /* Similar */,
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
                                                  RentalGroup
                                                          .rentaSimilarVendorCall
                                                          .details(
                                                            (_model.rentalSimillarOutput
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
                                                          RentalDetailsWidget
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
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .similarVendorCompModels
                                                            .getModel(
                                                          getJsonField(
                                                            similarVenueDetailsItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          similarVenueDetailsIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            SimilarVendorCompWidget(
                                                          key: Key(
                                                            'Keydb7_${getJsonField(
                                                              similarVenueDetailsItem,
                                                              r'''$.name''',
                                                            ).toString()}',
                                                          ),
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
                          ]
                              .divide(SizedBox(height: 10.0))
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
