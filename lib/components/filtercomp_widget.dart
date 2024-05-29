import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'filtercomp_model.dart';
export 'filtercomp_model.dart';

class FiltercompWidget extends StatefulWidget {
  const FiltercompWidget({super.key});

  @override
  State<FiltercompWidget> createState() => _FiltercompWidgetState();
}

class _FiltercompWidgetState extends State<FiltercompWidget> {
  late FiltercompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltercompModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(45.0, 20.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 219.0,
                    decoration: const BoxDecoration(
                      color: Color(0x12B9ABA7),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Distance',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        FlutterFlowRadioButton(
                          options: [
                            '2 Mile',
                            '5 Mile',
                            '10 Mile',
                            '25 Mile',
                            '50 Mile',
                            '100 Mile',
                            'No Limits'
                          ].toList(),
                          onChanged: (val) => setState(() {}),
                          controller:
                              _model.distanceSelectionValueController ??=
                                  FormFieldController<String>('25 Mile'),
                          optionHeight: 25.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).alternate,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.center,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                        Text(
                          valueOrDefault<String>(
                            _model.distanceSelectionValue,
                            'g',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  Container(
                    width: double.infinity,
                    height: 87.0,
                    decoration: const BoxDecoration(
                      color: Color(0x12B9ABA7),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sort By',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        FlutterFlowRadioButton(
                          options: ['ASC', 'DESC'].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.sortSelectionValueController ??=
                              FormFieldController<String>('ASC'),
                          optionHeight: 24.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.horizontal,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.center,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                        Text(
                          valueOrDefault<String>(
                            _model.sortSelectionValue,
                            'f',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  Container(
                    width: double.infinity,
                    height: 171.0,
                    decoration: const BoxDecoration(
                      color: Color(0x12B9ABA7),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'View By',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        FlutterFlowRadioButton(
                          options: [
                            'relevance',
                            'ranking',
                            'geometry',
                            'priceyfactor',
                            'venuetype'
                          ].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.viewSelectionValueController ??=
                              FormFieldController<String>('relevance'),
                          optionHeight: 25.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.center,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                        Text(
                          valueOrDefault<String>(
                            _model.viewSelectionValue,
                            'g',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(height: 2.0)),
              ),
            ),
          ),
          Container(
            width: 38.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primaryText,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primaryText,
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 34.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      'allVenue',
                      queryParameters: {
                        'sortoder': serializeParam(
                          _model.sortSelectionValue,
                          ParamType.String,
                        ),
                        'viewby': serializeParam(
                          _model.viewSelectionValue,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
