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
import 'package:webviewx_plus/webviewx_plus.dart';
import 'contact_list_for_friend_model.dart';
export 'contact_list_for_friend_model.dart';

class ContactListForFriendWidget extends StatefulWidget {
  const ContactListForFriendWidget({
    super.key,
    required this.contacts,
    required this.memberType,
  });

  final List<ContactStruct>? contacts;
  final String? memberType;

  static String routeName = 'contactListForFriend';
  static String routePath = 'contactListForFriend';

  @override
  State<ContactListForFriendWidget> createState() =>
      _ContactListForFriendWidgetState();
}

class _ContactListForFriendWidgetState
    extends State<ContactListForFriendWidget> {
  late ContactListForFriendModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactListForFriendModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.counter = widget.contacts!.length;
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
              context.safePop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'r0osyvz2' /* Add contacts */,
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
                          '2nodg3tp' /* Search contacts... */,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (widget.memberType == 'Family')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.counter = _model
                                              .selectedContact
                                              .where((e) => e.selection == true)
                                              .toList()
                                              .length;
                                          if (_model.counter > 0) {
                                            _model.selectedContact = _model
                                                .selectedContact
                                                .where(
                                                    (e) => e.selection == true)
                                                .toList()
                                                .cast<ContactStruct>();
                                            while (_model.counter > 0) {
                                              _model.apiResultFamilyMemberInfo =
                                                  await AccountInfoGroup
                                                      .familyMemberEditCall
                                                      .call(
                                                recordKey: '-1',
                                                token:
                                                    FFAppState().SessionToken,
                                                clientState:
                                                    '{\"clientId\":\"myFamily__myFamilyPageGrid\",\"cursor\":{},\"selection\":[\"-1\"],\"currentPage\":1}',
                                              );

                                              if ((_model
                                                      .apiResultFamilyMemberInfo
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.familyMemberSaveOutput =
                                                    await AccountInfoGroup
                                                        .saveFamilyMemberCall
                                                        .call(
                                                  formid: AccountInfoGroup
                                                      .familyMemberEditCall
                                                      .formId(
                                                    (_model.apiResultFamilyMemberInfo
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  clientState:
                                                      '{\"clientId\":\"myFamilyForm__myFamilyForm\",\"cursor\":{\"__recordKey\":\"${AccountInfoGroup.familyMemberEditCall.formId(
                                                    (_model.apiResultFamilyMemberInfo
                                                            ?.jsonBody ??
                                                        ''),
                                                  )}\",\"__cachedId\":\"${AccountInfoGroup.familyMemberEditCall.formId(
                                                    (_model.apiResultFamilyMemberInfo
                                                            ?.jsonBody ??
                                                        ''),
                                                  )}\"}}',
                                                  token:
                                                      FFAppState().SessionToken,
                                                  dateOfBirth: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.dob,
                                                  postalCode: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .postalCode,
                                                  stateProvince: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .state,
                                                  cityTown: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .city,
                                                  localArea: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .country,
                                                  street: _model.selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .street,
                                                  location: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .address,
                                                  mobile: _model.selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.phoneNumbers
                                                      .firstOrNull,
                                                  email: _model.selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.emailAddresses,
                                                  firstName: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.displayName,
                                                );

                                                if ((_model
                                                        .familyMemberSaveOutput
                                                        ?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Information Saved Sucessfully',
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
                                                              .secondaryText,
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Some thing went Wrong',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 3950),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .clearSnackBars();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Some thing went Wrong',
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
                                                            .secondaryText,
                                                  ),
                                                );
                                              }

                                              _model.counter =
                                                  _model.counter - 1;
                                            }

                                            context.goNamed(
                                                FamilyMemberListWidget
                                                    .routeName);
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text('Aletrt'),
                                                    content: Text(
                                                        'Contacts not selected'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'j111yj1b' /* Add Family Member */,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                  if (widget.memberType == 'Friend')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.counter = _model
                                              .selectedContact
                                              .where((e) => e.selection == true)
                                              .toList()
                                              .length;
                                          if (_model.counter > 0) {
                                            _model.selectedContact = _model
                                                .selectedContact
                                                .where(
                                                    (e) => e.selection == true)
                                                .toList()
                                                .cast<ContactStruct>();
                                            while (_model.counter > 0) {
                                              _model.apiResultFriendInfo =
                                                  await AccountInfoGroup
                                                      .myFriendEditCall
                                                      .call(
                                                token:
                                                    FFAppState().SessionToken,
                                                clientState:
                                                    '{\"clientId\":\"myFriend__myFriendPageGrid\",\"cursor\":{},\"selection\":[\"-1\"],\"currentPage\":1}',
                                                recordKey: '-1',
                                              );

                                              if ((_model.apiResultFriendInfo
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.friendSaveOutput =
                                                    await AccountInfoGroup
                                                        .saveFriendCall
                                                        .call(
                                                  token:
                                                      FFAppState().SessionToken,
                                                  formid: AccountInfoGroup
                                                      .myFriendEditCall
                                                      .formId(
                                                    (_model.apiResultFriendInfo
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  clientState:
                                                      '{\"clientId\":\"myFriendForm__myFriendForm\",\"cursor\":{\"__cachedId\":\"${AccountInfoGroup.myFriendEditCall.formId(
                                                    (_model.apiResultFriendInfo
                                                            ?.jsonBody ??
                                                        ''),
                                                  )}\"}}',
                                                  firstName: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.displayName,
                                                  dateOfBirth: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.dob,
                                                  phone: _model.selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.phoneNumbers
                                                      .firstOrNull,
                                                  email: _model.selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.emailAddresses,
                                                  location: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .address,
                                                  postalCode: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .postalCode,
                                                  cityTown: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .city,
                                                  stateProvince: _model
                                                      .selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .state,
                                                  street: _model.selectedContact
                                                      .elementAtOrNull(
                                                          _model.counter - 1)
                                                      ?.address
                                                      .street,
                                                );

                                                if ((_model.friendSaveOutput
                                                        ?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Information Saved Sucessfully',
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
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Some thing went Wrong',
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
                                                    .clearSnackBars();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Some thing went Wrong',
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

                                              _model.counter =
                                                  _model.counter - 1;
                                            }

                                            context.goNamed(
                                                FriendListWidget.routeName);
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text('Aletrt'),
                                                    content: Text(
                                                        'Contact not selected'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'vk78a83h' /* Add  Friend */,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                ]
                                    .divide(SizedBox(width: 12.0))
                                    .around(SizedBox(width: 12.0)),
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
