import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'guest_details_model.dart';
export 'guest_details_model.dart';

class GuestDetailsWidget extends StatefulWidget {
  const GuestDetailsWidget({
    super.key,
    required this.eventId,
    required this.guestId,
  });

  final String? eventId;
  final List<String>? guestId;

  static String routeName = 'GuestDetails';
  static String routePath = 'guestDetails';

  @override
  State<GuestDetailsWidget> createState() => _GuestDetailsWidgetState();
}

class _GuestDetailsWidgetState extends State<GuestDetailsWidget> {
  late GuestDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GuestDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.guestDetailQuery = ClientQueryStruct(
        clientId: 'nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid',
        cursor: CursorStruct(
          parentRecordKey: widget.eventId,
        ),
        selection: widget.guestId,
      );
      safeSetState(() {});
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFE3F333),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            fillColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.goNamed(
                MyEventsWidget.routeName,
                queryParameters: {
                  'tab': serializeParam(
                    1,
                    ParamType.int,
                  ),
                }.withoutNulls,
              );
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '4isq3gav' /* Guest Details */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: AccountInfoGroup.guestInformationCall.call(
              token: FFAppState().SessionToken,
              recordKey: widget.guestId?.firstOrNull,
              parentRecordKey: widget.eventId,
              clientQueryJson: _model.guestDetailQuery?.toMap(),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final columnGuestInformationResponse = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.goNamed(
                              GuestFormWidget.routeName,
                              queryParameters: {
                                'guestId': serializeParam(
                                  widget.guestId,
                                  ParamType.String,
                                  isList: true,
                                ),
                                'isEditForm': serializeParam(
                                  true,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            'd8hb3j1x' /* Edit Details */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).lemonLime,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primaryText,
                          borderRadius: 12.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).lemonLime,
                          icon: Icon(
                            Icons.delete_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            _model.guestDeleteQuery = ClientQueryStruct(
                              clientId:
                                  'nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid',
                              cursor: CursorStruct(
                                parentRecordKey: widget.eventId,
                              ),
                              selection: widget.guestId,
                            );
                            safeSetState(() {});
                            _model.apiResult7bq =
                                await AccountInfoGroup.deleteGuestCall.call(
                              token: FFAppState().SessionToken,
                              clientStateJson: _model.guestDeleteQuery?.toMap(),
                            );

                            if ((_model.apiResult7bq?.succeeded ?? true)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'delete Sucessfully',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              );

                              context.goNamed(
                                MyEventsWidget.routeName,
                                queryParameters: {
                                  'tab': serializeParam(
                                    1,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Something went Wrong',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                        ),
                      ].divide(SizedBox(width: 7.0)),
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.1,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.05,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE3F333),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${AccountInfoGroup.guestInformationCall.firstName(
                                              columnGuestInformationResponse
                                                  .jsonBody,
                                            )} ${AccountInfoGroup.guestInformationCall.middleName(
                                              columnGuestInformationResponse
                                                  .jsonBody,
                                            )} ${AccountInfoGroup.guestInformationCall.lastName(
                                              columnGuestInformationResponse
                                                  .jsonBody,
                                            )}',
                                            style: FlutterFlowTheme.of(context)
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
                                          Text(
                                            '${AccountInfoGroup.guestInformationCall.guestTypeName(
                                              columnGuestInformationResponse
                                                  .jsonBody,
                                            )}${functions.checkJsonValue(getJsonField(
                                              AccountInfoGroup
                                                  .guestInformationCall
                                                  .details(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  )
                                                  ?.firstOrNull,
                                              r'''$['memberRelation']''',
                                            )) ? '( ${AccountInfoGroup.guestInformationCall.memberRelationName(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              )} )' : ' '}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ('${AccountInfoGroup.guestInformationCall.bldgNum(
                                              columnGuestInformationResponse
                                                  .jsonBody,
                                            )}${AccountInfoGroup.guestInformationCall.street(
                                              columnGuestInformationResponse
                                                  .jsonBody,
                                            )}${AccountInfoGroup.guestInformationCall.citytown(
                                              columnGuestInformationResponse
                                                  .jsonBody,
                                            )}${AccountInfoGroup.guestInformationCall.stateProvince(
                                              columnGuestInformationResponse
                                                  .jsonBody,
                                            )}' !=
                                            '')
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                          Flexible(
                                            child: Text(
                                              '${AccountInfoGroup.guestInformationCall.bldgNum(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              )}  ${AccountInfoGroup.guestInformationCall.street(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              )}  ${AccountInfoGroup.guestInformationCall.citytown(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              )}  ${AccountInfoGroup.guestInformationCall.stateProvince(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              )}',
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
                                    if (functions.checkJsonValue(getJsonField(
                                      AccountInfoGroup.guestInformationCall
                                          .details(
                                            columnGuestInformationResponse
                                                .jsonBody,
                                          )
                                          ?.firstOrNull,
                                      r'''$['person-_-communication-_-email']''',
                                    )))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.email,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  AccountInfoGroup
                                                      .guestInformationCall
                                                      .email(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ),
                                                  'Email',
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
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ],
                                      ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (functions
                                            .checkJsonValue(getJsonField(
                                          AccountInfoGroup.guestInformationCall
                                              .details(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              )
                                              ?.firstOrNull,
                                          r'''$['person-_-communication-_-phone']''',
                                        )))
                                          Flexible(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.phone,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      AccountInfoGroup
                                                          .guestInformationCall
                                                          .phone(
                                                        columnGuestInformationResponse
                                                            .jsonBody,
                                                      ),
                                                      'phone',
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
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                          ),
                                        if (functions
                                            .checkJsonValue(getJsonField(
                                          AccountInfoGroup.guestInformationCall
                                              .details(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              )
                                              ?.firstOrNull,
                                          r'''$['person-_-communication-_-mobile']''',
                                        )))
                                          Flexible(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.phone_iphone,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      AccountInfoGroup
                                                          .guestInformationCall
                                                          .mobile(
                                                        columnGuestInformationResponse
                                                            .jsonBody,
                                                      ),
                                                      'mobile',
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
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                          ),
                                      ],
                                    ),
                                    if ((AccountInfoGroup.guestInformationCall
                                                    .dob(
                                                  columnGuestInformationResponse
                                                      .jsonBody,
                                                ) !=
                                                null &&
                                            AccountInfoGroup
                                                    .guestInformationCall
                                                    .dob(
                                                  columnGuestInformationResponse
                                                      .jsonBody,
                                                ) !=
                                                '') ||
                                        (AccountInfoGroup.guestInformationCall
                                                    .age(
                                                  columnGuestInformationResponse
                                                      .jsonBody,
                                                ) !=
                                                null &&
                                            AccountInfoGroup
                                                    .guestInformationCall
                                                    .age(
                                                  columnGuestInformationResponse
                                                      .jsonBody,
                                                ) !=
                                                ''))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (AccountInfoGroup
                                                      .guestInformationCall
                                                      .dob(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ) !=
                                                  null &&
                                              AccountInfoGroup
                                                      .guestInformationCall
                                                      .dob(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ) !=
                                                  '')
                                            Flexible(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .birthdayCake,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      (String? var1) {
                                                        return var1
                                                                ?.split(",")[1]
                                                                .trim() ??
                                                            "";
                                                      }(functions.formatDate(
                                                          AccountInfoGroup
                                                              .guestInformationCall
                                                              .dob(
                                                        columnGuestInformationResponse
                                                            .jsonBody,
                                                      ))),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          if (AccountInfoGroup
                                                      .guestInformationCall
                                                      .age(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ) !=
                                                  null &&
                                              AccountInfoGroup
                                                      .guestInformationCall
                                                      .age(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ) !=
                                                  '')
                                            Flexible(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.male,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        AccountInfoGroup
                                                            .guestInformationCall
                                                            .age(
                                                          columnGuestInformationResponse
                                                              .jsonBody,
                                                        ),
                                                        'Age',
                                                      )} Years',
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                        ],
                                      ),
                                    if ((AccountInfoGroup.guestInformationCall
                                                    .gender(
                                                  columnGuestInformationResponse
                                                      .jsonBody,
                                                ) !=
                                                null &&
                                            AccountInfoGroup
                                                    .guestInformationCall
                                                    .gender(
                                                  columnGuestInformationResponse
                                                      .jsonBody,
                                                ) !=
                                                '') ||
                                        (AccountInfoGroup.guestInformationCall
                                                    .education(
                                                  columnGuestInformationResponse
                                                      .jsonBody,
                                                ) !=
                                                null &&
                                            AccountInfoGroup
                                                    .guestInformationCall
                                                    .education(
                                                  columnGuestInformationResponse
                                                      .jsonBody,
                                                ) !=
                                                ''))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (AccountInfoGroup
                                                      .guestInformationCall
                                                      .gender(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ) !=
                                                  null &&
                                              AccountInfoGroup
                                                      .guestInformationCall
                                                      .gender(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ) !=
                                                  '')
                                            Flexible(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.transgender_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        AccountInfoGroup
                                                            .guestInformationCall
                                                            .gender(
                                                          columnGuestInformationResponse
                                                              .jsonBody,
                                                        ),
                                                        'Gender',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          if (AccountInfoGroup
                                                      .guestInformationCall
                                                      .education(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ) !=
                                                  null &&
                                              AccountInfoGroup
                                                      .guestInformationCall
                                                      .education(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ) !=
                                                  '')
                                            Flexible(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.cast_for_education,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        AccountInfoGroup
                                                            .guestInformationCall
                                                            .education(
                                                          columnGuestInformationResponse
                                                              .jsonBody,
                                                        ),
                                                        'Education',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                        ],
                                      ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'dbiklt8f' /* Dietary Preferences */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              decoration:
                                                  TextDecoration.underline,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
                                            ),
                                      ),
                                      if (AccountInfoGroup.guestInformationCall
                                                  .interests(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              ) !=
                                              null &&
                                          AccountInfoGroup.guestInformationCall
                                                  .interests(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              ) !=
                                              '')
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                AccountInfoGroup
                                                    .guestInformationCall
                                                    .interests(
                                                  columnGuestInformationResponse
                                                      .jsonBody,
                                                ),
                                                'Interests',
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                          .checkboxValue1 ??=
                                                      functions.stringToBool(
                                                          valueOrDefault<
                                                              String>(
                                                    AccountInfoGroup
                                                        .guestInformationCall
                                                        .specialNeed(
                                                      columnGuestInformationResponse
                                                          .jsonBody,
                                                    ),
                                                    'false',
                                                  )),
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.checkboxValue1 =
                                                            newValue!);
                                                  },
                                                  side: (FlutterFlowTheme.of(
                                                                  context)
                                                              .primary !=
                                                          null)
                                                      ? BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        )
                                                      : null,
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'iei3rxrl' /* Special Needs */,
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
                                            ].divide(SizedBox(width: 7.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                          .checkboxValue2 ??=
                                                      functions.stringToBool(
                                                          valueOrDefault<
                                                              String>(
                                                    AccountInfoGroup
                                                        .guestInformationCall
                                                        .allergy(
                                                      columnGuestInformationResponse
                                                          .jsonBody,
                                                    ),
                                                    'false',
                                                  )),
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.checkboxValue2 =
                                                            newValue!);
                                                  },
                                                  side: (FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate !=
                                                          null)
                                                      ? BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        )
                                                      : null,
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'fp6rqu6v' /* Allergy */,
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
                                            ].divide(SizedBox(width: 7.0)),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          if ((AccountInfoGroup.guestInformationCall.rsvp(
                                        columnGuestInformationResponse.jsonBody,
                                      ) !=
                                      null &&
                                  AccountInfoGroup.guestInformationCall.rsvp(
                                        columnGuestInformationResponse.jsonBody,
                                      ) !=
                                      '') ||
                              (AccountInfoGroup.guestInformationCall.keepIt(
                                        columnGuestInformationResponse.jsonBody,
                                      ) !=
                                      null &&
                                  AccountInfoGroup.guestInformationCall.keepIt(
                                        columnGuestInformationResponse.jsonBody,
                                      ) !=
                                      '') ||
                              (AccountInfoGroup.guestInformationCall
                                          .eventGuestrsvp(
                                        columnGuestInformationResponse.jsonBody,
                                      ) !=
                                      null &&
                                  AccountInfoGroup.guestInformationCall
                                          .eventGuestrsvp(
                                        columnGuestInformationResponse.jsonBody,
                                      ) !=
                                      ''))
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '7whhkjp9' /* RSVP Status */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              decoration:
                                                  TextDecoration.underline,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
                                            ),
                                      ),
                                      if (AccountInfoGroup.guestInformationCall
                                                  .rsvp(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              ) !=
                                              null &&
                                          AccountInfoGroup.guestInformationCall
                                                  .rsvp(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              ) !=
                                              '')
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '82ur931l' /* RSVP */,
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
                                            Flexible(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  AccountInfoGroup
                                                      .guestInformationCall
                                                      .rsvp(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ),
                                                  'rsvp',
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
                                          ],
                                        ),
                                      if (AccountInfoGroup.guestInformationCall
                                                  .keepIt(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              ) !=
                                              null &&
                                          AccountInfoGroup.guestInformationCall
                                                  .keepIt(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              ) !=
                                              '')
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'lucl0osn' /* Keep It */,
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
                                            Flexible(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  AccountInfoGroup
                                                      .guestInformationCall
                                                      .keepIt(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ),
                                                  'k',
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
                                          ],
                                        ),
                                      if (AccountInfoGroup.guestInformationCall
                                                  .eventGuestrsvp(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              ) !=
                                              null &&
                                          AccountInfoGroup.guestInformationCall
                                                  .eventGuestrsvp(
                                                columnGuestInformationResponse
                                                    .jsonBody,
                                              ) !=
                                              '')
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'xvbnzm2g' /* Comments */,
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
                                            Flexible(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  AccountInfoGroup
                                                      .guestInformationCall
                                                      .svpComments(
                                                    columnGuestInformationResponse
                                                        .jsonBody,
                                                  ),
                                                  'GuestrsvpComments',
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
                                          ],
                                        ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          if (AccountInfoGroup.guestInformationCall.comment(
                                    columnGuestInformationResponse.jsonBody,
                                  ) !=
                                  null &&
                              AccountInfoGroup.guestInformationCall.comment(
                                    columnGuestInformationResponse.jsonBody,
                                  ) !=
                                  '')
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '1f263qif' /* Description */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.underline,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleMediumIsCustom,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            AccountInfoGroup
                                                .guestInformationCall
                                                .comment(
                                              columnGuestInformationResponse
                                                  .jsonBody,
                                            ),
                                            'Comment/Note',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLargeIsCustom,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
