import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'guest_comp_model.dart';
export 'guest_comp_model.dart';

class GuestCompWidget extends StatefulWidget {
  const GuestCompWidget({
    super.key,
    required this.guestItem,
  });

  final dynamic guestItem;

  @override
  State<GuestCompWidget> createState() => _GuestCompWidgetState();
}

class _GuestCompWidgetState extends State<GuestCompWidget> {
  late GuestCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GuestCompModel());

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

    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x1A000000),
              offset: Offset(
                0.0,
                2.0,
              ),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getJsonField(
                            widget.guestItem,
                            r'''$.name''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                        ),
                        if ('${getJsonField(
                                  widget.guestItem,
                                  r'''$.guestType''',
                                ).toString()}${functions.checkJsonValue(getJsonField(
                                  widget.guestItem,
                                  r'''$.relation''',
                                )) ? ' ( ${getJsonField(
                                    widget.guestItem,
                                    r'''$.relation''',
                                  ).toString()} )' : ' '}' !=
                                '')
                          Text(
                            '${getJsonField(
                              widget.guestItem,
                              r'''$.guestType''',
                            ).toString()}${functions.checkJsonValue(getJsonField(
                              widget.guestItem,
                              r'''$.relation''',
                            )) ? ' ( ${getJsonField(
                                widget.guestItem,
                                r'''$.relation''',
                              ).toString()} )' : ' '}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                      ],
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      context.goNamed(
                        GuestDetailsWidget.routeName,
                        queryParameters: {
                          'eventId': serializeParam(
                            FFAppState().eventId,
                            ParamType.String,
                          ),
                          'guestId': serializeParam(
                            (getJsonField(
                              widget.guestItem,
                              r'''$._id''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList(),
                            ParamType.String,
                            isList: true,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'yog9kybc' /* Details */,
                    ),
                    options: FFButtonOptions(
                      height: MediaQuery.sizeOf(context).height * 0.045,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
              if (functions.checkJsonValue(getJsonField(
                widget.guestItem,
                r'''$.addressFormatted''',
              )))
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.location_city,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    Flexible(
                      child: Text(
                        getJsonField(
                          widget.guestItem,
                          r'''$.addressFormatted''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyLargeIsCustom,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              if (functions.checkJsonValue(getJsonField(
                widget.guestItem,
                r'''$.phone''',
              )))
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.phone_iphone,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    Flexible(
                      child: Text(
                        getJsonField(
                          widget.guestItem,
                          r'''$.phone''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyLargeIsCustom,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
