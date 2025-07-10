import '/backend/api_requests/api_calls.dart';
import '/compoents/allvendor_search_comp/distance_comp/distance_comp_widget.dart';
import '/compoents/allvendor_search_comp/loading_comp/loading_comp_widget.dart';
import '/compoents/allvendor_search_comp/location_change_comp/location_change_comp_widget.dart';
import '/compoents/allvendor_search_comp/map_venue/map_venue_widget.dart';
import '/compoents/allvendor_search_comp/place_activity_comp/place_activity_comp_widget.dart';
import '/compoents/allvendor_search_comp/view_by_comp/view_by_comp_widget.dart';
import '/compoents/cake_comp/cake_filter_comp/cake_filter_comp_widget.dart';
import '/compoents/common_comp/error_compoent/error_compoent_widget.dart';
import '/compoents/common_comp/image_error_compoent/image_error_compoent_widget.dart';
import '/compoents/common_comp/page_viewc_o_m_p/page_viewc_o_m_p_widget.dart';
import '/compoents/common_comp/rating_comp/rating_comp_widget.dart';
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
import 'all_cakes_model.dart';
export 'all_cakes_model.dart';

class AllCakesWidget extends StatefulWidget {
  const AllCakesWidget({
    super.key,
    this.cakeSerchQuery,
    this.themeCategory,
    this.themeId,
  });

  final String? cakeSerchQuery;
  final List<String>? themeCategory;
  final String? themeId;

  static String routeName = 'allCakes';
  static String routePath = 'allCakes';

  @override
  State<AllCakesWidget> createState() => _AllCakesWidgetState();
}

