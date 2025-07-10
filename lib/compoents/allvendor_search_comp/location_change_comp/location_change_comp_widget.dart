import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/error_compoent/error_compoent_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'location_change_comp_model.dart';
export 'location_change_comp_model.dart';

class LocationChangeCompWidget extends StatefulWidget {
  const LocationChangeCompWidget({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  @override
  State<LocationChangeCompWidget> createState() =>
      _LocationChangeCompWidgetState();
}

class _LocationChangeCompWidgetState extends State<LocationChangeCompWidget> {
  late LocationChangeCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationChangeCompModel());

    _model.locationTextFieldTextController ??= TextEditingController();
    _model.locationTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.16,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lemonLime,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 10.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).lemonLime,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(
                                context,
                                LocationReturnStruct(
                                  latitude: FFAppState().latitude,
                                  longitude: FFAppState().longituade,
                                  country: LocationsApiGroup
                                      .getLocationFromLatLongCall
                                      .country(
                                    (_model.apiResultLocation2?.jsonBody ?? ''),
                                  ),
                                  place: LocationsApiGroup
                                      .getLocationFromLatLongCall
                                      .place(
                                    (_model.apiResultLocation2?.jsonBody ?? ''),
                                  ),
                                  postalCode: LocationsApiGroup
                                      .getLocationFromLatLongCall
                                      .postalCode(
                                    (_model.apiResultLocation2?.jsonBody ?? ''),
                                  ),
                                  region: LocationsApiGroup
                                      .getLocationFromLatLongCall
                                      .region(
                                    (_model.apiResultLocation2?.jsonBody ?? ''),
                                  ),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.08,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(
                      width: 1.0,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      child: TextFormField(
                        controller: _model.locationTextFieldTextController,
                        focusNode: _model.locationTextFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.locationTextFieldTextController',
                          Duration(milliseconds: 2000),
                          () async {
                            _model.apiResultLocationSuggestion =
                                await LocationsApiGroup.locationSuggestionCall
                                    .call(
                              searchLocation:
                                  _model.locationTextFieldTextController.text,
                              latlong:
                                  '${FFAppState().longituade.toString()},${FFAppState().latitude.toString()}',
                            );

                            safeSetState(() {});
                          },
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: FFLocalizations.of(context).getText(
                            '1p7gmrwl' /* Search for area, street name..... */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelMediumIsCustom,
                              ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          hoverColor: FlutterFlowTheme.of(context).primary,
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 23.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                        validator: _model
                            .locationTextFieldTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await requestPermission(locationPermission);
                    _model.currentPosition1 = await actions.determinePosition();
                    FFAppState().latitude =
                        functions.getLatitude(_model.currentPosition1)!;
                    FFAppState().longituade =
                        functions.getLongitude(_model.currentPosition1)!;
                    _model.apiResultLocation2 =
                        await LocationsApiGroup.getLocationFromLatLongCall.call(
                      longitude:
                          functions.getLongitude(_model.currentPosition1),
                      latitude: functions.getLatitude(_model.currentPosition1),
                    );

                    FFAppState().country =
                        LocationsApiGroup.getLocationFromLatLongCall.country(
                      (_model.apiResultLocation2?.jsonBody ?? ''),
                    )!;
                    FFAppState().place =
                        LocationsApiGroup.getLocationFromLatLongCall.place(
                      (_model.apiResultLocation2?.jsonBody ?? ''),
                    )!;
                    FFAppState().pincode =
                        LocationsApiGroup.getLocationFromLatLongCall.postalCode(
                      (_model.apiResultLocation2?.jsonBody ?? ''),
                    )!;
                    FFAppState().region =
                        LocationsApiGroup.getLocationFromLatLongCall.region(
                      (_model.apiResultLocation2?.jsonBody ?? ''),
                    )!;
                    Navigator.pop(
                        context,
                        LocationReturnStruct(
                          latitude: FFAppState().latitude,
                          longitude: FFAppState().longituade,
                          country: LocationsApiGroup.getLocationFromLatLongCall
                              .country(
                            (_model.apiResultLocation2?.jsonBody ?? ''),
                          ),
                          place: LocationsApiGroup.getLocationFromLatLongCall
                              .place(
                            (_model.apiResultLocation2?.jsonBody ?? ''),
                          ),
                          postalCode: LocationsApiGroup
                              .getLocationFromLatLongCall
                              .postalCode(
                            (_model.apiResultLocation2?.jsonBody ?? ''),
                          ),
                          region: LocationsApiGroup.getLocationFromLatLongCall
                              .region(
                            (_model.apiResultLocation2?.jsonBody ?? ''),
                          ),
                        ));

                    safeSetState(() {});
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Icon(
                                Icons.my_location,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'yucqjbyd' /* Use current location */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyLargeIsCustom,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'uvcktlff' /* Enable location access */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodySmallIsCustom,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                if ((LocationsApiGroup.locationSuggestionCall
                            .suggestion(
                              (_model.apiResultLocationSuggestion?.jsonBody ??
                                  ''),
                            )
                            ?.length !=
                        null) &&
                    (LocationsApiGroup.locationSuggestionCall
                            .suggestion(
                              (_model.apiResultLocationSuggestion?.jsonBody ??
                                  ''),
                            )!
                            .length >
                        0))
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            final suggestion =
                                LocationsApiGroup.locationSuggestionCall
                                        .suggestion(
                                          (_model.apiResultLocationSuggestion
                                                  ?.jsonBody ??
                                              ''),
                                        )
                                        ?.toList() ??
                                    [];
                            if (suggestion.isEmpty) {
                              return ErrorCompoentWidget();
                            }

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: suggestion.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 15.0),
                              itemBuilder: (context, suggestionIndex) {
                                final suggestionItem =
                                    suggestion[suggestionIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
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
                                        await GetAddressFromLatLongCall.call(
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

                                    Navigator.pop(
                                        context,
                                        LocationReturnStruct(
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
                                          country:
                                              GetAddressFromLatLongCall.country(
                                            (_model.apiResultLocationUpdate
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          place:
                                              GetAddressFromLatLongCall.place(
                                            (_model.apiResultLocationUpdate
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          postalCode: GetAddressFromLatLongCall
                                              .postalcode(
                                            (_model.apiResultLocationUpdate
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          region:
                                              GetAddressFromLatLongCall.region(
                                            (_model.apiResultLocationUpdate
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                        ));

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Icon(
                                              Icons.location_pin,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(7.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${getJsonField(
                                                      suggestionItem,
                                                      r'''$.name''',
                                                    ).toString()} , ${getJsonField(
                                                      suggestionItem,
                                                      r'''$.place_formatted''',
                                                    ).toString()}',
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
                                                  Text(
                                                    functions
                                                        .metersToMileFunction(
                                                            valueOrDefault<int>(
                                                      getJsonField(
                                                        suggestionItem,
                                                        r'''$.distance''',
                                                      ),
                                                      40000,
                                                    ))!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
