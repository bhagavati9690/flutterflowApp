import '/backend/api_requests/api_calls.dart';
import '/compoents/allvendor_search_comp/location_change_comp/location_change_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'location_search_comp_model.dart';
export 'location_search_comp_model.dart';

class LocationSearchCompWidget extends StatefulWidget {
  const LocationSearchCompWidget({super.key});

  @override
  State<LocationSearchCompWidget> createState() =>
      _LocationSearchCompWidgetState();
}

class _LocationSearchCompWidgetState extends State<LocationSearchCompWidget> {
  late LocationSearchCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationSearchCompModel());

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

    return Builder(
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
            targetAnchor: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            followerAnchor: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            builder: (dialogContext) {
              return Material(
                color: Colors.transparent,
                child: WebViewAware(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.99,
                    width: MediaQuery.sizeOf(context).width * 0.99,
                    child: LocationChangeCompWidget(
                      latitude: FFAppState().latitude,
                      longitude: FFAppState().longituade,
                    ),
                  ),
                ),
              );
            },
          ).then((value) =>
              safeSetState(() => _model.locationUpdateOutput4 = value));

          _model.assignLocation4 =
              await AccountInfoGroup.assignLocationCall.call(
            country: _model.locationUpdateOutput4?.country != null &&
                    _model.locationUpdateOutput4?.country != ''
                ? _model.locationUpdateOutput4?.country
                : FFAppState().country,
            postalCode: _model.locationUpdateOutput4?.postalCode != null &&
                    _model.locationUpdateOutput4?.postalCode != ''
                ? _model.locationUpdateOutput4?.postalCode
                : FFAppState().pincode,
            geometrycoordinates0:
                _model.locationUpdateOutput4?.longitude != null
                    ? _model.locationUpdateOutput4?.longitude
                    : FFAppState().longituade,
            geometrycoordinates1: _model.locationUpdateOutput4?.latitude != null
                ? _model.locationUpdateOutput4?.latitude
                : FFAppState().latitude,
            stateProvince: _model.locationUpdateOutput4?.region != null &&
                    _model.locationUpdateOutput4?.region != ''
                ? _model.locationUpdateOutput4?.region
                : FFAppState().region,
            cityTown: _model.locationUpdateOutput4?.place != null &&
                    _model.locationUpdateOutput4?.place != ''
                ? _model.locationUpdateOutput4?.place
                : FFAppState().place,
            token: FFAppState().SessionToken,
          );

          if (AccountInfoGroup.assignLocationCall.actionSucess(
            (_model.assignLocation4?.jsonBody ?? ''),
          )!) {
            FFAppState().latitude =
                _model.locationUpdateOutput4?.latitude != null
                    ? _model.locationUpdateOutput4!.latitude
                    : FFAppState().latitude;
            FFAppState().longituade =
                _model.locationUpdateOutput4?.longitude != null
                    ? _model.locationUpdateOutput4!.longitude
                    : FFAppState().longituade;
            FFAppState().place = _model.locationUpdateOutput4?.place != null &&
                    _model.locationUpdateOutput4?.place != ''
                ? _model.locationUpdateOutput4!.place
                : FFAppState().place;
            FFAppState().pincode =
                _model.locationUpdateOutput4?.postalCode != null &&
                        _model.locationUpdateOutput4?.postalCode != ''
                    ? _model.locationUpdateOutput4!.postalCode
                    : FFAppState().pincode;
            FFAppState().country =
                _model.locationUpdateOutput4?.country != null &&
                        _model.locationUpdateOutput4?.country != ''
                    ? _model.locationUpdateOutput4!.country
                    : FFAppState().country;
            FFAppState().region =
                _model.locationUpdateOutput4?.region != null &&
                        _model.locationUpdateOutput4?.region != ''
                    ? _model.locationUpdateOutput4!.region
                    : FFAppState().region;
            FFAppState().SessionToken =
                (_model.assignLocation4?.getHeader('cbxtoken') ?? '');
            _model.visibleTabResponse2 = await VisibleTabCall.call(
              state: _model.locationUpdateOutput4?.region != null &&
                      _model.locationUpdateOutput4?.region != ''
                  ? _model.locationUpdateOutput4?.region
                  : FFAppState().region,
              token: FFAppState().SessionToken,
            );

            if ((_model.visibleTabResponse2?.succeeded ?? true)) {
              FFAppState().rentalVisible =
                  functions.stringToBool(VisibleTabCall.rental(
                (_model.visibleTabResponse2?.jsonBody ?? ''),
              ));
              FFAppState().entertainerVisible =
                  functions.stringToBool(VisibleTabCall.entertainer(
                (_model.visibleTabResponse2?.jsonBody ?? ''),
              ));
              FFAppState().cakeVisible =
                  functions.stringToBool(VisibleTabCall.cake(
                (_model.visibleTabResponse2?.jsonBody ?? ''),
              ));
            }
          }

          safeSetState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.07,
                  height: MediaQuery.sizeOf(context).width * 0.07,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          '${FFAppState().place},${FFAppState().region}',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyLargeIsCustom,
                              ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '020ml7hk' /* Change Location Here */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color:
                                    FlutterFlowTheme.of(context).clbxIconColor1,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodySmallIsCustom,
                              ),
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
    );
  }
}
