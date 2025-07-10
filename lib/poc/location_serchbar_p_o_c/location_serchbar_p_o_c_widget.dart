import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'location_serchbar_p_o_c_model.dart';
export 'location_serchbar_p_o_c_model.dart';

class LocationSerchbarPOCWidget extends StatefulWidget {
  const LocationSerchbarPOCWidget({super.key});

  static String routeName = 'locationSerchbarPOC';
  static String routePath = 'locationSerchbarPOC';

  @override
  State<LocationSerchbarPOCWidget> createState() =>
      _LocationSerchbarPOCWidgetState();
}

class _LocationSerchbarPOCWidgetState extends State<LocationSerchbarPOCWidget> {
  late LocationSerchbarPOCModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationSerchbarPOCModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentPosition = await actions.determinePosition();
      _model.apiResultLocation = await GetAddressFromLatLongCall.call(
        latitude: functions.getLatitude(_model.currentPosition),
        longitude: functions.getLongitude(_model.currentPosition),
      );

      _model.contry = GetAddressFromLatLongCall.country(
        (_model.apiResultLocation?.jsonBody ?? ''),
      );
      _model.place = GetAddressFromLatLongCall.place(
        (_model.apiResultLocation?.jsonBody ?? ''),
      );
      _model.pincode = GetAddressFromLatLongCall.postalcode(
        (_model.apiResultLocation?.jsonBody ?? ''),
      );
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'uyzueiio' /* Location Test */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'qn349zjb' /*    Country: */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        _model.contry,
                        '..',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'u0c15qdl' /* Place:  */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        _model.place,
                        ',,',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'zafqwat1' /* PinCode : */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        _model.pincode,
                        '..',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'LatLong:::${LocationsApiGroup.retriveSuggestionCall.latitude(
                          (_model.apiResultRetriveLocation?.jsonBody ?? ''),
                        )?.toString()},${LocationsApiGroup.retriveSuggestionCall.longitude(
                          (_model.apiResultRetriveLocation?.jsonBody ?? ''),
                        )?.toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    _model.apiResultSuggestion =
                                        await LocationsApiGroup
                                            .locationSuggestionCall
                                            .call(
                                      searchLocation:
                                          _model.textController.text,
                                    );

                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '6wrsmq5d' /* Label here... */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyLargeIsCustom,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelMediumIsCustom,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if ((LocationsApiGroup.locationSuggestionCall
                                    .suggestion(
                                      (_model.apiResultSuggestion?.jsonBody ??
                                          ''),
                                    )
                                    ?.length !=
                                null) &&
                            (LocationsApiGroup.locationSuggestionCall
                                    .suggestion(
                                      (_model.apiResultSuggestion?.jsonBody ??
                                          ''),
                                    )!
                                    .length >
                                0))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.bounceOut,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                ),
                              ),
                              child: Builder(
                                builder: (context) {
                                  final suggestion =
                                      LocationsApiGroup.locationSuggestionCall
                                              .suggestion(
                                                (_model.apiResultSuggestion
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              ?.toList() ??
                                          [];

                                  return ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: suggestion.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 15.0),
                                    itemBuilder: (context, suggestionIndex) {
                                      final suggestionItem =
                                          suggestion[suggestionIndex];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 1.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.apiResultRetriveLocation =
                                                      await LocationsApiGroup
                                                          .retriveSuggestionCall
                                                          .call(
                                                    mapboxId: getJsonField(
                                                      suggestionItem,
                                                      r'''$.mapbox_id''',
                                                    ).toString(),
                                                  );

                                                  _model.apiResultLocationUpdate =
                                                      await GetAddressFromLatLongCall
                                                          .call(
                                                    latitude: LocationsApiGroup
                                                        .retriveSuggestionCall
                                                        .latitude(
                                                      (_model.apiResultRetriveLocation
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    longitude: LocationsApiGroup
                                                        .retriveSuggestionCall
                                                        .longitude(
                                                      (_model.apiResultRetriveLocation
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                  );

                                                  _model.contry =
                                                      GetAddressFromLatLongCall
                                                          .country(
                                                    (_model.apiResultLocationUpdate
                                                            ?.jsonBody ??
                                                        ''),
                                                  );
                                                  _model.place =
                                                      GetAddressFromLatLongCall
                                                          .place(
                                                    (_model.apiResultLocationUpdate
                                                            ?.jsonBody ??
                                                        ''),
                                                  );
                                                  _model.pincode =
                                                      GetAddressFromLatLongCall
                                                          .postalcode(
                                                    (_model.apiResultLocationUpdate
                                                            ?.jsonBody ??
                                                        ''),
                                                  );

                                                  safeSetState(() {});
                                                },
                                                child: Text(
                                                  '${getJsonField(
                                                    suggestionItem,
                                                    r'''$.name''',
                                                  ).toString()} , ${getJsonField(
                                                    suggestionItem,
                                                    r'''$.place_formatted''',
                                                  ).toString()}',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
