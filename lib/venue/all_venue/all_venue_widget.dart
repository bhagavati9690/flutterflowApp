import '/backend/api_requests/api_calls.dart';
import '/compoents/allvendor_search_comp/distance_comp/distance_comp_widget.dart';
import '/compoents/allvendor_search_comp/loading_comp/loading_comp_widget.dart';
import '/compoents/allvendor_search_comp/location_change_comp/location_change_comp_widget.dart';
import '/compoents/allvendor_search_comp/map_venue/map_venue_widget.dart';
import '/compoents/allvendor_search_comp/place_activity_comp/place_activity_comp_widget.dart';
import '/compoents/allvendor_search_comp/view_by_comp/view_by_comp_widget.dart';
import '/compoents/common_comp/error_compoent/error_compoent_widget.dart';
import '/compoents/common_comp/image_error_compoent/image_error_compoent_widget.dart';
import '/compoents/common_comp/page_viewc_o_m_p/page_viewc_o_m_p_widget.dart';
import '/compoents/common_comp/rating_comp/rating_comp_widget.dart';
import '/compoents/venue_comp/venue_filter_comp/venue_filter_comp_widget.dart';
import '/components/location_search_comp_all_vendor_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'all_venue_model.dart';
export 'all_venue_model.dart';

class AllVenueWidget extends StatefulWidget {
  const AllVenueWidget({
    super.key,
    String? venueSearchQuery,
    this.venueTypeAgg,
    this.ageRangeAgg,
    this.activityTypeAgg,
    this.sportstypeAgg,
    this.placeTypeSelection,
    String? selectedDistance,
  })  : this.venueSearchQuery = venueSearchQuery ?? '*',
        this.selectedDistance = selectedDistance ?? '';

  final String venueSearchQuery;
  final List<String>? venueTypeAgg;
  final List<String>? ageRangeAgg;
  final List<String>? activityTypeAgg;
  final List<String>? sportstypeAgg;
  final String? placeTypeSelection;
  final String selectedDistance;

  static String routeName = 'allVenue';
  static String routePath = 'allVenue';

  @override
  State<AllVenueWidget> createState() => _AllVenueWidgetState();
}

