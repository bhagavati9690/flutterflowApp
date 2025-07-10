import '/backend/api_requests/api_calls.dart';
import '/compoents/account_comp/guest_comp/guest_comp_widget.dart';
import '/compoents/account_comp/guest_type/guest_type_widget.dart';
import '/compoents/account_comp/request_for_event_comp/request_for_event_comp_widget.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/error_page_view_compoent/error_page_view_compoent_widget.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'my_events_model.dart';
export 'my_events_model.dart';

class MyEventsWidget extends StatefulWidget {
  const MyEventsWidget({
    super.key,
    int? tab,
  }) : this.tab = tab ?? 0;

  final int tab;

  static String routeName = 'myEvents';
  static String routePath = 'myEvents';

  @override
  State<MyEventsWidget> createState() => _MyEventsWidgetState();
}

class _MyEventsWidgetState extends State<MyEventsWidget>
    with TickerProviderStateMixin {
  late MyEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyEventsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isRequestLoaded = false;
      _model.apiResulNearestUpcoming =
          await AccountInfoGroup.nearestUpcomingEventCall.call(
        token: FFAppState().SessionToken,
      );

      if ((_model.apiResulNearestUpcoming?.succeeded ?? true)) {
        if (AccountInfoGroup.nearestUpcomingEventCall.details(
                  (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                ) !=
                null &&
            (AccountInfoGroup.nearestUpcomingEventCall.details(
              (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
            ))!
                .isNotEmpty) {
          FFAppState().eventId = AccountInfoGroup.nearestUpcomingEventCall.id(
            (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
          )!;
          safeSetState(() {});
          await Future.wait([
            Future(() async {
              _model.guestListOutput =
                  await EventGuestInformationGroup.guestListCall.call(
                clientState:
                    '{\"clientId\":\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\"},\"selection\":[]}',
                token: FFAppState().SessionToken,
              );
            }),
            Future(() async {
              _model.activeRequestOutput =
                  await AccountRequestItemInformationGroup.activeRequestItemCall
                      .call(
                token: FFAppState().SessionToken,
              );
            }),
          ]);
          _model.isRequestLoaded = true;
          _model.requestData = (_model.activeRequestOutput?.jsonBody ?? '');
          safeSetState(() {});
        }
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
      initialIndex: min(
          valueOrDefault<int>(
            widget.tab,
            0,
          ),
          2),
    )..addListener(() => safeSetState(() {}));

    _model.packageExpandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.hallExpandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.rentalExpandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.serviceExpandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.cakeExpandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.foodExpandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.activityExpandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.productExpandableExpandableController =
        ExpandableController(initialExpanded: false);
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
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).lemonLime,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              buttonSize: 48.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.goNamed(HomePageWidget.routeName);
              },
            ),
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '4rslytqk' /* My Events */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                fontSize: 26.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineMediumIsCustom,
                              ),
                    ),
                  ),
                ],
              ),
              centerTitle: false,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).lemonLime,
                    Color(0xFFF6C0BA),
                    Color(0xFFF0D18C),
                    FlutterFlowTheme.of(context).secondaryBackground
                  ],
                  stops: [0.0, 1.0, 1.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: FlutterFlowButtonTabBar(
                            useToggleButtonStyle: false,
                            isScrollable: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleMediumIsCustom,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleMediumIsCustom,
                                ),
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor: Colors.white,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            unselectedBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedBorderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderWidth: 2.0,
                            borderRadius: 18.0,
                            elevation: 2.0,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 3.0, 10.0, 3.0),
                            buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                4.0, 7.0, 4.0, 7.0),
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 8.0),
                            tabs: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.celebration,
                                      color: _model.tabBarCurrentIndex == 0
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'axj2xhqb' /* Basic  */,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.groups,
                                      color: _model.tabBarCurrentIndex == 1
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'g2ktetqn' /* Guests */,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.shopping_basket,
                                      color: _model.tabBarCurrentIndex == 2
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'yvciijdt' /* Requests */,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Visibility(
                                visible: _model.apiResulNearestUpcoming != null,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (AccountInfoGroup
                                                  .nearestUpcomingEventCall
                                                  .details(
                                                (_model.apiResulNearestUpcoming
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          (AccountInfoGroup
                                                  .nearestUpcomingEventCall
                                                  .details(
                                            (_model.apiResulNearestUpcoming
                                                    ?.jsonBody ??
                                                ''),
                                          ))!
                                              .isNotEmpty)
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    borderRadius: 8.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 44.0,
                                                    hoverColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    hoverIconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    icon: Icon(
                                                      Icons.edit_square,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.goNamed(
                                                        EventFormWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'eventId':
                                                              serializeParam(
                                                            AccountInfoGroup
                                                                .nearestUpcomingEventCall
                                                                .id(
                                                              (_model.apiResulNearestUpcoming
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    borderRadius: 8.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 44.0,
                                                    hoverColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    hoverIconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    icon: Icon(
                                                      Icons.delete_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      _model.apiResultDeleteEvent =
                                                          await EventInformationGroup
                                                              .deleteEventsCall
                                                              .call(
                                                        recordKey: FFAppState()
                                                            .eventId,
                                                        id: FFAppState()
                                                            .eventId,
                                                        token: FFAppState()
                                                            .SessionToken,
                                                      );

                                                      if ((_model
                                                              .apiResultDeleteEvent
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Event deleted sucessfully',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                          ),
                                                        );
                                                        if (Navigator.of(
                                                                context)
                                                            .canPop()) {
                                                          context.pop();
                                                        }
                                                        context.pushNamed(
                                                          MyEventsWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'tab':
                                                                serializeParam(
                                                              1,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Something went Wrong',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                          ),
                                                        );
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                  ))
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          EventFormWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'eventId':
                                                                serializeParam(
                                                              '-1',
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xyvj29ek' /* Create */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                ]
                                                    .divide(
                                                        SizedBox(width: 7.0))
                                                    .around(
                                                        SizedBox(width: 7.0)),
                                              ),
                                              Flexible(
                                                child: SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    8.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            AccountInfoGroup
                                                                .nearestUpcomingEventCall
                                                                .name(
                                                              (_model.apiResulNearestUpcoming
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            'Name of Event',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLargeIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_month,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        functions.formatDate(AccountInfoGroup
                                                                            .nearestUpcomingEventCall
                                                                            .idealDate(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        )),
                                                                        '....',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                                if (AccountInfoGroup
                                                                            .nearestUpcomingEventCall
                                                                            .time(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        ) !=
                                                                        null &&
                                                                    AccountInfoGroup
                                                                            .nearestUpcomingEventCall
                                                                            .time(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        ) !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .timer_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .time(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ),
                                                                          'time',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                if ('${AccountInfoGroup.nearestUpcomingEventCall.bldgNo(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        )}${AccountInfoGroup.nearestUpcomingEventCall.street(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        )}${AccountInfoGroup.nearestUpcomingEventCall.localArea(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        )}${AccountInfoGroup.nearestUpcomingEventCall.city(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        )}${AccountInfoGroup.nearestUpcomingEventCall.state(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        )}${AccountInfoGroup.nearestUpcomingEventCall.postalcode(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        )}' !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .location_on,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          '${AccountInfoGroup.nearestUpcomingEventCall.bldgNo(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          )} ${AccountInfoGroup.nearestUpcomingEventCall.street(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          )} ${AccountInfoGroup.nearestUpcomingEventCall.localArea(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          )} ${AccountInfoGroup.nearestUpcomingEventCall.city(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          )} ${AccountInfoGroup.nearestUpcomingEventCall.state(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          )} ${AccountInfoGroup.nearestUpcomingEventCall.postalcode(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                if (AccountInfoGroup
                                                                            .nearestUpcomingEventCall
                                                                            .celebrationType(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        ) !=
                                                                        null &&
                                                                    AccountInfoGroup
                                                                            .nearestUpcomingEventCall
                                                                            .celebrationType(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        ) !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .celebration_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            AccountInfoGroup.nearestUpcomingEventCall.celebrationType(
                                                                              (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                            ),
                                                                            'type',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.face,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Text(
                                                                                  '${valueOrDefault<String>(
                                                                                    AccountInfoGroup.nearestUpcomingEventCall.kids(
                                                                                      (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                                    ),
                                                                                    '0',
                                                                                  )} kids',
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 5.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.person_rounded,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Text(
                                                                                  '${valueOrDefault<String>(
                                                                                    AccountInfoGroup.nearestUpcomingEventCall.adults(
                                                                                      (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                                    ),
                                                                                    '0',
                                                                                  )} adults',
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 5.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.groups_2_sharp,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Text(
                                                                                  '${valueOrDefault<String>(
                                                                                    AccountInfoGroup.nearestUpcomingEventCall.totalInvitee(
                                                                                      (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                                    ),
                                                                                    '0',
                                                                                  )} Guests',
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 5.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      14.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (AccountInfoGroup
                                                                  .nearestUpcomingEventCall
                                                                  .fullnameCele(
                                                                (_model.apiResulNearestUpcoming
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              null &&
                                                          AccountInfoGroup
                                                                  .nearestUpcomingEventCall
                                                                  .fullnameCele(
                                                                (_model.apiResulNearestUpcoming
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              '')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      24.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'noz35pxv' /* Celebratee Information */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLargeIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      if (AccountInfoGroup
                                                                  .nearestUpcomingEventCall
                                                                  .fullnameCele(
                                                                (_model.apiResulNearestUpcoming
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              null &&
                                                          AccountInfoGroup
                                                                  .nearestUpcomingEventCall
                                                                  .fullnameCele(
                                                                (_model.apiResulNearestUpcoming
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              '')
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.96,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if ((String?
                                                                      var1) {
                                                                    return var1 !=
                                                                        null;
                                                                  }(AccountInfoGroup
                                                                      .nearestUpcomingEventCall
                                                                      .fullnameCele(
                                                                    (_model.apiResulNearestUpcoming
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )))
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            AccountInfoGroup.nearestUpcomingEventCall.fullnameCele(
                                                                              (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                            ),
                                                                            'Celebratee Name',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                fontSize: 20.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      if (AccountInfoGroup.nearestUpcomingEventCall.gender(
                                                                                (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                              ) !=
                                                                              null &&
                                                                          AccountInfoGroup.nearestUpcomingEventCall.gender(
                                                                                (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                              ) !=
                                                                              '')
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            AccountInfoGroup.nearestUpcomingEventCall.gender(
                                                                              (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                            ),
                                                                            'gender',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                      if (AccountInfoGroup.nearestUpcomingEventCall.age(
                                                                                (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                              ) !=
                                                                              null &&
                                                                          AccountInfoGroup.nearestUpcomingEventCall.age(
                                                                                (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                              ) !=
                                                                              '')
                                                                        Text(
                                                                          '${AccountInfoGroup.nearestUpcomingEventCall.age(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          )} years',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            19.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (() {
                                                        if (AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .theme(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .theme(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                '') {
                                                          return true;
                                                        } else if (AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .eventStaus(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .eventStaus(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                '') {
                                                          return true;
                                                        } else {
                                                          return false;
                                                        }
                                                      }())
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      24.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'gnpbigsr' /* Event Details */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLargeIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      if (() {
                                                        if (AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .theme(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .theme(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                '') {
                                                          return true;
                                                        } else if (AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .eventStaus(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .eventStaus(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                '') {
                                                          return true;
                                                        } else {
                                                          return false;
                                                        }
                                                      }())
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.96,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .theme(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          null &&
                                                                      AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .theme(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          '')
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'nmtpd8sq' /* Theme: */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            AccountInfoGroup.nearestUpcomingEventCall.theme(
                                                                              (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                            ),
                                                                            'Theme',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  if (AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .themeCategory(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          null &&
                                                                      AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .themeCategory(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          '')
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'qaxxujio' /* Theme Category: */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              AccountInfoGroup.nearestUpcomingEventCall.themeCategory(
                                                                                (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                              ),
                                                                              'category',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  if (AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .eventStaus(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          null &&
                                                                      AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .eventStaus(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          '')
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'b6na3d1t' /* Event Status: */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFE8F5E9),
                                                                            borderRadius:
                                                                                BorderRadius.circular(14.0),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              AccountInfoGroup.nearestUpcomingEventCall.eventStaus(
                                                                                (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                              ),
                                                                              'status',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    24.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'f5jbw2s0' /* Budget Details */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLargeIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.96,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '84ibd60q' /* Budget: */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        AccountInfoGroup
                                                                            .nearestUpcomingEventCall
                                                                            .budget(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        'budget',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (AccountInfoGroup
                                                                            .nearestUpcomingEventCall
                                                                            .totalCost(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        ) !=
                                                                        null &&
                                                                    AccountInfoGroup
                                                                            .nearestUpcomingEventCall
                                                                            .totalCost(
                                                                          (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                              ''),
                                                                        ) !=
                                                                        '')
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '9vmaykt4' /* Total Cost: */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                      if (AccountInfoGroup.nearestUpcomingEventCall.totalCost(
                                                                                (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                              ) !=
                                                                              null &&
                                                                          AccountInfoGroup.nearestUpcomingEventCall.totalCost(
                                                                                (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                              ) !=
                                                                              '')
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            AccountInfoGroup.nearestUpcomingEventCall.totalCost(
                                                                              (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                            ),
                                                                            'Cost',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      16.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (() {
                                                        if (AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .idealDae2(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .idealDae2(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                '') {
                                                          return true;
                                                        } else if (AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .ideatDate1(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .ideatDate1(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                '') {
                                                          return true;
                                                        } else {
                                                          return false;
                                                        }
                                                      }())
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      24.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'uorcsty8' /* Alternative Dates */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLargeIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      if (() {
                                                        if (AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .ideatDate1(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .ideatDate1(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                '') {
                                                          return true;
                                                        } else if (AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .idealDae2(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            AccountInfoGroup
                                                                    .nearestUpcomingEventCall
                                                                    .idealDae2(
                                                                  (_model.apiResulNearestUpcoming
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                '') {
                                                          return true;
                                                        } else {
                                                          return false;
                                                        }
                                                      }())
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.96,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .ideatDate1(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          null &&
                                                                      AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .ideatDate1(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          '')
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '3mbgvpg3' /* Date 1: */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.formatDate(AccountInfoGroup.nearestUpcomingEventCall.ideatDate1(
                                                                              (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                            )),
                                                                            'date1',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  if (AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .idealDae2(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          null &&
                                                                      AccountInfoGroup
                                                                              .nearestUpcomingEventCall
                                                                              .idealDae2(
                                                                            (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          '')
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'qx1mcarh' /* Date 2: */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.formatDate(AccountInfoGroup.nearestUpcomingEventCall.idealDae2(
                                                                              (_model.apiResulNearestUpcoming?.jsonBody ?? ''),
                                                                            )),
                                                                            ' date2',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (AccountInfoGroup
                                                                  .nearestUpcomingEventCall
                                                                  .description(
                                                                (_model.apiResulNearestUpcoming
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              null &&
                                                          AccountInfoGroup
                                                                  .nearestUpcomingEventCall
                                                                  .description(
                                                                (_model.apiResulNearestUpcoming
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              '')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      24.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'fbnxrzft' /* Description */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLargeIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      if (AccountInfoGroup
                                                                  .nearestUpcomingEventCall
                                                                  .description(
                                                                (_model.apiResulNearestUpcoming
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              null &&
                                                          AccountInfoGroup
                                                                  .nearestUpcomingEventCall
                                                                  .description(
                                                                (_model.apiResulNearestUpcoming
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              '')
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  wrapWithModel(
                                                                    model: _model
                                                                        .descriptionCompModel,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        DescriptionCompWidget(
                                                                      input:
                                                                          getJsonField(
                                                                        (_model.apiResulNearestUpcoming?.jsonBody ??
                                                                            ''),
                                                                        r'''$.details[:]['description']''',
                                                                      ).toString(),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ].addToEnd(
                                                        SizedBox(height: 51.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (!(AccountInfoGroup
                                                  .nearestUpcomingEventCall
                                                  .details(
                                                (_model.apiResulNearestUpcoming
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          (AccountInfoGroup
                                                  .nearestUpcomingEventCall
                                                  .details(
                                            (_model.apiResulNearestUpcoming
                                                    ?.jsonBody ??
                                                ''),
                                          ))!
                                              .isNotEmpty))
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lemonLime,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(7.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          context.goNamed(
                                                            EventFormWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'eventId':
                                                                  serializeParam(
                                                                '-1',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'v02xduyk' /* Add New Event */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .add_box_outlined,
                                                          size: 24.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.05,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .errorPageViewCompoentModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        ErrorPageViewCompoentWidget(
                                                      text:
                                                          'Looks like you don\'t have any events planned yet',
                                                    ),
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (AccountInfoGroup.nearestUpcomingEventCall
                                              .details(
                                            (_model.apiResulNearestUpcoming
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (AccountInfoGroup.nearestUpcomingEventCall
                                              .details(
                                        (_model.apiResulNearestUpcoming
                                                ?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty)
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Flexible(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.goNamed(
                                                        GuestFormWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'isEditForm':
                                                              serializeParam(
                                                            false,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'mu74a1r3' /* Add Guest */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.add_box,
                                                      size: 24.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                                if (!isWeb)
                                                  Flexible(
                                                    child: Builder(
                                                      builder: (context) =>
                                                          FFButtonWidget(
                                                        onPressed: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        GuestTypeWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.guestTypeSelected =
                                                                      value));

                                                          await requestPermission(
                                                              contactsPermission);
                                                          if (await getPermissionStatus(
                                                              contactsPermission)) {
                                                            _model.allContacts =
                                                                await actions
                                                                    .getAllContacts();

                                                            context.goNamed(
                                                              ContactListWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'contacts':
                                                                    serializeParam(
                                                                  _model
                                                                      .allContacts,
                                                                  ParamType
                                                                      .DataStruct,
                                                                  isList: true,
                                                                ),
                                                                'guestType':
                                                                    serializeParam(
                                                                  _model
                                                                      .guestTypeSelected,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'cxz0qabj' /* Add from Contacts */,
                                                        ),
                                                        icon: Icon(
                                                          Icons.add_box,
                                                          size: 24.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.05,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                          ),
                                          if (_model.guestListOutput == null
                                              ? false
                                              : (EventGuestInformationGroup
                                                      .guestListCall
                                                      .details(
                                                        (_model.guestListOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                      .length >
                                                  0))
                                            Flexible(
                                              child: Builder(
                                                builder: (context) {
                                                  final guest =
                                                      EventGuestInformationGroup
                                                              .guestListCall
                                                              .details(
                                                                (_model.guestListOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                              ?.toList() ??
                                                          [];
                                                  if (guest.isEmpty) {
                                                    return ErrorPageViewCompoentWidget(
                                                      text:
                                                          'Looks like the party\'s empty! Guess it\'s just you and me 😎',
                                                    );
                                                  }

                                                  return ListView.builder(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      62.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: guest.length,
                                                    itemBuilder:
                                                        (context, guestIndex) {
                                                      final guestItem =
                                                          guest[guestIndex];
                                                      return wrapWithModel(
                                                        model: _model
                                                            .guestCompModels
                                                            .getModel(
                                                          guestIndex.toString(),
                                                          guestIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: GuestCompWidget(
                                                          key: Key(
                                                            'Key2na_${guestIndex.toString()}',
                                                          ),
                                                          guestItem: guestItem,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          if (_model.guestListOutput == null
                                              ? false
                                              : (EventGuestInformationGroup
                                                      .guestListCall
                                                      .details(
                                                        (_model.guestListOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      ?.length ==
                                                  0))
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  44.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .errorPageViewCompoentModel2,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            ErrorPageViewCompoentWidget(
                                                          text:
                                                              'No guests yet! Time to send some invites! ',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (!(AccountInfoGroup
                                              .nearestUpcomingEventCall
                                              .details(
                                            (_model.apiResulNearestUpcoming
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (AccountInfoGroup.nearestUpcomingEventCall
                                              .details(
                                        (_model.apiResulNearestUpcoming
                                                ?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty))
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lemonLime,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(7.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.goNamed(
                                                        EventFormWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'eventId':
                                                              serializeParam(
                                                            '-1',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'mo1t1nmj' /* Add New Event */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.add_box_outlined,
                                                      size: 24.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: wrapWithModel(
                                                model: _model
                                                    .errorPageViewCompoentModel3,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    ErrorPageViewCompoentWidget(
                                                  text:
                                                      'Looks like you don\'t have any events planned yet',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '83u2txfz' /* Loading ..... */,
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
                                    ),
                                  ),
                                  if (_model.isRequestLoaded)
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Visibility(
                                        visible: _model.isRequestLoaded,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (AccountInfoGroup
                                                        .nearestUpcomingEventCall
                                                        .details(
                                                      (_model.apiResulNearestUpcoming
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    null &&
                                                (AccountInfoGroup
                                                        .nearestUpcomingEventCall
                                                        .details(
                                                  (_model.apiResulNearestUpcoming
                                                          ?.jsonBody ??
                                                      ''),
                                                ))!
                                                    .isNotEmpty)
                                              Flexible(
                                                child: Stack(
                                                  children: [
                                                    if ((_model.activeRequestOutput
                                                                ?.succeeded ??
                                                            true)
                                                        ? (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                                  (_model.activeRequestOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                              (_model.activeRequestOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty)
                                                        : false)
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                                      (_model.activeRequestOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .where((e) =>
                                                                        (String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'Package';
                                                                        }(getJsonField(
                                                                          e,
                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                        ).toString()))
                                                                    .toList()
                                                                    .length >
                                                                0)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  controller: _model
                                                                      .packageExpandableExpandableController,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.layerGroup,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'huuz1k6z' /* Package  */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '9s2l280i' /* ( */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                            .details(
                                                                                              (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                            )
                                                                                            ?.where((e) => (String var1) {
                                                                                                  return var1 == 'Package';
                                                                                                }(getJsonField(
                                                                                                  e,
                                                                                                  r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                                ).toString()))
                                                                                            .toList()
                                                                                            .length
                                                                                            .toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '6wf69mtk' /* ) */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    expanded:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final package = AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                    .details(
                                                                                      (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                    )
                                                                                    ?.where((e) => (String var1) {
                                                                                          return var1 == 'Package';
                                                                                        }(getJsonField(
                                                                                          e,
                                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                        ).toString()))
                                                                                    .toList()
                                                                                    .toList() ??
                                                                                [];

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: package.length,
                                                                              itemBuilder: (context, packageIndex) {
                                                                                final packageItem = package[packageIndex];
                                                                                return wrapWithModel(
                                                                                  model: _model.requestForEventCompModels1.getModel(
                                                                                    packageIndex.toString(),
                                                                                    packageIndex,
                                                                                  ),
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  updateOnChange: true,
                                                                                  child: RequestForEventCompWidget(
                                                                                    key: Key(
                                                                                      'Key2dw_${packageIndex.toString()}',
                                                                                    ),
                                                                                    requestItem: packageItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                                      (_model.activeRequestOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .where((e) =>
                                                                        (String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'Halls/Rooms';
                                                                        }(getJsonField(
                                                                          e,
                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                        ).toString()))
                                                                    .toList()
                                                                    .length >
                                                                0)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  controller: _model
                                                                      .hallExpandableExpandableController,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.hotel,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'ew8h457q' /* Halls / Rooms  */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '6u4vck9j' /*  ( */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                            .details(
                                                                                              (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                            )
                                                                                            ?.where((e) => (String var1) {
                                                                                                  return var1 == 'Halls/Rooms';
                                                                                                }(getJsonField(
                                                                                                  e,
                                                                                                  r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                                ).toString()))
                                                                                            .toList()
                                                                                            .length
                                                                                            .toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'y5ob7ke8' /* ) */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    expanded:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final hallItem = AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                    .details(
                                                                                      (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                    )
                                                                                    ?.where((e) => (String var1) {
                                                                                          return var1 == 'Halls/Rooms';
                                                                                        }(getJsonField(
                                                                                          e,
                                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                        ).toString()))
                                                                                    .toList()
                                                                                    .toList() ??
                                                                                [];

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: hallItem.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 17.0),
                                                                              itemBuilder: (context, hallItemIndex) {
                                                                                final hallItemItem = hallItem[hallItemIndex];
                                                                                return wrapWithModel(
                                                                                  model: _model.requestForEventCompModels2.getModel(
                                                                                    hallItemIndex.toString(),
                                                                                    hallItemIndex,
                                                                                  ),
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  child: RequestForEventCompWidget(
                                                                                    key: Key(
                                                                                      'Keymv9_${hallItemIndex.toString()}',
                                                                                    ),
                                                                                    requestItem: hallItemItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                                      (_model.activeRequestOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .where((e) =>
                                                                        (String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'Rental';
                                                                        }(getJsonField(
                                                                          e,
                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                        ).toString()))
                                                                    .toList()
                                                                    .length >
                                                                0)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  controller: _model
                                                                      .rentalExpandableExpandableController,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.fire_truck_sharp,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'kpt7x268' /* Rental */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'biesbxip' /*  ( */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                            .details(
                                                                                              (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                            )
                                                                                            ?.where((e) => (String var1) {
                                                                                                  return var1 == 'Rental';
                                                                                                }(getJsonField(
                                                                                                  e,
                                                                                                  r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                                ).toString()))
                                                                                            .toList()
                                                                                            .length
                                                                                            .toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '07g0vkhe' /* ) */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(
                                                                      height:
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    expanded:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final rental = AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                    .details(
                                                                                      (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                    )
                                                                                    ?.where((e) => (String var1) {
                                                                                          return var1 == 'Rental';
                                                                                        }(getJsonField(
                                                                                          e,
                                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                        ).toString()))
                                                                                    .toList()
                                                                                    .toList() ??
                                                                                [];

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: rental.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 17.0),
                                                                              itemBuilder: (context, rentalIndex) {
                                                                                final rentalItem = rental[rentalIndex];
                                                                                return wrapWithModel(
                                                                                  model: _model.requestForEventCompModels3.getModel(
                                                                                    rentalIndex.toString(),
                                                                                    rentalIndex,
                                                                                  ),
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  child: RequestForEventCompWidget(
                                                                                    key: Key(
                                                                                      'Keymmx_${rentalIndex.toString()}',
                                                                                    ),
                                                                                    requestItem: rentalItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                                      (_model.activeRequestOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .where((e) =>
                                                                        (String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'Service';
                                                                        }(getJsonField(
                                                                          e,
                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                        ).toString()))
                                                                    .toList()
                                                                    .length >
                                                                0)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  controller: _model
                                                                      .serviceExpandableExpandableController,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.hotel,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'eq1mp4kv' /* Service */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'fnka7fh3' /*  ( */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                            .details(
                                                                                              (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                            )
                                                                                            ?.where((e) => (String var1) {
                                                                                                  return var1 == 'Service';
                                                                                                }(getJsonField(
                                                                                                  e,
                                                                                                  r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                                ).toString()))
                                                                                            .toList()
                                                                                            .length
                                                                                            .toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'f9ehzf9x' /* ) */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    expanded:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final service = AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                    .details(
                                                                                      (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                    )
                                                                                    ?.where((e) => (String var1) {
                                                                                          return var1 == 'Service';
                                                                                        }(getJsonField(
                                                                                          e,
                                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                        ).toString()))
                                                                                    .toList()
                                                                                    .toList() ??
                                                                                [];

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: service.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 17.0),
                                                                              itemBuilder: (context, serviceIndex) {
                                                                                final serviceItem = service[serviceIndex];
                                                                                return wrapWithModel(
                                                                                  model: _model.requestForEventCompModels4.getModel(
                                                                                    serviceIndex.toString(),
                                                                                    serviceIndex,
                                                                                  ),
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  child: RequestForEventCompWidget(
                                                                                    key: Key(
                                                                                      'Key8i6_${serviceIndex.toString()}',
                                                                                    ),
                                                                                    requestItem: serviceItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                                      (_model.activeRequestOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .where((e) =>
                                                                        (String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'Cake';
                                                                        }(getJsonField(
                                                                          e,
                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                        ).toString()))
                                                                    .toList()
                                                                    .length >
                                                                0)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  controller: _model
                                                                      .cakeExpandableExpandableController,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.birthdayCake,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'bo11agx4' /* Cake */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '5723e3u0' /*  ( */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                            .details(
                                                                                              (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                            )
                                                                                            ?.where((e) => (String var1) {
                                                                                                  return var1 == 'Cake';
                                                                                                }(getJsonField(
                                                                                                  e,
                                                                                                  r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                                ).toString()))
                                                                                            .toList()
                                                                                            .length
                                                                                            .toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'c9tqgxo5' /* ) */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    expanded:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final cake = AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                    .details(
                                                                                      (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                    )
                                                                                    ?.where((e) => (String var1) {
                                                                                          return var1 == 'Cake';
                                                                                        }(getJsonField(
                                                                                          e,
                                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                        ).toString()))
                                                                                    .toList()
                                                                                    .toList() ??
                                                                                [];

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: cake.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 17.0),
                                                                              itemBuilder: (context, cakeIndex) {
                                                                                final cakeItem = cake[cakeIndex];
                                                                                return wrapWithModel(
                                                                                  model: _model.requestForEventCompModels5.getModel(
                                                                                    cakeIndex.toString(),
                                                                                    cakeIndex,
                                                                                  ),
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  updateOnChange: true,
                                                                                  child: RequestForEventCompWidget(
                                                                                    key: Key(
                                                                                      'Keyogv_${cakeIndex.toString()}',
                                                                                    ),
                                                                                    requestItem: cakeItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                                      (_model.activeRequestOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .where((e) =>
                                                                        (String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'Food';
                                                                        }(getJsonField(
                                                                          e,
                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                        ).toString()))
                                                                    .toList()
                                                                    .length >
                                                                0)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  controller: _model
                                                                      .foodExpandableExpandableController,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.fastfood_sharp,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'xxxyvs5w' /* Food */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'd0vbwcfk' /*  ( */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                            .details(
                                                                                              (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                            )
                                                                                            ?.where((e) => (String var1) {
                                                                                                  return var1 == 'Food';
                                                                                                }(getJsonField(
                                                                                                  e,
                                                                                                  r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                                ).toString()))
                                                                                            .toList()
                                                                                            .length
                                                                                            .toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '7q8cepy2' /* ) */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    expanded:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final food = AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                    .details(
                                                                                      (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                    )
                                                                                    ?.where((e) => (String var1) {
                                                                                          return var1 == 'Food';
                                                                                        }(getJsonField(
                                                                                          e,
                                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                        ).toString()))
                                                                                    .toList()
                                                                                    .toList() ??
                                                                                [];

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: food.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 17.0),
                                                                              itemBuilder: (context, foodIndex) {
                                                                                final foodItem = food[foodIndex];
                                                                                return wrapWithModel(
                                                                                  model: _model.requestForEventCompModels6.getModel(
                                                                                    foodIndex.toString(),
                                                                                    foodIndex,
                                                                                  ),
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  child: RequestForEventCompWidget(
                                                                                    key: Key(
                                                                                      'Keywmu_${foodIndex.toString()}',
                                                                                    ),
                                                                                    requestItem: foodItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                                      (_model.activeRequestOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .where((e) =>
                                                                        (String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'Activity';
                                                                        }(getJsonField(
                                                                          e,
                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                        ).toString()))
                                                                    .toList()
                                                                    .length >
                                                                0)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  controller: _model
                                                                      .activityExpandableExpandableController,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.hotel,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '199dhhax' /* Activity */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'mxncw5io' /*  ( */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                            .details(
                                                                                              (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                            )
                                                                                            ?.where((e) => (String var1) {
                                                                                                  return var1 == 'Activity';
                                                                                                }(getJsonField(
                                                                                                  e,
                                                                                                  r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                                ).toString()))
                                                                                            .toList()
                                                                                            .length
                                                                                            .toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '7zqi8snk' /* ) */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    expanded:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final activity = AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                    .details(
                                                                                      (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                    )
                                                                                    ?.where((e) => (String var1) {
                                                                                          return var1 == 'Activity';
                                                                                        }(getJsonField(
                                                                                          e,
                                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                        ).toString()))
                                                                                    .toList()
                                                                                    .toList() ??
                                                                                [];

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: activity.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 17.0),
                                                                              itemBuilder: (context, activityIndex) {
                                                                                final activityItem = activity[activityIndex];
                                                                                return wrapWithModel(
                                                                                  model: _model.requestForEventCompModels7.getModel(
                                                                                    activityIndex.toString(),
                                                                                    activityIndex,
                                                                                  ),
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  child: RequestForEventCompWidget(
                                                                                    key: Key(
                                                                                      'Keya34_${activityIndex.toString()}',
                                                                                    ),
                                                                                    requestItem: activityItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                                      (_model.activeRequestOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!
                                                                    .where((e) =>
                                                                        (String
                                                                            var1) {
                                                                          return var1 ==
                                                                              'Product';
                                                                        }(getJsonField(
                                                                          e,
                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                        ).toString()))
                                                                    .toList()
                                                                    .length >
                                                                0)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  controller: _model
                                                                      .productExpandableExpandableController,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.hotel,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'h30lrim0' /* Product */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'zarsbz21' /*  ( */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                            .details(
                                                                                              (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                            )
                                                                                            ?.where((e) => (String var1) {
                                                                                                  return var1 == 'Product';
                                                                                                }(getJsonField(
                                                                                                  e,
                                                                                                  r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                                ).toString()))
                                                                                            .toList()
                                                                                            .length
                                                                                            .toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '6q44z3pd' /* ) */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    expanded:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final product = AccountRequestItemInformationGroup.activeRequestItemCall
                                                                                    .details(
                                                                                      (_model.activeRequestOutput?.jsonBody ?? ''),
                                                                                    )
                                                                                    ?.where((e) => (String var1) {
                                                                                          return var1 == 'Product';
                                                                                        }(getJsonField(
                                                                                          e,
                                                                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
                                                                                        ).toString()))
                                                                                    .toList()
                                                                                    .toList() ??
                                                                                [];

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: product.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 17.0),
                                                                              itemBuilder: (context, productIndex) {
                                                                                final productItem = product[productIndex];
                                                                                return wrapWithModel(
                                                                                  model: _model.requestForEventCompModels8.getModel(
                                                                                    productIndex.toString(),
                                                                                    productIndex,
                                                                                  ),
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  child: RequestForEventCompWidget(
                                                                                    key: Key(
                                                                                      'Keyw6t_${productIndex.toString()}',
                                                                                    ),
                                                                                    requestItem: productItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 7.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      height:
                                                                          7.0))
                                                              .addToEnd(SizedBox(
                                                                  height:
                                                                      61.0)),
                                                        ),
                                                      ),
                                                    if ((_model.activeRequestOutput
                                                                ?.succeeded ??
                                                            true)
                                                        ? !(AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                                  (_model.activeRequestOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (AccountRequestItemInformationGroup
                                                                    .activeRequestItemCall
                                                                    .details(
                                                              (_model.activeRequestOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty)
                                                        : false)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Flexible(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .errorPageViewCompoentModel4,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    ErrorPageViewCompoentWidget(
                                                                  text:
                                                                      'Oops! No one has requested for an item yet !',
                                                                ),
                                                              ),
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
                                  if (!(AccountInfoGroup
                                              .nearestUpcomingEventCall
                                              .details(
                                            (_model.apiResulNearestUpcoming
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (AccountInfoGroup.nearestUpcomingEventCall
                                              .details(
                                        (_model.apiResulNearestUpcoming
                                                ?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty))
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lemonLime,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(7.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            context.goNamed(
                                                              EventFormWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'eventId':
                                                                    serializeParam(
                                                                  '-1',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            't582cdop' /* Add New Event */,
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .add_box_outlined,
                                                            size: 24.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.05,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .errorPageViewCompoentModel5,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          ErrorPageViewCompoentWidget(
                                                        text:
                                                            'Looks like you don\'t have any events planned yet',
                                                      ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!FFAppState().IsLoggedInUser)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'k9fgx7b5' /* Sign in to see information rel... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleLargeIsCustom,
                                      ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(LoginWidget.routeName);
                                },
                                text: FFLocalizations.of(context).getText(
                                  '2z2bczfe' /* LogIn */,
                                ),
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.37,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.06,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 24.0))
                                .around(SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarWidget(
                        activePage: 'Events',
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
