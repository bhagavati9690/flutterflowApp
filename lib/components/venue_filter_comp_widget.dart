import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'venue_filter_comp_model.dart';
export 'venue_filter_comp_model.dart';

class VenueFilterCompWidget extends StatefulWidget {
  const VenueFilterCompWidget({
    super.key,
    required this.venueType,
    required this.venueCount,
    required this.activityType,
    required this.activityCount,
    required this.sportType,
    required this.sportTypeCount,
    required this.price,
    required this.priceCount,
    required this.rank,
    required this.rankCount,
    required this.age,
    required this.ageCount,
    required this.town,
    required this.townCount,
    required this.capacity,
    required this.capacityCount,
    required this.gender,
    required this.genderCount,
    required this.activityCatgory,
    required this.activityCatgoryCount,
  });

  final List<String>? venueType;
  final List<int>? venueCount;
  final List<String>? activityType;
  final List<int>? activityCount;
  final List<String>? sportType;
  final List<int>? sportTypeCount;
  final List<String>? price;
  final List<int>? priceCount;
  final List<String>? rank;
  final List<int>? rankCount;
  final List<String>? age;
  final List<int>? ageCount;
  final List<String>? town;
  final List<int>? townCount;
  final List<String>? capacity;
  final List<int>? capacityCount;
  final List<String>? gender;
  final List<int>? genderCount;
  final List<String>? activityCatgory;
  final List<int>? activityCatgoryCount;

  @override
  State<VenueFilterCompWidget> createState() => _VenueFilterCompWidgetState();
}