class _AllVenueWidgetState extends State<AllVenueWidget> {
  late AllVenueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllVenueModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (widget.activityTypeAgg != null &&
              (widget.activityTypeAgg)!.isNotEmpty) {
            _model.activityTypeAggregation =
                widget.activityTypeAgg!.toList().cast<String>();
          }
        }),
        Future(() async {
          if (widget.ageRangeAgg != null &&
              (widget.ageRangeAgg)!.isNotEmpty) {
            _model.ageRangeAggregation =
                widget.ageRangeAgg!.toList().cast<String>();
          }
        }),
        Future(() async {
          if (widget.placeTypeSelection != null &&
              widget.placeTypeSelection != '') {
            _model.placeTypeSelectedId = widget.placeTypeSelection;
          }
        }),
        Future(() async {
          if (widget.sportstypeAgg != null &&
              (widget.sportstypeAgg)!.isNotEmpty) {
            _model.sportstypeAggregation =
                widget.sportstypeAgg!.toList().cast<String>();
          }
        }),
        Future(() async {
          if (widget.venueTypeAgg != null &&
              (widget.venueTypeAgg)!.isNotEmpty) {
            _model.venueAggregation =
                widget.venueTypeAgg!.toList().cast<String>();
          }
        }),
      ]);
      safeSetState(() {
        _model.venueSearchFieldTextController?.text =
            (widget.venueSearchQuery == '*' ? '' : widget.venueSearchQuery);
      });
      _model.searchuery = valueOrDefault<String>(
        widget.venueSearchQuery,
        '*',
      );
      _model.showSerchResult = false;
      safeSetState(() {});
      _model.pageLoad = true;
      safeSetState(() {});
    });

    _model.venueSearchFieldTextController ??= TextEditingController(
        text: _model.searchuery == '*' ? '' : _model.searchuery);
    _model.venueSearchFieldFocusNode ??= FocusNode();

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFE3F333),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 98.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 2.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showAlignedDialog(
                                        context: context,
                                        isGlobal: false,
                                        avoidOverflow: true,
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: WebViewAware(
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.99,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.99,
                                                  child:
                                                      LocationChangeCompWidget(
                                                    latitude:
                                                        FFAppState().latitude,
                                                    longitude:
                                                        FFAppState().longituade,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() =>
                                          _model.locationUpdateOutput = value));

                                      _model.assignLocation =
                                          await AccountInfoGroup
                                              .assignLocationCall
                                              .call(
                                        country: _model.locationUpdateOutput
                                                        ?.country !=
                                                    null &&
                                                _model.locationUpdateOutput
                                                        ?.country !=
                                                    ''
                                            ? _model
                                                .locationUpdateOutput?.country
                                            : FFAppState().country,
                                        postalCode: _model.locationUpdateOutput
                                                        ?.postalCode !=
                                                    null &&
                                                _model.locationUpdateOutput
                                                        ?.postalCode !=
                                                    ''
                                            ? _model.locationUpdateOutput
                                                ?.postalCode
                                            : FFAppState().pincode,
                                        geometrycoordinates0: _model
                                                    .locationUpdateOutput
                                                    ?.longitude !=
                                                null
                                            ? _model
                                                .locationUpdateOutput?.longitude
                                            : FFAppState().longituade,
                                        geometrycoordinates1: _model
                                                    .locationUpdateOutput
                                                    ?.latitude !=
                                                null
                                            ? _model
                                                .locationUpdateOutput?.latitude
                                            : FFAppState().latitude,
                                        stateProvince: _model
                                                        .locationUpdateOutput
                                                        ?.region !=
                                                    null &&
                                                _model.locationUpdateOutput
                                                        ?.region !=
                                                    ''
                                            ? _model
                                                .locationUpdateOutput?.region
                                            : FFAppState().region,
                                        cityTown: _model.locationUpdateOutput
                                                        ?.place !=
                                                    null &&
                                                _model.locationUpdateOutput
                                                        ?.place !=
                                                    ''
                                            ? _model.locationUpdateOutput?.place
                                            : FFAppState().place,
                                        token: FFAppState().SessionToken,
                                      );

                                      if ((_model.assignLocation?.succeeded ??
                                          true)) {
                                        FFAppState().latitude = _model
                                                    .locationUpdateOutput
                                                    ?.latitude !=
                                                null
                                            ? _model
                                                .locationUpdateOutput!.latitude
                                            : FFAppState().latitude;
                                        FFAppState().longituade = _model
                                                    .locationUpdateOutput
                                                    ?.longitude !=
                                                null
                                            ? _model
                                                .locationUpdateOutput!.longitude
                                            : FFAppState().longituade;
                                        FFAppState().place = _model
                                                        .locationUpdateOutput
                                                        ?.place !=
                                                    null &&
                                                _model.locationUpdateOutput
                                                        ?.place !=
                                                    ''
                                            ? _model.locationUpdateOutput!.place
                                            : FFAppState().place;
                                        FFAppState().pincode = _model
                                                        .locationUpdateOutput
                                                        ?.postalCode !=
                                                    null &&
                                                _model.locationUpdateOutput
                                                        ?.postalCode !=
                                                    ''
                                            ? _model.locationUpdateOutput!
                                                .postalCode
                                            : FFAppState().pincode;
                                        FFAppState().country = _model
                                                        .locationUpdateOutput
                                                        ?.country !=
                                                    null &&
                                                _model.locationUpdateOutput
                                                        ?.country !=
                                                    ''
                                            ? _model
                                                .locationUpdateOutput!.country
                                            : FFAppState().country;
                                        FFAppState().region = _model
                                                        .locationUpdateOutput
                                                        ?.region !=
                                                    null &&
                                                _model.locationUpdateOutput
                                                        ?.region !=
                                                    ''
                                            ? _model
                                                .locationUpdateOutput!.region
                                            : FFAppState().region;
                                        FFAppState().SessionToken = (_model
                                                .assignLocation
                                                ?.getHeader('cbxtoken') ??
                                            '');
                                        _model.visibleTabResponse =
                                            await VisibleTabCall.call(
                                          state: _model.locationUpdateOutput
                                                          ?.region !=
                                                      null &&
                                                  _model.locationUpdateOutput
                                                          ?.region !=
                                                      ''
                                              ? _model
                                                  .locationUpdateOutput?.region
                                              : FFAppState().region,
                                          token: FFAppState().SessionToken,
                                        );

                                        if ((_model.visibleTabResponse
                                                ?.succeeded ??
                                            true)) {
                                          FFAppState().rentalVisible =
                                              functions.stringToBool(
                                                  VisibleTabCall.rental(
                                            (_model.visibleTabResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ));
                                          FFAppState().entertainerVisible =
                                              functions.stringToBool(
                                                  VisibleTabCall.entertainer(
                                            (_model.visibleTabResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ));
                                          FFAppState().cakeVisible = functions
                                              .stringToBool(VisibleTabCall.cake(
                                            (_model.visibleTabResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ));
                                        }
                                      }
                                      safeSetState(() => _model
                                          .venueListViewPagingController
                                          ?.refresh());
                                      await _model
                                          .waitForOnePageForVenueListView();

                                      safeSetState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model
                                          .locationSearchCompAllVendorModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child:
                                          LocationSearchCompAllVendorWidget(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: WebViewAware(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              child: DistanceCompWidget(),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.distanceSelection = value));

                                  if (_model.distanceSelection != null &&
                                      _model.distanceSelection != '') {
                                    FFAppState().distance =
                                        _model.distanceSelection!;
                                    safeSetState(() => _model
                                        .venueListViewPagingController
                                        ?.refresh());
                                  }

                                  safeSetState(() {});
                                },
                                text: valueOrDefault<String>(
                                  FFAppState().distance,
                                  'Distance',
                                ),
                                icon: FaIcon(
                                  FontAwesomeIcons.streetView,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.064,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      7.0, 0.0, 7.0, 0.0),
                                  iconPadding: EdgeInsets.all(0.0),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ]
                              .divide(SizedBox(width: 4.0))
                              .addToStart(SizedBox(width: 3.0))
                              .addToEnd(SizedBox(width: 3.0)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 7.0, 4.0, 0.0),
                          child: TextFormField(
                            controller: _model.venueSearchFieldTextController,
                            focusNode: _model.venueSearchFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.venueSearchFieldTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.showSerchResult = _model.venueSearchFieldTextController
                                            .text !=
                                        '';
                                _model.searchuery = valueOrDefault<String>(
                                  _model.venueSearchFieldTextController
                                                  .text !=
                                              ''
                                      ? valueOrDefault<String>(
                                          _model.venueSearchFieldTextController
                                              .text,
                                          '*',
                                        )
                                      : '*',
                                  '*',
                                );
                                safeSetState(() => _model
                                    .venueListViewPagingController
                                    ?.refresh());
                                safeSetState(
                                    () => _model.apiRequestCompleter1 = null);
                              },
                            ),
                            onFieldSubmitted: (_) async {
                              _model.showSerchResult = false;
                              _model.searchuery = valueOrDefault<String>(
                                _model.venueSearchFieldTextController
                                                .text !=
                                            ''
                                    ? _model.venueSearchFieldTextController.text
                                    : '*',
                                '*',
                              );
                              safeSetState(() => _model
                                  .venueListViewPagingController
                                  ?.refresh());
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'awh4mr7s' /* Search */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'etyu5c0t' /* Search for venues... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              prefixIcon: Icon(
                                Icons.search_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              suffixIcon: _model.venueSearchFieldTextController!
                                      .text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.venueSearchFieldTextController
                                            ?.clear();
                                        _model.showSerchResult = _model.venueSearchFieldTextController
                                                    .text !=
                                                '';
                                        _model.searchuery =
                                            valueOrDefault<String>(
                                          _model.venueSearchFieldTextController
                                                          .text !=
                                                      ''
                                              ? valueOrDefault<String>(
                                                  _model
                                                      .venueSearchFieldTextController
                                                      .text,
                                                  '*',
                                                )
                                              : '*',
                                          '*',
                                        );
                                        safeSetState(() => _model
                                            .venueListViewPagingController
                                            ?.refresh());
                                        safeSetState(() =>
                                            _model.apiRequestCompleter1 = null);
                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 21.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            validator: _model
                                .venueSearchFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                1.0, 9.0, 1.0, 9.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        _model.partyplacesList =
                                            await VenuesGroup
                                                .getPartyPlaceTypeCall
                                                .call();

                                        if ((_model
                                                .partyplacesList?.succeeded ??
                                            true)) {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 1.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      child:
                                                          PlaceActivityCompWidget(
                                                        partyListItem: VenuesGroup
                                                            .getPartyPlaceTypeCall
                                                            .details(
                                                          (_model.partyplacesList
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        selected: _model
                                                            .placeTypeSeletedName,
                                                        lable: 'Place/Activity',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.placeSelectionAltertBoxOutput =
                                                  value));

                                          _model.placeTypeSelectedId = _model
                                              .placeSelectionAltertBoxOutput
                                              ?.id;
                                          _model.placeTypeSeletedName = _model
                                              .placeSelectionAltertBoxOutput
                                              ?.name;
                                          safeSetState(() => _model
                                              .venueListViewPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForVenueListView();
                                        }

                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'vtld1taw' /* Place/Activity */,
                                      ),
                                      icon: FaIcon(
                                        FontAwesomeIcons.solidPaperPlane,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        iconPadding: EdgeInsets.all(0.0),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 1.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.5,
                                                    width: double.infinity,
                                                    child: ViewByCompWidget(
                                                      sortOrder:
                                                          _model.sortOrder,
                                                      sortType: _model.sortType,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() =>
                                            _model.viewSelectionOutput =
                                                value));

                                        _model.sortOrder =
                                            _model.viewSelectionOutput != null
                                                ? _model.viewSelectionOutput!
                                                    .sortSelection
                                                : 'desc';
                                        _model.sortType =
                                            valueOrDefault<String>(
                                          functions.viewByConverter(
                                              _model.viewSelectionOutput != null
                                                  ? _model.viewSelectionOutput
                                                      ?.viewSelection
                                                  : 'Relevance'),
                                          'Relevance',
                                        );
                                        safeSetState(() => _model
                                            .venueListViewPagingController
                                            ?.refresh());
                                        await _model
                                            .waitForOnePageForVenueListView();

                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'p9ak7f59' /* Sort By */,
                                      ),
                                      icon: FaIcon(
                                        FontAwesomeIcons.sort,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        iconPadding: EdgeInsets.all(0.0),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'nsjoltf1' /* Filters */,
                                      ),
                                      icon: Icon(
                                        Icons.filter_alt,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  if (_model.placeTypeSeletedName != null &&
                                      _model.placeTypeSeletedName != '')
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: _model.placeTypeSeletedName!,
                                      icon: Icon(
                                        Icons.close_sharp,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.04,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        iconAlignment: IconAlignment.end,
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: _model.pageLoad,
                              child: PagedListView<ApiPagingParams,
                                  dynamic>.separated(
                                pagingController:
                                    _model.setVenueListViewController(
                                  (nextPageMarker) =>
                                      VenuesGroup.getAllVenuesCall.call(
                                    filters: functions.venueFilterInputFunction(
                                        functions.distanceSelectionConverter(
                                            FFAppState().distance),
                                        functions
                                            .topFilterTypeSelectionConverter(_model.venueAggregation
                                                .toList())
                                            ?.unique((e) => e)
                                            .toList(),
                                        functions
                                            .topFilterTypeSelectionConverter(
                                                _model.activityTypeAggregation
                                                    .toList())
                                            ?.unique((e) => e)
                                            .toList(),
                                        functions
                                            .topFilterTypeSelectionConverter(
                                                _model.sportstypeAggregation
                                                    .toList())
                                            ?.unique((e) => e)
                                            .toList(),
                                        functions
                                            .topFilterTypeSelectionConverter(
                                                _model.pricefactorAggregation
                                                    .toList())
                                            ?.unique((e) => e)
                                            .toList(),
                                        functions
                                            .topFilterTypeSelectionConverter(
                                                _model.rankingAggregation
                                                    .toList())
                                            ?.unique((e) => e)
                                            .toList(),
                                        functions
                                            .topFilterTypeSelectionConverter(_model.ageRangeAggregation.toList())
                                            ?.unique((e) => e)
                                            .toList(),
                                        functions.topFilterTypeSelectionConverter(_model.townAggregation.toList())?.unique((e) => e).toList(),
                                        functions.topFilterTypeSelectionConverter(_model.capacityAggregation.toList())?.unique((e) => e).toList(),
                                        functions.topFilterTypeSelectionConverter(_model.demographicsAggregation.toList())?.unique((e) => e).toList(),
                                        _model.placeTypeSelectedId,
                                        FFAppState().latitude,
                                        FFAppState().longituade,
                                        functions.topFilterTypeSelectionConverter(_model.activityCategoryAggregation.toList())?.unique((e) => e).toList()),
                                    searchText: valueOrDefault<String>(
                                      Uri.encodeComponent(_model.searchuery),
                                      '*',
                                    ),
                                    pageNumber:
                                        nextPageMarker.nextPageNumber + 1,
                                    startIndex:
                                        nextPageMarker.nextPageNumber * 20,
                                    limit: 20,
                                    sortQueryJson:
                                        functions.getSortingAttributes(
                                            _model.sortType, _model.sortOrder),
                                    token: FFAppState().SessionToken,
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 6.0),
                                builderDelegate:
                                    PagedChildBuilderDelegate<dynamic>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.9,
                                      child: LoadingCompWidget(),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.9,
                                      child: LoadingCompWidget(),
                                    ),
                                  ),
                                  noItemsFoundIndicatorBuilder: (_) => Center(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.9,
                                      child: ImageErrorCompoentWidget(
                                        image:
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/celebratix-u9fafm/assets/kyqz82poydem/No-Venues-logo.png',
                                      ),
                                    ),
                                  ),
                                  itemBuilder: (context, _, eachVenueIndex) {
                                    final eachVenueItem = _model
                                        .venueListViewPagingController!
                                        .itemList![eachVenueIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.24,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .pageViewcOMPModels
                                                          .getModel(
                                                        getJsonField(
                                                          eachVenueItem,
                                                          r'''$['venueMoreFields-_-resourcePhotos']''',
                                                        ).toString(),
                                                        eachVenueIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: PageViewcOMPWidget(
                                                        key: Key(
                                                          'Keypwg_${getJsonField(
                                                            eachVenueItem,
                                                            r'''$['venueMoreFields-_-resourcePhotos']''',
                                                          ).toString()}',
                                                        ),
                                                        photos: getJsonField(
                                                          eachVenueItem,
                                                          r'''$['venueMoreFields-_-resourcePhotos']''',
                                                          true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 12.0),
                                                child: InkWell(
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
                                                            eachVenueItem,
                                                            r'''$._id''',
                                                          ),
                                                          ParamType.int,
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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                eachVenueItem,
                                                                r'''$.name''',
                                                              )?.toString(),
                                                              'Name',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMediumIsCustom,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                eachVenueItem,
                                                                r'''$.address''',
                                                              )?.toString(),
                                                              'address ',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmallIsCustom,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 2.0)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    1.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Flexible(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              wrapWithModel(
                                                                                model: _model.ratingCompModels.getModel(
                                                                                  valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      eachVenueItem,
                                                                                      r'''$.overallRank''',
                                                                                    )?.toString(),
                                                                                    '0',
                                                                                  ),
                                                                                  eachVenueIndex,
                                                                                ),
                                                                                updateCallback: () => safeSetState(() {}),
                                                                                child: RatingCompWidget(
                                                                                  key: Key(
                                                                                    'Keylgx_${valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        eachVenueItem,
                                                                                        r'''$.overallRank''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    )}',
                                                                                  ),
                                                                                  rank: valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      eachVenueItem,
                                                                                      r'''$.overallRank''',
                                                                                    )?.toString(),
                                                                                    '0',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 2.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.monetization_on_rounded,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    '${getJsonField(
                                                                                      eachVenueItem,
                                                                                      r'''$['venueMoreFields-_-price']''',
                                                                                    ).toString()}',
                                                                                    'Price On Request',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              eachVenueItem,
                                                                              r'''$.venueType''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '${getJsonField(
                                                                                  eachVenueItem,
                                                                                  r'''$['venueMoreFields-_-sportsType']''',
                                                                                ) != null ? '${getJsonField(
                                                                                eachVenueItem,
                                                                                r'''$['venueMoreFields-_-sportsType']''',
                                                                              ).toString()}' : ''}${getJsonField(
                                                                              eachVenueItem,
                                                                              r'''$['venueMoreFields-_-activityType']''',
                                                                            ).toString()}',
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 2.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.24,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
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
                                                                            VenueDetailsWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'venueId': serializeParam(
                                                                                getJsonField(
                                                                                  eachVenueItem,
                                                                                  r'''$._id''',
                                                                                ),
                                                                                ParamType.int,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.bottomToTop,
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          child:
                                                                              Image.network(
                                                                            functions.validateAndFormatUrl(
                                                                                getJsonField(
                                                                                  eachVenueItem,
                                                                                  r'''$.logo''',
                                                                                ).toString(),
                                                                                FFDevEnvironmentValues().BaseUrl)!,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.104,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.png',
                                                                              width: double.infinity,
                                                                              height: MediaQuery.sizeOf(context).height * 0.104,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 114.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Visibility(
                          visible: _model.showSerchResult,
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_model.apiRequestCompleter1 ??=
                                    Completer<ApiCallResponse>()
                                      ..complete(
                                          VenuesGroup.venueSuggestionCall.call(
                                        searchVenueQuery:
                                            valueOrDefault<String>(
                                          Uri.encodeComponent(_model
                                              .venueSearchFieldTextController
                                              .text),
                                          '*',
                                        ),
                                        uiContext:
                                            '{\"key\":\"venueTabContent\",\"params\":{},\"component\":{\"clientId\":\"venueTabContent__venueTopFilterPanel\",\"clientState\":{\"clientId\":\"venueTabContent__venueTopFilterPanel\",\"query\":\"${valueOrDefault<String>(
                                          Uri.encodeComponent(_model
                                              .venueSearchFieldTextController
                                              .text),
                                          '*',
                                        )}\"}}}',
                                        distance: functions
                                            .distanceSelectionConverter(
                                                FFAppState().distance),
                                        token: FFAppState().SessionToken,
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 11.0,
                                    height: 11.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final suggestionListViewVenueSuggestionResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final suggestions =
                                      VenuesGroup.venueSuggestionCall
                                              .text(
                                                suggestionListViewVenueSuggestionResponse
                                                    .jsonBody,
                                              )
                                              ?.unique((e) => e)
                                              .toList() ??
                                          [];
                                  if (suggestions.isEmpty) {
                                    return Center(
                                      child: ErrorCompoentWidget(),
                                    );
                                  }

                                  return ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.0),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: suggestions.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 4.0),
                                    itemBuilder: (context, suggestionsIndex) {
                                      final suggestionsItem =
                                          suggestions[suggestionsIndex];
                                      return Visibility(
                                        visible: VenuesGroup.venueSuggestionCall
                                                .key(
                                                  suggestionListViewVenueSuggestionResponse
                                                      .jsonBody,
                                                )!
                                                .length >=
                                            2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  safeSetState(() {
                                                    _model
                                                        .venueSearchFieldTextController
                                                        ?.text = suggestionsItem;
                                                  });
                                                  _model.searchuery = _model.venueSearchFieldTextController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .venueSearchFieldTextController
                                                          .text
                                                      : '*';
                                                  _model.showSerchResult =
                                                      false;
                                                  safeSetState(() => _model
                                                      .venueListViewPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForVenueListView();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.search,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Text(
                                                              suggestionsItem,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 25.0, 20.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 51.0,
                            fillColor: Color(0xFFFDAB9D),
                            icon: FaIcon(
                              FontAwesomeIcons.map,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              _model.mapoutPut =
                                  await VenuesGroup.getAllVenuesMapCall.call(
                                sortOrderType: _model.sortType,
                                sortOrder: _model.sortOrder,
                                limit: 30,
                                pageNumber: 1,
                                startIndex: 0,
                                searchText: valueOrDefault<String>(
                                  Uri.encodeComponent(_model.searchuery),
                                  '*',
                                ),
                                filters: functions.venueFilterInputFunction(
                                    valueOrDefault<String>(
                                      functions.distanceSelectionConverter(
                                          FFAppState().distance != ''
                                              ? FFAppState().distance
                                              : '25'),
                                      '25',
                                    ),
                                    functions
                                        .topFilterTypeSelectionConverter(
                                            _model.venueAggregation.toList())
                                        ?.unique((e) => e)
                                        .toList(),
                                    functions
                                        .topFilterTypeSelectionConverter(_model
                                            .activityTypeAggregation
                                            .toList())
                                        ?.unique((e) => e)
                                        .toList(),
                                    functions
                                        .topFilterTypeSelectionConverter(_model
                                            .sportstypeAggregation
                                            .toList())
                                        ?.unique((e) => e)
                                        .toList(),
                                    functions
                                        .topFilterTypeSelectionConverter(_model
                                            .pricefactorAggregation
                                            .toList())
                                        ?.unique((e) => e)
                                        .toList(),
                                    functions
                                        .topFilterTypeSelectionConverter(
                                            _model.rankingAggregation.toList())
                                        ?.unique((e) => e)
                                        .toList(),
                                    functions
                                        .topFilterTypeSelectionConverter(
                                            _model.ageRangeAggregation.toList())
                                        ?.unique((e) => e)
                                        .toList(),
                                    functions
                                        .topFilterTypeSelectionConverter(
                                            _model.townAggregation.toList())
                                        ?.unique((e) => e)
                                        .toList(),
                                    functions
                                        .topFilterTypeSelectionConverter(
                                            _model.capacityAggregation.toList())
                                        ?.unique((e) => e)
                                        .toList(),
                                    functions
                                        .topFilterTypeSelectionConverter(_model
                                            .demographicsAggregation
                                            .toList())
                                        ?.unique((e) => e)
                                        .toList(),
                                    _model.placeTypeSelectedId,
                                    FFAppState().latitude,
                                    FFAppState().longituade,
                                    functions
                                        .topFilterTypeSelectionConverter(
                                            _model.activityCategoryAggregation.toList())
                                        ?.unique((e) => e)
                                        .toList()),
                              );

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
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          child: MapVenueWidget(
                                            detail: getJsonField(
                                              (_model.mapoutPut?.jsonBody ??
                                                  ''),
                                              r'''$.details''',
                                            ),
                                            data: functions
                                                .mapLoadInformationForVenue(
                                                    getJsonField(
                                              (_model.mapoutPut?.jsonBody ??
                                                  ''),
                                              r'''$.details''',
                                              true,
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );

                              safeSetState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 49.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlutterFlowIconButton(
                    buttonSize: 44.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).clbxBlack,
                      size: 23.0,
                    ),
                    onPressed: () async {
                      context.goNamed(HomePageWidget.routeName);
                    },
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'wvoz2au3' /* Venues */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleLargeFamily,
                                  color: FlutterFlowTheme.of(context).clbxBlack,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleLargeIsCustom,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
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
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: VenueFilterCompWidget(
                                    venueTypeSelected: _model.venueAggregation,
                                    activityTypeSelected:
                                        _model.activityTypeAggregation,
                                    sportTypeSelected:
                                        _model.sportstypeAggregation,
                                    priceSelected:
                                        _model.pricefactorAggregation,
                                    rankSelected: _model.rankingAggregation,
                                    ageSelected: _model.ageRangeAggregation,
                                    townSelected: _model.townAggregation,
                                    capacitySelected:
                                        _model.capacityAggregation,
                                    genderSelected:
                                        _model.demographicsAggregation,
                                    activityCatagorySelected:
                                        _model.activityCategoryAggregation,
                                    serchQuery: _model.searchuery,
                                    placeActivityId: _model.placeTypeSelectedId,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) =>
                            safeSetState(() => _model.aggreSelection = value));

                        if (_model.aggreSelection != null) {
                          _model.venueAggregation = _model
                              .aggreSelection!.venueTypeSelections
                              .toList()
                              .cast<String>();
                          _model.activityTypeAggregation = _model
                              .aggreSelection!.activityTypeSelections
                              .toList()
                              .cast<String>();
                          _model.sportstypeAggregation = _model
                              .aggreSelection!.sportTypeSelections
                              .toList()
                              .cast<String>();
                          _model.pricefactorAggregation = _model
                              .aggreSelection!.priceFactorSelections
                              .toList()
                              .cast<String>();
                          _model.townAggregation = _model
                              .aggreSelection!.townSelections
                              .toList()
                              .cast<String>();
                          _model.activityCategoryAggregation = _model
                              .aggreSelection!.activityTypeCategorySelections
                              .toList()
                              .cast<String>();
                          _model.capacityAggregation = _model
                              .aggreSelection!.capacitySelections
                              .toList()
                              .cast<String>();
                          _model.rankingAggregation = _model
                              .aggreSelection!.rankingSelections
                              .toList()
                              .cast<String>();
                          _model.demographicsAggregation = _model
                              .aggreSelection!.demographicsSelections
                              .toList()
                              .cast<String>();
                          _model.ageRangeAggregation = _model
                              .aggreSelection!.ageRangeSelections
                              .toList()
                              .cast<String>();
                          safeSetState(() =>
                              _model.venueListViewPagingController?.refresh());
                          await _model.waitForOnePageForVenueListView();
                        }

                        safeSetState(() {});
                      },
                      child: Icon(
                        Icons.filter_list_alt,
                        color:
                            FlutterFlowTheme.of(context).backgroundComponents,
                        size: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
