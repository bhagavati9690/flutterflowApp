import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0x5895A1AC),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Distance',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: const Color(0x5895A1AC),
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: const Color(0x5895A1AC),
                    icon: Icon(
                      Icons.clear,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context, _model.distanceSelectionValue);
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterFlowRadioButton(
                  options: [
                    '  2 Mile             ',
                    '  5 Mile            ',
                    '  10 Mile          ',
                    '  25 Mile             ',
                    '  50 Mile          ',
                    '  100 Mile        ',
                    '  No Limits     '
                  ].toList(),
                  onChanged: (val) => setState(() {}),
                  controller: _model.distanceSelectionValueController ??=
                      FormFieldController<String>('  25 Mile             '),
                  optionHeight: 30.0,
                  optionWidth: 276.0,
                  textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                  selectedTextStyle: FlutterFlowTheme.of(context)
                      .bodyLarge
                      .override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                      ),
                  textPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 150.0, 0.0),
                  buttonPosition: RadioButtonPosition.right,
                  direction: Axis.vertical,
                  radioButtonColor: FlutterFlowTheme.of(context).alternate,
                  inactiveRadioButtonColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  toggleable: false,
                  horizontalAlignment: WrapAlignment.center,
                  verticalAlignment: WrapCrossAlignment.end,
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0x5895A1AC),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context, _model.distanceSelectionValue);
                  },
                  text: 'Apply',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.991,
                    height: 38.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xEED1D3D6),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
