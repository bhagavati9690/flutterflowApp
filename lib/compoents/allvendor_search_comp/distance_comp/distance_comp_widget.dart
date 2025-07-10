import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'distance_comp_model.dart';
export 'distance_comp_model.dart';

class DistanceCompWidget extends StatefulWidget {
  const DistanceCompWidget({super.key});

  @override
  State<DistanceCompWidget> createState() => _DistanceCompWidgetState();
}

class _DistanceCompWidgetState extends State<DistanceCompWidget> {
  late DistanceCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DistanceCompModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'nx362c62' /* Distance */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .titleMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .titleMediumIsCustom,
                            ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.clear,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context, _model.distanceSelectedValue);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    Flexible(
                      child: Text(
                        valueOrDefault<String>(
                          '${FFAppState().place},${FFAppState().region}',
                          'Location',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlutterFlowChoiceChips(
                    options: [
                      ChipData(FFLocalizations.of(context).getText(
                        'nqrn62oh' /* 2 Mile */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'uz20iv41' /* 5 Mile */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'ygtavqza' /* 10 Mile */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'iyjxg671' /* 25 Mile */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'oa8s8fx5' /* 50 Mile */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '6mizrrr8' /* 100 Mile */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'nx20icap' /* No Limits */,
                      ))
                    ],
                    onChanged: (val) => safeSetState(
                        () => _model.distanceSelectedValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.of(context).pillColor,
                      textStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelMediumIsCustom,
                          ),
                      iconColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      iconSize: 20.0,
                      labelPadding: EdgeInsets.all(6.0),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .labelLarge
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelLargeIsCustom,
                          ),
                      iconColor: FlutterFlowTheme.of(context).primaryText,
                      iconSize: 20.0,
                      labelPadding: EdgeInsets.all(6.0),
                      elevation: 0.0,
                      borderColor: FlutterFlowTheme.of(context).primaryText,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    chipSpacing: 16.0,
                    rowSpacing: 16.0,
                    multiselect: false,
                    initialized: _model.distanceSelectedValue != null,
                    alignment: WrapAlignment.start,
                    controller: _model.distanceSelectedValueController ??=
                        FormFieldController<List<String>>(
                      [FFAppState().distance],
                    ),
                    wrapped: true,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0x5895A1AC),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(
                                context, _model.distanceSelectedValue);
                          },
                          text: FFLocalizations.of(context).getText(
                            'w6775frd' /* Apply */,
                          ),
                          options: FFButtonOptions(
                            height: 38.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 7.0)),
          ),
        ),
      ),
    );
  }
}
