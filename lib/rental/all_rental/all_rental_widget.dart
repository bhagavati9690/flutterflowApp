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
import '/compoents/rental_comp/rental_filter_comp/rental_filter_comp_widget.dart';
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
import 'all_rental_model.dart';
export 'all_rental_model.dart';

class AllRentalWidget extends StatefulWidget {
  const AllRentalWidget({
    super.key,
    this.rentalSerchQuery,
    this.rentalsectioncategory,
    this.categoryId,
  });

  final String? rentalSerchQuery;
  final List<String>? rentalsectioncategory;
  final String? categoryId;

  static String routeName = 'allRental';
  static String routePath = 'allRental';

  @override
  State<AllRentalWidget> createState() => _AllRentalWidgetState();
}

class _AllRentalWidgetState extends State<AllRentalWidget> {
  late AllRentalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllRentalModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.rentalsectioncategory != null &&
          (widget.rentalsectioncategory)!.isNotEmpty) {
        _model.rentalsectioncategory =
            widget.rentalsectioncategory!.toList().cast<String>();
      }
      safeSetState(() {
        _model.rentalSearchFieldTextController?.text =
            (widget.rentalSerchQuery == '*' ? '' : widget.rentalSerchQuery!);
      });
      _model.showSuggestion = false;
      _model.rentalSerchQuery =
          widget.rentalSerchQuery != null && widget.rentalSerchQuery != ''
              ? widget.rentalSerchQuery!
              : '*';
      _model.categoryId = widget.categoryId;
      _model.pageLoad = true;
      safeSetState(() {});
    });

    _model.rentalSearchFieldTextController ??= TextEditingController(
        text: _model.rentalSerchQuery == '*' ? '' : _model.rentalSerchQuery);
    _model.rentalSearchFieldFocusNode ??= FocusNode();

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
                      Column(
                        mainAxisSize: MainAxisSize.min,
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
                                            .rentalListViewPagingController
                                            ?.refresh());
                                        await _model
                                            .waitForOnePageForRentalListView();

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
                                    ).then((value) => safeSetState(() => _model
                                        .distanceSelectionOutput2 = value));

                                    FFAppState().distance =
                                        _model.distanceSelectionOutput2!;
                                    _model.rentalsectioncategory = [];
                                    _model.themes = [];
                                    _model.priceFactor = [];
                                    _model.ranking = [];
                                    _model.town = [];
                                    _model.ageRange = [];
                                    safeSetState(() {});
                                    safeSetState(() => _model
                                        .rentalListViewPagingController
                                        ?.refresh());
                                    await _model
                                        .waitForOnePageForRentalListView();

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
                                    height: MediaQuery.sizeOf(context).height *
                                        0.064,
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
                                3.0, 7.0, 3.0, 0.0),
                            child: TextFormField(
                              controller:
                                  _model.rentalSearchFieldTextController,
                              focusNode: _model.rentalSearchFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.rentalSearchFieldTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  _model.rentalSerchQuery = _model.rentalSearchFieldTextController
                                                  .text !=
                                              ''
                                      ? _model
                                          .rentalSearchFieldTextController.text
                                      : '*';
                                  safeSetState(() => _model
                                      .rentalListViewPagingController
                                      ?.refresh());
                                  safeSetState(
                                      () => _model.apiRequestCompleter1 = null);
                                },
                              ),
                              onFieldSubmitted: (_) async {
                                _model.rentalSerchQuery = _model.rentalSearchFieldTextController
                                                .text !=
                                            ''
                                    ? _model
                                        .rentalSearchFieldTextController.text
                                    : '*';
                                _model.showSuggestion = false;
                                safeSetState(() => _model
                                    .rentalListViewPagingController
                                    ?.refresh());
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '092vf2km' /* Search */,
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
                                  '9d5xygxc' /* Search for rental Item */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                  Icons.search,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                suffixIcon: _model
                                        .rentalSearchFieldTextController!
                                        .text
                                        .isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.rentalSearchFieldTextController
                                              ?.clear();
                                          _model.rentalSerchQuery = _model.rentalSearchFieldTextController
                                                          .text !=
                                                      ''
                                              ? _model
                                                  .rentalSearchFieldTextController
                                                  .text
                                              : '*';
                                          safeSetState(() => _model
                                              .rentalListViewPagingController
                                              ?.refresh());
                                          safeSetState(() => _model
                                              .apiRequestCompleter1 = null);
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
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .rentalSearchFieldTextControllerValidator
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
                                          _model.retalCategory =
                                              await RentalGroup
                                                  .rentalCategoryCall
                                                  .call();

                                          if ((_model
                                                  .retalCategory?.succeeded ??
                                              true)) {
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
                                                        width: double.infinity,
                                                        child:
                                                            PlaceActivityCompWidget(
                                                          partyListItem: RentalGroup
                                                              .rentalCategoryCall
                                                              .details(
                                                            (_model.retalCategory
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          selected: _model
                                                              .categoryName,
                                                          lable: 'Category',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.categoryAltertBoxOutput =
                                                    value));

                                            _model.categoryId = _model
                                                .categoryAltertBoxOutput?.id;
                                            _model.categoryName = _model
                                                .categoryAltertBoxOutput?.name;
                                            safeSetState(() {});
                                            _model.rentalsectioncategory = [];
                                            _model.themes = [];
                                            _model.priceFactor = [];
                                            _model.ranking = [];
                                            _model.town = [];
                                            _model.ageRange = [];
                                            safeSetState(() => _model
                                                .rentalListViewPagingController
                                                ?.refresh());
                                            await _model
                                                .waitForOnePageForRentalListView();
                                          }

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'oo8ean5e' /* Category */,
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
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                      height: MediaQuery.sizeOf(
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
                                              .rentalListViewPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForRentalListView();

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'oypdki2f' /* Sort By */,
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
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
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
                                      _model.setRentalListViewController(
                                    (nextPageMarker) =>
                                        RentalGroup.gelAllRentalCall.call(
                                      filterQuery: functions.rentalFilterInputFunction(
                                          functions.distanceSelectionConverter(
                                              FFAppState().distance),
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
                                                  _model.ageRange.toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          functions
                                              .topFilterTypeSelectionConverter(
                                                  _model.town.toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          functions
                                              .topFilterTypeSelectionConverter(
                                                  _model.rentalsectioncategory
                                                      .toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          _model.themes.toList(),
                                          _model.categoryId,
                                          FFAppState().latitude,
                                          FFAppState().longituade),
                                      limit: '20',
                                      sortQueryJson:
                                          functions.getSortingAttributes(
                                              _model.sortType,
                                              _model.sortOrder),
                                      query: valueOrDefault<String>(
                                        Uri.encodeComponent(
                                            _model.rentalSerchQuery),
                                        '*',
                                      ),
                                      start:
                                          (nextPageMarker.nextPageNumber * 20)
                                              .toString(),
                                      page: (nextPageMarker.nextPageNumber + 1)
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.9,
                                      child: LoadingCompWidget(),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.9,
                                      child: LoadingCompWidget(),
                                    ),
                                    noItemsFoundIndicatorBuilder: (_) => Center(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        child: ImageErrorCompoentWidget(
                                          image:
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/celebratix-u9fafm/assets/nbasjj3s0nz4/No-Rental-logo.png',
                                        ),
                                      ),
                                    ),
                                    itemBuilder: (context, _, deatailIndex) {
                                      final deatailItem = _model
                                          .rentalListViewPagingController!
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
                                            color: FlutterFlowTheme.of(context)
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
                                                      deatailIndex.toString(),
                                                      deatailIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: PageViewcOMPWidget(
                                                      key: Key(
                                                        'Keyvtj_${deatailIndex.toString()}',
                                                      ),
                                                      photos: getJsonField(
                                                        deatailItem,
                                                        r'''$['rentalMoreFields-_-resourcePhotos']''',
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
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    RentalDetailsWidget
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
                                                      CrossAxisAlignment.start,
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              RentalDetailsWidget
                                                                  .routeName,
                                                              queryParameters: {
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
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
                                                                                  'Key8lw_${valueOrDefault<String>(
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
                                                                          (String
                                                                              input) {
                                                                            return input.length > 1
                                                                                ? input.substring(1, input.length - 1)
                                                                                : "";
                                                                          }(getJsonField(
                                                                            deatailItem,
                                                                            r'''$.rentalSectionMainCategory''',
                                                                          ).toString()),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 2.0)),
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
                                                                          RentalDetailsWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'id':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                deatailItem,
                                                                                r'''$._id''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
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
                                                                        child: Image
                                                                            .network(
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
                                                                          fit: BoxFit
                                                                              .contain,
                                                                          errorBuilder: (context, error, stackTrace) =>
                                                                              Image.asset(
                                                                            'assets/images/error_image.png',
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.09,
                                                                            fit:
                                                                                BoxFit.contain,
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
                              future: (_model.apiRequestCompleter1 ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(RentalGroup
                                            .rentalSuggestionCall
                                            .call(
                                          query: valueOrDefault<String>(
                                            Uri.encodeComponent(_model
                                                .rentalSearchFieldTextController
                                                .text),
                                            '*',
                                          ),
                                          uicontext:
                                              '{\"key\":\"rentalTabContent\",\"params\":{},\"component\":{\"clientId\":\"rentalTabContent__rentalTopFilterPanel\",\"clientState\":{\"clientId\":\"rentalTabContent__rentalTopFilterPanel\",\"query\":\"${valueOrDefault<String>(
                                            Uri.encodeComponent(_model
                                                .rentalSearchFieldTextController
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final suggestionListViewRentalSuggestionResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final suggestion =
                                        RentalGroup.rentalSuggestionCall
                                                .text(
                                                  suggestionListViewRentalSuggestionResponse
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
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: suggestion.length,
                                      itemBuilder: (context, suggestionIndex) {
                                        final suggestionItem =
                                            suggestion[suggestionIndex];
                                        return Visibility(
                                          visible:
                                              RentalGroup.rentalSuggestionCall
                                                      .details(
                                                        suggestionListViewRentalSuggestionResponse
                                                            .jsonBody,
                                                      )!
                                                      .length >
                                                  1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  safeSetState(() {
                                                    _model
                                                        .rentalSearchFieldTextController
                                                        ?.text = suggestionItem;
                                                  });
                                                  _model.showSuggestion = false;
                                                  _model
                                                      .rentalSerchQuery = _model.rentalSearchFieldTextController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .rentalSearchFieldTextController
                                                          .text
                                                      : '*';
                                                  safeSetState(() => _model
                                                      .rentalListViewPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForRentalListView();
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.98,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            suggestionItem,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
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
                                _model.rntalallOutput =
                                    await RentalGroup.gelAllRentalCall.call(
                                  start: '0',
                                  limit: '30',
                                  query: valueOrDefault<String>(
                                    Uri.encodeComponent(
                                        _model.rentalSerchQuery),
                                    '*',
                                  ),
                                  page: '1',
                                  filterQuery:
                                      functions.rentalFilterInputFunction(
                                          functions.distanceSelectionConverter(
                                              FFAppState().distance),
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
                                                  _model.ageRange.toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          functions
                                              .topFilterTypeSelectionConverter(
                                                  _model.town.toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          functions
                                              .topFilterTypeSelectionConverter(
                                                  _model.rentalsectioncategory
                                                      .toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          _model.themes.toList(),
                                          _model.categoryId,
                                          FFAppState().latitude,
                                          FFAppState().longituade),
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
                                                (_model.rntalallOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.details''',
                                              ),
                                              data: functions
                                                  .mapLoadInformationForRentalFun(
                                                      getJsonField(
                                                (_model.rntalallOutput
                                                        ?.jsonBody ??
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
                              's46brnhx' /* Rental */,
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
                                  child: RentalFilterCompWidget(
                                    rentalCategorySelected:
                                        _model.rentalsectioncategory,
                                    priceSelected: _model.priceFactor,
                                    rankSelected: _model.ranking,
                                    ageSelected: _model.ageRange,
                                    townSelected: _model.town,
                                    serchQuery: _model.rentalSerchQuery,
                                    categoryId: _model.categoryId,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) =>
                            safeSetState(() => _model.aggreSelection = value));

                        if (_model.aggreSelection != null) {
                          _model.ranking = _model
                              .aggreSelection!.rankingSelections
                              .toList()
                              .cast<String>();
                          _model.rentalsectioncategory = _model
                              .aggreSelection!.venueTypeSelections
                              .toList()
                              .cast<String>();
                          _model.town = _model.aggreSelection!.townSelections
                              .toList()
                              .cast<String>();
                          _model.ageRange = _model
                              .aggreSelection!.ageRangeSelections
                              .toList()
                              .cast<String>();
                          _model.priceFactor = _model
                              .aggreSelection!.priceFactorSelections
                              .toList()
                              .cast<String>();
                          safeSetState(() =>
                              _model.rentalListViewPagingController?.refresh());
                          await _model.waitForOnePageForRentalListView();
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
