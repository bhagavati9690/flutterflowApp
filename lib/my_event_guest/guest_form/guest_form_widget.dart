import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'guest_form_model.dart';
export 'guest_form_model.dart';

class GuestFormWidget extends StatefulWidget {
  const GuestFormWidget({
    super.key,
    this.guestId,
    required this.isEditForm,
  });

  final List<String>? guestId;
  final bool? isEditForm;

  static String routeName = 'GuestForm';
  static String routePath = 'guestForm';

  @override
  State<GuestFormWidget> createState() => _GuestFormWidgetState();
}

class _GuestFormWidgetState extends State<GuestFormWidget> {
  late GuestFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GuestFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isEditForm!) {
        _model.apiResultEditCursor =
            await EventGuestInformationGroup.editGuestCursorCall.call(
          parentRecordKey: FFAppState().eventId,
          clientState:
              '{\"clientId\":\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\"},\"selection\":[\"${widget.guestId?.firstOrNull}\"]}',
          token: FFAppState().SessionToken,
          cache: 'server',
          recordKey: widget.guestId?.firstOrNull,
        );

        safeSetState(() {
          _model.firstNameTextController?.text =
              EventGuestInformationGroup.editGuestCursorCall.firstname(
            (_model.apiResultEditCursor?.jsonBody ?? ''),
          )!;
        });
        await Future.wait([
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.lastName(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.lastName(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.lastNameTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.lastName(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.mobile(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.mobile(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.mobileNumberTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.mobile(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.email(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.email(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.emailTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.email(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.phone(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.phone(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.phoneNumberTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.phone(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.age(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                ) !=
                null) {
              safeSetState(() {
                _model.ageTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall
                        .age(
                          (_model.apiResultEditCursor?.jsonBody ?? ''),
                        )!
                        .toString();
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.dob(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.dob(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.dobTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.dob(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.intersts(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.intersts(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.interstesTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.intersts(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.rsvpComments(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.rsvpComments(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.rsvpCommentsTextFieldTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.rsvpComments(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.location(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.location(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.adressTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.location(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.bldgNum(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.bldgNum(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.buildingNumberTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.bldgNum(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.postalCode(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.postalCode(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.postalCodeTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.postalCode(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.floor(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.floor(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.floorTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.floor(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.strrect(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.strrect(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.streetNameTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.strrect(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.cityTown(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.cityTown(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.cityTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.cityTown(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.state(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.state(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.stateTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.state(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.country(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.country(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.countryTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.country(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (EventGuestInformationGroup.editGuestCursorCall.localArea(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    null &&
                EventGuestInformationGroup.editGuestCursorCall.localArea(
                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.loacalAreaTextController?.text =
                    EventGuestInformationGroup.editGuestCursorCall.localArea(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )!;
              });
            }
          }),
        ]);
        _model.idForm = EventGuestInformationGroup.editGuestCursorCall.idForm(
          (_model.apiResultEditCursor?.jsonBody ?? ''),
        );
        _model.guestType = valueOrDefault<String>(
          widget.isEditForm!
              ? EventGuestInformationGroup.editGuestCursorCall.guestType(
                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                )
              : '',
          'kkkkkk',
        );
        safeSetState(() {});
      } else {
        _model.apiResultAddGuest =
            await EventGuestInformationGroup.addGuestCursorCall.call(
          parentRecordKey: FFAppState().eventId,
          clientState:
              '{\"clientId\":\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\"}}',
          cache: 'server',
          token: FFAppState().SessionToken,
        );

        _model.idForm = EventGuestInformationGroup.addGuestCursorCall.idForm(
          (_model.apiResultAddGuest?.jsonBody ?? ''),
        );
        safeSetState(() {});
      }
    });

    _model.firstNameTextController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameTextController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();

    _model.mobileNumberTextController ??= TextEditingController();
    _model.mobileNumberFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    _model.ageTextController ??= TextEditingController();
    _model.ageFocusNode ??= FocusNode();

    _model.dobTextController ??= TextEditingController();
    _model.dobFocusNode ??= FocusNode();

    _model.adressTextController ??= TextEditingController();
    _model.adressFocusNode ??= FocusNode();

    _model.buildingNumberTextController ??= TextEditingController();
    _model.buildingNumberFocusNode ??= FocusNode();

    _model.postalCodeTextController ??= TextEditingController();
    _model.postalCodeFocusNode ??= FocusNode();

    _model.floorTextController ??= TextEditingController();
    _model.floorFocusNode ??= FocusNode();

    _model.streetNameTextController ??= TextEditingController();
    _model.streetNameFocusNode ??= FocusNode();

    _model.cityTextController ??= TextEditingController();
    _model.cityFocusNode ??= FocusNode();

    _model.stateTextController ??= TextEditingController();
    _model.stateFocusNode ??= FocusNode();

    _model.countryTextController ??= TextEditingController();
    _model.countryFocusNode ??= FocusNode();

    _model.loacalAreaTextController ??= TextEditingController();
    _model.loacalAreaFocusNode ??= FocusNode();

    _model.interstesTextController ??= TextEditingController();
    _model.interstesFocusNode ??= FocusNode();

    _model.rsvpCommentsTextFieldTextController ??= TextEditingController();
    _model.rsvpCommentsTextFieldFocusNode ??= FocusNode();

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
                    1,
                    ParamType.int,
                  ),
                }.withoutNulls,
              );
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '6dco44b4' /* Guest Information */,
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 52.0),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.idForm != null && _model.idForm != '')
                          SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
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
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future:
                                                        EventGuestInformationGroup
                                                            .eventGuestTypeCall
                                                            .call(
                                                      token: FFAppState()
                                                          .SessionToken,
                                                      ui: '{\"key\":\"addEventGuestUI\",\"params\":{\"format\":[\"js\",\"js\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\\\",\\\"cursor\\\":{\\\"parentRecordKey\\\":\\\"${FFAppState().eventId}\\\"},\\\"selection\\\":[]}\"],\"label\":[\"New Guest\"],\"autoRefreshOnSaveTarget\":[\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\"],\"parentRecordKey\":[\"${FFAppState().eventId}\"]},\"component\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"clientState\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}}}',
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      final rowEventGuestTypeResponse =
                                                          snapshot.data!;

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '4lkldghl' /* * */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyLargeIsCustom,
                                                                    ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'xjsjh6ph' /* Guest Type */,
                                                                ),
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
                                                            ],
                                                          ),
                                                          Flexible(
                                                            child:
                                                                FlutterFlowRadioButton(
                                                              options:
                                                                  EventGuestInformationGroup
                                                                      .eventGuestTypeCall
                                                                      .text(
                                                                        rowEventGuestTypeResponse
                                                                            .jsonBody,
                                                                      )!
                                                                      .toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(
                                                                    () {});
                                                                _model.guestType =
                                                                    _model
                                                                        .guestTypeRadioButtonValue!;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .friendOfdropdownValueController
                                                                      ?.reset();
                                                                  _model
                                                                      .relationdropdownValueController
                                                                      ?.reset();
                                                                });
                                                              },
                                                              controller: _model
                                                                      .guestTypeRadioButtonValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      valueOrDefault<
                                                                          String>(
                                                                widget
                                                                        .isEditForm!
                                                                    ? EventGuestInformationGroup
                                                                        .editGuestCursorCall
                                                                        .guestType(
                                                                        (_model.apiResultEditCursor?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                    : 'Family',
                                                                'Family',
                                                              )),
                                                              optionHeight:
                                                                  32.0,
                                                              optionWidth:
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.29,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                              selectedTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              buttonPosition:
                                                                  RadioButtonPosition
                                                                      .left,
                                                              direction: Axis
                                                                  .horizontal,
                                                              radioButtonColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              inactiveRadioButtonColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              toggleable: false,
                                                              horizontalAlignment:
                                                                  WrapAlignment
                                                                      .spaceAround,
                                                              verticalAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 9.0)),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: _model
                                                            .firstNameTextController,
                                                        focusNode: _model
                                                            .firstNameFocusNode,
                                                        autofocus: false,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .words,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'go0ttsu2' /* First Name */,
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        minLines: 1,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .firstNameTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          if (!isAndroid &&
                                                              !isiOS)
                                                            TextInputFormatter
                                                                .withFunction(
                                                                    (oldValue,
                                                                        newValue) {
                                                              return TextEditingValue(
                                                                selection: newValue
                                                                    .selection,
                                                                text: newValue
                                                                    .text
                                                                    .toCapitalization(
                                                                        TextCapitalization
                                                                            .words),
                                                              );
                                                            }),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jhk5ki40' /* * */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ],
                                            ),
                                            TextFormField(
                                              controller:
                                                  _model.lastNameTextController,
                                              focusNode:
                                                  _model.lastNameFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '7mv7bzkt' /* Last Name */,
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
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
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
                                                        .primaryText,
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
                                              minLines: 1,
                                              validator: _model
                                                  .lastNameTextControllerValidator
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
                                            FutureBuilder<ApiCallResponse>(
                                              future: EventGuestInformationGroup
                                                  .cLBXEnPersonGenderGuestCall
                                                  .call(
                                                uiContext:
                                                    '{\"key\":\"addEventGuestUI\",\"params\":{\"format\":[\"js\",\"js\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\\\",\\\"cursor\\\":{\\\"parentRecordKey\\\":\\\"${FFAppState().eventId}\\\"},\\\"selection\\\":[]}\"],\"label\":[\"New Guest\"],\"autoRefreshOnSaveTarget\":[\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\"],\"parentRecordKey\":[\"${FFAppState().eventId}\"]},\"component\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"clientState\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}}}',
                                                token:
                                                    FFAppState().SessionToken,
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
                                                final rowCLBXEnPersonGenderGuestResponse =
                                                    snapshot.data!;

                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FlutterFlowDropDown<String>(
                                                      controller: _model
                                                              .genderdropDownValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model
                                                            .genderdropDownValue ??= widget
                                                                .isEditForm!
                                                            ? EventGuestInformationGroup
                                                                .editGuestCursorCall
                                                                .genderId(
                                                                (_model.apiResultEditCursor
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                            : '',
                                                      ),
                                                      options: List<
                                                              String>.from(
                                                          functions.replaceEmpty(
                                                              EventGuestInformationGroup
                                                                  .cLBXEnPersonGenderGuestCall
                                                                  .id(
                                                                    rowCLBXEnPersonGenderGuestResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.toList())),
                                                      optionLabels: functions
                                                          .replaceEmpty(
                                                              EventGuestInformationGroup
                                                                  .cLBXEnPersonGenderGuestCall
                                                                  .text(
                                                                    rowCLBXEnPersonGenderGuestResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.toList()),
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.genderdropDownValue =
                                                                  val),
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.401,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.057,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'h0yhul87' /* Gender */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderWidth: 1.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: _model
                                                            .mobileNumberTextController,
                                                        focusNode: _model
                                                            .mobileNumberFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.mobileNumberTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            't5cmo78i' /* mobile Number */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          suffixIcon: _model
                                                                  .mobileNumberTextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .mobileNumberTextController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        minLines: 1,
                                                        keyboardType:
                                                            TextInputType.phone,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .mobileNumberTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 7.0)),
                                                );
                                              },
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextFormField(
                                                  controller: _model
                                                      .emailTextController,
                                                  focusNode:
                                                      _model.emailFocusNode,
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'zlkc2k4h' /* your Email */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
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
                                                                .primaryText,
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
                                                            Color(0x00000000),
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
                                                            Color(0x00000000),
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
                                                  minLines: 1,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .emailTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Container(
                                      width: double.infinity,
                                      color: Color(0x00000000),
                                      child: ExpandableNotifier(
                                        controller: _model
                                            .expandableExpandableController,
                                        child: ExpandablePanel(
                                          header: Text(
                                            FFLocalizations.of(context).getText(
                                              'fa7gk2sj' /* More Details */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily,
                                                  color: Colors.black,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeIsCustom,
                                                ),
                                          ),
                                          collapsed: Container(
                                            height: 1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          expanded: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x1E000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                        spreadRadius: 0.0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: EventGuestInformationGroup
                                                              .existingFamilyMemberListPickerCall
                                                              .call(
                                                            uiContext:
                                                                '{\"key\":\"addEventGuestUI\",\"params\":{\"format\":[\"js\",\"js\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\\\",\\\"cursor\\\":{\\\"parentRecordKey\\\":\\\"${FFAppState().eventId}\\\"},\\\"selection\\\":[]}\"],\"label\":[\"New Guest\"],\"autoRefreshOnSaveTarget\":[\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\"],\"parentRecordKey\":[\"${FFAppState().eventId}\"]},\"component\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"clientState\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}}}',
                                                            token: FFAppState()
                                                                .SessionToken,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            final columnExistingFamilyMemberListPickerResponse =
                                                                snapshot.data!;

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (_model
                                                                        .guestType ==
                                                                    'Friend')
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'j7a9ms0j' /* Friend of */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.friendOfdropdownValueController ??=
                                                                                FormFieldController<String>(
                                                                          _model.friendOfdropdownValue ??= widget.isEditForm!
                                                                              ? (EventGuestInformationGroup.editGuestCursorCall.familymeberId(
                                                                                            (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                                          ) !=
                                                                                          null &&
                                                                                      EventGuestInformationGroup.editGuestCursorCall.familymeberId(
                                                                                            (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                                          ) !=
                                                                                          ''
                                                                                  ? EventGuestInformationGroup.editGuestCursorCall.familymeberId(
                                                                                      (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                                    )
                                                                                  : EventGuestInformationGroup.existingFamilyMemberListPickerCall
                                                                                      .id(
                                                                                        columnExistingFamilyMemberListPickerResponse.jsonBody,
                                                                                      )
                                                                                      ?.firstOrNull)
                                                                              : valueOrDefault<String>(
                                                                                  EventGuestInformationGroup.existingFamilyMemberListPickerCall
                                                                                      .id(
                                                                                        columnExistingFamilyMemberListPickerResponse.jsonBody,
                                                                                      )
                                                                                      ?.firstOrNull,
                                                                                  '0',
                                                                                ),
                                                                        ),
                                                                        options: List<String>.from(functions.replaceEmpty(EventGuestInformationGroup
                                                                            .existingFamilyMemberListPickerCall
                                                                            .id(
                                                                              columnExistingFamilyMemberListPickerResponse.jsonBody,
                                                                            )
                                                                            ?.toList())),
                                                                        optionLabels: functions.replaceEmpty(EventGuestInformationGroup
                                                                            .existingFamilyMemberListPickerCall
                                                                            .text(
                                                                              columnExistingFamilyMemberListPickerResponse.jsonBody,
                                                                            )
                                                                            ?.toList()),
                                                                        onChanged:
                                                                            (val) =>
                                                                                safeSetState(() => _model.friendOfdropdownValue = val),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'qabonzrk' /* Select... */,
                                                                        ),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        borderWidth:
                                                                            1.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            false,
                                                                        isSearchable:
                                                                            false,
                                                                        isMultiSelect:
                                                                            false,
                                                                      ),
                                                                    ],
                                                                  ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                        if (_model.guestType ==
                                                            'Family')
                                                          FutureBuilder<
                                                              ApiCallResponse>(
                                                            future: EventGuestInformationGroup
                                                                .addEventGuestCursorRelationOptsCall
                                                                .call(
                                                              uiContext:
                                                                  '{\"key\":\"addEventGuestUI\",\"params\":{\"format\":[\"js\",\"js\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\\\",\\\"cursor\\\":{\\\"parentRecordKey\\\":\\\"${FFAppState().eventId}\\\"},\\\"selection\\\":[]}\"],\"label\":[\"New Guest\"],\"autoRefreshOnSaveTarget\":[\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\"],\"parentRecordKey\":[\"${FFAppState().eventId}\"]},\"component\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"clientState\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}}}',
                                                              token: FFAppState()
                                                                  .SessionToken,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 11.0,
                                                                    height:
                                                                        11.0,
                                                                    child:
                                                                        CircularProgressIndicator(
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
                                                              final columnAddEventGuestCursorRelationOptsResponse =
                                                                  snapshot
                                                                      .data!;

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '464bmxzy' /* Relation */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .relationdropdownValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model
                                                                          .relationdropdownValue ??= widget
                                                                              .isEditForm!
                                                                          ? (EventGuestInformationGroup.editGuestCursorCall.memberRelationId(
                                                                                        (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                                      ) !=
                                                                                      null &&
                                                                                  EventGuestInformationGroup.editGuestCursorCall.memberRelationId(
                                                                                        (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                                      ) !=
                                                                                      ''
                                                                              ? EventGuestInformationGroup.editGuestCursorCall.memberRelationId(
                                                                                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                                )
                                                                              : EventGuestInformationGroup.addEventGuestCursorRelationOptsCall
                                                                                  .id(
                                                                                    columnAddEventGuestCursorRelationOptsResponse.jsonBody,
                                                                                  )
                                                                                  ?.firstOrNull)
                                                                          : EventGuestInformationGroup.addEventGuestCursorRelationOptsCall
                                                                              .id(
                                                                                columnAddEventGuestCursorRelationOptsResponse.jsonBody,
                                                                              )
                                                                              ?.firstOrNull,
                                                                    ),
                                                                    options: List<
                                                                            String>.from(
                                                                        functions.replaceEmpty(EventGuestInformationGroup
                                                                            .addEventGuestCursorRelationOptsCall
                                                                            .id(
                                                                              columnAddEventGuestCursorRelationOptsResponse.jsonBody,
                                                                            )
                                                                            ?.toList())),
                                                                    optionLabels: functions.replaceEmpty(EventGuestInformationGroup
                                                                        .addEventGuestCursorRelationOptsCall
                                                                        .text(
                                                                          columnAddEventGuestCursorRelationOptsResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList()),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.relationdropdownValue =
                                                                                val),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'uev4jvdg' /* Select... */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        1.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: EventGuestInformationGroup
                                                              .cLBXEnEduLevelCall
                                                              .call(
                                                            uiContext:
                                                                '{\"key\":\"addEventGuestUI\",\"params\":{\"format\":[\"js\",\"js\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\\\",\\\"cursor\\\":{\\\"parentRecordKey\\\":\\\"${FFAppState().eventId}\\\"},\\\"selection\\\":[]}\"],\"label\":[\"New Guest\"],\"autoRefreshOnSaveTarget\":[\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\"],\"parentRecordKey\":[\"${FFAppState().eventId}\"]},\"component\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"clientState\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}}}',
                                                            token: FFAppState()
                                                                .SessionToken,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            final columnCLBXEnEduLevelResponse =
                                                                snapshot.data!;

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '93hma5bo' /* Education */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                                  controller: _model
                                                                          .educationdropdownValueController ??=
                                                                      FormFieldController<
                                                                          String>(
                                                                    _model
                                                                        .educationdropdownValue ??= widget
                                                                            .isEditForm!
                                                                        ? EventGuestInformationGroup
                                                                            .editGuestCursorCall
                                                                            .eduLevelId(
                                                                            (_model.apiResultEditCursor?.jsonBody ??
                                                                                ''),
                                                                          )
                                                                        : '',
                                                                  ),
                                                                  options: List<
                                                                          String>.from(
                                                                      functions.replaceEmpty(EventGuestInformationGroup
                                                                          .cLBXEnEduLevelCall
                                                                          .id(
                                                                            columnCLBXEnEduLevelResponse.jsonBody,
                                                                          )
                                                                          ?.toList())),
                                                                  optionLabels: functions.replaceEmpty(
                                                                      EventGuestInformationGroup
                                                                          .cLBXEnEduLevelCall
                                                                          .text(
                                                                            columnCLBXEnEduLevelResponse.jsonBody,
                                                                          )
                                                                          ?.toList()),
                                                                  onChanged: (val) =>
                                                                      safeSetState(() =>
                                                                          _model.educationdropdownValue =
                                                                              val),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    't56s46c9' /* Select... */,
                                                                  ),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  borderWidth:
                                                                      1.0,
                                                                  borderRadius:
                                                                      8.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isOverButton:
                                                                      false,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'tjf0x0nk' /* Alternate Contact Number */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .phoneNumberTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .phoneNumberFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'g73xbr5l' /* Contact Number */,
                                                                      ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    minLines: 1,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .phone,
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    validator: _model
                                                                        .phoneNumberTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp('[0-9]'))
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.25,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .ageTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .ageFocusNode,
                                                                      autofocus:
                                                                          false,
                                                                      textCapitalization:
                                                                          TextCapitalization
                                                                              .words,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .next,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            FFLocalizations.of(context).getText(
                                                                          '861zophb' /* Age */,
                                                                        ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                      minLines:
                                                                          1,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .ageTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                      inputFormatters: [
                                                                        if (!isAndroid &&
                                                                            !isiOS)
                                                                          TextInputFormatter.withFunction((oldValue,
                                                                              newValue) {
                                                                            return TextEditingValue(
                                                                              selection: newValue.selection,
                                                                              text: newValue.text.toCapitalization(TextCapitalization.words),
                                                                            );
                                                                          }),
                                                                        FilteringTextInputFormatter.allow(
                                                                            RegExp('[0-9]'))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 3.0)),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'n0cb3hze' /* Date of Birth */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.dobTextController,
                                                                        focusNode:
                                                                            _model.dobFocusNode,
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            '6tsre6p7' /* Date of Birth */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        keyboardType:
                                                                            TextInputType.datetime,
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .dobTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet<
                                                                                bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return ScrollConfiguration(
                                                                                behavior: const MaterialScrollBehavior().copyWith(
                                                                                  dragDevices: {
                                                                                    PointerDeviceKind.mouse,
                                                                                    PointerDeviceKind.touch,
                                                                                    PointerDeviceKind.stylus,
                                                                                    PointerDeviceKind.unknown
                                                                                  },
                                                                                ),
                                                                                child: Container(
                                                                                  height: MediaQuery.of(context).size.height / 3,
                                                                                  width: MediaQuery.of(context).size.width,
                                                                                  child: CupertinoDatePicker(
                                                                                    mode: CupertinoDatePickerMode.date,
                                                                                    minimumDate: DateTime(1900),
                                                                                    initialDateTime: getCurrentTimestamp,
                                                                                    maximumDate: getCurrentTimestamp,
                                                                                    use24hFormat: false,
                                                                                    onDateTimeChanged: (newDateTime) => safeSetState(() {
                                                                                      _model.datePicked = newDateTime;
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            });
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .dobTextController
                                                                              ?.text = dateTimeFormat(
                                                                            "d/M/y",
                                                                            _model.datePicked,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          );
                                                                          _model
                                                                              .dobFocusNode
                                                                              ?.requestFocus();
                                                                          WidgetsBinding
                                                                              .instance
                                                                              .addPostFrameCallback((_) {
                                                                            _model.dobTextController?.selection =
                                                                                TextSelection.collapsed(
                                                                              offset: _model.dobTextController!.text.length,
                                                                            );
                                                                          });
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .calendar_today,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  't2s1mqnl' /* Street Address */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              controller: _model
                                                                  .adressTextController,
                                                              focusNode: _model
                                                                  .adressFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.adressTextController',
                                                                Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                () async {
                                                                  _model.apiResultAdressSuggestion =
                                                                      await EventGuestInformationGroup
                                                                          .addressSuggestionGetCall
                                                                          .call(
                                                                    token: FFAppState()
                                                                        .SessionToken,
                                                                    query: _model
                                                                        .adressTextController
                                                                        .text,
                                                                    clientState:
                                                                        '{\"key\":\"addEventGuestUI\",\"params\":{\"format\":[\"js\",\"js\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\\\",\\\"cursor\\\":{\\\"parentRecordKey\\\":\\\"${FFAppState().eventId}\\\"},\\\"selection\\\":[]}\"],\"label\":[\"New Guest\"],\"autoRefreshOnSaveTarget\":[\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\"],\"parentRecordKey\":[\"${FFAppState().eventId}\"]},\"component\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"clientState\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}}}',
                                                                  );

                                                                  if ((_model
                                                                          .apiResultAdressSuggestion
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    await Future
                                                                        .wait([
                                                                      Future(
                                                                          () async {
                                                                        if (EventGuestInformationGroup.addressSuggestionGetCall.totalcount(
                                                                              (_model.apiResultAdressSuggestion?.jsonBody ?? ''),
                                                                            )! >
                                                                            2) {
                                                                          _model.showSuggestion =
                                                                              true;
                                                                        }
                                                                      }),
                                                                      Future(
                                                                          () async {
                                                                        _model.apiResultPoulateAddress1 = await EventGuestInformationGroup
                                                                            .populateAddressCall
                                                                            .call(
                                                                          token:
                                                                              FFAppState().SessionToken,
                                                                          id: _model
                                                                              .idForm,
                                                                          location: _model
                                                                              .adressTextController
                                                                              .text,
                                                                          clientState:
                                                                              ' {\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}',
                                                                        );

                                                                        if ((_model.apiResultPoulateAddress1?.succeeded ??
                                                                            true)) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.buildingNumberTextController?.clear();
                                                                            _model.postalCodeTextController?.clear();
                                                                            _model.floorTextController?.clear();
                                                                            _model.streetNameTextController?.clear();
                                                                            _model.cityTextController?.clear();
                                                                            _model.stateTextController?.clear();
                                                                            _model.countryTextController?.clear();
                                                                            _model.loacalAreaTextController?.clear();
                                                                          });
                                                                          await Future
                                                                              .wait([
                                                                            Future(() async {
                                                                              safeSetState(() {
                                                                                _model.cityTextController?.text = EventGuestInformationGroup.populateAddressCall.city(
                                                                                  (_model.apiResultPoulateAddress1?.jsonBody ?? ''),
                                                                                )!;
                                                                              });
                                                                            }),
                                                                            Future(() async {
                                                                              safeSetState(() {
                                                                                _model.buildingNumberTextController?.text = EventGuestInformationGroup.populateAddressCall.bldgNumber(
                                                                                  (_model.apiResultPoulateAddress1?.jsonBody ?? ''),
                                                                                )!;
                                                                              });
                                                                            }),
                                                                            Future(() async {
                                                                              safeSetState(() {
                                                                                _model.postalCodeTextController?.text = EventGuestInformationGroup.populateAddressCall.postalCode(
                                                                                  (_model.apiResultPoulateAddress1?.jsonBody ?? ''),
                                                                                )!;
                                                                              });
                                                                            }),
                                                                            Future(() async {
                                                                              safeSetState(() {
                                                                                _model.floorTextController?.text = EventGuestInformationGroup.populateAddressCall
                                                                                    .floor(
                                                                                      (_model.apiResultPoulateAddress1?.jsonBody ?? ''),
                                                                                    )!
                                                                                    .firstOrNull!;
                                                                              });
                                                                            }),
                                                                            Future(() async {
                                                                              safeSetState(() {
                                                                                _model.streetNameTextController?.text = EventGuestInformationGroup.populateAddressCall.street(
                                                                                  (_model.apiResultPoulateAddress1?.jsonBody ?? ''),
                                                                                )!;
                                                                              });
                                                                            }),
                                                                            Future(() async {
                                                                              safeSetState(() {
                                                                                _model.stateTextController?.text = EventGuestInformationGroup.populateAddressCall.state(
                                                                                  (_model.apiResultPoulateAddress1?.jsonBody ?? ''),
                                                                                )!;
                                                                              });
                                                                            }),
                                                                            Future(() async {
                                                                              safeSetState(() {
                                                                                _model.loacalAreaTextController?.text = EventGuestInformationGroup.populateAddressCall.localArea(
                                                                                  (_model.apiResultPoulateAddress1?.jsonBody ?? ''),
                                                                                )!;
                                                                              });
                                                                            }),
                                                                          ]);
                                                                        }
                                                                      }),
                                                                    ]);
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                              onFieldSubmitted:
                                                                  (_) async {
                                                                _model.showSuggestion =
                                                                    false;
                                                              },
                                                              autofocus: false,
                                                              textCapitalization:
                                                                  TextCapitalization
                                                                      .words,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintStyle: FlutterFlowTheme.of(
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
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                suffixIcon:
                                                                    Icon(
                                                                  Icons.place,
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                              maxLines: null,
                                                              cursorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              validator: _model
                                                                  .adressTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                              inputFormatters: [
                                                                if (!isAndroid &&
                                                                    !isiOS)
                                                                  TextInputFormatter
                                                                      .withFunction(
                                                                          (oldValue,
                                                                              newValue) {
                                                                    return TextEditingValue(
                                                                      selection:
                                                                          newValue
                                                                              .selection,
                                                                      text: newValue
                                                                          .text
                                                                          .toCapitalization(
                                                                              TextCapitalization.words),
                                                                    );
                                                                  }),
                                                              ],
                                                            ),
                                                            if (_model
                                                                    .showSuggestion ??
                                                                true)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final item = EventGuestInformationGroup
                                                                              .addressSuggestionGetCall
                                                                              .text(
                                                                                (_model.apiResultAdressSuggestion?.jsonBody ?? ''),
                                                                              )
                                                                              ?.toList() ??
                                                                          [];

                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            item.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                SizedBox(height: 10.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                itemIndex) {
                                                                          final itemItem =
                                                                              item[itemIndex];
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              safeSetState(() {
                                                                                _model.adressTextController?.text = itemItem;
                                                                              });
                                                                              _model.apiResultPoulateAddress2 = await EventGuestInformationGroup.populateAddressCall.call(
                                                                                token: FFAppState().SessionToken,
                                                                                id: _model.idForm,
                                                                                location: _model.adressTextController.text,
                                                                                clientState: ' {\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}',
                                                                              );

                                                                              if ((_model.apiResultPoulateAddress2?.succeeded ?? true)) {
                                                                                safeSetState(() {
                                                                                  _model.buildingNumberTextController?.clear();
                                                                                  _model.postalCodeTextController?.clear();
                                                                                  _model.floorTextController?.clear();
                                                                                  _model.streetNameTextController?.clear();
                                                                                  _model.cityTextController?.clear();
                                                                                  _model.stateTextController?.clear();
                                                                                  _model.countryTextController?.clear();
                                                                                  _model.loacalAreaTextController?.clear();
                                                                                });
                                                                                await Future.wait([
                                                                                  Future(() async {
                                                                                    safeSetState(() {
                                                                                      _model.cityTextController?.text = EventGuestInformationGroup.populateAddressCall.city(
                                                                                        (_model.apiResultPoulateAddress2?.jsonBody ?? ''),
                                                                                      )!;
                                                                                    });
                                                                                  }),
                                                                                  Future(() async {
                                                                                    safeSetState(() {
                                                                                      _model.buildingNumberTextController?.text = EventGuestInformationGroup.populateAddressCall.bldgNumber(
                                                                                        (_model.apiResultPoulateAddress2?.jsonBody ?? ''),
                                                                                      )!;
                                                                                    });
                                                                                  }),
                                                                                  Future(() async {
                                                                                    safeSetState(() {
                                                                                      _model.postalCodeTextController?.text = EventGuestInformationGroup.populateAddressCall.postalCode(
                                                                                        (_model.apiResultPoulateAddress2?.jsonBody ?? ''),
                                                                                      )!;
                                                                                    });
                                                                                  }),
                                                                                  Future(() async {
                                                                                    safeSetState(() {
                                                                                      _model.floorTextController?.text = EventGuestInformationGroup.populateAddressCall
                                                                                          .floor(
                                                                                            (_model.apiResultPoulateAddress2?.jsonBody ?? ''),
                                                                                          )!
                                                                                          .firstOrNull!;
                                                                                    });
                                                                                  }),
                                                                                  Future(() async {
                                                                                    safeSetState(() {
                                                                                      _model.streetNameTextController?.text = EventGuestInformationGroup.populateAddressCall.street(
                                                                                        (_model.apiResultPoulateAddress2?.jsonBody ?? ''),
                                                                                      )!;
                                                                                    });
                                                                                  }),
                                                                                  Future(() async {
                                                                                    safeSetState(() {
                                                                                      _model.stateTextController?.text = EventGuestInformationGroup.populateAddressCall.state(
                                                                                        (_model.apiResultPoulateAddress2?.jsonBody ?? ''),
                                                                                      )!;
                                                                                    });
                                                                                  }),
                                                                                  Future(() async {
                                                                                    safeSetState(() {
                                                                                      _model.loacalAreaTextController?.text = EventGuestInformationGroup.populateAddressCall.localArea(
                                                                                        (_model.apiResultPoulateAddress2?.jsonBody ?? ''),
                                                                                      )!;
                                                                                    });
                                                                                  }),
                                                                                ]);
                                                                                _model.showSuggestion = false;
                                                                              } else {
                                                                                _model.showSuggestion = false;
                                                                              }

                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.search_sharp,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                Flexible(
                                                                                  child: Text(
                                                                                    itemItem,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 7.0)),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'j8pyn9hq' /* Building Number */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.4,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .buildingNumberTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .buildingNumberFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .words,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    maxLines:
                                                                        null,
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    validator: _model
                                                                        .buildingNumberTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      if (!isAndroid &&
                                                                          !isiOS)
                                                                        TextInputFormatter.withFunction((oldValue,
                                                                            newValue) {
                                                                          return TextEditingValue(
                                                                            selection:
                                                                                newValue.selection,
                                                                            text:
                                                                                newValue.text.toCapitalization(TextCapitalization.words),
                                                                          );
                                                                        }),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1epdljlp' /* Postal Code */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.4,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .postalCodeTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .postalCodeFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    maxLines:
                                                                        null,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    validator: _model
                                                                        .postalCodeTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '0fbsu90e' /* Floor/Section */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.4,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .floorTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .floorFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .words,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    maxLines:
                                                                        null,
                                                                    validator: _model
                                                                        .floorTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      if (!isAndroid &&
                                                                          !isiOS)
                                                                        TextInputFormatter.withFunction((oldValue,
                                                                            newValue) {
                                                                          return TextEditingValue(
                                                                            selection:
                                                                                newValue.selection,
                                                                            text:
                                                                                newValue.text.toCapitalization(TextCapitalization.words),
                                                                          );
                                                                        }),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'xujn94av' /* Street Name */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.4,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .streetNameTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .streetNameFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .words,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    minLines: 1,
                                                                    validator: _model
                                                                        .streetNameTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      if (!isAndroid &&
                                                                          !isiOS)
                                                                        TextInputFormatter.withFunction((oldValue,
                                                                            newValue) {
                                                                          return TextEditingValue(
                                                                            selection:
                                                                                newValue.selection,
                                                                            text:
                                                                                newValue.text.toCapitalization(TextCapitalization.words),
                                                                          );
                                                                        }),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1n8228bh' /* City/Town */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.4,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .cityTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .cityFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .words,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    maxLines:
                                                                        null,
                                                                    validator: _model
                                                                        .cityTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      if (!isAndroid &&
                                                                          !isiOS)
                                                                        TextInputFormatter.withFunction((oldValue,
                                                                            newValue) {
                                                                          return TextEditingValue(
                                                                            selection:
                                                                                newValue.selection,
                                                                            text:
                                                                                newValue.text.toCapitalization(TextCapitalization.words),
                                                                          );
                                                                        }),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'sgv2177a' /* State */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.4,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .stateTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .stateFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .words,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    maxLines:
                                                                        null,
                                                                    validator: _model
                                                                        .stateTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      if (!isAndroid &&
                                                                          !isiOS)
                                                                        TextInputFormatter.withFunction((oldValue,
                                                                            newValue) {
                                                                          return TextEditingValue(
                                                                            selection:
                                                                                newValue.selection,
                                                                            text:
                                                                                newValue.text.toCapitalization(TextCapitalization.words),
                                                                          );
                                                                        }),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'jo0x4e7t' /* Country */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.4,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .countryTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .countryFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .words,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .done,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    maxLines:
                                                                        null,
                                                                    validator: _model
                                                                        .countryTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      if (!isAndroid &&
                                                                          !isiOS)
                                                                        TextInputFormatter.withFunction((oldValue,
                                                                            newValue) {
                                                                          return TextEditingValue(
                                                                            selection:
                                                                                newValue.selection,
                                                                            text:
                                                                                newValue.text.toCapitalization(TextCapitalization.words),
                                                                          );
                                                                        }),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'w9tsezpd' /* Local Area */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.4,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .loacalAreaTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .loacalAreaFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .words,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .done,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    maxLines:
                                                                        null,
                                                                    validator: _model
                                                                        .loacalAreaTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      if (!isAndroid &&
                                                                          !isiOS)
                                                                        TextInputFormatter.withFunction((oldValue,
                                                                            newValue) {
                                                                          return TextEditingValue(
                                                                            selection:
                                                                                newValue.selection,
                                                                            text:
                                                                                newValue.text.toCapitalization(TextCapitalization.words),
                                                                          );
                                                                        }),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'jjvmm3vy' /* Interest */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              controller: _model
                                                                  .interstesTextController,
                                                              focusNode: _model
                                                                  .interstesFocusNode,
                                                              autofocus: false,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintStyle: FlutterFlowTheme.of(
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
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                              minLines: 1,
                                                              validator: _model
                                                                  .interstesTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      visualDensity:
                                                                          VisualDensity
                                                                              .compact,
                                                                      materialTapTargetSize:
                                                                          MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    unselectedWidgetColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                  ),
                                                                  child:
                                                                      Checkbox(
                                                                    value: _model
                                                                        .specialNeedsValue ??= widget
                                                                            .isEditForm!
                                                                        ? (EventGuestInformationGroup.editGuestCursorCall.specialNeeds(
                                                                                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                                ) !=
                                                                                null
                                                                            ? EventGuestInformationGroup.editGuestCursorCall.specialNeeds(
                                                                                (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                              )!
                                                                            : false)
                                                                        : false,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.specialNeedsValue =
                                                                              newValue!);
                                                                    },
                                                                    side: (FlutterFlowTheme.of(context).alternate !=
                                                                            null)
                                                                        ? BorderSide(
                                                                            width:
                                                                                2,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          )
                                                                        : null,
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    checkColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'q7jheyn6' /* Special Needs */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 7.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      visualDensity:
                                                                          VisualDensity
                                                                              .compact,
                                                                      materialTapTargetSize:
                                                                          MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    unselectedWidgetColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                  ),
                                                                  child:
                                                                      Checkbox(
                                                                    value: _model
                                                                        .allergyValue ??= widget
                                                                            .isEditForm!
                                                                        ? (EventGuestInformationGroup.editGuestCursorCall.allergy(
                                                                                  (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                                ) !=
                                                                                null
                                                                            ? EventGuestInformationGroup.editGuestCursorCall.allergy(
                                                                                (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                              )!
                                                                            : false)
                                                                        : false,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.allergyValue =
                                                                              newValue!);
                                                                    },
                                                                    side: (FlutterFlowTheme.of(context).alternate !=
                                                                            null)
                                                                        ? BorderSide(
                                                                            width:
                                                                                2,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          )
                                                                        : null,
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    checkColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'v0glm4ka' /* Allergy */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 7.0)),
                                                            ),
                                                          ],
                                                        ),
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: EventGuestInformationGroup
                                                              .cLBXEnGuestRSVPCall
                                                              .call(
                                                            uiContext:
                                                                '{\"key\":\"addEventGuestUI\",\"params\":{\"format\":[\"js\",\"js\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\\\",\\\"cursor\\\":{\\\"parentRecordKey\\\":\\\"${FFAppState().eventId}\\\"},\\\"selection\\\":[]}\"],\"label\":[\"New Guest\"],\"autoRefreshOnSaveTarget\":[\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\"],\"parentRecordKey\":[\"${FFAppState().eventId}\"]},\"component\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"clientState\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}}}',
                                                            token: FFAppState()
                                                                .SessionToken,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            final rowCLBXEnGuestRSVPResponse =
                                                                snapshot.data!;

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'brv7kn18' /* RSVP */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                    controller: _model
                                                                            .rsvpDropDownValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model
                                                                          .rsvpDropDownValue ??= widget
                                                                              .isEditForm!
                                                                          ? EventGuestInformationGroup
                                                                              .editGuestCursorCall
                                                                              .guestRSVPId(
                                                                              (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                            )
                                                                          : '',
                                                                    ),
                                                                    options: List<
                                                                            String>.from(
                                                                        functions.replaceEmpty(EventGuestInformationGroup
                                                                            .cLBXEnGuestRSVPCall
                                                                            .id(
                                                                              rowCLBXEnGuestRSVPResponse.jsonBody,
                                                                            )
                                                                            ?.toList())),
                                                                    optionLabels: functions.replaceEmpty(EventGuestInformationGroup
                                                                        .cLBXEnGuestRSVPCall
                                                                        .text(
                                                                          rowCLBXEnGuestRSVPResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList()),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.rsvpDropDownValue =
                                                                                val),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'xzi8n0s0' /* Select... */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 7.0)),
                                                            );
                                                          },
                                                        ),
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: EventGuestInformationGroup
                                                              .cLBXEnGuestSecurityCall
                                                              .call(
                                                            uiContext:
                                                                '{\"key\":\"addEventGuestUI\",\"params\":{\"format\":[\"js\",\"js\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\\\",\\\"cursor\\\":{\\\"parentRecordKey\\\":\\\"${FFAppState().eventId}\\\"},\\\"selection\\\":[]}\"],\"label\":[\"New Guest\"],\"autoRefreshOnSaveTarget\":[\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\"],\"parentRecordKey\":[\"${FFAppState().eventId}\"]},\"component\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"clientState\":{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}}}',
                                                            token: FFAppState()
                                                                .SessionToken,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            final rowCLBXEnGuestSecurityResponse =
                                                                snapshot.data!;

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ws294nv7' /* Keep It */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                    controller: _model
                                                                            .keepItDropDownValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model
                                                                          .keepItDropDownValue ??= widget
                                                                              .isEditForm!
                                                                          ? EventGuestInformationGroup
                                                                              .editGuestCursorCall
                                                                              .eventSecurityId(
                                                                              (_model.apiResultEditCursor?.jsonBody ?? ''),
                                                                            )
                                                                          : '',
                                                                    ),
                                                                    options: List<
                                                                            String>.from(
                                                                        functions.replaceEmpty(EventGuestInformationGroup
                                                                            .cLBXEnGuestSecurityCall
                                                                            .id(
                                                                              rowCLBXEnGuestSecurityResponse.jsonBody,
                                                                            )
                                                                            ?.toList())),
                                                                    optionLabels: functions.replaceEmpty(EventGuestInformationGroup
                                                                        .cLBXEnGuestSecurityCall
                                                                        .text(
                                                                          rowCLBXEnGuestSecurityResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList()),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.keepItDropDownValue =
                                                                                val),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hipzc0jm' /* Select... */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 7.0)),
                                                            );
                                                          },
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'n1d737jn' /* RSVP Comments */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              controller: _model
                                                                  .rsvpCommentsTextFieldTextController,
                                                              focusNode: _model
                                                                  .rsvpCommentsTextFieldFocusNode,
                                                              autofocus: false,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintStyle: FlutterFlowTheme.of(
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
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                              minLines: 1,
                                                              maxLength: 100,
                                                              cursorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              validator: _model
                                                                  .rsvpCommentsTextFieldTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 16.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 10.0))
                                  .around(SizedBox(height: 10.0)),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if (_model.guestTypeRadioButtonValue == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Enter guest type',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            );
                            return;
                          }
                          _model.guestSaveOutput =
                              await EventGuestInformationGroup.addGuestCall
                                  .call(
                            clientState:
                                '{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${_model.idForm}\"}}',
                            id: _model.idForm,
                            token: FFAppState().SessionToken,
                            guestType:
                                _model.guestTypeRadioButtonValue == 'Family'
                                    ? '0'
                                    : '1',
                            personAllergy: _model.allergyValue,
                            personSpecialNeeds: _model.specialNeedsValue,
                            personFirstName:
                                _model.firstNameTextController.text,
                            personLastName: _model.lastNameTextController.text,
                            personCommunicationEmail:
                                _model.emailTextController.text,
                            personAge: _model.ageTextController.text,
                            personCommunicationPhone:
                                _model.phoneNumberTextController.text,
                            eventGuestRsvpComments:
                                _model.rsvpCommentsTextFieldTextController.text,
                            personCommunicationMobile:
                                _model.mobileNumberTextController.text,
                            personInterests:
                                _model.interstesTextController.text,
                            personAddressLocalArea:
                                _model.loacalAreaTextController.text,
                            personAddressStreet:
                                _model.streetNameTextController.text,
                            personAddressFloorSection:
                                _model.floorTextController.text,
                            personAddressPostalCode:
                                _model.postalCodeTextController.text,
                            personAddressBldgNum:
                                _model.buildingNumberTextController.text,
                            personAddressCityTown:
                                _model.cityTextController.text,
                            personAddressStateProvince:
                                _model.stateTextController.text,
                            personAddressLocation:
                                _model.adressTextController.text,
                            personGender: _model.genderdropDownValue,
                            eventGuestRsvp: _model.rsvpDropDownValue,
                            personEduLevel: _model.educationdropdownValue,
                            eventGuestsecurity: _model.keepItDropDownValue,
                            familyMemberId:
                                _model.friendOfdropdownValue != null &&
                                        _model.friendOfdropdownValue != ''
                                    ? (_model.guestType == 'Friend'
                                        ? _model.friendOfdropdownValue
                                        : '')
                                    : '',
                            memberRelation:
                                _model.relationdropdownValue != null &&
                                        _model.relationdropdownValue != ''
                                    ? (_model.guestType == 'Family'
                                        ? _model.relationdropdownValue
                                        : '')
                                    : '',
                            personDateOfBirth: _model.dobTextController.text,
                          );

                          if ((_model.guestSaveOutput?.succeeded ?? true)) {
                            if (EventGuestInformationGroup.addGuestCall
                                .actionSucess(
                              (_model.guestSaveOutput?.jsonBody ?? ''),
                            )!) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    EventGuestInformationGroup.addGuestCall
                                        .messageSucess(
                                      (_model.guestSaveOutput?.jsonBody ?? ''),
                                    )!,
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              );

                              context.goNamed(
                                MyEventsWidget.routeName,
                                queryParameters: {
                                  'tab': serializeParam(
                                    1,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Something went Wrong',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Something went Wrong',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            );
                          }

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'x3ytipon' /* Save */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
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
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleSmallIsCustom,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
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