class _VenueFilterCompWidgetState extends State<VenueFilterCompWidget> {
  late VenueFilterCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueFilterCompModel());

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController6 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController7 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController8 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController9 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController10 =
        ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xD7EEEEF5),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Aggregation',
                        icon: const Icon(
                          Icons.tag_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xD7EEEEF5),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: const Color(0xD7EEEEF5),
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(
                              context,
                              FilterSelectionDataStruct(
                                venueTypeSelections:
                                    _model.venueTypeSelectionsValues,
                                activityTypeSelections:
                                    _model.activityTypeSelectionsValues,
                                sportTypeSelections:
                                    _model.sportSelectionsValues,
                                activityTypeCategorySelections:
                                    _model.activityTypeCatgaorySelectionsValues,
                                capacitySelections:
                                    _model.capacitytySelectionsValues,
                                ageRangeSelections: _model.ageSelectionsValues,
                                townSelections: _model.townSelectionsValues,
                                priceFactorSelections:
                                    functions.priceTypeListReverse(
                                        _model.choiceChipsValues?.toList()),
                                demographicsSelections:
                                    _model.genderSelectionsValues,
                                rankingSelections: _model.rankSelectionsValues,
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(18.0, 8.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              color: const Color(0xFFEAEAF0),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController1,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.domain_add,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Venue type',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(),
                                  expanded: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowCheckboxGroup(
                                          options: functions
                                              .venueTypeList(
                                                  widget.venueType?.toList(),
                                                  widget.venueCount?.toList())!
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.venueTypeSelectionsValues =
                                                  val),
                                          controller: _model
                                                  .venueTypeSelectionsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          unselectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                          itemPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 0.0, 0.0, 0.0),
                                          checkboxBorderRadius:
                                              BorderRadius.circular(0.0),
                                          initialized: _model
                                                  .venueTypeSelectionsValues !=
                                              null,
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.top,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                            child: Container(
                              color: const Color(0xFFEAEAF0),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController2,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.sports_kabaddi_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Activities',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(),
                                  expanded: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowCheckboxGroup(
                                          options: functions
                                              .venueTypeList(
                                                  widget.activityType?.toList(),
                                                  widget.activityCount
                                                      ?.toList())!
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.activityTypeSelectionsValues =
                                                  val),
                                          controller: _model
                                                  .activityTypeSelectionsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          unselectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                          itemPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 0.0, 0.0, 0.0),
                                          checkboxBorderRadius:
                                              BorderRadius.circular(0.0),
                                          initialized: _model
                                                  .activityTypeSelectionsValues !=
                                              null,
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.top,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                            child: Container(
                              color: const Color(0xFFEAEAF0),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController3,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.sports_handball_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Sports',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(),
                                  expanded: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowCheckboxGroup(
                                          options: functions
                                              .venueTypeList(
                                                  widget.sportType?.toList(),
                                                  widget.sportTypeCount
                                                      ?.toList())!
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.sportSelectionsValues =
                                                  val),
                                          controller: _model
                                                  .sportSelectionsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          unselectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                          itemPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 0.0, 0.0, 0.0),
                                          checkboxBorderRadius:
                                              BorderRadius.circular(0.0),
                                          initialized:
                                              _model.sportSelectionsValues !=
                                                  null,
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.top,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              color: const Color(0xFFEAEAF0),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController4,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.funnelDollar,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Price',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(),
                                  expanded: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 2.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .priceTypeList(
                                                            widget.price
                                                                ?.toList(),
                                                            widget.priceCount
                                                                ?.toList())!
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .choiceChipsValues =
                                                            val),
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 18.0,
                                                      elevation: 7.0,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 18.0,
                                                      elevation: 7.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                    chipSpacing: 10.0,
                                                    rowSpacing: 12.0,
                                                    multiselect: true,
                                                    initialized: _model
                                                            .choiceChipsValues !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .choiceChipsValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.top,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              color: const Color(0xFFEAEAF0),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController5,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.favorite,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Ranking',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(),
                                  expanded: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowCheckboxGroup(
                                          options: functions
                                              .venueTypeList(
                                                  widget.rank?.toList(),
                                                  widget.rankCount?.toList())!
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.rankSelectionsValues =
                                                  val),
                                          controller: _model
                                                  .rankSelectionsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          unselectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                          itemPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 0.0, 0.0, 0.0),
                                          checkboxBorderRadius:
                                              BorderRadius.circular(0.0),
                                          initialized:
                                              _model.rankSelectionsValues !=
                                                  null,
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.top,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              color: const Color(0xFFEAEAF0),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController6,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.assist_walker,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Age',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(),
                                  expanded: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowCheckboxGroup(
                                          options: functions
                                              .venueTypeList(
                                                  widget.age?.toList(),
                                                  widget.ageCount?.toList())!
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.ageSelectionsValues = val),
                                          controller: _model
                                                  .ageSelectionsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          unselectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                          itemPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 0.0, 0.0, 0.0),
                                          checkboxBorderRadius:
                                              BorderRadius.circular(0.0),
                                          initialized:
                                              _model.ageSelectionsValues !=
                                                  null,
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.top,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              color: const Color(0xFFEAEAF0),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController7,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.houseUser,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Town',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(),
                                  expanded: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowCheckboxGroup(
                                          options: functions
                                              .venueTypeList(
                                                  widget.town?.toList(),
                                                  widget.townCount?.toList())!
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.townSelectionsValues =
                                                  val),
                                          controller: _model
                                                  .townSelectionsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          unselectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                          itemPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 0.0, 0.0, 0.0),
                                          checkboxBorderRadius:
                                              BorderRadius.circular(0.0),
                                          initialized:
                                              _model.townSelectionsValues !=
                                                  null,
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.top,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              color: const Color(0xFFEAEAF0),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController8,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.where_to_vote,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Capacity',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(),
                                  expanded: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowCheckboxGroup(
                                          options: functions
                                              .venueTypeList(
                                                  widget.capacity?.toList(),
                                                  widget.capacityCount
                                                      ?.toList())!
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.capacitytySelectionsValues =
                                                  val),
                                          controller: _model
                                                  .capacitytySelectionsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          unselectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                          itemPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 0.0, 0.0, 0.0),
                                          checkboxBorderRadius:
                                              BorderRadius.circular(0.0),
                                          initialized: _model
                                                  .capacitytySelectionsValues !=
                                              null,
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.top,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              color: const Color(0xFFEAEAF0),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController9,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.people_outline_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Gender',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(),
                                  expanded: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowCheckboxGroup(
                                          options: functions
                                              .venueTypeList(
                                                  widget.gender?.toList(),
                                                  widget.genderCount?.toList())!
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.genderSelectionsValues =
                                                  val),
                                          controller: _model
                                                  .genderSelectionsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          unselectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                          itemPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 0.0, 0.0, 0.0),
                                          checkboxBorderRadius:
                                              BorderRadius.circular(0.0),
                                          initialized:
                                              _model.genderSelectionsValues !=
                                                  null,
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.top,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                            child: Container(
                              color: const Color(0xFFEAEAF0),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController10,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.emoji_transportation_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Indoor/Outdoor',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(),
                                  expanded: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowCheckboxGroup(
                                          options: functions
                                              .venueTypeList(
                                                  widget.activityCatgory
                                                      ?.toList(),
                                                  widget.activityCatgoryCount
                                                      ?.toList())!
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.activityTypeCatgaorySelectionsValues =
                                                  val),
                                          controller: _model
                                                  .activityTypeCatgaorySelectionsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          unselectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                          itemPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 0.0, 0.0, 0.0),
                                          checkboxBorderRadius:
                                              BorderRadius.circular(0.0),
                                          initialized: _model
                                                  .activityTypeCatgaorySelectionsValues !=
                                              null,
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  theme: const ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.top,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 9.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xD7EEEEF5),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {});
                            setState(() => _model
                                .venueTypeSelectionsValueController
                                ?.value = []);
                          },
                          child: Text(
                            'Clear all',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(
                                context,
                                FilterSelectionDataStruct(
                                  venueTypeSelections:
                                      _model.venueTypeSelectionsValues,
                                  activityTypeSelections:
                                      _model.activityTypeSelectionsValues,
                                  sportTypeSelections:
                                      _model.sportSelectionsValues,
                                  activityTypeCategorySelections: _model
                                      .activityTypeCatgaorySelectionsValues,
                                  capacitySelections:
                                      _model.capacitytySelectionsValues,
                                  ageRangeSelections:
                                      _model.ageSelectionsValues,
                                  townSelections: _model.townSelectionsValues,
                                  priceFactorSelections:
                                      functions.priceTypeListReverse(
                                          _model.choiceChipsValues?.toList()),
                                  demographicsSelections:
                                      _model.genderSelectionsValues,
                                  rankingSelections:
                                      _model.rankSelectionsValues,
                                ));
                          },
                          text: 'Apply all',
                          icon: const Icon(
                            Icons.app_shortcut_rounded,
                            size: 16.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xD7EEEEF5),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
