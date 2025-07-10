import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/error_page_view_compoent/error_page_view_compoent_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'contact_list_model.dart';
export 'contact_list_model.dart';

class ContactListWidget extends StatefulWidget {
  const ContactListWidget({
    super.key,
    required this.contacts,
    required this.guestType,
  });

  final List<ContactStruct>? contacts;
  final String? guestType;

  static String routeName = 'contactList';
  static String routePath = 'contactList';

  @override
  State<ContactListWidget> createState() => _ContactListWidgetState();
}

class _ContactListWidgetState extends State<ContactListWidget> {
  late ContactListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.counter = widget.contacts!.length;
      _model.addGuestQuery = ClientQueryStruct(
        clientId: 'addEventGuestUI__addEventGuestForm',
        cursor: CursorStruct(
          parentRecordKey: FFAppState().eventId,
        ),
      );
      _model.selectedContact = widget.contacts!.toList().cast<ContactStruct>();
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            buttonSize: 48.0,
            fillColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
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
              'fgd7t9kx' /* Contacts */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
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
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.serchContacts = await actions.searchContacts(
                            _model.textController.text,
                          );
                          _model.selectedContact = _model.serchContacts!
                              .toList()
                              .cast<ContactStruct>();
                          safeSetState(() {});
                          _model.counter = _model.selectedContact.length;
                          safeSetState(() {});

