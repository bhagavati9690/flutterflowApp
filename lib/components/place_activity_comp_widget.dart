import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'place_activity_comp_model.dart';
export 'place_activity_comp_model.dart';

class PlaceActivityCompWidget extends StatefulWidget {
  const PlaceActivityCompWidget({super.key});

  @override
  State<PlaceActivityCompWidget> createState() =>
      _PlaceActivityCompWidgetState();
}

class _PlaceActivityCompWidgetState extends State<PlaceActivityCompWidget> {
  late PlaceActivityCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceActivityCompModel());

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
        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                    'Place/Activity',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
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
                      Navigator.pop(context, _model.slection);
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: FutureBuilder<ApiCallResponse>(
              future: VenuesGroup.getPartyPlaceTypeCall.call(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: SpinKitRing(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20.0,
                      ),
                    ),
                  );
                }
                final columnGetPartyPlaceTypeResponse = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                      child: FlutterFlowRadioButton(
                        options: VenuesGroup.getPartyPlaceTypeCall
                            .names(
                              columnGetPartyPlaceTypeResponse.jsonBody,
                            )!
                            .toList(),
                        onChanged: (val) async {
                          setState(() {});
                          _model.slection = functions.placeConversion(
                              VenuesGroup.getPartyPlaceTypeCall
                                  .details(
                                    columnGetPartyPlaceTypeResponse.jsonBody,
                                  )
                                  ?.toList(),
                              _model.placeSelectionValue);
                          setState(() {});
                        },
                        controller: _model.placeSelectionValueController ??=
                            FormFieldController<String>(
                                VenuesGroup.getPartyPlaceTypeCall
                                    .names(
                                      columnGetPartyPlaceTypeResponse.jsonBody,
                                    )!
                                    .first),
                        optionHeight: 30.0,
                        optionWidth: MediaQuery.sizeOf(context).width * 0.9,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                        selectedTextStyle: FlutterFlowTheme.of(context)
                            .bodyLarge
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.vertical,
                        radioButtonColor:
                            FlutterFlowTheme.of(context).primaryText,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.center,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                    ),
                  ],
                );
              },
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 13.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context, _model.slection);
                    },
                    text: 'Apply',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.991,
                      height: 38.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xEAD6DDE5),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
