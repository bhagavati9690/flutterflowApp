import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'login_comp_model.dart';
export 'login_comp_model.dart';

class LoginCompWidget extends StatefulWidget {
  const LoginCompWidget({super.key});

  @override
  State<LoginCompWidget> createState() => _LoginCompWidgetState();
}

class _LoginCompWidgetState extends State<LoginCompWidget>
    with TickerProviderStateMixin {
  late LoginCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginCompModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1010.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 1010.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 12.000000000000014),
            end: Offset(0.0, -33.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(-0.349, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).lemonLime,
            Color(0xFFF0D18C),
            Color(0xFFF6C0BA),
            FlutterFlowTheme.of(context).secondaryBackground
          ],
          stops: [0.1, 0.4, 0.7, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'b418j0qo' /* Welcome! Login Successful */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ).animateOnActionTrigger(
                        animationsMap['textOnActionTriggerAnimation']!,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 3.0, 12.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/celebratix_logo_e.png',
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'o8ve5non' /* Sign In */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineSmallIsCustom,
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 12.0)).around(SizedBox(height: 12.0)),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 7.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.emailAddressTextController,
                                  focusNode: _model.emailAddressFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.emailAddressTextController',
                                    Duration(milliseconds: 2000),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'x058ta0k' /* Email */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelLargeIsCustom,
                                        ),
                                    alignLabelWithHint: false,
                                    errorStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodySmallIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding: EdgeInsets.all(20.0),
                                    suffixIcon: _model
                                            .emailAddressTextController!
                                            .text
                                            .isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.emailAddressTextController
                                                  ?.clear();
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFF757575),
                                              size: 22.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .emailAddressTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.passwordTextController,
                                  focusNode: _model.passwordFocusNode,
                                  autofocus: false,
                                  obscureText: !_model.passwordVisibility,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'vbhkzczi' /* Password */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding: EdgeInsets.all(20.0),
                                    suffixIcon: InkWell(
                                      onTap: () => safeSetState(
                                        () => _model.passwordVisibility =
                                            !_model.passwordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  validator: _model
                                      .passwordTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed(ForgotPasswordWidget.routeName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x1CEE8B60),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'c4clcgrs' /* Forgot Password ? */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        color: Color(0xFFFCFBFB),
                                        letterSpacing: 0.0,
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyLargeIsCustom,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.apiResultLoginAction =
                                  await AccountInfoGroup.loginAccountCall.call(
                                email: _model.emailAddressTextController.text,
                                password: _model.passwordTextController.text,
                                rememberMe: true,
                                token: FFAppState().SessionToken,
                              );

                              if ((_model.apiResultLoginAction?.succeeded ??
                                  true)) {
                                if (AccountInfoGroup.loginAccountCall
                                        .actionSuccess(
                                      (_model.apiResultLoginAction?.jsonBody ??
                                          ''),
                                    ) ==
                                    true) {
                                  FFAppState().IsLoggedInUser = true;
                                  FFAppState().SessionToken = (_model
                                          .apiResultLoginAction
                                          ?.getHeader('cbxtoken') ??
                                      '');
                                  FFAppState().Email =
                                      _model.emailAddressTextController.text;
                                  FFAppState().password =
                                      _model.passwordTextController.text;
                                  FFAppState().cartCount = AccountInfoGroup
                                              .loginAccountCall
                                              .cartCount(
                                            (_model.apiResultLoginAction
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          null
                                      ? AccountInfoGroup.loginAccountCall
                                          .cartCount(
                                            (_model.apiResultLoginAction
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                          .toString()
                                      : '';
                                  FFAppState().resourceId = functions
                                      .getAllResourceType(
                                          AccountInfoGroup.loginAccountCall
                                              .params(
                                                (_model.apiResultLoginAction
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .resourceId;
                                  if (animationsMap[
                                          'textOnActionTriggerAnimation'] !=
                                      null) {
                                    await animationsMap[
                                            'textOnActionTriggerAnimation']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: Text(AccountInfoGroup
                                              .loginAccountCall
                                              .title(
                                            (_model.apiResultLoginAction
                                                    ?.jsonBody ??
                                                ''),
                                          )!),
                                          content: Text(AccountInfoGroup
                                              .loginAccountCall
                                              .msg(
                                            (_model.apiResultLoginAction
                                                    ?.jsonBody ??
                                                ''),
                                          )!),
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
                                }

                                _model.myInformation = await AccountInfoGroup
                                    .myInformationCall
                                    .call(
                                  token: FFAppState().SessionToken,
                                );

                                FFAppState().custmorName =
                                    AccountInfoGroup.myInformationCall.name(
                                  (_model.myInformation?.jsonBody ?? ''),
                                )!;
                                FFAppState().userType = () {
                                  if (functions
                                      .getAllResourceType(
                                          AccountInfoGroup.loginAccountCall
                                              .params(
                                                (_model.apiResultLoginAction
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .isVenue) {
                                    return 'vendor';
                                  } else if (functions
                                      .getAllResourceType(
                                          AccountInfoGroup.loginAccountCall
                                              .params(
                                                (_model.apiResultLoginAction
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .isRental) {
                                    return 'vendor';
                                  } else if (functions
                                      .getAllResourceType(
                                          AccountInfoGroup.loginAccountCall
                                              .params(
                                                (_model.apiResultLoginAction
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .isEntertainer) {
                                    return 'vendor';
                                  } else if (functions
                                      .getAllResourceType(
                                          AccountInfoGroup.loginAccountCall
                                              .params(
                                                (_model.apiResultLoginAction
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .isCake) {
                                    return 'vendor';
                                  } else if (functions
                                      .getAllResourceType(
                                          AccountInfoGroup.loginAccountCall
                                              .params(
                                                (_model.apiResultLoginAction
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .isFood) {
                                    return 'vendor';
                                  } else {
                                    return 'consumer';
                                  }
                                }();
                                FFAppState().profilePic = AccountInfoGroup
                                    .myInformationCall
                                    .profilePic(
                                  (_model.myInformation?.jsonBody ?? ''),
                                )!;
                                if (functions.getIsAppDownloaded(
                                    AccountInfoGroup.loginAccountCall
                                        .params(
                                          (_model.apiResultLoginAction
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                        .toList())) {
                                  _model.currentUserResponse =
                                      await queryUsersRecordOnce(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where(
                                      'email',
                                      isEqualTo: FFAppState().Email,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  FFAppState().currentUserId =
                                      _model.currentUserResponse?.reference;
                                  FFAppState().currentUser = UserStruct(
                                    displayName:
                                        _model.currentUserResponse?.displayName,
                                    emails: _model.currentUserResponse?.email,
                                    referenceId: _model
                                        .currentUserResponse?.reference.id,
                                  );
                                } else {
                                  _model.currentUserBeforeAddResponse =
                                      await queryUsersRecordOnce(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where(
                                      'email',
                                      isEqualTo: FFAppState().Email,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (_model.currentUserBeforeAddResponse
                                          ?.reference !=
                                      null) {
                                    FFAppState().currentUserId = _model
                                        .currentUserBeforeAddResponse
                                        ?.reference;
                                    FFAppState().currentUser = UserStruct(
                                      displayName: _model
                                          .currentUserBeforeAddResponse
                                          ?.displayName,
                                      emails: _model
                                          .currentUserBeforeAddResponse?.email,
                                      referenceId: _model
                                          .currentUserBeforeAddResponse
                                          ?.reference
                                          .id,
                                    );
                                  } else {
                                    var usersRecordReference =
                                        UsersRecord.collection.doc();
                                    await usersRecordReference
                                        .set(createUsersRecordData(
                                      email: _model
                                          .emailAddressTextController.text,
                                      displayName: AccountInfoGroup
                                          .myInformationCall
                                          .name(
                                        (_model.myInformation?.jsonBody ?? ''),
                                      ),
                                      isVenue: functions
                                          .getAllResourceType(
                                              AccountInfoGroup.loginAccountCall
                                                  .params(
                                                    (_model.apiResultLoginAction
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList())
                                          .isVenue,
                                      isRental: functions
                                          .getAllResourceType(
                                              AccountInfoGroup.loginAccountCall
                                                  .params(
                                                    (_model.apiResultLoginAction
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList())
                                          .isRental,
                                      isEntertainer: functions
                                          .getAllResourceType(
                                              AccountInfoGroup.loginAccountCall
                                                  .params(
                                                    (_model.apiResultLoginAction
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList())
                                          .isEntertainer,
                                      isCake: functions
                                          .getAllResourceType(
                                              AccountInfoGroup.loginAccountCall
                                                  .params(
                                                    (_model.apiResultLoginAction
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList())
                                          .isCake,
                                      isFood: functions
                                          .getAllResourceType(
                                              AccountInfoGroup.loginAccountCall
                                                  .params(
                                                    (_model.apiResultLoginAction
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList())
                                          .isFood,
                                    ));
                                    _model.createUserResponse =
                                        UsersRecord.getDocumentFromData(
                                            createUsersRecordData(
                                              email: _model
                                                  .emailAddressTextController
                                                  .text,
                                              displayName: AccountInfoGroup
                                                  .myInformationCall
                                                  .name(
                                                (_model.myInformation
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              isVenue: functions
                                                  .getAllResourceType(
                                                      AccountInfoGroup
                                                          .loginAccountCall
                                                          .params(
                                                            (_model.apiResultLoginAction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                          .toList())
                                                  .isVenue,
                                              isRental: functions
                                                  .getAllResourceType(
                                                      AccountInfoGroup
                                                          .loginAccountCall
                                                          .params(
                                                            (_model.apiResultLoginAction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                          .toList())
                                                  .isRental,
                                              isEntertainer: functions
                                                  .getAllResourceType(
                                                      AccountInfoGroup
                                                          .loginAccountCall
                                                          .params(
                                                            (_model.apiResultLoginAction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                          .toList())
                                                  .isEntertainer,
                                              isCake: functions
                                                  .getAllResourceType(
                                                      AccountInfoGroup
                                                          .loginAccountCall
                                                          .params(
                                                            (_model.apiResultLoginAction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                          .toList())
                                                  .isCake,
                                              isFood: functions
                                                  .getAllResourceType(
                                                      AccountInfoGroup
                                                          .loginAccountCall
                                                          .params(
                                                            (_model.apiResultLoginAction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                          .toList())
                                                  .isFood,
                                            ),
                                            usersRecordReference);
                                    await AccountInfoGroup
                                        .updateMobileDownLoadCursorCall
                                        .call(
                                      email: FFAppState().Email,
                                      isAndroid: isAndroid,
                                      isVenue: functions
                                          .getAllResourceType(
                                              AccountInfoGroup.loginAccountCall
                                                  .params(
                                                    (_model.apiResultLoginAction
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList())
                                          .isVenue,
                                      isRental: functions
                                          .getAllResourceType(
                                              AccountInfoGroup.loginAccountCall
                                                  .params(
                                                    (_model.apiResultLoginAction
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList())
                                          .isRental,
                                      isEntertainer: functions
                                          .getAllResourceType(
                                              AccountInfoGroup.loginAccountCall
                                                  .params(
                                                    (_model.apiResultLoginAction
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList())
                                          .isEntertainer,
                                      isCake: functions
                                          .getAllResourceType(
                                              AccountInfoGroup.loginAccountCall
                                                  .params(
                                                    (_model.apiResultLoginAction
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList())
                                          .isVenue,
                                      isFood: functions
                                          .getAllResourceType(
                                              AccountInfoGroup.loginAccountCall
                                                  .params(
                                                    (_model.apiResultLoginAction
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList())
                                          .isVenue,
                                    );

                                    _model.currentUserResponse2 =
                                        await queryUsersRecordOnce(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where(
                                        'email',
                                        isEqualTo:
                                            _model.createUserResponse?.email,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    FFAppState().currentUserId =
                                        _model.currentUserResponse2?.reference;
                                    FFAppState().currentUser = UserStruct(
                                      displayName: _model
                                          .currentUserResponse2?.displayName,
                                      emails:
                                          _model.currentUserResponse2?.email,
                                      referenceId: _model
                                          .currentUserResponse2?.reference.id,
                                    );
                                  }
                                }

                                context.goNamed(MyAccountWidget.routeName);
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text('ERROR'),
                                        content: Text('Somthing went Wrong'),
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
                              }

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'mq2qk8ry' /* Sign In */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              height: MediaQuery.sizeOf(context).height * 0.06,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 16.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'kc2dexio' /* Or sign In with */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelMediumIsCustom,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Wrap(
                                spacing: 6.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.center,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 15.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'jrnw6y7k' /*  */,
                                          ),
                                          icon: FaIcon(
                                            FontAwesomeIcons.google,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.05,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconAlignment: IconAlignment.end,
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 15.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '3dkdzgi2' /*  */,
                                          ),
                                          icon: FaIcon(
                                            FontAwesomeIcons.apple,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.05,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconAlignment: IconAlignment.end,
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ].divide(SizedBox(height: 16.0)),
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