                          safeSetState(() {});
                        },
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          '0yfwamsz' /* Search contacts... */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        suffixIcon: Icon(
                          Icons.search,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                      minLines: 1,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                if (_model.selectedContact.length > 0)
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 58.0),
                            child: Builder(
                              builder: (context) {
                                final contact = _model.selectedContact.toList();
                                if (contact.isEmpty) {
                                  return ErrorPageViewCompoentWidget(
                                    text: 'No contacts found I your phone',
                                  );
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: contact.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 10.0),
                                  itemBuilder: (context, contactIndex) {
                                    final contactItem = contact[contactIndex];
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (!contactItem.selection)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
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
                                                        _model
                                                            .updateSelectedContactAtIndex(
                                                          contactIndex,
                                                          (e) => e
                                                            ..selection = true,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .check_box_outline_blank,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ),
                                                if (contactItem.selection)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
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
                                                        _model
                                                            .updateSelectedContactAtIndex(
                                                          contactIndex,
                                                          (e) => e
                                                            ..selection = false,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.check_box,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model
                                                      .updateSelectedContactAtIndex(
                                                    contactIndex,
                                                    (e) => e
                                                      ..selection =
                                                          contactItem.selection
                                                              ? false
                                                              : true,
                                                  );
                                                  safeSetState(() {});
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            contactItem
                                                                .displayName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMediumIsCustom,
                                                                ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if (valueOrDefault<
                                                                          String>(
                                                                        contactItem
                                                                            .phoneNumbers
                                                                            .firstOrNull,
                                                                        '99',
                                                                      ) !=
                                                                      '')
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .phone,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        contactItem
                                                                            .phoneNumbers
                                                                            .firstOrNull,
                                                                        '99',
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
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              if (valueOrDefault<
                                                                      int>(
                                                                    contactItem
                                                                        .phoneNumbers
                                                                        .length,
                                                                    99,
                                                                  ) >
                                                                  1)
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .phone,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        contactItem
                                                                            .phoneNumbers
                                                                            .elementAtOrNull(1),
                                                                        '88',
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
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                          if (contactItem
                                                                      .emailAddresses !=
                                                                  '')
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons.email,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 16.0,
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    contactItem
                                                                        .emailAddresses,
                                                                    'h',
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
                                                                  width: 8.0)),
                                                            ),
                                                          if (valueOrDefault<
                                                                      String>(
                                                                    contactItem
                                                                        .dob,
                                                                    '99',
                                                                  ) !=
                                                                  '')
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons.cake,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 16.0,
                                                                ),
                                                                Flexible(
                                                                  child: Text(
                                                                    contactItem
                                                                        .dob,
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
                                                                ),
                                                              ],
                                                            ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.counter = _model.selectedContact
                                            .where((e) => e.selection == true)
                                            .toList()
                                            .length;
                                        if (_model.counter > 0) {
                                          _model.selectedContact = _model
                                              .selectedContact
                                              .where((e) => e.selection == true)
                                              .toList()
                                              .cast<ContactStruct>();
                                          while (_model.counter > 0) {
                                            _model.addGuestCursorOutput =
                                                await EventGuestInformationGroup
                                                    .addGuestCursorCall
                                                    .call(
                                              token: FFAppState().SessionToken,
                                              parentRecordKey:
                                                  FFAppState().eventId,
                                              clientState:
                                                  '{\"clientId\":\"nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\"}}',
                                            );

                                            if ((_model.addGuestCursorOutput
                                                    ?.succeeded ??
                                                true)) {
                                              _model.guestSaveOutput =
                                                  await EventGuestInformationGroup
                                                      .addGuestCall
                                                      .call(
                                                token:
                                                    FFAppState().SessionToken,
                                                id: EventGuestInformationGroup
                                                    .addGuestCursorCall
                                                    .idForm(
                                                  (_model.addGuestCursorOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                guestType: widget.guestType,
                                                personFirstName: _model
                                                    .selectedContact
                                                    .elementAtOrNull(
                                                        _model.counter - 1)
                                                    ?.displayName,
                                                personLastName: _model
                                                    .selectedContact
                                                    .elementAtOrNull(
                                                        _model.counter - 1)
                                                    ?.lastName,
                                                personCommunicationEmail: _model
                                                    .selectedContact
                                                    .elementAtOrNull(
                                                        _model.counter - 1)
                                                    ?.emailAddresses,
                                                personCommunicationMobile:
                                                    _model.selectedContact
                                                        .elementAtOrNull(
                                                            _model.counter - 1)
                                                        ?.phoneNumbers
                                                        .firstOrNull,
                                                personDateOfBirth: _model
                                                    .selectedContact
                                                    .elementAtOrNull(
                                                        _model.counter - 1)
                                                    ?.dob,
                                                personAddressLocation: _model
                                                    .selectedContact
                                                    .elementAtOrNull(
                                                        _model.counter - 1)
                                                    ?.address
                                                    .address,
                                                personAddressCityTown: _model
                                                    .selectedContact
                                                    .elementAtOrNull(
                                                        _model.counter - 1)
                                                    ?.address
                                                    .city,
                                                personAddressStreet: _model
                                                    .selectedContact
                                                    .elementAtOrNull(
                                                        _model.counter - 1)
                                                    ?.address
                                                    .street,
                                                personAddressStateProvince:
                                                    _model.selectedContact
                                                        .elementAtOrNull(
                                                            _model.counter - 1)
                                                        ?.address
                                                        .state,
                                                personAddressPostalCode: _model
                                                    .selectedContact
                                                    .elementAtOrNull(
                                                        _model.counter - 1)
                                                    ?.address
                                                    .postalCode,
                                                clientState:
                                                    '{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"${FFAppState().eventId}\",\"__cachedId\":\"${EventGuestInformationGroup.addGuestCursorCall.idForm(
                                                  (_model.addGuestCursorOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}\"}}',
                                              );

                                              if ((_model.guestSaveOutput
                                                      ?.succeeded ??
                                                  true)) {
                                                if (EventGuestInformationGroup
                                                    .addGuestCall
                                                    .actionSucess(
                                                  (_model.guestSaveOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Guest added sucessfully',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Something went Wrong',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Something went Wrong',
                                                      style: TextStyle(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                                );
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Something went Wrong',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              );
                                            }

                                            _model.counter = _model.counter - 1;
                                          }

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
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Plz Select contact ',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'ubo3n0ma' /* Add Guests */,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(width: 11.0))
                                    .around(SizedBox(width: 11.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
