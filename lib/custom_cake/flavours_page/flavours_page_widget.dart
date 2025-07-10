import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/compoents/common_comp/error_page_view_compoent/error_page_view_compoent_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'flavours_page_model.dart';
export 'flavours_page_model.dart';

class FlavoursPageWidget extends StatefulWidget {
  const FlavoursPageWidget({
    super.key,
    this.parentRecordKey,
    this.recordKey,
    this.index,
  });

  final String? parentRecordKey;
  final String? recordKey;
  final String? index;

  static String routeName = 'flavoursPage';
  static String routePath = 'flavoursPage';

  @override
  State<FlavoursPageWidget> createState() => _FlavoursPageWidgetState();
}

class _FlavoursPageWidgetState extends State<FlavoursPageWidget> {
  late FlavoursPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlavoursPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.cakeFlavourResponse = await CustomCakeGroup.cakeFlavoursCall.call(
        recordKey: widget.recordKey,
        parentRecordKey: widget.parentRecordKey,
        index: widget.index,
        token: FFAppState().SessionToken,
        clientState:
            '{\"clientId\":\"customCakeForMenuSectionToCart__customCakeCartWizardTabPanel\",\"index\":${widget.index}}',
      );

      if ((_model.cakeFlavourResponse?.succeeded ?? true)) {
        _model.ocKey = CustomCakeGroup.cakeFlavoursCall.id(
          (_model.cakeFlavourResponse?.jsonBody ?? ''),
        );
        _model.selectionPrice =
            CustomCakeGroup.cakeFlavoursCall.priceOfMenuSectionOption(
          (_model.cakeFlavourResponse?.jsonBody ?? ''),
        );
        _model.totalPrice = CustomCakeGroup.cakeFlavoursCall.totalPrice(
          (_model.cakeFlavourResponse?.jsonBody ?? ''),
        );
      } else {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: CustomErrorrAltertBoxWidget(),
                ),
              ),
            );
          },
        );
      }

      _model.flavourOptionsResponse =
          await CustomCakeGroup.flavourListPickerCursorCall.call(
        parentRecordKey: widget.parentRecordKey,
        recordKey: widget.recordKey,
        token: FFAppState().SessionToken,
        uiContext:
            '{\"key\":\"cakeFlavours\",\"clientId\":\"contains_cakeFlavours__cakeFlavours__cakeFlavoursUIForm\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}} ',
      );

      if ((_model.flavourOptionsResponse?.succeeded ?? true)) {
        _model.options = functions
            .mapCheckboxes(
                (_model.flavourOptionsResponse?.jsonBody ?? ''),
                CustomCakeGroup.cakeFlavoursCall
                    .checkbox(
                      (_model.cakeFlavourResponse?.jsonBody ?? ''),
                    )!
                    .toList())
            .toList()
            .cast<ContactStruct>();
        _model.apiLoaded = true;
        safeSetState(() {});
      } else {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: CustomErrorrAltertBoxWidget(),
                ),
              ),
            );
          },
        );
      }
    });

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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).lemonLime,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 43.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 26.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'qkpjela4' /* Flavours  */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.roboto(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Visibility(
              visible: _model.apiLoaded,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 24.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.apiLoaded)
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '5k82natq' /* Choose maximum 3 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      if (_model.selectionPrice != '0')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'b9ommwnn' /* Selection Price */,
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
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  '\$${_model.selectionPrice}',
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
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.totalPrice != '0')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '1prz07k1' /* Total Price */,
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
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  '\$${_model.totalPrice}',
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
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Builder(
                                            builder: (context) {
                                              final contact =
                                                  _model.options.toList();
                                              if (contact.isEmpty) {
                                                return ErrorPageViewCompoentWidget(
                                                  text:
                                                      'No contacts found I your phone',
                                                );
                                              }

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: contact.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 10.0),
                                                itemBuilder:
                                                    (context, contactIndex) {
                                                  final contactItem =
                                                      contact[contactIndex];
                                                  return Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if (!contactItem
                                                                  .selection)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
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
                                                                      _model
                                                                          .updateOptionsAtIndex(
                                                                        contactIndex,
                                                                        (e) => e
                                                                          ..selection =
                                                                              true,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.checkboxChanged = await CustomCakeGroup
                                                                          .flavourCheckBoxSelectionCall
                                                                          .call(
                                                                        token: FFAppState()
                                                                            .SessionToken,
                                                                        id: _model
                                                                            .ocKey,
                                                                        clientState:
                                                                            '{\"clientId\":\"contains_cakeFlavours__cakeFlavours__cakeFlavoursUIForm\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                                        checkboxId: functions.getSelectedCheckboxes(_model
                                                                            .options
                                                                            .toList()),
                                                                      );

                                                                      if (CustomCakeGroup
                                                                          .flavourCheckBoxSelectionCall
                                                                          .actionSuccess(
                                                                        (_model.checkboxChanged?.jsonBody ??
                                                                            ''),
                                                                      )!) {
                                                                        _model.selectionPrice = CustomCakeGroup
                                                                            .flavourCheckBoxSelectionCall
                                                                            .selectionPrice(
                                                                          (_model.checkboxChanged?.jsonBody ??
                                                                              ''),
                                                                        );
                                                                        _model.totalPrice = CustomCakeGroup
                                                                            .flavourCheckBoxSelectionCall
                                                                            .totalPrice(
                                                                          (_model.checkboxChanged?.jsonBody ??
                                                                              ''),
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              CustomCakeGroup.flavourCheckBoxSelectionCall.toastErrorMsg(
                                                                                (_model.checkboxChanged?.jsonBody ?? ''),
                                                                              )!,
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        );
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .check_box_outline_blank,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (contactItem
                                                                  .selection)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
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
                                                                      _model
                                                                          .updateOptionsAtIndex(
                                                                        contactIndex,
                                                                        (e) => e
                                                                          ..selection =
                                                                              false,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.checkboxChanged2 = await CustomCakeGroup
                                                                          .flavourCheckBoxSelectionCall
                                                                          .call(
                                                                        token: FFAppState()
                                                                            .SessionToken,
                                                                        id: _model
                                                                            .ocKey,
                                                                        clientState:
                                                                            '{\"clientId\":\"contains_cakeFlavours__cakeFlavours__cakeFlavoursUIForm\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                                        checkboxId: functions.getSelectedCheckboxes(_model
                                                                            .options
                                                                            .toList()),
                                                                      );

                                                                      if (CustomCakeGroup
                                                                          .flavourCheckBoxSelectionCall
                                                                          .actionSuccess(
                                                                        (_model.checkboxChanged2?.jsonBody ??
                                                                            ''),
                                                                      )!) {
                                                                        _model.selectionPrice = CustomCakeGroup
                                                                            .flavourCheckBoxSelectionCall
                                                                            .selectionPrice(
                                                                          (_model.checkboxChanged2?.jsonBody ??
                                                                              ''),
                                                                        );
                                                                        _model.totalPrice = CustomCakeGroup
                                                                            .flavourCheckBoxSelectionCall
                                                                            .totalPrice(
                                                                          (_model.checkboxChanged2?.jsonBody ??
                                                                              ''),
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              '',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .check_box,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Flexible(
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                _model
                                                                    .updateOptionsAtIndex(
                                                                  contactIndex,
                                                                  (e) => e
                                                                    ..selection = contactItem
                                                                            .selection
                                                                        ? false
                                                                        : true,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                _model.checkboxChanged3 =
                                                                    await CustomCakeGroup
                                                                        .flavourCheckBoxSelectionCall
                                                                        .call(
                                                                  token: FFAppState()
                                                                      .SessionToken,
                                                                  id: _model
                                                                      .ocKey,
                                                                  clientState:
                                                                      '{\"clientId\":\"contains_cakeFlavours__cakeFlavours__cakeFlavoursUIForm\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                                  checkboxId: functions
                                                                      .getSelectedCheckboxes(_model
                                                                          .options
                                                                          .toList()),
                                                                );

                                                                if (CustomCakeGroup
                                                                    .flavourCheckBoxSelectionCall
                                                                    .actionSuccess(
                                                                  (_model.checkboxChanged3
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!) {
                                                                  _model.selectionPrice =
                                                                      CustomCakeGroup
                                                                          .flavourCheckBoxSelectionCall
                                                                          .selectionPrice(
                                                                    (_model.checkboxChanged3
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.totalPrice =
                                                                      CustomCakeGroup
                                                                          .flavourCheckBoxSelectionCall
                                                                          .totalPrice(
                                                                    (_model.checkboxChanged3
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        CustomCakeGroup
                                                                            .flavourCheckBoxSelectionCall
                                                                            .toastErrorMsg(
                                                                          (_model.checkboxChanged3?.jsonBody ??
                                                                              ''),
                                                                        )!,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                    ),
                                                                  );
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        contactItem
                                                                            .displayName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
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
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              _model.nextResponse =
                                  await CustomCakeGroup.flavourNextCall.call(
                                recordKey: widget.recordKey,
                                parentRecordKey: widget.parentRecordKey,
                                id: _model.ocKey,
                                index: widget.index,
                                token: FFAppState().SessionToken,
                                checkbox: functions.getSelectedCheckboxes(
                                    _model.options.toList()),
                                clientState:
                                    '{\"clientId\":\"contains_cakeFlavours__cakeFlavours__cakeFlavoursUIForm\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"${widget.parentRecordKey}\",\"index\":\"${widget.index}\",\"__cachedId\":\"${_model.ocKey}\"}}',
                              );

                              if ((_model.nextResponse?.succeeded ?? true)) {
                                _model.nextParms = functions
                                    .mapParams(CustomCakeGroup.flavourNextCall
                                        .act(
                                          (_model.nextResponse?.jsonBody ?? ''),
                                        )!
                                        .firstOrNull!)
                                    .toList()
                                    .cast<NameIdSearchableStruct>();
                                await Future.wait([
                                  Future(() async {
                                    if (_model.nextParms
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeFillings') {
                                      context.pushNamed(
                                        FillingsPageWidget.routeName,
                                        queryParameters: {
                                          'parentRecordKey': serializeParam(
                                            widget.parentRecordKey,
                                            ParamType.String,
                                          ),
                                          'recordKey': serializeParam(
                                            widget.recordKey,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            widget.index,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.nextParms
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'priceTab') {
                                      context.pushNamed(
                                        CustomCakeDeliveryTabWidget.routeName,
                                        queryParameters: {
                                          'recordKey': serializeParam(
                                            widget.recordKey,
                                            ParamType.String,
                                          ),
                                          'parentRecordKey': serializeParam(
                                            widget.parentRecordKey,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            widget.index,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.nextParms
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeIcingsTab') {
                                      context.pushNamed(
                                        IcingPageWidget.routeName,
                                        queryParameters: {
                                          'parentRecordKey': serializeParam(
                                            widget.parentRecordKey,
                                            ParamType.String,
                                          ),
                                          'recordKey': serializeParam(
                                            widget.recordKey,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            widget.index,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.nextParms
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeShapesTab') {
                                      context.pushNamed(
                                        ShapesPageWidget.routeName,
                                        queryParameters: {
                                          'parentRecordKey': serializeParam(
                                            widget.parentRecordKey,
                                            ParamType.String,
                                          ),
                                          'recordKey': serializeParam(
                                            widget.recordKey,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            widget.index,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.nextParms
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeDecorTypeTab') {
                                      context.pushNamed(
                                        DecorPageWidget.routeName,
                                        queryParameters: {
                                          'parentRecordKey': serializeParam(
                                            widget.parentRecordKey,
                                            ParamType.String,
                                          ),
                                          'recordKey': serializeParam(
                                            widget.recordKey,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            widget.index,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.nextParms
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeColorTab') {
                                      context.pushNamed(
                                        ColorPageWidget.routeName,
                                        queryParameters: {
                                          'parentRecordKey': serializeParam(
                                            widget.parentRecordKey,
                                            ParamType.String,
                                          ),
                                          'recordKey': serializeParam(
                                            widget.recordKey,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            widget.index,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.nextParms
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeLayersTab') {
                                      context.pushNamed(
                                        LayerPageWidget.routeName,
                                        queryParameters: {
                                          'parentRecordKey': serializeParam(
                                            widget.parentRecordKey,
                                            ParamType.String,
                                          ),
                                          'recordKey': serializeParam(
                                            widget.recordKey,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            widget.index,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.nextParms
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeBorderTypeTab') {
                                      context.pushNamed(
                                        BorderPageWidget.routeName,
                                        queryParameters: {
                                          'parentRecordKey': serializeParam(
                                            widget.parentRecordKey,
                                            ParamType.String,
                                          ),
                                          'recordKey': serializeParam(
                                            widget.recordKey,
                                            ParamType.String,
                                          ),
                                          'index': serializeParam(
                                            widget.index,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  }),
                                ]);
                              }

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'k6gucoeu' /* Next */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.55,
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
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
