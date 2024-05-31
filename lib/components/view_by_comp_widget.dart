import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'view_by_comp_model.dart';
export 'view_by_comp_model.dart';

class ViewByCompWidget extends StatefulWidget {
  const ViewByCompWidget({super.key});

  @override
  State<ViewByCompWidget> createState() => _ViewByCompWidgetState();
}

class _ViewByCompWidgetState extends State<ViewByCompWidget> {
  late ViewByCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewByCompModel());

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
        borderRadius: BorderRadius.circular(12.0),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
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
                    'Sorting',
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
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(
                          context,
                          SortingDataStruct(
                            viewSelection: _model.viewSortSelectionValue,
                            sortSelection: _model.choiceChipsValue,
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 3.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: FlutterFlowChoiceChips(
                      options: const [
                        ChipData('DESC', FontAwesomeIcons.sortAmountDown),
                        ChipData('ASC', FontAwesomeIcons.sortAmountUp)
                      ],
                      onChanged: (val) => setState(
                          () => _model.choiceChipsValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        iconSize: 18.0,
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                ),
                        iconColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        iconSize: 18.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      chipSpacing: 12.0,
                      rowSpacing: 12.0,
                      multiselect: false,
                      initialized: _model.choiceChipsValue != null,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsValueController ??=
                          FormFieldController<List<String>>(
                        ['DESC'],
                      ),
                      wrapped: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterFlowRadioButton(
                    options: [
                      'Relevance      ',
                      'VenueType          ',
                      'Price                ',
                      'Distance         ',
                      'Ranking          '
                    ].toList(),
                    onChanged: (val) => setState(() {}),
                    controller: _model.viewSortSelectionValueController ??=
                        FormFieldController<String>('Relevance      '),
                    optionHeight: 30.0,
                    optionWidth: 335.0,
                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                    selectedTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                    textPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 211.0, 0.0),
                    buttonPosition: RadioButtonPosition.right,
                    direction: Axis.vertical,
                    radioButtonColor: FlutterFlowTheme.of(context).primaryText,
                    inactiveRadioButtonColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    toggleable: false,
                    horizontalAlignment: WrapAlignment.center,
                    verticalAlignment: WrapCrossAlignment.end,
                  ),
                ],
              ),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(
                          context,
                          SortingDataStruct(
                            viewSelection: _model.viewSortSelectionValue,
                            sortSelection: _model.choiceChipsValue,
                          ));
                    },
                    text: 'Apply',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.991,
                      height: 38.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
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
