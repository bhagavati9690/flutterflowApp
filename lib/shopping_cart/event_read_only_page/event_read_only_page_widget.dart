import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'event_read_only_page_model.dart';
export 'event_read_only_page_model.dart';

class EventReadOnlyPageWidget extends StatefulWidget {
  const EventReadOnlyPageWidget({
    super.key,
    this.recordKey,
    required this.type,
    this.packageId,
    this.spaceId,
    this.denominatorId,
    this.resourceItemId,
    this.resourceItemType,
    this.quantity,
    bool? customCake,
  }) : this.customCake = customCake ?? false;

  final String? recordKey;
  final String? type;
  final String? packageId;
  final String? spaceId;
  final bool? denominatorId;
  final String? resourceItemId;

  /// resourceType
  final String? resourceItemType;

  final String? quantity;
  final bool customCake;

  static String routeName = 'EventReadOnlyPage';
  static String routePath = 'eventReadOnlyPage';

  @override
  State<EventReadOnlyPageWidget> createState() =>
      _EventReadOnlyPageWidgetState();
}

class _EventReadOnlyPageWidgetState extends State<EventReadOnlyPageWidget> {
  late EventReadOnlyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventReadOnlyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.eventInfoRespones =
          await ShoppingCartSummaryUIGroup.eventInfoCall.call(
        token: FFAppState().SessionToken,
      );

