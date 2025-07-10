import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/compoents/vendor_comp/vendor_customer_comp/vendor_customer_comp_widget.dart';
import '/compoents/vendor_comp/vendor_inquiry_comp/vendor_inquiry_comp_widget.dart';
import '/compoents/vendor_comp/vendor_order_comp/vendor_order_comp_widget.dart';
import '/compoents/vendor_comp/vendor_prospects/vendor_prospects_widget.dart';
import '/compoents/vendor_comp/vendor_request_comp/vendor_request_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'vendor_order_page_model.dart';
export 'vendor_order_page_model.dart';

class VendorOrderPageWidget extends StatefulWidget {
  const VendorOrderPageWidget({
    super.key,
    required this.parentRecordKey,
    String? preSelectedTab,
  }) : this.preSelectedTab = preSelectedTab ?? 'default';

  final String? parentRecordKey;
  final String preSelectedTab;

  static String routeName = 'vendorOrderPage';
  static String routePath = 'vendorOrderPage';

  @override
  State<VendorOrderPageWidget> createState() => _VendorOrderPageWidgetState();
}

class _VendorOrderPageWidgetState extends State<VendorOrderPageWidget>
    with TickerProviderStateMixin {
  late VendorOrderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VendorOrderPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dashBoardResponse =
          await VendorGroup.vendorDashboardCursorCall.call(
        clientState:
            '{\"clientId\":\"vendorDashboard__vendorDashboardGrid\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().resourceId.toString()}\"},\"selection\":[]}',
        filters:
            '[{\"attribute\":\"span\",\"value\":\"6\",\"serverDataType\":\"com.cbx.app.constant.transaction.CLBXEnDateSpanType\$CBTVal\$\"}]',
      );

      if ((_model.dashBoardResponse?.succeeded ?? true)) {
        _model.apiLoaded = true;
        _model.requestPresent =
            VendorGroup.vendorDashboardCursorCall.requestsCount(
                  (_model.dashBoardResponse?.jsonBody ?? ''),
                ) !=
                '0';
        _model.ordersPresent =
            VendorGroup.vendorDashboardCursorCall.ordersCount(
                  (_model.dashBoardResponse?.jsonBody ?? ''),
                ) !=
                '0';
        _model.prospectsPresent =
            VendorGroup.vendorDashboardCursorCall.prospectsCount(
                  (_model.dashBoardResponse?.jsonBody ?? ''),
                ) !=
                '0';
        _model.customerPresent =
            VendorGroup.vendorDashboardCursorCall.customersCount(
                  (_model.dashBoardResponse?.jsonBody ?? ''),
                ) !=
                '0';
        _model.inquiryPresent =
            VendorGroup.vendorDashboardCursorCall.inquiriesCount(
                  (_model.dashBoardResponse?.jsonBody ?? ''),
                ) !=
                '0';
        _model.selectedTab = () {
          if (widget.preSelectedTab != 'default') {
            return widget.preSelectedTab;
          } else if (VendorGroup.vendorDashboardCursorCall.requestsCount(
                (_model.dashBoardResponse?.jsonBody ?? ''),
              ) !=
              '0') {
            return 'Requests';
          } else if (VendorGroup.vendorDashboardCursorCall.ordersCount(
                (_model.dashBoardResponse?.jsonBody ?? ''),
              ) !=
              '0') {
            return 'Orders';
          } else if (VendorGroup.vendorDashboardCursorCall.prospectsCount(
                (_model.dashBoardResponse?.jsonBody ?? ''),
              ) !=
              '0') {
            return 'Prospects';
          } else if (VendorGroup.vendorDashboardCursorCall.customersCount(
                (_model.dashBoardResponse?.jsonBody ?? ''),
              ) !=
              '0') {
            return 'Customers';
          } else if (VendorGroup.vendorDashboardCursorCall.inquiriesCount(
                (_model.dashBoardResponse?.jsonBody ?? ''),
              ) !=
              '0') {
            return 'Inquiry';
          } else {
            return 'default';
          }
        }();
        safeSetState(() {});
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        appBar: AppBar(
          backgroundColor: FFAppState().userType == 'vendor'
              ? FFAppConstants.vendorPrimaryColor
              : FFAppConstants.consumerPrimaryColor,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'v052shtu' /* Order */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: FlutterFlowTheme.of(context).clbxBlack,
                      fontSize: 23.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                    ),
              ),
            ].divide(SizedBox(width: 5.0)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (_model.requestPresent)
                            Opacity(
                              opacity:
                                  _model.selectedTab == 'Requests' ? 1.0 : 0.3,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedTab = 'Requests';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.17,
                                  decoration: BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.selectedTab = 'Requests';
                                      safeSetState(() {});
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.pending_actions,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '8l9x3zxl' /* Requests */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.17,
                                          height: 5.0,
                                          decoration: BoxDecoration(
                                            color: _model.selectedTab ==
                                                    'Requests'
                                                ? FFAppConstants
                                                    .vendorSecondaryColor
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(5.0),
                                              topRight: Radius.circular(5.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (_model.ordersPresent)
                            Opacity(
                              opacity:
                                  _model.selectedTab == 'Orders' ? 1.0 : 0.3,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedTab = 'Orders';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.17,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '5v4shoad' /* Orders */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
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
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.17,
                                        height: 5.0,
                                        decoration: BoxDecoration(
                                          color: _model.selectedTab == 'Orders'
                                              ? FFAppConstants
                                                  .vendorSecondaryColor
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(5.0),
                                            topRight: Radius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (_model.customerPresent)
                            Opacity(
                              opacity:
                                  _model.selectedTab == 'Customers' ? 1.0 : 0.3,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedTab = 'Customers';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.18,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.people,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'f8ffyppj' /* Customers */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
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
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.18,
                                        height: 5.0,
                                        decoration: BoxDecoration(
                                          color:
                                              _model.selectedTab == 'Customers'
                                                  ? FFAppConstants
                                                      .vendorSecondaryColor
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(5.0),
                                            topRight: Radius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (_model.prospectsPresent)
                            Opacity(
                              opacity:
                                  _model.selectedTab == 'Prospects' ? 1.0 : 0.3,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedTab = 'Prospects';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.17,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.people,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '10u2scc1' /* Prospects */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
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
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.17,
                                        height: 5.0,
                                        decoration: BoxDecoration(
                                          color:
                                              _model.selectedTab == 'Prospects'
                                                  ? FFAppConstants
                                                      .vendorSecondaryColor
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(5.0),
                                            topRight: Radius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (_model.inquiryPresent)
                            Opacity(
                              opacity:
                                  _model.selectedTab == 'Inquiry' ? 1.0 : 0.3,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedTab = 'Inquiry';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.17,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.question_mark_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'pf2ubvqj' /* Inquiry */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
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
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.17,
                                        height: 5.0,
                                        decoration: BoxDecoration(
                                          color: _model.selectedTab == 'Inquiry'
                                              ? FFAppConstants
                                                  .vendorSecondaryColor
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(5.0),
                                            topRight: Radius.circular(5.0),
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
                    ),
                    if (_model.selectedTab == 'Requests')
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Container(
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: wrapWithModel(
                              model: _model.vendorRequestCompModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: VendorRequestCompWidget(
                                parentRecordKey: widget.parentRecordKey!,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_model.selectedTab == 'Orders')
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Container(
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: wrapWithModel(
                              model: _model.vendorOrderCompModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: VendorOrderCompWidget(
                                parentRecordKey: widget.parentRecordKey!,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_model.selectedTab == 'Customers')
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Container(
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: wrapWithModel(
                              model: _model.vendorCustomerCompModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: VendorCustomerCompWidget(
                                parentRecordKey: widget.parentRecordKey!,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_model.selectedTab == 'Prospects')
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Container(
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: wrapWithModel(
                              model: _model.vendorProspectsModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: VendorProspectsWidget(
                                parentRecordKey: widget.parentRecordKey!,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_model.selectedTab == 'Inquiry')
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Container(
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: wrapWithModel(
                              model: _model.vendorInquiryCompModel,
                              updateCallback: () => safeSetState(() {}),
                              child: VendorInquiryCompWidget(
                                parentRecordKey: widget.parentRecordKey!,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                isScrollable: true,
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).clbxIconColor1,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      letterSpacing: 0.0,
                                      lineHeight: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          letterSpacing: 0.0,
                                          lineHeight: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primary,
                                indicatorWeight: 7.0,
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'yys93i1a' /*   Request   */,
                                    ),
                                    icon: Icon(
                                      Icons.business_sharp,
                                      size: 26.0,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'bnvrlwdk' /*     Orders    */,
                                    ),
                                    icon: FaIcon(
                                      FontAwesomeIcons.truckMoving,
                                      size: 24.0,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'rxn4xlm5' /* Prospects */,
                                    ),
                                    icon: Icon(
                                      Icons.auto_fix_high_rounded,
                                      size: 26.0,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'pf231t2i' /*  Customer  */,
                                    ),
                                    icon: Icon(
                                      Icons.cake,
                                      size: 26.0,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [
                                    () async {},
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
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => wrapWithModel(
                                      model: _model.vendorRequestCompModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: VendorRequestCompWidget(
                                        parentRecordKey:
                                            widget.parentRecordKey!,
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => wrapWithModel(
                                      model: _model.vendorOrderCompModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: VendorOrderCompWidget(
                                        parentRecordKey:
                                            widget.parentRecordKey!,
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => wrapWithModel(
                                      model: _model.vendorProspectsModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: VendorProspectsWidget(
                                        parentRecordKey:
                                            widget.parentRecordKey!,
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => wrapWithModel(
                                      model: _model.vendorCustomerCompModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: VendorCustomerCompWidget(
                                        parentRecordKey:
                                            widget.parentRecordKey!,
                                      ),
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
                ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBarWidget(
                    activePage: 'Order',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
