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
import 'cake_details_model.dart';
export 'cake_details_model.dart';

class CakeDetailsWidget extends StatefulWidget {
  const CakeDetailsWidget({
    super.key,
    required this.id,
  });

  final String? id;

  static String routeName = 'CakeDetails';
  static String routePath = 'cakeDetails';

  @override
  State<CakeDetailsWidget> createState() => _CakeDetailsWidgetState();
}

class _CakeDetailsWidgetState extends State<CakeDetailsWidget>
    with TickerProviderStateMixin {
  late CakeDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CakeDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.cakeDetailOutput = await CakeGroup.cakeDetailsCall.call(
        key: widget.id,
      );

      if ((_model.cakeDetailOutput?.succeeded ?? true)) {
        await Future.wait([
          Future(() async {
            _model.cakePhotoOutput =
                await ResourceLevalGroup.resourcePhotoCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__photoViewer\",\"cursor\":{\"parentRecordKey\":\"${CakeGroup.cakeDetailsCall.resourceId(
                (_model.cakeDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[0]}',
            );
          }),
          Future(() async {
            _model.cakeSectionNameOutput =
                await CakeGroup.cakeItemSectionsCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__bakeryItemsTypeCursor\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeDelivery =
                await ResourceLevalGroup.resourceDeliveryCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__resourceDeliveryUIGrid\",\"cursor\":{\"parentRecordKey\":\"${CakeGroup.cakeDetailsCall.resourceId(
                (_model.cakeDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeOpsHourOutput =
                await ResourceLevalGroup.resourceopHoursCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__hoursGrid\",\"cursor\":{\"parentRecordKey\":\"${CakeGroup.cakeDetailsCall.resourceId(
                (_model.cakeDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeReviewOutput =
                await ResourceLevalGroup.resourcereviewCall.call(
              query:
                  '{\"clientId\":\"viewCakeDetail__resourceReviewGrid\",\"cursor\":{\"parentRecordKey\":\"${CakeGroup.cakeDetailsCall.resourceId(
                (_model.cakeDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeCancllationPolicyOutput =
                await ResourceLevalGroup.resourceCancellationPolicyCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__ResourceCancellationPolicyUI1\",\"cursor\":{\"parentRecordKey\":\"${CakeGroup.cakeDetailsCall.resourceId(
                (_model.cakeDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeSimillarOutput =
                await CakeGroup.cakeSimilarVendorCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__similarBakeryGrid\",\"cursor\":{\"dist\":\"${functions.distanceSelectionConverter(FFAppState().distance)}\",\"parentRecordKey\":\"${widget.id}\"},\"selection\":[],\"currentPage\":1}',
            );
          }),
          Future(() async {
            _model.cakeAwardOutput =
                await ResourceLevalGroup.resourceAwardCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__resourceAwardUIGrid\",\"cursor\":{\"parentRecordKey\":\"${CakeGroup.cakeDetailsCall.resourceId(
                (_model.cakeDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeFAQapiResponce =
                await ResourceLevalGroup.resourceFAQCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__resourceFaqUIGrid\",\"cursor\":{\"parentRecordKey\":\"${CakeGroup.cakeDetailsCall.resourceId(
                (_model.cakeDetailOutput?.jsonBody ?? ''),
              )}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeFlavors = await CakeGroup.cakeFlavorsCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__ListOfValuesInNColumnsUIComponentInGridcakeFlavorsCursor\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeFilling = await CakeGroup.cakeFillingCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__ListOfValuesInNColumnsUIComponentInGridcakeFillingsCursor\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeShape = await CakeGroup.cakeShapesCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__ListOfValuesInNColumnsUIComponentInGridcakeShapesCursor\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeSizes = await CakeGroup.cakeSizesCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__ListOfValuesInNColumnsUIComponentInGridcakeSizesCursor\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeColors = await CakeGroup.cakeColorsCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__ListOfValuesInNColumnsUIComponentInGridcakeColorsCursor\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeIcing = await CakeGroup.cakeIcingCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__ListOfValuesInNColumnsUIComponentInGridcakeIcingsCursor\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
            );
          }),
          Future(() async {
            _model.cakeCustomSection =
                await CakeGroup.bakeryMenuSectionsCall.call(
              clientState:
                  '{\"clientId\":\"viewCakeDetail__bakeryMenuSectionsGridCursor\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
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
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController6 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController7 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController8 =
        ExpandableController(initialExpanded: false);
    _model.expandablePaymentExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController9 =
        ExpandableController(initialExpanded: false);
    _model.expandablePaymentExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController10 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController11 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController12 =
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
                                        CakeGroup.cakeDetailsCall.name(
                                          (_model.cakeDetailOutput?.jsonBody ??
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
                                        CakeGroup.cakeDetailsCall
                                            .foodProviderType(
                                          (_model.cakeDetailOutput?.jsonBody ??
                                              ''),
                                        ),
                                        'foodProviderCategory',
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
                                    (_model.cakeDetailOutput?.jsonBody ?? ''),
                                    r'''$.details[:]['celebrationTypes']''',
                                  )))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              CakeGroup.cakeDetailsCall
                                                  .celebrationTypes(
                                                (_model.cakeDetailOutput
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
                                              CakeGroup.cakeDetailsCall.price(
                                                (_model.cakeDetailOutput
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
                                          CakeGroup.cakeDetailsCall.rank(
                                            (_model.cakeDetailOutput
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
                                    (_model.cakeDetailOutput?.jsonBody ?? ''),
                                    r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-busPartyIdentifier-_-description']''',
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
                                            input: CakeGroup.cakeDetailsCall
                                                .description(
                                              (_model.cakeDetailOutput
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
                                                    'drs5zpts' /* Photo */,
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
                                                    'gw44l32u' /* Map */,
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
                                                if ((_model.cakePhotoOutput
                                                        ?.succeeded ??
                                                    true))
                                                  Builder(
                                                    builder: (context) {
                                                      final imagePath =
                                                          ResourceLevalGroup
                                                                  .resourcePhotoCall
                                                                  .imageUrl(
                                                                    (_model.cakePhotoOutput
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
                                                                  return ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: Image
                                                                        .network(
                                                                      functions.validateAndFormatUrl(
                                                                          imagePathItem,
                                                                          FFDevEnvironmentValues()
                                                                              .BaseUrl)!,
                                                                      width: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.png',
                                                                        width: double
                                                                            .infinity,
                                                                        fit: BoxFit
                                                                            .cover,
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
                                                if (!(_model.cakePhotoOutput
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
                                                        CakeGroup
                                                            .cakeDetailsCall
                                                            .detail(
                                                              (_model.cakeDetailOutput
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
                              if (CakeGroup.cakeDetailsCall
                                      .hideCustomizeCakeButton(
                                    (_model.cakeDetailOutput?.jsonBody ?? ''),
                                  ) ==
                                  'false') {
                                return false;
                              } else if (CakeGroup.cakeDetailsCall
                                      .readymadeCakeCount(
                                    (_model.cakeDetailOutput?.jsonBody ?? ''),
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
                                                  'cake',
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
                                                  'cake',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '9xln80l7' /* Inquiry to Book */,
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
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleMediumIsCustom,
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
                            if (CakeGroup.cakeDetailsCall
                                    .hideCustomizeCakeButton(
                                  (_model.cakeDetailOutput?.jsonBody ?? ''),
                                ) ==
                                'false')
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
                                          _model.customizeAction =
                                              await CustomCakeGroup
                                                  .customizeActionCall
                                                  .call(
                                            token: FFAppState().SessionToken,
                                            parentRecordKey: '380',
                                            clientState:
                                                '{\"clientId\":\"viewCakeDetail__menuSectionsGrid\",\"cursor\":{\"parentRecordKey\":\"380\"},\"selection\":[]}',
                                          );

                                          if ((_model
                                                  .customizeAction?.succeeded ??
                                              true)) {
                                            if (CustomCakeGroup
                                                    .customizeActionCall
                                                    .action(
                                                  (_model.customizeAction
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                'redirect') {
                                              if (functions
                                                      .extractParamsFromCustomCake(
                                                          CustomCakeGroup
                                                              .customizeActionCall
                                                              .url(
                                                        (_model.customizeAction
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))
                                                      .firstTab ==
                                                  'itemDetailsTab') {
                                                context.pushNamed(
                                                  EventReadOnlyPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'recordKey': serializeParam(
                                                      functions
                                                          .extractParamsFromCustomCake(
                                                              CustomCakeGroup
                                                                  .customizeActionCall
                                                                  .url(
                                                            (_model.customizeAction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ))
                                                          .recordKey,
                                                      ParamType.String,
                                                    ),
                                                    'type': serializeParam(
                                                      widget.id,
                                                      ParamType.String,
                                                    ),
                                                    'packageId': serializeParam(
                                                      '-1',
                                                      ParamType.String,
                                                    ),
                                                    'customCake':
                                                        serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  EventInfoForShoppingCartWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'recordKey': serializeParam(
                                                      functions
                                                          .extractParamsFromCustomCake(
                                                              CustomCakeGroup
                                                                  .customizeActionCall
                                                                  .url(
                                                            (_model.customizeAction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ))
                                                          .recordKey,
                                                      ParamType.String,
                                                    ),
                                                    'type': serializeParam(
                                                      widget.id,
                                                      ParamType.String,
                                                    ),
                                                    'packageId': serializeParam(
                                                      '-1',
                                                      ParamType.String,
                                                    ),
                                                    'customCake':
                                                        serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            } else {
                                              context.pushNamed(
                                                AnonymousLoginGuestUIWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'params': serializeParam(
                                                    functions.mapParams(
                                                        CustomCakeGroup
                                                            .customizeActionCall
                                                            .act(
                                                              (_model.customizeAction
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .firstOrNull!),
                                                    ParamType.DataStruct,
                                                    isList: true,
                                                  ),
                                                  'recordKey': serializeParam(
                                                    functions
                                                        .mapParams(CustomCakeGroup
                                                            .customizeActionCall
                                                            .act(
                                                              (_model.customizeAction
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .firstOrNull!)
                                                        .where((e) =>
                                                            e.id == 'index')
                                                        .toList()
                                                        .firstOrNull
                                                        ?.name,
                                                    ParamType.String,
                                                  ),
                                                  'type': serializeParam(
                                                    '1',
                                                    ParamType.String,
                                                  ),
                                                  'packageId': serializeParam(
                                                    '-1',
                                                    ParamType.String,
                                                  ),
                                                  'customCake': serializeParam(
                                                    true,
                                                    ParamType.bool,
                                                  ),
                                                  'spaceId': serializeParam(
                                                    functions
                                                        .mapParams(CustomCakeGroup
                                                            .customizeActionCall
                                                            .act(
                                                              (_model.customizeAction
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .firstOrNull!)
                                                        .where((e) =>
                                                            e.id ==
                                                            'parentRecordKey')
                                                        .toList()
                                                        .firstOrNull
                                                        ?.name,
                                                    ParamType.String,
                                                  ),
                                                  'denominatorId':
                                                      serializeParam(
                                                    false,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          }

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'iyf26uj5' /* Order Custom Cake */,
                                        ),
                                        icon: Icon(
                                          Icons.shopping_cart,
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
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleMediumIsCustom,
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
                                                              CakeGroup
                                                                  .cakeDetailsCall
                                                                  .email(
                                                                (_model.cakeDetailOutput
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
                                              'q4grti7g' /* Email */,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
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
                                                CakeGroup.cakeDetailsCall.phone(
                                                  (_model.cakeDetailOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                '0',
                                              ),
                                            ));
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'deh2pxt3' /* Call */,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
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
                                            await launchURL(CakeGroup
                                                .cakeDetailsCall
                                                .website(
                                              (_model.cakeDetailOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )!);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'mhtaz1nm' /* Website */,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
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
                                            CakeGroup.cakeDetailsCall.location(
                                              (_model.cakeDetailOutput
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
                                                  CakeGroup.cakeDetailsCall
                                                      .location(
                                                    (_model.cakeDetailOutput
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
                            if (functions.checkJsonValue(getJsonField(
                              (_model.cakeDetailOutput?.jsonBody ?? ''),
                              r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
                            )))
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
                                                      '0mudicib' /* About this Bakery */,
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
                                              ],
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (functions.checkJsonValue(
                                                    getJsonField(
                                                  (_model.cakeDetailOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
                                                )))
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
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .descriptionCompModel2,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              DescriptionCompWidget(
                                                            input: CakeGroup
                                                                .cakeDetailsCall
                                                                .longDescription(
                                                              (_model.cakeDetailOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (functions.checkJsonValue(
                                                    getJsonField(
                                                  (_model.cakeDetailOutput
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
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'hp0frn46' /* Minimum time for booking requi... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .roboto(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                CakeGroup
                                                                    .cakeDetailsCall
                                                                    .minTImeTOBook(
                                                                  (_model.cakeDetailOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                '0 Days',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 6.0)),
                                                  ),
                                                if (functions.checkJsonValue(
                                                    getJsonField(
                                                  (_model.cakeDetailOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.details[:]['themes']''',
                                                )))
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'zh66shx5' /* Available Theme : */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: CakeGroup
                                                                  .cakeDetailsCall
                                                                  .themes(
                                                                (_model.cakeDetailOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                if (functions.checkJsonValue(
                                                    getJsonField(
                                                  (_model.cakeDetailOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.details[:]['menuSectionCategories']''',
                                                )))
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '5p1fyqjf' /* Bakery Type :  */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                CakeGroup
                                                                    .cakeDetailsCall
                                                                    .foodProviderType(
                                                                  (_model.cakeDetailOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                'Bakery',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                if (functions.checkJsonValue(
                                                    getJsonField(
                                                  (_model.cakeDetailOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.details[:]['menuSectionNames']''',
                                                )))
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'xrnrg4lt' /* Menu Section Names :  */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                CakeGroup
                                                                    .cakeDetailsCall
                                                                    .menuSectionNames(
                                                                  (_model.cakeDetailOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                'Section Names',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                if (functions.checkJsonValue(
                                                    getJsonField(
                                                  (_model.cakeDetailOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.details[:]['"specialities']''',
                                                )))
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'ml819x9c' /* Speciality :  */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                CakeGroup
                                                                    .cakeDetailsCall
                                                                    .specialities(
                                                                  (_model.cakeDetailOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                'Section Names',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                            if ((_model.cakeSectionNameOutput?.succeeded ??
                                true))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (valueOrDefault<String>(
                                          CakeGroup.cakeDetailsCall
                                              .readymadeCakeCount(
                                            (_model.cakeDetailOutput
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
                                                      '2ymh8yl2' /* Cake Items */,
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
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
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
                                                final sectionName = CakeGroup
                                                        .cakeItemSectionsCall
                                                        .value(
                                                          (_model.cakeSectionNameOutput
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
                                                  itemCount: sectionName.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 10.0),
                                                  itemBuilder: (context,
                                                      sectionNameIndex) {
                                                    final sectionNameItem =
                                                        sectionName[
                                                            sectionNameIndex];
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
                                                                            CakeItemWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'id': serializeParam(
                                                                                widget.id,
                                                                                ParamType.String,
                                                                              ),
                                                                              'name': serializeParam(
                                                                                Uri.encodeComponent(sectionNameItem),
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
                                                                                  sectionNameItem,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.plusJakartaSans(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                  CakeItemWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'id': serializeParam(
                                                                                      widget.id,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'name': serializeParam(
                                                                                      Uri.encodeComponent(sectionNameItem),
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
                            if ((_model.cakeFlavors?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (CakeGroup.cakeFlavorsCall.detail(
                                            (_model.cakeFlavors?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (CakeGroup.cakeFlavorsCall.detail(
                                        (_model.cakeFlavors?.jsonBody ?? ''),
                                      ))!
                                          .isNotEmpty)
                                    Column(
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
                                                  .expandableExpandableController2,
                                              child: ExpandablePanel(
                                                header: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                        Icons.cake,
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
                                                        '9ov4laze' /* Flavors */,
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
                                                  child:
                                                      ReadOnlyChopChipsWidget(
                                                    parameter1: CakeGroup
                                                        .cakeFlavorsCall
                                                        .name(
                                                      (_model.cakeFlavors
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            if ((_model.cakeFilling?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (CakeGroup.cakeFillingCall.detail(
                                            (_model.cakeFilling?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (CakeGroup.cakeFillingCall.detail(
                                        (_model.cakeFilling?.jsonBody ?? ''),
                                      ))!
                                          .isNotEmpty)
                                    Column(
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
                                                        Icons.cake,
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
                                                        'by4o4ucx' /* Filling */,
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
                                                      parameter1: CakeGroup
                                                          .cakeFillingCall
                                                          .name(
                                                        (_model.cakeFilling
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            if ((_model.cakeShape?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (CakeGroup.cakeShapesCall.detail(
                                            (_model.cakeShape?.jsonBody ?? ''),
                                          ) !=
                                          null &&
                                      (CakeGroup.cakeShapesCall.detail(
                                        (_model.cakeShape?.jsonBody ?? ''),
                                      ))!
                                          .isNotEmpty)
                                    Column(
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
                                                        Icons.cake,
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
                                                        '9bfsfebg' /* Shape */,
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
                                                        .readOnlyChopChipsModel3,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        ReadOnlyChopChipsWidget(
                                                      parameter1: CakeGroup
                                                          .cakeShapesCall
                                                          .name(
                                                        (_model.cakeShape
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            if ((_model.cakeIcing?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (CakeGroup.cakeIcingCall.detail(
                                            (_model.cakeIcing?.jsonBody ?? ''),
                                          ) !=
                                          null &&
                                      (CakeGroup.cakeIcingCall.detail(
                                        (_model.cakeIcing?.jsonBody ?? ''),
                                      ))!
                                          .isNotEmpty)
                                    Column(
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
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                        Icons.cake,
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
                                                        'extt0t9e' /* Icing */,
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
                                                        .readOnlyChopChipsModel4,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        ReadOnlyChopChipsWidget(
                                                      parameter1: CakeGroup
                                                          .cakeIcingCall
                                                          .name(
                                                        (_model.cakeIcing
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            if ((_model.cakeSizes?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (CakeGroup.cakeSizesCall.detail(
                                            (_model.cakeSizes?.jsonBody ?? ''),
                                          ) !=
                                          null &&
                                      (CakeGroup.cakeSizesCall.detail(
                                        (_model.cakeSizes?.jsonBody ?? ''),
                                      ))!
                                          .isNotEmpty)
                                    Column(
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
                                                  .expandableExpandableController6,
                                              child: ExpandablePanel(
                                                header: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                        Icons.cake,
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
                                                        '9f59bonb' /* Sizes */,
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
                                                        .readOnlyChopChipsModel5,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        ReadOnlyChopChipsWidget(
                                                      parameter1: CakeGroup
                                                          .cakeSizesCall
                                                          .name(
                                                        (_model.cakeSizes
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            if ((_model.cakeColors?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (CakeGroup.cakeColorsCall.detail(
                                            (_model.cakeColors?.jsonBody ?? ''),
                                          ) !=
                                          null &&
                                      (CakeGroup.cakeColorsCall.detail(
                                        (_model.cakeColors?.jsonBody ?? ''),
                                      ))!
                                          .isNotEmpty)
                                    Column(
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
                                                  .expandableExpandableController7,
                                              child: ExpandablePanel(
                                                header: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                        Icons.cake,
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
                                                        'e59pc7e9' /* Colors */,
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
                                                        .readOnlyChopChipsModel6,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        ReadOnlyChopChipsWidget(
                                                      parameter1: CakeGroup
                                                          .cakeColorsCall
                                                          .name(
                                                        (_model.cakeColors
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            if ((_model.cakeCustomSection?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (CakeGroup.bakeryMenuSectionsCall.details(
                                            (_model.cakeCustomSection
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (CakeGroup.bakeryMenuSectionsCall.details(
                                        (_model.cakeCustomSection?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty)
                                    Column(
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
                                                  .expandableExpandableController8,
                                              child: ExpandablePanel(
                                                header: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                        Icons.cake,
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
                                                        '4doty6xo' /* Custom */,
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
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .readOnlyChopChipsModel7,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            ReadOnlyChopChipsWidget(
                                                          parameter1: CakeGroup
                                                              .bakeryMenuSectionsCall
                                                              .name(
                                                            (_model.cakeCustomSection
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            if ((_model.cakeDelivery?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (ResourceLevalGroup.resourceDeliveryCall
                                              .details(
                                            (_model.cakeDelivery?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ResourceLevalGroup.resourceDeliveryCall
                                              .details(
                                        (_model.cakeDelivery?.jsonBody ?? ''),
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
                                                          'n99inxl7' /* Delivery Info */,
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
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
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
                                                                        (_model.cakeDelivery?.jsonBody ??
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
                                                                    'Keyh9t_${develiveryItemIndex.toString()}',
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
                            if ((_model.cakeOpsHourOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (ResourceLevalGroup.resourceopHoursCall
                                              .details(
                                            (_model.cakeOpsHourOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ResourceLevalGroup.resourceopHoursCall
                                              .details(
                                        (_model.cakeOpsHourOutput?.jsonBody ??
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
                                                  .expandableExpandableController9,
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
                                                            'mooowoww' /* Hours */,
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
                                                              (_model.cakeOpsHourOutput
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
                                                                  '8hyz8gph' /* Regular Hours */,
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
                                                                          (_model.cakeOpsHourOutput?.jsonBody ??
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
                                                              (_model.cakeOpsHourOutput
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
                                                                  '5kz7ivdu' /* Celebration Hours */,
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
                                                                          (_model.cakeOpsHourOutput?.jsonBody ??
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
                                    (_model.cakeDetailOutput?.jsonBody ?? ''),
                                    r'''$.details[:]['creditCardAccepted']''',
                                  ))) {
                                    return true;
                                  } else if (functions
                                      .checkJsonValue(getJsonField(
                                    (_model.cakeDetailOutput?.jsonBody ?? ''),
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
                                                            'nv0y0bpe' /* Payment */,
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
                                                                  CakeGroup
                                                                      .cakeDetailsCall
                                                                      .credictCardAccpted(
                                                                    (_model.cakeDetailOutput
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
                                                                  CakeGroup
                                                                      .cakeDetailsCall
                                                                      .paymentModes(
                                                                    (_model.cakeDetailOutput
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
                            if ((_model.cakeReviewOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (functions.checkListOfDynamic(getJsonField(
                                    (_model.cakeReviewOutput?.jsonBody ?? ''),
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
                                                    .expandableExpandableController10,
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
                                                            '97gpuazb' /* Review & Rating */,
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
                                                                        (_model.cakeReviewOutput?.jsonBody ??
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
                                                                      'Keyqzx_${getJsonField(
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
                            if ((_model
                                    .cakeCancllationPolicyOutput?.succeeded ??
                                true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (functions.checkListOfDynamic(getJsonField(
                                    (_model.cakeCancllationPolicyOutput
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
                                                        .expandableExpandableController11,
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
                                                              'ad2m9va5' /* Booking Policies */,
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
                                                                    (_model.cakeCancllationPolicyOutput
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
                            if ((_model.cakeFAQapiResponce?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (ResourceLevalGroup.resourceFAQCall
                                              .details(
                                            (_model.cakeFAQapiResponce
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ResourceLevalGroup.resourceFAQCall
                                              .details(
                                        (_model.cakeFAQapiResponce?.jsonBody ??
                                            ''),
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
                                                                (_model.cakeFAQapiResponce
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              name:
                                                                  valueOrDefault<
                                                                      String>(
                                                                CakeGroup
                                                                    .cakeDetailsCall
                                                                    .name(
                                                                  (_model.cakeDetailOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                'Name',
                                                              ),
                                                              venueType: CakeGroup
                                                                  .cakeDetailsCall
                                                                  .celebrationTypes(
                                                                (_model.cakeDetailOutput
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
                                                              '2i29dc9j' /* Frequently Asked Questions */,
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
                            if ((_model.cakeSimillarOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (CakeGroup.cakeSimilarVendorCall.details(
                                            (_model.cakeSimillarOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (CakeGroup.cakeSimilarVendorCall.details(
                                        (_model.cakeSimillarOutput?.jsonBody ??
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
                                                    '57mqjixh' /* Similar */,
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
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Builder(
                                            builder: (context) {
                                              final similarVenueDetails =
                                                  CakeGroup
                                                          .cakeSimilarVendorCall
                                                          .details(
                                                            (_model.cakeSimillarOutput
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
                                                          CakeDetailsWidget
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
                                                          similarVenueDetailsIndex
                                                              .toString(),
                                                          similarVenueDetailsIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            SimilarVendorCompWidget(
                                                          key: Key(
                                                            'Key1bb_${similarVenueDetailsIndex.toString()}',
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
                            if ((_model.cakeAwardOutput?.succeeded ?? true))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (functions.checkListOfDynamic(getJsonField(
                                    (_model.cakeAwardOutput?.jsonBody ?? ''),
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
                                                    .expandableExpandableController12,
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
                                                            'mmvh4x05' /* Awards */,
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
                                                                          (_model.cakeAwardOutput?.jsonBody ??
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
                                                                        'Key3w7_${itemwIndex.toString()}',
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
                                      ],
                                    ),
                                ].divide(SizedBox(height: 3.0)),
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