class _AllCakesWidgetState extends State<AllCakesWidget> {
  late AllCakesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllCakesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.showSuggestion = false;
      _model.cakeSerchQuery = valueOrDefault<String>(
        widget.cakeSerchQuery,
        '*',
      );
      _model.themeId = widget.themeId;
      if (widget.themeCategory != null &&
          (widget.themeCategory)!.isNotEmpty) {
        _model.themecategory = widget.themeCategory!.toList().cast<String>();
      }
      safeSetState(() {
        _model.cakeSearchFieldTextController?.text =
            (widget.cakeSerchQuery == '*' ? '' : widget.cakeSerchQuery!);
      });
      _model.pageload = true;
      safeSetState(() {});
    });

    _model.cakeSearchFieldTextController ??= TextEditingController(
        text: _model.cakeSerchQuery == '*' ? '' : _model.cakeSerchQuery);
    _model.cakeSearchFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).lemonLime,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 98.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showAlignedDialog(
                                          context: context,
                                          isGlobal: false,
                                          avoidOverflow: true,
                                          targetAnchor: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: AlignmentDirectional(
                                                  0.0, 0.0)
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
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.99,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.99,
                                                    child:
                                                        LocationChangeCompWidget(
                                                      latitude:
                                                          FFAppState().latitude,
                                                      longitude: FFAppState()
                                                          .longituade,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() =>
                                            _model.locationUpdateOutput =
                                                value));

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
                                          postalCode: _model
                                                          .locationUpdateOutput
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
                                              ? _model.locationUpdateOutput
                                                  ?.longitude
                                              : FFAppState().longituade,
                                          geometrycoordinates1: _model
                                                      .locationUpdateOutput
                                                      ?.latitude !=
                                                  null
                                              ? _model.locationUpdateOutput
                                                  ?.latitude
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
                                              ? _model
                                                  .locationUpdateOutput?.place
                                              : FFAppState().place,
                                          token: FFAppState().SessionToken,
                                        );

                                        if ((_model.assignLocation?.succeeded ??
                                            true)) {
                                          FFAppState().latitude = _model
                                                      .locationUpdateOutput
                                                      ?.latitude !=
                                                  null
                                              ? _model.locationUpdateOutput!
                                                  .latitude
                                              : FFAppState().latitude;
                                          FFAppState().longituade = _model
                                                      .locationUpdateOutput
                                                      ?.longitude !=
                                                  null
                                              ? _model.locationUpdateOutput!
                                                  .longitude
                                              : FFAppState().longituade;
                                          FFAppState().place = _model
                                                          .locationUpdateOutput
                                                          ?.place !=
                                                      null &&
                                                  _model.locationUpdateOutput
                                                          ?.place !=
                                                      ''
                                              ? _model
                                                  .locationUpdateOutput!.place
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
                                                ? _model.locationUpdateOutput
                                                    ?.region
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
                                            FFAppState().cakeVisible =
                                                functions.stringToBool(
                                                    VisibleTabCall.cake(
                                              (_model.visibleTabResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ));
                                          }
                                        }
                                        safeSetState(() => _model
                                            .cakeListViewPagingController
                                            ?.refresh());
                                        await _model
                                            .waitForOnePageForCakeListView();

                                        safeSetState(() {});
                                      },
                                      child: wrapWithModel(
                                        model: _model
                                            .locationSearchCompAllVendorModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child:
                                            LocationSearchCompAllVendorWidget(),
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
                                            alignment: AlignmentDirectional(
                                                    0.0, 1.0)
                                                .resolve(
                                                    Directionality.of(context)),
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
                                                  width: double.infinity,
                                                  child: DistanceCompWidget(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() =>
                                          _model.distanceSelectionOutput2 =
                                              value));

                                      FFAppState().distance =
                                          _model.distanceSelectionOutput2!;
                                      safeSetState(() {});
                                      _model.themecategory = [];
                                      _model.priceFactor = [];
                                      _model.ranking = [];
                                      _model.town = [];
                                      _model.foodProviderType = [];
                                      _model.icecremeFlavors = [];
                                      _model.fillings = [];
                                      _model.cakeFlavors = [];
                                      _model.mindeliveryfee = [];
                                      _model.menuRestriction = [];
                                      safeSetState(() => _model
                                          .cakeListViewPagingController
                                          ?.refresh());
                                      await _model
                                          .waitForOnePageForCakeListView();

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
                                          MediaQuery.sizeOf(context).height *
                                              0.063,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      iconPadding: EdgeInsets.all(0.0),
                                      iconColor:
                                          FlutterFlowTheme.of(context).primary,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
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
                                controller:
                                    _model.cakeSearchFieldTextController,
                                focusNode: _model.cakeSearchFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.cakeSearchFieldTextController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    _model.cakeSerchQuery = _model.cakeSearchFieldTextController
                                                    .text !=
                                                ''
                                        ? _model
                                            .cakeSearchFieldTextController.text
                                        : '*';
                                    _model.showSuggestion = true;
                                    safeSetState(() => _model
                                        .cakeListViewPagingController
                                        ?.refresh());
                                    safeSetState(() =>
                                        _model.apiRequestCompleter2 = null);
                                  },
                                ),
                                onFieldSubmitted: (_) async {
                                  _model.cakeSerchQuery = _model.cakeSearchFieldTextController
                                                  .text !=
                                              ''
                                      ? _model
                                          .cakeSearchFieldTextController.text
                                      : '*';
                                  _model.showSuggestion = false;
                                  safeSetState(() => _model
                                      .cakeListViewPagingController
                                      ?.refresh());
                                },
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'usx4wj21' /* Search */,
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
                                    'txhp2t2n' /* Search for cake */,
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
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                  suffixIcon: _model
                                          .cakeSearchFieldTextController!
                                          .text
                                          .isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.cakeSearchFieldTextController
                                                ?.clear();
                                            _model.cakeSerchQuery = _model.cakeSearchFieldTextController
                                                            .text !=
                                                        ''
                                                ? _model
                                                    .cakeSearchFieldTextController
                                                    .text
                                                : '*';
                                            _model.showSuggestion = true;
                                            safeSetState(() => _model
                                                .cakeListViewPagingController
                                                ?.refresh());
                                            safeSetState(() => _model
                                                .apiRequestCompleter2 = null);
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                validator: _model
                                    .cakeSearchFieldTextControllerValidator
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            _model.cakeThemesOutput =
                                                await CakeGroup.cakeThemesCall
                                                    .call();

                                            if ((_model.cakeThemesOutput
                                                    ?.succeeded ??
                                                true)) {
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
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child:
                                                              PlaceActivityCompWidget(
                                                            partyListItem:
                                                                CakeGroup
                                                                    .cakeThemesCall
                                                                    .details(
                                                              (_model.cakeThemesOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            selected: _model
                                                                .themeName,
                                                            lable: 'Theme',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(
                                                  () => _model
                                                          .themeAltertBoxOutput =
                                                      value));

                                              _model.themeId = _model
                                                  .themeAltertBoxOutput?.id;
                                              _model.themeName = _model
                                                  .themeAltertBoxOutput?.name;
                                              safeSetState(() {});
                                              _model.themecategory = [];
                                              _model.priceFactor = [];
                                              _model.ranking = [];
                                              _model.town = [];
                                              _model.foodProviderType = [];
                                              _model.menuRestriction = [];
                                              _model.fillings = [];
                                              _model.icecremeFlavors = [];
                                              _model.cakeFlavors = [];
                                              _model.mindeliveryfee = [];
                                              safeSetState(() => _model
                                                  .cakeListViewPagingController
                                                  ?.refresh());
                                              await _model
                                                  .waitForOnePageForCakeListView();
                                            }

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'z6lnhoof' /* Themes */,
                                          ),
                                          icon: FaIcon(
                                            FontAwesomeIcons.solidPaperPlane,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.05,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            iconPadding: EdgeInsets.all(0.0),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallIsCustom,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.5,
                                                        width: double.infinity,
                                                        child: ViewByCompWidget(
                                                          sortOrder:
                                                              _model.sortOrder!,
                                                          sortType:
                                                              _model.sortType!,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.viewSelectionOutput1 =
                                                    value));

                                            _model.sortOrder = _model
                                                .viewSelectionOutput1
                                                ?.sortSelection;
                                            _model.sortType =
                                                functions.viewByConverter(_model
                                                    .viewSelectionOutput1
                                                    ?.viewSelection);
                                            safeSetState(() {});
                                            safeSetState(() => _model
                                                .cakeListViewPagingController
                                                ?.refresh());
                                            await _model
                                                .waitForOnePageForCakeListView();

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'oyc84ohv' /* Sort By */,
                                          ),
                                          icon: FaIcon(
                                            FontAwesomeIcons.sort,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.05,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            iconPadding: EdgeInsets.all(0.0),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallIsCustom,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: _model.pageload,
                                  child: PagedListView<ApiPagingParams,
                                      dynamic>.separated(
                                    pagingController:
                                        _model.setCakeListViewController(
                                      (nextPageMarker) =>
                                          CakeGroup.gelAllCakeCall.call(
                                        limit: '20',
                                        filterQuery: functions.cakeFilterInputFunction(
                                            functions
                                                .distanceSelectionConverter(
                                                    FFAppState().distance),
                                            functions
                                                .topFilterTypeSelectionConverter(
                                                    _model.foodProviderType
                                                        .toList())
                                                ?.unique((e) => e)
                                                .toList(),
                                            functions
                                                .topFilterTypeSelectionConverter(
                                                    _model.menuRestriction
                                                        .toList())
                                                ?.unique((e) => e)
                                                .toList(),
                                            functions
                                                .topFilterTypeSelectionConverter(
                                                    _model.cakeFlavors.toList())
                                                ?.unique((e) => e)
                                                .toList(),
                                            functions
                                                .topFilterTypeSelectionConverter(
                                                    _model.priceFactor.toList())
                                                ?.unique((e) => e)
                                                .toList(),
                                            functions
                                                .topFilterTypeSelectionConverter(
                                                    _model.ranking.toList())
                                                ?.unique((e) => e)
                                                .toList(),
                                            functions
                                                .topFilterTypeSelectionConverter(
                                                    widget.themeCategory
                                                        ?.toList())
                                                ?.unique((e) => e)
                                                .toList(),
                                            functions
                                                .topFilterTypeSelectionConverter(_model.town.toList())
                                                ?.unique((e) => e)
                                                .toList(),
                                            functions.topFilterTypeSelectionConverter(_model.fillings.toList())?.unique((e) => e).toList(),
                                            functions.topFilterTypeSelectionConverter(_model.icecremeFlavors.toList())?.unique((e) => e).toList(),
                                            widget.themeId,
                                            FFAppState().latitude,
                                            FFAppState().longituade,
                                            functions.topFilterTypeSelectionConverter(functions.topFilterTypeSelectionConverter(_model.mindeliveryfee.toList())?.unique((e) => e).toList())?.unique((e) => e).toList()),
                                        query: valueOrDefault<String>(
                                          Uri.encodeComponent(
                                              _model.cakeSerchQuery),
                                          '*',
                                        ),
                                        sortQueryJson:
                                            functions.getSortingAttributes(
                                                _model.sortType,
                                                _model.sortOrder),
                                        page:
                                            (nextPageMarker.nextPageNumber + 1)
                                                .toString(),
                                        start:
                                            (nextPageMarker.nextPageNumber * 20)
                                                .toString(),
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
                                          Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        child: LoadingCompWidget(),
                                      ),
                                      // Customize what your widget looks like when it's loading another page.
                                      newPageProgressIndicatorBuilder: (_) =>
                                          Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        child: LoadingCompWidget(),
                                      ),
                                      noItemsFoundIndicatorBuilder: (_) =>
                                          Center(
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.9,
                                          child: ImageErrorCompoentWidget(
                                            image:
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/celebratix-u9fafm/assets/l2ukk3segd1p/No-Cake-logo.png',
                                          ),
                                        ),
                                      ),
                                      itemBuilder: (context, _, deatailIndex) {
                                        final deatailItem = _model
                                            .cakeListViewPagingController!
                                            .itemList![deatailIndex];
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          child: Column(
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
                                                          deatailItem,
                                                          r'''$['cakeMoreFields-_-resourcePhotos']''',
                                                        ).toString(),
                                                        deatailIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: PageViewcOMPWidget(
                                                        key: Key(
                                                          'Keym4n_${getJsonField(
                                                            deatailItem,
                                                            r'''$['cakeMoreFields-_-resourcePhotos']''',
                                                          ).toString()}',
                                                        ),
                                                        photos: getJsonField(
                                                          deatailItem,
                                                          r'''$['cakeMoreFields-_-resourcePhotos']''',
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
                                                      CakeDetailsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'id': serializeParam(
                                                          getJsonField(
                                                            deatailItem,
                                                            r'''$._id''',
                                                          ).toString(),
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
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                CakeDetailsWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'id':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      deatailItem,
                                                                      r'''$._id''',
                                                                    ).toString(),
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
                                                            child: Text(
                                                              getJsonField(
                                                                deatailItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
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
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              deatailItem,
                                                              r'''$.address''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
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
                                                                                      deatailItem,
                                                                                      r'''$.overallRank''',
                                                                                    )?.toString(),
                                                                                    '0',
                                                                                  ),
                                                                                  deatailIndex,
                                                                                ),
                                                                                updateCallback: () => safeSetState(() {}),
                                                                                child: RatingCompWidget(
                                                                                  key: Key(
                                                                                    'Keyi7n_${valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        deatailItem,
                                                                                        r'''$.overallRank''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    )}',
                                                                                  ),
                                                                                  rank: valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      deatailItem,
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
                                                                            children: [
                                                                              Icon(
                                                                                Icons.monetization_on_rounded,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      deatailItem,
                                                                                      r'''$.price''',
                                                                                    )?.toString(),
                                                                                    'Price On Request',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              deatailItem,
                                                                              r'''$.menuSectionNameList''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
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
                                                                            CakeDetailsWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'id': serializeParam(
                                                                                getJsonField(
                                                                                  deatailItem,
                                                                                  r'''$._id''',
                                                                                ).toString(),
                                                                                ParamType.String,
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
                                                                                  deatailItem,
                                                                                  r'''$.logo''',
                                                                                ).toString(),
                                                                                FFDevEnvironmentValues().BaseUrl)!,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.09,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.png',
                                                                              width: double.infinity,
                                                                              height: MediaQuery.sizeOf(context).height * 0.09,
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
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 114.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                          ),
                          child: Visibility(
                            visible: _model.showSuggestion,
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter2 ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(
                                            CakeGroup.cakeSuggestionCall.call(
                                          query: valueOrDefault<String>(
                                            Uri.encodeComponent(_model
                                                .cakeSearchFieldTextController
                                                .text),
                                            '*',
                                          ),
                                          uicontext:
                                              '{\"key\":\"cakeTabContent\",\"params\":{},\"component\":{\"clientId\":\"cakeTabContent__cakeTopFilterPanel\",\"clientState\":{\"clientId\":\"cakeTabContent__cakeTopFilterPanel\",\"query\":\"${valueOrDefault<String>(
                                            Uri.encodeComponent(_model
                                                .cakeSearchFieldTextController
                                                .text),
                                            '*',
                                          )}\"}}}',
                                          token: FFAppState().SessionToken,
                                          distance: functions
                                              .distanceSelectionConverter(
                                                  FFAppState().distance),
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final suggestionListViewCakeSuggestionResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final suggestion =
                                        CakeGroup.cakeSuggestionCall
                                                .text(
                                                  suggestionListViewCakeSuggestionResponse
                                                      .jsonBody,
                                                )
                                                ?.unique((e) => e)
                                                .toList() ??
                                            [];
                                    if (suggestion.isEmpty) {
                                      return Center(
                                        child: ErrorCompoentWidget(),
                                      );
                                    }

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: suggestion.length,
                                      itemBuilder: (context, suggestionIndex) {
                                        final suggestionItem =
                                            suggestion[suggestionIndex];
                                        return Visibility(
                                          visible: CakeGroup.cakeSuggestionCall
                                                  .details(
                                                    suggestionListViewCakeSuggestionResponse
                                                        .jsonBody,
                                                  )!
                                                  .length >
                                              1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 10.0, 0.0),
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
                                                    safeSetState(() {
                                                      _model
                                                          .cakeSearchFieldTextController
                                                          ?.text = suggestionItem;
                                                    });
                                                    _model.showSuggestion =
                                                        false;
                                                    _model
                                                        .cakeSerchQuery = _model.cakeSearchFieldTextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .cakeSearchFieldTextController
                                                            .text
                                                        : '*';
                                                    safeSetState(() => _model
                                                        .cakeListViewPagingController
                                                        ?.refresh());
                                                    await _model
                                                        .waitForOnePageForCakeListView();
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.search,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Text(
                                                                suggestionItem,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                _model.cakeOutput =
                                    await CakeGroup.gelAllCakeCall.call(
                                  limit: '30',
                                  filterQuery: functions.cakeFilterInputFunction(
                                      functions.distanceSelectionConverter(
                                          FFAppState().distance),
                                      functions
                                          .topFilterTypeSelectionConverter(
                                              _model.foodProviderType.toList())
                                          ?.unique((e) => e)
                                          .toList(),
                                      functions
                                          .topFilterTypeSelectionConverter(
                                              _model.menuRestriction.toList())
                                          ?.unique((e) => e)
                                          .toList(),
                                      functions
                                          .topFilterTypeSelectionConverter(
                                              _model.cakeFlavors.toList())
                                          ?.unique((e) => e)
                                          .toList(),
                                      _model.priceFactor.toList(),
                                      _model.ranking.toList(),
                                      functions
                                          .topFilterTypeSelectionConverter(
                                              widget.themeCategory?.toList())
                                          ?.unique((e) => e)
                                          .toList(),
                                      functions
                                          .topFilterTypeSelectionConverter(
                                              _model.town.toList())
                                          ?.unique((e) => e)
                                          .toList(),
                                      functions
                                          .topFilterTypeSelectionConverter(
                                              _model.fillings.toList())
                                          ?.unique((e) => e)
                                          .toList(),
                                      functions
                                          .topFilterTypeSelectionConverter(
                                              _model.icecremeFlavors.toList())
                                          ?.unique((e) => e)
                                          .toList(),
                                      widget.themeId,
                                      FFAppState().latitude,
                                      FFAppState().longituade,
                                      functions
                                          .topFilterTypeSelectionConverter(functions
                                              .topFilterTypeSelectionConverter(_model.mindeliveryfee.toList())
                                              ?.unique((e) => e)
                                              .toList())
                                          ?.unique((e) => e)
                                          .toList()),
                                  query: valueOrDefault<String>(
                                    Uri.encodeComponent(_model.cakeSerchQuery),
                                    '*',
                                  ),
                                  sortQueryJson: functions.getSortingAttributes(
                                      _model.sortType, _model.sortOrder),
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
                                                (_model.cakeOutput?.jsonBody ??
                                                    ''),
                                                r'''$.details''',
                                              ),
                                              data: functions
                                                  .mapLoadInformationForRentalFun(
                                                      getJsonField(
                                                (_model.cakeOutput?.jsonBody ??
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
                      context.goNamed(
                        HomePageWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
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
                              't87f52pk' /* Cakes */,
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
                                  child: CakeFilterCompWidget(
                                    bakeryTypeSelected: _model.foodProviderType,
                                    menuRestrictionSelected:
                                        _model.menuRestriction,
                                    cakeFlavorSelected: _model.cakeFlavors,
                                    priceSelected: _model.priceFactor,
                                    rankSelected: _model.ranking,
                                    themeSelected: _model.themecategory,
                                    townSelected: _model.town,
                                    fillingSelected: _model.fillings,
                                    deliveryfeeSelected: _model.mindeliveryfee,
                                    iceCremeFlavorSelected:
                                        _model.icecremeFlavors,
                                    serchQuery: _model.cakeSerchQuery,
                                    themeId: _model.themeId,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) =>
                            safeSetState(() => _model.cakeaggreation = value));

                        if (_model.cakeaggreation != null) {
                          _model.priceFactor = _model
                              .cakeaggreation!.priceFactorSelections
                              .toList()
                              .cast<String>();
                          _model.foodProviderType = _model
                              .cakeaggreation!.foodprovidertypeSelections
                              .toList()
                              .cast<String>();
                          _model.town = _model.cakeaggreation!.townSelections
                              .toList()
                              .cast<String>();
                          _model.themecategory = _model
                              .cakeaggreation!.themesSelections
                              .toList()
                              .cast<String>();
                          _model.ranking = _model
                              .cakeaggreation!.rankingSelections
                              .toList()
                              .cast<String>();
                          _model.fillings = _model
                              .cakeaggreation!.fillingsSelections
                              .toList()
                              .cast<String>();
                          _model.icecremeFlavors = _model
                              .cakeaggreation!.icecreamflavorsSelections
                              .toList()
                              .cast<String>();
                          _model.cakeFlavors = _model
                              .cakeaggreation!.cakeflavorsSelections
                              .toList()
                              .cast<String>();
                          _model.mindeliveryfee = _model
                              .cakeaggreation!.mindeliveryfeeSelections
                              .toList()
                              .cast<String>();
                          _model.menuRestriction = _model
                              .cakeaggreation!.menurestrictionsSelections
                              .toList()
                              .cast<String>();
                          safeSetState(() =>
                              _model.cakeListViewPagingController?.refresh());
                          await _model.waitForOnePageForCakeListView();
                        }

                        safeSetState(() {});
                      },
                      child: Icon(
                        Icons.filter_alt,
                        color: FlutterFlowTheme.of(context).primaryText,
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