      if ((_model.eventInfoRespones?.succeeded ?? true)) {
        _model.apiLoaded = true;
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                context.safePop();
              },
            ),
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '2s5g2ort' /* Event Details */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          fontSize: 26.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: !FlutterFlowTheme.of(context)
                              .headlineMediumIsCustom,
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
            child: Visibility(
              visible: _model.apiLoaded,
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 0.0, 14.0, 0.0),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 8.0, 0.0, 2.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    ShoppingCartSummaryUIGroup.eventInfoCall
                                        .eventName(
                                      (_model.eventInfoRespones?.jsonBody ??
                                          ''),
                                    ),
                                    'Event',
                                  ),
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
                              Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.96,
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
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            Flexible(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions.formatDate(
                                                      ShoppingCartSummaryUIGroup
                                                          .eventInfoCall
                                                          .idealDate(
                                                    (_model.eventInfoRespones
                                                            ?.jsonBody ??
                                                        ''),
                                                  )),
                                                  '....',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                        if (ShoppingCartSummaryUIGroup
                                                    .eventInfoCall
                                                    .timeString(
                                                  (_model.eventInfoRespones
                                                          ?.jsonBody ??
                                                      ''),
                                                ) !=
                                                null &&
                                            ShoppingCartSummaryUIGroup
                                                    .eventInfoCall
                                                    .timeString(
                                                  (_model.eventInfoRespones
                                                          ?.jsonBody ??
                                                      ''),
                                                ) !=
                                                '')
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.timer_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  ShoppingCartSummaryUIGroup
                                                      .eventInfoCall
                                                      .timeString(
                                                    (_model.eventInfoRespones
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  '...',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        if (!(ShoppingCartSummaryUIGroup
                                                .eventInfoCall
                                                .eventAddress(
                                                  (_model.eventInfoRespones
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                ?.trim()
                                                .isEmpty ??
                                            true))
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    ShoppingCartSummaryUIGroup
                                                        .eventInfoCall
                                                        .eventAddress(
                                                      (_model.eventInfoRespones
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    'Event Address',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        if (ShoppingCartSummaryUIGroup
                                                    .eventInfoCall
                                                    .celebrationType(
                                                  (_model.eventInfoRespones
                                                          ?.jsonBody ??
                                                      ''),
                                                ) !=
                                                null &&
                                            ShoppingCartSummaryUIGroup
                                                    .eventInfoCall
                                                    .celebrationType(
                                                  (_model.eventInfoRespones
                                                          ?.jsonBody ??
                                                      ''),
                                                ) !=
                                                '')
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.celebration_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          ShoppingCartSummaryUIGroup
                                                              .eventInfoCall
                                                              .celebrationType(
                                                            (_model.eventInfoRespones
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          'celebration Type',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLargeIsCustom,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.face,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            ShoppingCartSummaryUIGroup
                                                                .eventInfoCall
                                                                .noOfKids(
                                                              (_model.eventInfoRespones
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            'Kids',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLargeIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.person_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            ShoppingCartSummaryUIGroup
                                                                .eventInfoCall
                                                                .noOfAdults(
                                                              (_model.eventInfoRespones
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            'Adults',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLargeIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.groups_2_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            ShoppingCartSummaryUIGroup
                                                                .eventInfoCall
                                                                .totalInvitees(
                                                              (_model.eventInfoRespones
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            'Total Invitees',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLargeIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 14.0)),
                                    ),
                                  ),
                                ),
                              ),
                              if (!(ShoppingCartSummaryUIGroup.eventInfoCall
                                      .celebratee(
                                        (_model.eventInfoRespones?.jsonBody ??
                                            ''),
                                      )
                                      ?.trim()
                                      .isEmpty ??
                                  true))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 24.0, 0.0, 2.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'vmcb342m' /* Celebratee */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleLargeIsCustom,
                                        ),
                                  ),
                                ),
                              if (!(ShoppingCartSummaryUIGroup.eventInfoCall
                                      .celebratee(
                                        (_model.eventInfoRespones?.jsonBody ??
                                            ''),
                                      )
                                      ?.trim()
                                      .isEmpty ??
                                  true))
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.96,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    ShoppingCartSummaryUIGroup
                                                        .eventInfoCall
                                                        .celebratee(
                                                      (_model.eventInfoRespones
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    'Celebratee Name',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
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
                                              if (ShoppingCartSummaryUIGroup
                                                          .eventInfoCall
                                                          .celebrateeGender(
                                                        (_model.eventInfoRespones
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      null &&
                                                  ShoppingCartSummaryUIGroup
                                                          .eventInfoCall
                                                          .celebrateeGender(
                                                        (_model.eventInfoRespones
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      '')
                                                Flexible(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      ShoppingCartSummaryUIGroup
                                                          .eventInfoCall
                                                          .celebratee(
                                                        (_model.eventInfoRespones
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'Celebratee Gender',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              if (ShoppingCartSummaryUIGroup
                                                          .eventInfoCall
                                                          .celebrateeAge(
                                                        (_model.eventInfoRespones
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      null &&
                                                  ShoppingCartSummaryUIGroup
                                                          .eventInfoCall
                                                          .celebrateeAge(
                                                        (_model.eventInfoRespones
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      '')
                                                Flexible(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      ShoppingCartSummaryUIGroup
                                                          .eventInfoCall
                                                          .celebrateeAge(
                                                        (_model.eventInfoRespones
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'Celebratee Age',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                                  ),
                                                ),
                                            ].divide(SizedBox(width: 19.0)),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 24.0, 0.0, 2.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'v97jibzm' /* Guest Count */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleLargeIsCustom,
                                        ),
                                  ),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.96,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'd9ezhava' /* Kids: */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'gikho8i5' /* 12 */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  't40uh32t' /* Adults: */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'cpjt7dji' /* 8 */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'j2eq5124' /* Total Guests: */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'f7dqw3g7' /* 20 */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              if ((ShoppingCartSummaryUIGroup.eventInfoCall
                                              .themeCategoryName(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      ShoppingCartSummaryUIGroup.eventInfoCall
                                              .themeCategoryName(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          '') ||
                                  (ShoppingCartSummaryUIGroup.eventInfoCall
                                              .totalCost(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      ShoppingCartSummaryUIGroup.eventInfoCall
                                              .totalCost(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 24.0, 0.0, 2.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '5pqv3cme' /* Other Details */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleLargeIsCustom,
                                        ),
                                  ),
                                ),
                              if ((ShoppingCartSummaryUIGroup.eventInfoCall
                                              .themeCategoryName(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      ShoppingCartSummaryUIGroup.eventInfoCall
                                              .themeCategoryName(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          '') ||
                                  (ShoppingCartSummaryUIGroup.eventInfoCall
                                              .totalCost(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      ShoppingCartSummaryUIGroup.eventInfoCall
                                              .totalCost(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''))
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.96,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (ShoppingCartSummaryUIGroup
                                                      .eventInfoCall
                                                      .themeCategoryName(
                                                    (_model.eventInfoRespones
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              ShoppingCartSummaryUIGroup
                                                      .eventInfoCall
                                                      .themeCategoryName(
                                                    (_model.eventInfoRespones
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  '')
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ig197xvn' /* Theme: */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
                                                          ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    ShoppingCartSummaryUIGroup
                                                        .eventInfoCall
                                                        .themeCategoryName(
                                                      (_model.eventInfoRespones
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    'Theme Category',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          if (ShoppingCartSummaryUIGroup
                                                      .eventInfoCall
                                                      .totalCost(
                                                    (_model.eventInfoRespones
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              ShoppingCartSummaryUIGroup
                                                      .eventInfoCall
                                                      .totalCost(
                                                    (_model.eventInfoRespones
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  '')
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'objq67rj' /* Total Cost: */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
                                                          ),
                                                ),
                                                Text(
                                                  '\$ ${valueOrDefault<String>(
                                                    ShoppingCartSummaryUIGroup
                                                        .eventInfoCall
                                                        .totalCost(
                                                      (_model.eventInfoRespones
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    'Total Cost',
                                                  )}',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              if ((ShoppingCartSummaryUIGroup.eventInfoCall
                                              .altdate1(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      ShoppingCartSummaryUIGroup.eventInfoCall
                                              .altdate1(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          '') ||
                                  (ShoppingCartSummaryUIGroup.eventInfoCall
                                              .altdate2(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      ShoppingCartSummaryUIGroup.eventInfoCall
                                              .altdate2(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 24.0, 0.0, 2.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ojjo6wca' /* Alternative Dates */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleLargeIsCustom,
                                        ),
                                  ),
                                ),
                              if ((ShoppingCartSummaryUIGroup.eventInfoCall
                                              .altdate1(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      ShoppingCartSummaryUIGroup.eventInfoCall
                                              .altdate1(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          '') ||
                                  (ShoppingCartSummaryUIGroup.eventInfoCall
                                              .altdate2(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      ShoppingCartSummaryUIGroup.eventInfoCall
                                              .altdate2(
                                            (_model.eventInfoRespones
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          ''))
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.96,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (ShoppingCartSummaryUIGroup
                                                      .eventInfoCall
                                                      .altdate1(
                                                    (_model.eventInfoRespones
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              ShoppingCartSummaryUIGroup
                                                      .eventInfoCall
                                                      .altdate1(
                                                    (_model.eventInfoRespones
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  '')
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'udz6vnmt' /* Date 1: */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions.formatDate(
                                                          ShoppingCartSummaryUIGroup
                                                              .eventInfoCall
                                                              .altdate1(
                                                        (_model.eventInfoRespones
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      'Date',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          if (ShoppingCartSummaryUIGroup
                                                      .eventInfoCall
                                                      .altdate2(
                                                    (_model.eventInfoRespones
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              ShoppingCartSummaryUIGroup
                                                      .eventInfoCall
                                                      .altdate2(
                                                    (_model.eventInfoRespones
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  '')
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'zgks85b0' /* Date 2: */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions.formatDate(
                                                          ShoppingCartSummaryUIGroup
                                                              .eventInfoCall
                                                              .altdate2(
                                                        (_model.eventInfoRespones
                                                                ?.jsonBody ??
                                                            ''),
                                                      )),
                                                      'Date',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              if (ShoppingCartSummaryUIGroup.eventInfoCall
                                          .eventDescription(
                                        (_model.eventInfoRespones?.jsonBody ??
                                            ''),
                                      ) !=
                                      null &&
                                  ShoppingCartSummaryUIGroup.eventInfoCall
                                          .eventDescription(
                                        (_model.eventInfoRespones?.jsonBody ??
                                            ''),
                                      ) !=
                                      '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 24.0, 0.0, 2.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'nu5ekgrg' /* Description */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleLargeIsCustom,
                                        ),
                                  ),
                                ),
                              if (ShoppingCartSummaryUIGroup.eventInfoCall
                                          .eventDescription(
                                        (_model.eventInfoRespones?.jsonBody ??
                                            ''),
                                      ) !=
                                      null &&
                                  ShoppingCartSummaryUIGroup.eventInfoCall
                                          .eventDescription(
                                        (_model.eventInfoRespones?.jsonBody ??
                                            ''),
                                      ) !=
                                      '')
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.97,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          wrapWithModel(
                                            model: _model.descriptionCompModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: DescriptionCompWidget(
                                              input: getJsonField(
                                                (_model.eventInfoRespones
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.details[:]['eventDescription']''',
                                              ).toString(),
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
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            if (widget.customCake) {
                              context.pushNamed(
                                CustomCakeDNTWidget.routeName,
                                queryParameters: {
                                  'bakeryId': serializeParam(
                                    widget.type,
                                    ParamType.String,
                                  ),
                                  'menuSectionId': serializeParam(
                                    widget.packageId,
                                    ParamType.String,
                                  ),
                                  'index': serializeParam(
                                    widget.recordKey,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              if (!widget.denominatorId!) {
                                context.pushNamed(
                                  DateAndTimeTab1Widget.routeName,
                                  queryParameters: {
                                    'recordKey': serializeParam(
                                      functions.stringToInt(widget.recordKey),
                                      ParamType.int,
                                    ),
                                    'type': serializeParam(
                                      functions.stringToInt(widget.type),
                                      ParamType.int,
                                    ),
                                    'packageId': serializeParam(
                                      widget.packageId != null &&
                                              widget.packageId != ''
                                          ? functions
                                              .stringToInt(widget.packageId)
                                          : null,
                                      ParamType.int,
                                    ),
                                    'spaceId': serializeParam(
                                      widget.spaceId != null &&
                                              widget.spaceId != ''
                                          ? functions
                                              .stringToInt(widget.spaceId)
                                          : null,
                                      ParamType.int,
                                    ),
                                    'denominatorId': serializeParam(
                                      widget.denominatorId == true
                                          ? functions.stringToInt(
                                              widget.denominatorId?.toString())
                                          : null,
                                      ParamType.int,
                                    ),
                                    'denomName': serializeParam(
                                      '',
                                      ParamType.String,
                                    ),
                                    'resourceItemType': serializeParam(
                                      widget.resourceItemType,
                                      ParamType.String,
                                    ),
                                    'quantity': serializeParam(
                                      widget.quantity,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                context.pushNamed(
                                  PackageVariationPageWidget.routeName,
                                  queryParameters: {
                                    'resourceItemId': serializeParam(
                                      widget.resourceItemId,
                                      ParamType.String,
                                    ),
                                    'recordKey': serializeParam(
                                      functions.stringToInt(widget.recordKey),
                                      ParamType.int,
                                    ),
                                    'type': serializeParam(
                                      functions.stringToInt(widget.type),
                                      ParamType.int,
                                    ),
                                    'spaceId': serializeParam(
                                      widget.spaceId != null &&
                                              widget.spaceId != ''
                                          ? functions
                                              .stringToInt(widget.spaceId)
                                          : null,
                                      ParamType.int,
                                    ),
                                    'packageId': serializeParam(
                                      widget.packageId != null &&
                                              widget.packageId != ''
                                          ? functions
                                              .stringToInt(widget.packageId)
                                          : null,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            'rm1wa4q1' /* Next */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
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
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
