import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_by_comp_model.dart';
export 'view_by_comp_model.dart';

class ViewByCompWidget extends StatefulWidget {
  const ViewByCompWidget({
    super.key,
    required this.sortOrder,
    required this.sortType,
  });

  final String? sortOrder;
  final String? sortType;

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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'xe5lto43' /* View By */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              font: GoogleFonts.roboto(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
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
                        Navigator.pop(
                            context,
                            SortingDataStruct(
                              viewSelection: _model.viewSortSelectionValue,
                              sortSelection: _model.sortSelectionValue,
                            ));
                      },
                    ),
                  ],
                ),
              ),
              Flexible(
                child: FlutterFlowChoiceChips(
                  options: [
                    ChipData(
                        FFLocalizations.of(context).getText(
                          '8pc7p3oo' /* Desc */,
                        ),
                        FontAwesomeIcons.sortAmountDown),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'jbz6hrrq' /* Asc */,
                        ),
                        FontAwesomeIcons.sortAmountUpAlt)
                  ],
                  onChanged: (val) => safeSetState(
                      () => _model.sortSelectionValue = val?.firstOrNull),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).pillColor,
                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelLargeFamily,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelLargeIsCustom,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryBackground,
                    iconSize: 24.0,
                    labelPadding: EdgeInsets.all(6.0),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelLargeFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelLargeIsCustom,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryText,
                    iconSize: 16.0,
                    labelPadding: EdgeInsets.all(6.0),
                    elevation: 0.0,
                    borderColor: Colors.black,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  chipSpacing: 24.0,
                  rowSpacing: 18.0,
                  multiselect: false,
                  initialized: _model.sortSelectionValue != null,
                  alignment: WrapAlignment.start,
                  controller: _model.sortSelectionValueController ??=
                      FormFieldController<List<String>>(
                    [widget.sortOrder!],
                  ),
                  wrapped: true,
                ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Flexible(
                child: FlutterFlowChoiceChips(
                  options: [
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'hndqaiy0' /* Relevance */,
                        ),
                        FontAwesomeIcons.solidStar),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'i2cblswf' /* Price */,
                        ),
                        FontAwesomeIcons.dollarSign),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'njky8dk6' /* Distance */,
                        ),
                        FontAwesomeIcons.route),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'fg7y4903' /* Ranking */,
                        ),
                        FontAwesomeIcons.starOfDavid)
                  ],
                  onChanged: (val) => safeSetState(
                      () => _model.viewSortSelectionValue = val?.firstOrNull),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).pillColor,
                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelLargeFamily,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelLargeIsCustom,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryBackground,
                    iconSize: 16.0,
                    labelPadding: EdgeInsets.all(6.0),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelLargeFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelLargeIsCustom,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryText,
                    iconSize: 16.0,
                    labelPadding: EdgeInsets.all(6.0),
                    elevation: 0.0,
                    borderColor: Colors.black,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  chipSpacing: 16.0,
                  rowSpacing: 18.0,
                  multiselect: false,
                  initialized: _model.viewSortSelectionValue != null,
                  alignment: WrapAlignment.start,
                  controller: _model.viewSortSelectionValueController ??=
                      FormFieldController<List<String>>(
                    [
                      valueOrDefault<String>(
                        functions.viewByConverter2(widget.sortType),
                        'Relevence',
                      )
                    ],
                  ),
                  wrapped: true,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(
                              context,
                              SortingDataStruct(
                                viewSelection: _model.viewSortSelectionValue,
                                sortSelection: _model.sortSelectionValue,
                              ));
                        },
                        text: FFLocalizations.of(context).getText(
                          '960pomru' /* Apply */,
                        ),
                        options: FFButtonOptions(
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 16.0)).around(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
