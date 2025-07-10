import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'timer_picker_comp_model.dart';
export 'timer_picker_comp_model.dart';

class TimerPickerCompWidget extends StatefulWidget {
  const TimerPickerCompWidget({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.initialHr,
    this.initMin,
    String? label,
  }) : this.label = label ?? 'Time : ';

  final int? startTime;
  final int? endTime;
  final String? initialHr;
  final String? initMin;
  final String label;

  @override
  State<TimerPickerCompWidget> createState() => _TimerPickerCompWidgetState();
}

class _TimerPickerCompWidgetState extends State<TimerPickerCompWidget> {
  late TimerPickerCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerPickerCompModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedTime = functions.getTimeFromTimePickerComp(
          int.parse((widget.initialHr!)) % 12,
          functions.stringToInt(widget.initMin)!,
          functions.getAMOrPM(widget.initialHr!));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryText,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                child: Text(
                  widget.label,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController1 ??=
                      FormFieldController<String>(
                    _model.dropDownValue1 ??=
                        (int.parse((widget.initialHr!)) % 12).toString(),
                  ),
                  options: functions.getHoursFromStartNEndTimeInSec(
                      widget.startTime!,
                      widget.endTime!,
                      _model.dropDownValue3 != null &&
                              _model.dropDownValue3 != ''
                          ? _model.dropDownValue3!
                          : functions.getAMOrPM(widget.initialHr!)),
                  onChanged: (val) async {
                    safeSetState(() => _model.dropDownValue1 = val);
                    _model.selectedTime = functions.getTimeFromTimePickerComp(
                        functions.stringToInt(_model.dropDownValue1)!,
                        functions.stringToInt(_model.dropDownValue2)!,
                        _model.dropDownValue3!);
                    safeSetState(() {});
                  },
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: 40.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                  hintText: 'Hour',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).primaryText,
                  borderWidth: 1.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '9izsj1rq' /*  :  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
                FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController2 ??=
                      FormFieldController<String>(
                    _model.dropDownValue2 ??= widget.initMin,
                  ),
                  options: [
                    FFLocalizations.of(context).getText(
                      'in2nres0' /* 0 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'eiw8pdha' /* 15 */,
                    ),
                    FFLocalizations.of(context).getText(
                      '3r058qaz' /* 30 */,
                    ),
                    FFLocalizations.of(context).getText(
                      '1d8404lt' /* 45 */,
                    )
                  ],
                  onChanged: (val) async {
                    safeSetState(() => _model.dropDownValue2 = val);
                    _model.selectedTime = functions.getTimeFromTimePickerComp(
                        functions.stringToInt(_model.dropDownValue1)!,
                        functions.stringToInt(_model.dropDownValue2)!,
                        _model.dropDownValue3!);
                    safeSetState(() {});
                  },
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: 40.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'xoe3737g' /* Min */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).primaryText,
                  borderWidth: 1.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '5o5c8xfx' /*  :  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
                FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController3 ??=
                      FormFieldController<String>(
                    _model.dropDownValue3 ??=
                        functions.getAMOrPM(widget.initialHr!),
                  ),
                  options: [
                    FFLocalizations.of(context).getText(
                      'xh3adsyt' /* AM */,
                    ),
                    FFLocalizations.of(context).getText(
                      '2927vuz0' /* PM */,
                    )
                  ],
                  onChanged: (val) async {
                    safeSetState(() => _model.dropDownValue3 = val);
                    _model.selectedTime = functions.getTimeFromTimePickerComp(
                        functions.stringToInt(_model.dropDownValue1)!,
                        functions.stringToInt(_model.dropDownValue2)!,
                        _model.dropDownValue3!);
                    safeSetState(() {});
                  },
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: 40.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    '19yhhpj0' /* AM */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).primaryText,
                  borderWidth: 1.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
