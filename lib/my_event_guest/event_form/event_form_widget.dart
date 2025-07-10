import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/timer_picker_comp/timer_picker_comp_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'event_form_model.dart';
export 'event_form_model.dart';

class EventFormWidget extends StatefulWidget {
  const EventFormWidget({
    super.key,
    required this.eventId,
  });

  final String? eventId;

  static String routeName = 'EventForm';
  static String routePath = 'EventForm';

  @override
  State<EventFormWidget> createState() => _EventFormWidgetState();
}

class _EventFormWidgetState extends State<EventFormWidget> {
  late EventFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.eventEditFromCursorOutput =
          await EventInformationGroup.eventEditFormCursorCall.call(
        token: FFAppState().SessionToken,
        recordKey: widget.eventId,
        clientState: widget.eventId == '-1'
            ? '{\"clientId\":\"nearestUpcomingEventInfoTab__noEventForm\",\"cursor\":{\"message\":\"You don\'t have any upcoming event.\"}}'
            : '{  \"clientId\": \"nearestUpcomingEventInfoTab__nearestUpcomingEventDetails\",  \"cursor\": {}}',
        lable: widget.eventId == '-1' ? ' Event' : 'Edit',
      );

      if ((_model.eventEditFromCursorOutput?.succeeded ?? true)) {
        await Future.wait([
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.eventName(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.eventName(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.eventNameTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.eventName(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.idealDate(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.idealDate(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              _model.idealDate =
                  EventInformationGroup.eventEditFormCursorCall.idealDate(
                (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
              );
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.kids(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                ) !=
                null) {
              safeSetState(() {
                _model.kidsValue =
                    EventInformationGroup.eventEditFormCursorCall.kids(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.eventTheme(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.eventTheme(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.themeTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.eventTheme(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.adults(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                ) !=
                null) {
              safeSetState(() {
                _model.adultsValue =
                    EventInformationGroup.eventEditFormCursorCall.adults(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.totalCost(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.totalCost(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.totalCostTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.totalCost(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.country(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.country(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.countryTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.country(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.state(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.state(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.stateTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.state(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.postalCode(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.postalCode(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.postalCodeTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.postalCode(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.city(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.city(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.cityTownTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.city(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.street(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.street(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.strretNameTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.street(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.bldgNumber(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.bldgNumber(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.buildingNumberTextController?.text = '';
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.localArea(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.localArea(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.loacalAreaTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.localArea(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.cage(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                ) !=
                null) {
              safeSetState(() {
                _model.ageTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall
                        .cage(
                          (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                        )!
                        .toString();
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.clastName(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.clastName(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.lastNameTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.clastName(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.cFirstName(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.cFirstName(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.firstNameTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.cFirstName(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.location(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.location(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.addressTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.location(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.budget(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                ) !=
                null) {
              safeSetState(() {
                _model.budgetTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall
                        .budget(
                          (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                        )!
                        .toString();
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.totalInvitee(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                ) !=
                null) {
              safeSetState(() {
                _model.totalInviteeTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall
                        .totalInvitee(
                          (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                        )!
                        .toString();
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.description(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.description(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.descriptionTextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.description(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.idealDate1(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.idealDate1(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.alterNateDate1TextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.idealDate1(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.idealDate2(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.idealDate2(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.alterNateDate2TextController?.text =
                    EventInformationGroup.eventEditFormCursorCall.idealDate2(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventInformationGroup.eventEditFormCursorCall.genderId(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventInformationGroup.eventEditFormCursorCall.genderId(
                      (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.gendetDropDownValueController?.value =
                    EventInformationGroup.eventEditFormCursorCall.genderId(
                  (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
        ]);
        _model.first = true;
        _model.second = false;
        _model.third = false;
        _model.fourth = false;
        _model.formId = EventInformationGroup.eventEditFormCursorCall.idForm(
          (_model.eventEditFromCursorOutput?.jsonBody ?? ''),
        );
        safeSetState(() {});
      }
    });

    _model.eventNameTextController ??= TextEditingController();
    _model.eventNameFocusNode ??= FocusNode();

    _model.totalInviteeTextController ??= TextEditingController();
    _model.totalInviteeFocusNode ??= FocusNode();

    _model.firstNameTextController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameTextController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();

    _model.ageTextController ??= TextEditingController();
    _model.ageFocusNode ??= FocusNode();

    _model.addressTextController ??= TextEditingController();
    _model.addressFocusNode ??= FocusNode();

    _model.buildingNumberTextController ??= TextEditingController();
    _model.buildingNumberFocusNode ??= FocusNode();

    _model.postalCodeTextController ??= TextEditingController();
    _model.postalCodeFocusNode ??= FocusNode();

    _model.flooreTextController ??= TextEditingController();
    _model.flooreFocusNode ??= FocusNode();

    _model.strretNameTextController ??= TextEditingController();
    _model.strretNameFocusNode ??= FocusNode();

    _model.cityTownTextController ??= TextEditingController();
    _model.cityTownFocusNode ??= FocusNode();

    _model.stateTextController ??= TextEditingController();
    _model.stateFocusNode ??= FocusNode();

    _model.countryTextController ??= TextEditingController();
    _model.countryFocusNode ??= FocusNode();

    _model.loacalAreaTextController ??= TextEditingController();
    _model.loacalAreaFocusNode ??= FocusNode();

    _model.alterNateDate1TextController ??= TextEditingController();
    _model.alterNateDate1FocusNode ??= FocusNode();

    _model.alterNateDate2TextController ??= TextEditingController();
    _model.alterNateDate2FocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    _model.themeTextController ??= TextEditingController();
    _model.themeFocusNode ??= FocusNode();

    _model.totalCostTextController ??= TextEditingController();
    _model.totalCostFocusNode ??= FocusNode();

    _model.budgetTextController ??= TextEditingController();
    _model.budgetFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFE3F333),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            fillColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.goNamed(
                MyEventsWidget.routeName,
                queryParameters: {
                  'tab': serializeParam(
                    0,
                    ParamType.int,
                  ),
                }.withoutNulls,
              );
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'fkev5i5y' /* Event Information */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: _model.formId != null && _model.formId != '',
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                                decoration: BoxDecoration(
                                  color: _model.first
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.01,
                                  decoration: BoxDecoration(
                                    color: _model.second
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                                decoration: BoxDecoration(
                                  color: _model.third
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                                decoration: BoxDecoration(
                                  color: _model.fourth
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 7.0)),
                      ),
                    ),
                  ),
                ),
                if (_model.first)
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.always,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yw5nuynq' /* Basic Information */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeIsCustom,
                                                  ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nsltfich' /* * */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                            TextFormField(
                                              controller: _model
                                                  .eventNameTextController,
                                              focusNode:
                                                  _model.eventNameFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'aucanwn7' /* Event Name */,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                              maxLines: null,
                                              validator: _model
                                                  .eventNameTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                if (!isAndroid && !isiOS)
                                                  TextInputFormatter
                                                      .withFunction(
                                                          (oldValue, newValue) {
                                                    return TextEditingValue(
                                                      selection:
                                                          newValue.selection,
                                                      text: newValue.text
                                                          .toCapitalization(
                                                              TextCapitalization
                                                                  .words),
                                                    );
                                                  }),
                                              ],
                                            ),
                                          ],
                                        ),
                                        FutureBuilder<ApiCallResponse>(
                                          future: EventInformationGroup
                                              .celebrationTypeForEventCall
                                              .call(
                                            token: FFAppState().SessionToken,
                                            context:
                                                '{\"key\":\"myEventForm\",\"params\":{\"format\":[\"js\",\"js\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"myEvent__otherEventCursorGrid\\\",\\\"cursor\\\":{},\\\"selection\\\":[]}\"],\"label\":[\"Event\"],\"autoRefreshOnSaveTarget\":[\"myEvent__otherEventCursorGrid\"],\"recordKey\":[\"-1\"]},\"component\":{\"clientId\":\"myEventForm__myEventForm\",\"clientState\":{\"clientId\":\"myEventForm__myEventForm\",\"cursor\":{\"__cachedId\":\"${_model.formId}\"}}}}',
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final celebrationTypeCelebrationTypeForEventResponse =
                                                snapshot.data!;

                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .celebrationTypeValueController ??=
                                                  FormFieldController<String>(
                                                _model.celebrationTypeValue ??=
                                                    EventInformationGroup
                                                                    .eventEditFormCursorCall
                                                                    .celebrationId(
                                                                  (_model.eventEditFromCursorOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            EventInformationGroup
                                                                    .eventEditFormCursorCall
                                                                    .celebrationId(
                                                                  (_model.eventEditFromCursorOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                ''
                                                        ? EventInformationGroup
                                                            .eventEditFormCursorCall
                                                            .celebrationId(
                                                            (_model.eventEditFromCursorOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                        : '',
                                              ),
                                              options: List<String>.from(
                                                  EventInformationGroup
                                                      .celebrationTypeForEventCall
                                                      .id(
                                                celebrationTypeCelebrationTypeForEventResponse
                                                    .jsonBody,
                                              )!),
                                              optionLabels: EventInformationGroup
                                                  .celebrationTypeForEventCall
                                                  .text(
                                                celebrationTypeCelebrationTypeForEventResponse
                                                    .jsonBody,
                                              )!,
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .celebrationTypeValue =
                                                      val),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '97vhqtss' /* Select Celebration Type */,
                                              ),
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderWidth: 1.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sdb0p0s6' /* Kids */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.35,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: FlutterFlowCountController(
                                                decrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.remove_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 24.0,
                                                ),
                                                incrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.add_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 24.0,
                                                ),
                                                countBuilder: (count) => Text(
                                                  count.toString(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeIsCustom,
                                                          ),
                                                ),
                                                count: _model.kidsValue ??= 0,
                                                updateCount: (count) async {
                                                  safeSetState(() =>
                                                      _model.kidsValue = count);
                                                  safeSetState(() {
                                                    _model
                                                        .totalInviteeTextController
                                                        ?.text = ((_model
                                                                .kidsValue!) +
                                                            (_model
                                                                .adultsValue!))
                                                        .toString();
                                                  });
                                                },
                                                stepSize: 1,
                                                minimum: 0,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            12.0, 0.0),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 24.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gkqt8su2' /* Adults */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.35,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: FlutterFlowCountController(
                                                decrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.remove_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 24.0,
                                                ),
                                                incrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.add_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 24.0,
                                                ),
                                                countBuilder: (count) => Text(
                                                  count.toString(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeIsCustom,
                                                          ),
                                                ),
                                                count: _model.adultsValue ??= 0,
                                                updateCount: (count) async {
                                                  safeSetState(() => _model
                                                      .adultsValue = count);
                                                  safeSetState(() {
                                                    _model
                                                        .totalInviteeTextController
                                                        ?.text = ((_model
                                                                .kidsValue!) +
                                                            (_model
                                                                .adultsValue!))
                                                        .toString();
                                                  });
                                                },
                                                stepSize: 1,
                                                minimum: 0,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            12.0, 0.0),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 24.0)),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'e8nkonm5' /* Total Invitees            */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.35,
                                                child: TextFormField(
                                                  controller: _model
                                                      .totalInviteeTextController,
                                                  focusNode: _model
                                                      .totalInviteeFocusNode,
                                                  autofocus: false,
                                                  textCapitalization:
                                                      TextCapitalization.words,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeIsCustom,
                                                            ),
                                                    alignLabelWithHint: true,
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'kzyst87o' /* 1 */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeIsCustom,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeIsCustom,
                                                          ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: null,
                                                  validator: _model
                                                      .totalInviteeTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    if (!isAndroid && !isiOS)
                                                      TextInputFormatter
                                                          .withFunction(
                                                              (oldValue,
                                                                  newValue) {
                                                        return TextEditingValue(
                                                          selection: newValue
                                                              .selection,
                                                          text: newValue.text
                                                              .toCapitalization(
                                                                  TextCapitalization
                                                                      .words),
                                                        );
                                                      }),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 7.0)),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '20s9sesc' /* Celebratee Information */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeIsCustom,
                                                  ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                        TextFormField(
                                          controller:
                                              _model.firstNameTextController,
                                          focusNode: _model.firstNameFocusNode,
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'mj6zftp6' /* FirstName */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLargeIsCustom,
                                              ),
                                          minLines: 1,
                                          validator: _model
                                              .firstNameTextControllerValidator
                                              .asValidator(context),
                                        ),
                                        TextFormField(
                                          controller:
                                              _model.lastNameTextController,
                                          focusNode: _model.lastNameFocusNode,
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'qrfy45zw' /* Last Name */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLargeIsCustom,
                                              ),
                                          minLines: 1,
                                          validator: _model
                                              .lastNameTextControllerValidator
                                              .asValidator(context),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future: EventInformationGroup
                                                  .cLBXEnPersonGenderForEventCall
                                                  .call(
                                                token:
                                                    FFAppState().SessionToken,
                                                context:
                                                    '{\"key\":\"myEventForm\",\"params\":{\"format\":[\"js\",\"js\"],\"label\":[\"Event\"],\"autoRefreshOnSaveTarget\":[\"myEvent__otherEventCursorGrid\"],\"recordKey\":[\"-1\"]},\"component\":{\"clientId\":\"myEventForm__myEventForm\",\"clientState\":{\"clientId\":\"myEventForm__myEventForm\",\"cursor\":{\"__cachedId\":\"${_model.formId}\"}}}}',
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 11.0,
                                                      height: 11.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final gendetDropDownCLBXEnPersonGenderForEventResponse =
                                                    snapshot.data!;

                                                return FlutterFlowDropDown<
                                                    String>(
                                                  controller: _model
                                                          .gendetDropDownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model
                                                        .gendetDropDownValue ??= EventInformationGroup
                                                                    .eventEditFormCursorCall
                                                                    .genderId(
                                                                  (_model.eventEditFromCursorOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            EventInformationGroup
                                                                    .eventEditFormCursorCall
                                                                    .genderId(
                                                                  (_model.eventEditFromCursorOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                ''
                                                        ? EventInformationGroup
                                                            .eventEditFormCursorCall
                                                            .genderId(
                                                            (_model.eventEditFromCursorOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                        : 'Null',
                                                  ),
                                                  options: List<String>.from(
                                                      functions.replaceEmpty(
                                                          EventInformationGroup
                                                              .cLBXEnPersonGenderForEventCall
                                                              .id(
                                                                gendetDropDownCLBXEnPersonGenderForEventResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.toList())),
                                                  optionLabels:
                                                      functions.replaceEmpty(
                                                          EventInformationGroup
                                                              .cLBXEnPersonGenderForEventCall
                                                              .text(
                                                                gendetDropDownCLBXEnPersonGenderForEventResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.toList()),
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .gendetDropDownValue =
                                                          val),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.42,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.053,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '5j0ak739' /* Gender */,
                                                  ),
                                                  icon: Icon(
                                                    Icons.transgender_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  borderWidth: 1.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  hidesUnderline: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                );
                                              },
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.ageTextController,
                                                  focusNode:
                                                      _model.ageFocusNode,
                                                  autofocus: false,
                                                  textCapitalization:
                                                      TextCapitalization.words,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '6vxrd72m' /* Age */,
                                                    ),
                                                    alignLabelWithHint: false,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeIsCustom,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
                                                          ),
                                                  maxLines: null,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: _model
                                                      .ageTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    if (!isAndroid && !isiOS)
                                                      TextInputFormatter
                                                          .withFunction(
                                                              (oldValue,
                                                                  newValue) {
                                                        return TextEditingValue(
                                                          selection: newValue
                                                              .selection,
                                                          text: newValue.text
                                                              .toCapitalization(
                                                                  TextCapitalization
                                                                      .words),
                                                        );
                                                      }),
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp('[0-9]'))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (_model.celebrationTypeValue == null) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: Text('Altert'),
                                          content:
                                              Text('Select Celebration Type'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  return;
                                }
                                _model.first = false;
                                _model.second = true;
                                _model.third = false;
                                _model.fourth = false;
                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'l2tqlozu' /* Next */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.32,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.055,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                if (_model.second)
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '7v2hvg1i' /* Date And Time */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyLargeIsCustom,
                                            ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: FlutterFlowCalendar(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            weekFormat: false,
                                            weekStartsMonday: false,
                                            initialDate: _model.idealDate !=
                                                        null &&
                                                    _model.idealDate != ''
                                                ? functions
                                                    .convertStringToDateForCalender(
                                                        _model.idealDate!)
                                                : getCurrentTimestamp,
                                            rowHeight: 49.0,
                                            onChange: (DateTimeRange?
                                                newSelectedDate) {
                                              safeSetState(() =>
                                                  _model.calendarSelectedDay =
                                                      newSelectedDate);
                                            },
                                            titleStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLargeIsCustom,
                                                    ),
                                            dayOfWeekStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      lineHeight: 1.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            dateStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            selectedDateStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            inactiveDateStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      color: Color(0xFFBEBFC3),
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .timerPickerCompStartTimeModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        TimerPickerCompWidget(
                                                      startTime: 0,
                                                      endTime: 84600,
                                                      initialHr: functions
                                                          .getHourFromDateTime(functions
                                                              .getTimeFromStringWithAMPM(
                                                                  EventInformationGroup
                                                                      .eventEditFormCursorCall
                                                                      .startTime(
                                                        (_model.eventEditFromCursorOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))),
                                                      initMin: functions
                                                          .getMinutesFromDateTime(
                                                              functions.getTimeFromStringWithAMPM(
                                                                  EventInformationGroup
                                                                      .eventEditFormCursorCall
                                                                      .startTime(
                                                        (_model.eventEditFromCursorOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))),
                                                      label: 'StartTime :',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .timerPickerCompEndTimeModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        TimerPickerCompWidget(
                                                      startTime: 0,
                                                      endTime: 84600,
                                                      initialHr: functions
                                                          .getHourFromDateTime(functions
                                                              .getTimeFromStringWithAMPM(
                                                                  EventInformationGroup
                                                                      .eventEditFormCursorCall
                                                                      .endTime(
                                                        (_model.eventEditFromCursorOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))),
                                                      initMin: functions
                                                          .getMinutesFromDateTime(
                                                              functions.getTimeFromStringWithAMPM(
                                                                  EventInformationGroup
                                                                      .eventEditFormCursorCall
                                                                      .endTime(
                                                        (_model.eventEditFromCursorOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))),
                                                      label: 'End Time : ',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.first = true;
                                  _model.second = false;
                                  _model.third = false;
                                  _model.fourth = false;
                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'glvv82ar' /* Back */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.timerPickerCompStartTimeModel
                                          .selectedTime! <
                                      _model.timerPickerCompEndTimeModel
                                          .selectedTime!) {
                                    _model.first = false;
                                    _model.second = false;
                                    _model.third = true;
                                    _model.fourth = false;
                                    safeSetState(() {});
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please ensure the start time is earlier than the end time',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 2050),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                    );
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  '9cbunmu7' /* Next */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                if (_model.third)
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.first = false;
                                          _model.second = false;
                                          _model.third = false;
                                          _model.fourth = true;
                                          safeSetState(() {});
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'w6adiqtk' /* Skip */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.underline,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLargeIsCustom,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'dycgh7wu' /* Address */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyLargeIsCustom,
                                            ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                  TextFormField(
                                    controller: _model.addressTextController,
                                    focusNode: _model.addressFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.addressTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        _model.showAddressesSuggestion = true;
                                        _model.populateAddressOutput =
                                            await EventInformationGroup
                                                .eventPoplateaddressCall
                                                .call(
                                          token: FFAppState().SessionToken,
                                          clientState:
                                              '{\"clientId\":\"myEventForm__myEventForm\",\"cursor\":{\"__cachedId\":\"${_model.formId}\"}}',
                                          id: _model.formId,
                                          querytext:
                                              _model.addressTextController.text,
                                        );

                                        await Future.wait([
                                          Future(() async {
                                            safeSetState(() {
                                              _model.buildingNumberTextController
                                                      ?.text =
                                                  EventInformationGroup
                                                      .eventPoplateaddressCall
                                                      .blgNo(
                                                        (_model.populateAddressOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                      .firstOrNull!;
                                            });
                                          }),
                                          Future(() async {
                                            safeSetState(() {
                                              _model.postalCodeTextController
                                                      ?.text =
                                                  EventInformationGroup
                                                      .eventPoplateaddressCall
                                                      .postalCode(
                                                (_model.populateAddressOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                            });
                                          }),
                                          Future(() async {
                                            safeSetState(() {
                                              _model.flooreTextController
                                                      ?.text =
                                                  EventInformationGroup
                                                      .eventPoplateaddressCall
                                                      .floor(
                                                (_model.populateAddressOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                            });
                                          }),
                                          Future(() async {
                                            safeSetState(() {
                                              _model.strretNameTextController
                                                      ?.text =
                                                  EventInformationGroup
                                                      .eventPoplateaddressCall
                                                      .street(
                                                (_model.populateAddressOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                            });
                                          }),
                                          Future(() async {
                                            safeSetState(() {
                                              _model.cityTownTextController
                                                      ?.text =
                                                  EventInformationGroup
                                                      .eventPoplateaddressCall
                                                      .city(
                                                (_model.populateAddressOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                            });
                                          }),
                                          Future(() async {
                                            safeSetState(() {
                                              _model.stateTextController?.text =
                                                  EventInformationGroup
                                                      .eventPoplateaddressCall
                                                      .state(
                                                (_model.populateAddressOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                            });
                                          }),
                                          Future(() async {
                                            safeSetState(() {
                                              _model.loacalAreaTextController
                                                      ?.text =
                                                  EventInformationGroup
                                                      .eventPoplateaddressCall
                                                      .localArea(
                                                (_model.populateAddressOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                            });
                                          }),
                                        ]);

                                        safeSetState(() {});
                                      },
                                    ),
                                    onFieldSubmitted: (_) async {
                                      _model.showAddressesSuggestion = false;
                                    },
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'nf0m1yt0' /* Type Street Address .... */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyLargeIsCustom,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      suffixIcon: Icon(
                                        Icons.place,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyLargeIsCustom,
                                        ),
                                    maxLines: null,
                                    validator: _model
                                        .addressTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.words),
                                          );
                                        }),
                                    ],
                                  ),
                                  if (_model.showAddressesSuggestion)
                                    FutureBuilder<ApiCallResponse>(
                                      future: EventInformationGroup
                                          .adressSuggestionForEventCall
                                          .call(
                                        token: FFAppState().SessionToken,
                                        query:
                                            _model.addressTextController.text,
                                        context:
                                            '{\"key\":\"myEventForm\",\"params\":{\"format\":[\"js\",\"js\"],\"label\":[\"Event\"],\"autoRefreshOnSaveTarget\":[\"myEvent__otherEventCursorGrid\"],\"recordKey\":[\"-1\"]},\"component\":{\"clientId\":\"myEventForm__myEventForm\",\"clientState\":{\"clientId\":\"myEventForm__myEventForm\",\"cursor\":{\"__cachedId\":\"${_model.formId}\"}}}}',
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 11.0,
                                              height: 11.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final addresSuggestinContainerAdressSuggestionForEventResponse =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x1E000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                                spreadRadius: 0.0,
                                              )
                                            ],
                                          ),
                                          child: Visibility(
                                            visible: EventInformationGroup
                                                    .adressSuggestionForEventCall
                                                    .totalCount(
                                                  addresSuggestinContainerAdressSuggestionForEventResponse
                                                      .jsonBody,
                                                )! >
                                                1,
                                            child: Builder(
                                              builder: (context) {
                                                final item = EventInformationGroup
                                                        .adressSuggestionForEventCall
                                                        .text(
                                                          addresSuggestinContainerAdressSuggestionForEventResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: item.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 10.0),
                                                  itemBuilder:
                                                      (context, itemIndex) {
                                                    final itemItem =
                                                        item[itemIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          safeSetState(() {
                                                            _model
                                                                .addressTextController
                                                                ?.text = itemItem;
                                                            _model
                                                                .addressFocusNode
                                                                ?.requestFocus();
                                                            WidgetsBinding
                                                                .instance
                                                                .addPostFrameCallback(
                                                                    (_) {
                                                              _model.addressTextController
                                                                      ?.selection =
                                                                  TextSelection(
                                                                baseOffset: 0,
                                                                extentOffset: _model
                                                                    .addressTextController!
                                                                    .text
                                                                    .length,
                                                              );
                                                            });
                                                          });
                                                          _model.populateAddressOutput2 =
                                                              await EventInformationGroup
                                                                  .eventPoplateaddressCall
                                                                  .call(
                                                            token: FFAppState()
                                                                .SessionToken,
                                                            clientState:
                                                                '{\"clientId\":\"myEventForm__myEventForm\",\"cursor\":{\"__cachedId\":\"${_model.formId}\"}}',
                                                            id: _model.formId,
                                                            querytext: _model
                                                                .addressTextController
                                                                .text,
                                                          );

                                                          await Future.wait([
                                                            Future(() async {
                                                              safeSetState(() {
                                                                _model.buildingNumberTextController
                                                                        ?.text =
                                                                    EventInformationGroup
                                                                        .eventPoplateaddressCall
                                                                        .blgNo(
                                                                          (_model.populateAddressOutput2?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                        .firstOrNull!;
                                                              });
                                                            }),
                                                            Future(() async {
                                                              safeSetState(() {
                                                                _model.postalCodeTextController
                                                                        ?.text =
                                                                    EventInformationGroup
                                                                        .eventPoplateaddressCall
                                                                        .postalCode(
                                                                  (_model.populateAddressOutput2
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!;
                                                              });
                                                            }),
                                                            Future(() async {
                                                              safeSetState(() {
                                                                _model.flooreTextController
                                                                        ?.text =
                                                                    EventInformationGroup
                                                                        .eventPoplateaddressCall
                                                                        .floor(
                                                                  (_model.populateAddressOutput2
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!;
                                                              });
                                                            }),
                                                            Future(() async {
                                                              safeSetState(() {
                                                                _model.strretNameTextController
                                                                        ?.text =
                                                                    EventInformationGroup
                                                                        .eventPoplateaddressCall
                                                                        .street(
                                                                  (_model.populateAddressOutput2
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!;
                                                              });
                                                            }),
                                                            Future(() async {
                                                              safeSetState(() {
                                                                _model.cityTownTextController
                                                                        ?.text =
                                                                    EventInformationGroup
                                                                        .eventPoplateaddressCall
                                                                        .city(
                                                                  (_model.populateAddressOutput2
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!;
                                                              });
                                                            }),
                                                            Future(() async {
                                                              safeSetState(() {
                                                                _model.stateTextController
                                                                        ?.text =
                                                                    EventInformationGroup
                                                                        .eventPoplateaddressCall
                                                                        .state(
                                                                  (_model.populateAddressOutput2
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!;
                                                              });
                                                            }),
                                                            Future(() async {
                                                              safeSetState(() {
                                                                _model.loacalAreaTextController
                                                                        ?.text =
                                                                    EventInformationGroup
                                                                        .eventPoplateaddressCall
                                                                        .localArea(
                                                                  (_model.populateAddressOutput2
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!;
                                                              });
                                                            }),
                                                          ]);
                                                          _model.showAddressesSuggestion =
                                                              false;

                                                          safeSetState(() {});
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .search_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                itemItem,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyLargeIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 7.0)),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        child: TextFormField(
                                          controller: _model
                                              .buildingNumberTextController,
                                          focusNode:
                                              _model.buildingNumberFocusNode,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'bu28qv4m' /* Building Number */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          validator: _model
                                              .buildingNumberTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            if (!isAndroid && !isiOS)
                                              TextInputFormatter.withFunction(
                                                  (oldValue, newValue) {
                                                return TextEditingValue(
                                                  selection: newValue.selection,
                                                  text: newValue.text
                                                      .toCapitalization(
                                                          TextCapitalization
                                                              .words),
                                                );
                                              }),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        child: TextFormField(
                                          controller:
                                              _model.postalCodeTextController,
                                          focusNode: _model.postalCodeFocusNode,
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'w4c198u3' /* Postal Code */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .postalCodeTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]'))
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        child: TextFormField(
                                          controller:
                                              _model.flooreTextController,
                                          focusNode: _model.flooreFocusNode,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'urwwl4tx' /* Floor/Section */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          validator: _model
                                              .flooreTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            if (!isAndroid && !isiOS)
                                              TextInputFormatter.withFunction(
                                                  (oldValue, newValue) {
                                                return TextEditingValue(
                                                  selection: newValue.selection,
                                                  text: newValue.text
                                                      .toCapitalization(
                                                          TextCapitalization
                                                              .words),
                                                );
                                              }),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        child: TextFormField(
                                          controller:
                                              _model.strretNameTextController,
                                          focusNode: _model.strretNameFocusNode,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'u0y2shk5' /* Street Name */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          minLines: 1,
                                          validator: _model
                                              .strretNameTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            if (!isAndroid && !isiOS)
                                              TextInputFormatter.withFunction(
                                                  (oldValue, newValue) {
                                                return TextEditingValue(
                                                  selection: newValue.selection,
                                                  text: newValue.text
                                                      .toCapitalization(
                                                          TextCapitalization
                                                              .words),
                                                );
                                              }),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        child: TextFormField(
                                          controller:
                                              _model.cityTownTextController,
                                          focusNode: _model.cityTownFocusNode,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'nuu6vkut' /* City/Town */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          validator: _model
                                              .cityTownTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            if (!isAndroid && !isiOS)
                                              TextInputFormatter.withFunction(
                                                  (oldValue, newValue) {
                                                return TextEditingValue(
                                                  selection: newValue.selection,
                                                  text: newValue.text
                                                      .toCapitalization(
                                                          TextCapitalization
                                                              .words),
                                                );
                                              }),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        child: TextFormField(
                                          controller:
                                              _model.stateTextController,
                                          focusNode: _model.stateFocusNode,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '8gumovgo' /* State */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          validator: _model
                                              .stateTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            if (!isAndroid && !isiOS)
                                              TextInputFormatter.withFunction(
                                                  (oldValue, newValue) {
                                                return TextEditingValue(
                                                  selection: newValue.selection,
                                                  text: newValue.text
                                                      .toCapitalization(
                                                          TextCapitalization
                                                              .words),
                                                );
                                              }),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        child: TextFormField(
                                          controller:
                                              _model.countryTextController,
                                          focusNode: _model.countryFocusNode,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'dhr82o77' /* Country */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          maxLines: null,
                                          validator: _model
                                              .countryTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            if (!isAndroid && !isiOS)
                                              TextInputFormatter.withFunction(
                                                  (oldValue, newValue) {
                                                return TextEditingValue(
                                                  selection: newValue.selection,
                                                  text: newValue.text
                                                      .toCapitalization(
                                                          TextCapitalization
                                                              .words),
                                                );
                                              }),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        child: TextFormField(
                                          controller:
                                              _model.loacalAreaTextController,
                                          focusNode: _model.loacalAreaFocusNode,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'pbsr4ttd' /* Local Area */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          maxLines: null,
                                          validator: _model
                                              .loacalAreaTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            if (!isAndroid && !isiOS)
                                              TextInputFormatter.withFunction(
                                                  (oldValue, newValue) {
                                                return TextEditingValue(
                                                  selection: newValue.selection,
                                                  text: newValue.text
                                                      .toCapitalization(
                                                          TextCapitalization
                                                              .words),
                                                );
                                              }),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: _model
                                                  .alterNateDate1TextController,
                                              focusNode: _model
                                                  .alterNateDate1FocusNode,
                                              autofocus: false,
                                              textInputAction:
                                                  TextInputAction.next,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '5wibzghc' /* Alternate Date 1 */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              keyboardType:
                                                  TextInputType.datetime,
                                              validator: _model
                                                  .alterNateDate1TextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              // alternateDate1
                                              final _datePicked1Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: (functions.convertStringToDateForCalender(_model.alterNateDate1TextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .alterNateDate1TextController
                                                            .text
                                                        : _model
                                                            .calendarSelectedDay!
                                                            .start
                                                            .toString()) ??
                                                    DateTime.now()),
                                                firstDate: (functions.convertStringToDateForCalender(_model.alterNateDate1TextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .alterNateDate1TextController
                                                            .text
                                                        : _model
                                                            .calendarSelectedDay!
                                                            .start
                                                            .toString()) ??
                                                    DateTime.now()),
                                                lastDate: DateTime(2050),
                                                builder: (context, child) {
                                                  return wrapInMaterialDatePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeIsCustom,
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );

                                              if (_datePicked1Date != null) {
                                                safeSetState(() {
                                                  _model.datePicked1 = DateTime(
                                                    _datePicked1Date.year,
                                                    _datePicked1Date.month,
                                                    _datePicked1Date.day,
                                                  );
                                                });
                                              } else if (_model.datePicked1 !=
                                                  null) {
                                                safeSetState(() {
                                                  _model.datePicked1 = functions
                                                      .convertStringToDateForCalender(_model.alterNateDate1TextController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .alterNateDate1TextController
                                                              .text
                                                          : _model
                                                              .calendarSelectedDay!
                                                              .start
                                                              .toString());
                                                });
                                              }
                                              safeSetState(() {
                                                _model
                                                    .alterNateDate1TextController
                                                    ?.text = dateTimeFormat(
                                                  "yMd",
                                                  _model.datePicked1,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                );
                                              });
                                            },
                                            child: Icon(
                                              Icons.calendar_today,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: _model
                                                  .alterNateDate2TextController,
                                              focusNode: _model
                                                  .alterNateDate2FocusNode,
                                              autofocus: false,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'bj34crta' /* Alternate Date 2 */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              validator: _model
                                                  .alterNateDate2TextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              // alternateDate1
                                              final _datePicked2Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: (functions.convertStringToDateForCalender(_model.alterNateDate2TextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .alterNateDate2TextController
                                                            .text
                                                        : _model
                                                            .calendarSelectedDay!
                                                            .start
                                                            .toString()) ??
                                                    DateTime.now()),
                                                firstDate: (functions.convertStringToDateForCalender(_model.alterNateDate2TextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .alterNateDate2TextController
                                                            .text
                                                        : _model
                                                            .calendarSelectedDay!
                                                            .start
                                                            .toString()) ??
                                                    DateTime.now()),
                                                lastDate: DateTime(2050),
                                                builder: (context, child) {
                                                  return wrapInMaterialDatePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeIsCustom,
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );

                                              if (_datePicked2Date != null) {
                                                safeSetState(() {
                                                  _model.datePicked2 = DateTime(
                                                    _datePicked2Date.year,
                                                    _datePicked2Date.month,
                                                    _datePicked2Date.day,
                                                  );
                                                });
                                              } else if (_model.datePicked2 !=
                                                  null) {
                                                safeSetState(() {
                                                  _model.datePicked2 = functions
                                                      .convertStringToDateForCalender(_model.alterNateDate2TextController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .alterNateDate2TextController
                                                              .text
                                                          : _model
                                                              .calendarSelectedDay!
                                                              .start
                                                              .toString());
                                                });
                                              }
                                              safeSetState(() {
                                                _model
                                                    .alterNateDate2TextController
                                                    ?.text = dateTimeFormat(
                                                  "yMd",
                                                  _model.datePicked2,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                );
                                              });
                                            },
                                            child: Icon(
                                              Icons.calendar_today,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 11.0)),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                _model.first = false;
                                _model.second = true;
                                _model.third = false;
                                _model.fourth = false;
                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'o2jeux0s' /* Back */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                _model.first = false;
                                _model.second = false;
                                _model.third = false;
                                _model.fourth = true;
                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'y86zqmyj' /* Next */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ]
                          .divide(SizedBox(height: 10.0))
                          .addToEnd(SizedBox(height: 10.0)),
                    ),
                  ),
                if (_model.fourth)
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'wo66neck' /* Additional Details */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyLargeIsCustom,
                                            ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.descriptionTextController,
                                    focusNode: _model.descriptionFocusNode,
                                    autofocus: false,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelMediumIsCustom,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'e0mbgizs' /* Description */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    maxLines: null,
                                    maxLength: 100,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .descriptionTextControllerValidator
                                        .asValidator(context),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '9v5gb8c4' /* Theme Category : */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: EventInformationGroup
                                        .themeCategoryListPickerCall
                                        .call(
                                      token: FFAppState().SessionToken,
                                      context:
                                          '{\"key\":\"myEventForm\",\"params\":{\"format\":[\"js\",\"js\"],\"label\":[\"Event\"],\"autoRefreshOnSaveTarget\":[\"myEvent__otherEventCursorGrid\"],\"recordKey\":[\"-1\"]},\"component\":{\"clientId\":\"myEventForm__myEventForm\",\"clientState\":{\"clientId\":\"myEventForm__myEventForm\",\"cursor\":{\"__cachedId\":\"${_model.formId}\"}}}}',
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 11.0,
                                            height: 11.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final themeCategoryThemeCategoryListPickerResponse =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .themeCategoryValueController ??=
                                            FormFieldController<String>(
                                          _model.themeCategoryValue ??=
                                              EventInformationGroup
                                                              .eventEditFormCursorCall
                                                              .themeCategoryId(
                                                            (_model.eventEditFromCursorOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          null &&
                                                      EventInformationGroup
                                                              .eventEditFormCursorCall
                                                              .themeCategoryId(
                                                            (_model.eventEditFromCursorOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          ''
                                                  ? EventInformationGroup
                                                      .eventEditFormCursorCall
                                                      .themeCategoryId(
                                                      (_model.eventEditFromCursorOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                  : '',
                                        ),
                                        options: List<String>.from(functions
                                            .replaceEmpty(EventInformationGroup
                                                .themeCategoryListPickerCall
                                                .id(
                                                  themeCategoryThemeCategoryListPickerResponse
                                                      .jsonBody,
                                                )
                                                ?.toList())),
                                        optionLabels: functions.replaceEmpty(
                                            EventInformationGroup
                                                .themeCategoryListPickerCall
                                                .text(
                                                  themeCategoryThemeCategoryListPickerResponse
                                                      .jsonBody,
                                                )
                                                ?.toList()),
                                        onChanged: (val) => safeSetState(() =>
                                            _model.themeCategoryValue = val),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'me221c5r' /* Select Theme Category */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderWidth: 1.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        hidesUnderline: true,
                                        isOverButton: false,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                  TextFormField(
                                    controller: _model.themeTextController,
                                    focusNode: _model.themeFocusNode,
                                    autofocus: false,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'gp4tbqam' /* Enter Theme Name */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyLargeIsCustom,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    minLines: 1,
                                    validator: _model
                                        .themeTextControllerValidator
                                        .asValidator(context),
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: EventInformationGroup
                                        .cLBXEnEventStatusForEventCall
                                        .call(
                                      token: FFAppState().SessionToken,
                                      context:
                                          '{\"key\":\"myEventForm\",\"params\":{\"format\":[\"js\",\"js\"],\"label\":[\"Event\"],\"autoRefreshOnSaveTarget\":[\"myEvent__otherEventCursorGrid\"],\"recordKey\":[\"-1\"]},\"component\":{\"clientId\":\"myEventForm__myEventForm\",\"clientState\":{\"clientId\":\"myEventForm__myEventForm\",\"cursor\":{\"__cachedId\":\"${_model.formId}\"}}}}',
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 11.0,
                                            height: 11.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final eventStatusCLBXEnEventStatusForEventResponse =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .eventStatusValueController ??=
                                            FormFieldController<String>(
                                          _model.eventStatusValue ??=
                                              EventInformationGroup
                                                              .eventEditFormCursorCall
                                                              .eventStatusId(
                                                            (_model.eventEditFromCursorOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          null &&
                                                      EventInformationGroup
                                                              .eventEditFormCursorCall
                                                              .eventStatusId(
                                                            (_model.eventEditFromCursorOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          ''
                                                  ? EventInformationGroup
                                                      .eventEditFormCursorCall
                                                      .eventStatusId(
                                                      (_model.eventEditFromCursorOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                  : '',
                                        ),
                                        options: List<String>.from(functions
                                            .replaceEmpty(EventInformationGroup
                                                .cLBXEnEventStatusForEventCall
                                                .id(
                                                  eventStatusCLBXEnEventStatusForEventResponse
                                                      .jsonBody,
                                                )
                                                ?.toList())),
                                        optionLabels: functions.replaceEmpty(
                                            EventInformationGroup
                                                .cLBXEnEventStatusForEventCall
                                                .text(
                                                  eventStatusCLBXEnEventStatusForEventResponse
                                                      .jsonBody,
                                                )
                                                ?.toList()),
                                        onChanged: (val) => safeSetState(() =>
                                            _model.eventStatusValue = val),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'k2d7oc8y' /* Select Event Status */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderWidth: 1.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        hidesUnderline: true,
                                        isOverButton: false,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: TextFormField(
                                            controller:
                                                _model.totalCostTextController,
                                            focusNode:
                                                _model.totalCostFocusNode,
                                            autofocus: false,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                't8cyl6vy' /* TotalCost */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                's068ohzs' /* TotalCost */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .totalCostTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: TextFormField(
                                            controller:
                                                _model.budgetTextController,
                                            focusNode: _model.budgetFocusNode,
                                            autofocus: false,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'wh7m69vo' /* Budget */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'yds73gvl' /* Budget */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .budgetTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 7.0)),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                _model.first = false;
                                _model.second = false;
                                _model.third = true;
                                _model.fourth = false;
                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'xoqj4b5h' /* Back */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                _model.saveEventOutput =
                                    await EventInformationGroup.saveEventCall
                                        .call(
                                  id: _model.formId,
                                  eventName:
                                      _model.eventNameTextController.text,
                                  eventCelebration: _model.celebrationTypeValue,
                                  eventIdealDate: dateTimeFormat(
                                    "yMd",
                                    _model.calendarSelectedDay?.start,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  token: FFAppState().SessionToken,
                                  clientState:
                                      '{\"clientId\":\"myEventForm__myEventForm\",\"cursor\":{\"__cachedId\":\"${_model.formId}\"}}',
                                  celebrateePersonFirstName:
                                      _model.firstNameTextController.text,
                                  celebrateePersonLastName:
                                      _model.lastNameTextController.text,
                                  opsHoursStartTime:
                                      functions.getTimeFromDateNTime(_model
                                          .timerPickerCompStartTimeModel
                                          .selectedTime!),
                                  opsHoursEndTime:
                                      functions.getTimeFromDateNTime(_model
                                          .timerPickerCompEndTimeModel
                                          .selectedTime!),
                                  additionalInfoIdealDateAlt1:
                                      _model.alterNateDate1TextController.text,
                                  additionalInfoIdealDateAlt2:
                                      _model.alterNateDate2TextController.text,
                                  celebrateePersonAge:
                                      _model.ageTextController.text,
                                  eventKidsInvitee:
                                      _model.kidsValue?.toString(),
                                  eventAdultInvitee:
                                      _model.adultsValue?.toString(),
                                  eventTotalCost:
                                      _model.totalCostTextController.text,
                                  additionalInfoBudget:
                                      _model.budgetTextController.text,
                                  eventAddressPostalCode:
                                      _model.postalCodeTextController.text,
                                  eventAddressStateProvince:
                                      _model.stateTextController.text,
                                  eventAddressStreet:
                                      _model.strretNameTextController.text,
                                  eventAddressCityTown:
                                      _model.cityTownTextController.text,
                                  eventAddressFloorSection:
                                      _model.flooreTextController.text,
                                  eventAddressLocalArea:
                                      _model.loacalAreaTextController.text,
                                  eventAddressBldgNum:
                                      _model.buildingNumberTextController.text,
                                  celebrateePersonGender:
                                      _model.gendetDropDownValue != null &&
                                              _model.gendetDropDownValue != ''
                                          ? _model.gendetDropDownValue
                                          : '',
                                  eventThemeCategory:
                                      _model.themeCategoryValue != null &&
                                              _model.themeCategoryValue != ''
                                          ? _model.themeCategoryValue
                                          : '',
                                  eventTheme: _model.themeTextController.text,
                                  eventEventStatus:
                                      _model.eventStatusValue != null &&
                                              _model.eventStatusValue != ''
                                          ? _model.eventStatusValue
                                          : '',
                                  eventDescription:
                                      _model.descriptionTextController.text,
                                );

                                if (getJsonField(
                                  (_model.saveEventOutput?.jsonBody ?? ''),
                                  r'''$.actionSuccess''',
                                )) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Event saved Sucessfully',
                                        style: GoogleFonts.roboto(
                                          color: Color(0x00000000),
                                          fontSize: 0.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 6750),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                    ),
                                  );

                                  context.goNamed(
                                    MyEventsWidget.routeName,
                                    queryParameters: {
                                      'tab': serializeParam(
                                        0,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        valueOrDefault<String>(
                                          EventInformationGroup.saveEventCall
                                              .text(
                                            (_model.saveEventOutput?.jsonBody ??
                                                ''),
                                          ),
                                          'Something Went Wrong',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                    ),
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'v8wxi5xi' /* Next */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ]
                          .divide(SizedBox(height: 10.0))
                          .addToEnd(SizedBox(height: 10.0)),
                    ),
                  ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
