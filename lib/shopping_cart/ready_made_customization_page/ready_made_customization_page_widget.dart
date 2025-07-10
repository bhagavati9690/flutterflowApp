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
import 'ready_made_customization_page_model.dart';
export 'ready_made_customization_page_model.dart';

class ReadyMadeCustomizationPageWidget extends StatefulWidget {
  const ReadyMadeCustomizationPageWidget({
    super.key,
    String? recordKey,
    String? type,
    this.customizationType,
    this.quantity,
  })  : this.recordKey = recordKey ?? '-1',
        this.type = type ?? '-1';

  /// not present for venue
  final String recordKey;

  final String type;
  final String? customizationType;
  final String? quantity;

  static String routeName = 'readyMadeCustomizationPage';
  static String routePath = 'readyMadeCustomizationPage';

  @override
  State<ReadyMadeCustomizationPageWidget> createState() =>
      _ReadyMadeCustomizationPageWidgetState();
}

class _ReadyMadeCustomizationPageWidgetState
    extends State<ReadyMadeCustomizationPageWidget> {
  late ReadyMadeCustomizationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadyMadeCustomizationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.customizationCursor =
          await RentalShoppingCartGroup.readyMakeCakeCustomCursorCall.call(
        resourceType: '5',
        type: '0',
        token: FFAppState().SessionToken,
        recordKey: widget.recordKey,
        quantity: widget.quantity,
        parentRecordKey: widget.recordKey,
        cakeCustomizationType: widget.customizationType,
        clientState:
            '{\"clientId\":\"contains_readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemPackageFrom\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}',
      );

      if ((_model.customizationCursor?.succeeded ?? true)) {
        _model.ocKey = RentalShoppingCartGroup.readyMakeCakeCustomCursorCall.id(
          (_model.customizationCursor?.jsonBody ?? ''),
        );
        _model.list = functions
            .mapCheckboxes2(
                (_model.customizationCursor?.jsonBody ?? ''),
                RentalShoppingCartGroup.readyMakeCakeCustomCursorCall
                    .checkBoxIds(
                      (_model.customizationCursor?.jsonBody ?? ''),
                    )!
                    .toList())
            .toList()
            .cast<ContactStruct>();
        _model.apiLoaded = true;
        _model.totalPrice =
            RentalShoppingCartGroup.readyMakeCakeCustomCursorCall.totalPrice(
          (_model.customizationCursor?.jsonBody ?? ''),
        )!;
        _model.optionsPrice =
            RentalShoppingCartGroup.readyMakeCakeCustomCursorCall.unitPrice(
          (_model.customizationCursor?.jsonBody ?? ''),
        );
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
              borderWidth: 1.0,
              buttonSize: 44.0,
              icon: Icon(
                Icons.arrow_back_rounded,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'yu3em43y' /* Customization */,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (_model.apiLoaded)
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    RentalShoppingCartGroup
                                        .readyMakeCakeCustomCursorCall
                                        .label(
                                      (_model.customizationCursor?.jsonBody ??
                                          ''),
                                    ),
                                    'CustomizationType',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF14181B),
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Visibility(
                                    visible: (_model.optionsPrice != '0') ||
                                        (_model.totalPrice != '0'),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (_model.optionsPrice != '0')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                'Unit Price : ${_model.optionsPrice}',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          if (_model.totalPrice != '0')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                'Price : ${_model.totalPrice}',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Builder(
                                      builder: (context) {
                                        final contact = _model.list.toList();
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
                                          itemBuilder: (context, contactIndex) {
                                            final contactItem =
                                                contact[contactIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (!contactItem
                                                            .selection)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
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
                                                                    .updateListAtIndex(
                                                                  contactIndex,
                                                                  (e) => e
                                                                    ..selection =
                                                                        true,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                _model.checkboxChanged =
                                                                    await RentalShoppingCartGroup
                                                                        .rMCustomPageCheckboxChangedCall
                                                                        .call(
                                                                  clientState:
                                                                      '{\"clientId\":\"contains_readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemPackageFrom\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}',
                                                                  resourceType:
                                                                      '5',
                                                                  type: widget
                                                                      .type,
                                                                  recordKey: widget
                                                                      .recordKey,
                                                                  id: _model
                                                                      .ocKey,
                                                                  token: FFAppState()
                                                                      .SessionToken,
                                                                  cakeCustomizationType:
                                                                      widget
                                                                          .customizationType,
                                                                  quantity: widget
                                                                      .quantity,
                                                                  checkBoxIds: functions
                                                                      .getSelectedCheckboxes(_model
                                                                          .list
                                                                          .toList()),
                                                                );

                                                                if ((_model
                                                                        .checkboxChanged
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  _model.optionsPrice =
                                                                      RentalShoppingCartGroup
                                                                          .rMCustomPageCheckboxChangedCall
                                                                          .price(
                                                                    (_model.checkboxChanged
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.totalPrice =
                                                                      RentalShoppingCartGroup
                                                                          .rMCustomPageCheckboxChangedCall
                                                                          .totalPrice(
                                                                    (_model.checkboxChanged
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!;
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
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ),
                                                        if (contactItem
                                                            .selection)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
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
                                                                    .updateListAtIndex(
                                                                  contactIndex,
                                                                  (e) => e
                                                                    ..selection =
                                                                        false,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                _model.checkboxChanged2 =
                                                                    await RentalShoppingCartGroup
                                                                        .rMCustomPageCheckboxChangedCall
                                                                        .call(
                                                                  clientState:
                                                                      '{\"clientId\":\"contains_readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemPackageFrom\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}',
                                                                  resourceType:
                                                                      '5',
                                                                  type: widget
                                                                      .type,
                                                                  recordKey: widget
                                                                      .recordKey,
                                                                  id: _model
                                                                      .ocKey,
                                                                  token: FFAppState()
                                                                      .SessionToken,
                                                                  cakeCustomizationType:
                                                                      widget
                                                                          .customizationType,
                                                                  quantity: widget
                                                                      .quantity,
                                                                  checkBoxIds: functions
                                                                      .getSelectedCheckboxes(_model
                                                                          .list
                                                                          .toList()),
                                                                );

                                                                if (RentalShoppingCartGroup
                                                                    .rMCustomPageCheckboxChangedCall
                                                                    .actionSuccess(
                                                                  (_model.checkboxChanged2
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!) {
                                                                  _model.optionsPrice =
                                                                      RentalShoppingCartGroup
                                                                          .rMCustomPageCheckboxChangedCall
                                                                          .price(
                                                                    (_model.checkboxChanged2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.totalPrice =
                                                                      RentalShoppingCartGroup
                                                                          .rMCustomPageCheckboxChangedCall
                                                                          .totalPrice(
                                                                    (_model.checkboxChanged2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!;
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons.check_box,
                                                                color: FlutterFlowTheme.of(
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
                                                              .updateListAtIndex(
                                                            contactIndex,
                                                            (e) => e
                                                              ..selection =
                                                                  contactItem
                                                                          .selection
                                                                      ? false
                                                                      : true,
                                                          );
                                                          safeSetState(() {});
                                                          _model.checkboxChanged3 =
                                                              await RentalShoppingCartGroup
                                                                  .rMCustomPageCheckboxChangedCall
                                                                  .call(
                                                            clientState:
                                                                '{\"clientId\":\"contains_readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemPackageFrom\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}',
                                                            resourceType: '5',
                                                            type: widget.type,
                                                            recordKey: widget
                                                                .recordKey,
                                                            id: _model.ocKey,
                                                            token: FFAppState()
                                                                .SessionToken,
                                                            cakeCustomizationType:
                                                                widget
                                                                    .customizationType,
                                                            quantity: widget
                                                                .quantity,
                                                            checkBoxIds: functions
                                                                .getSelectedCheckboxes(
                                                                    _model.list
                                                                        .toList()),
                                                          );

                                                          if (RentalShoppingCartGroup
                                                              .rMCustomPageCheckboxChangedCall
                                                              .actionSuccess(
                                                            (_model.checkboxChanged3
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!) {
                                                            _model.optionsPrice =
                                                                RentalShoppingCartGroup
                                                                    .rMCustomPageCheckboxChangedCall
                                                                    .price(
                                                              (_model.checkboxChanged3
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.totalPrice =
                                                                RentalShoppingCartGroup
                                                                    .rMCustomPageCheckboxChangedCall
                                                                    .totalPrice(
                                                              (_model.checkboxChanged3
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!;
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
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
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
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
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          _model.nextResponse = await RentalShoppingCartGroup
                              .rMCustomPageNextCall
                              .call(
                            clientState:
                                '{\"clientId\":\"contains_readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemPackageFrom\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}',
                            quantity: widget.quantity,
                            resourceType: '5',
                            recordKey: widget.recordKey,
                            type: widget.type,
                            cakeCustomizationType: widget.customizationType,
                            id: _model.ocKey,
                            token: FFAppState().SessionToken,
                            checkBoxIds: functions
                                .getSelectedCheckboxes(_model.list.toList()),
                          );

                          if ((_model.nextResponse?.succeeded ?? true)) {
                            if (RentalShoppingCartGroup.rMCustomPageNextCall
                                .actionSuccess(
                              (_model.nextResponse?.jsonBody ?? ''),
                            )!) {
                              _model.nextTabName = functions
                                  .mapParams(RentalShoppingCartGroup
                                      .rMCustomPageNextCall
                                      .act(
                                        (_model.nextResponse?.jsonBody ?? ''),
                                      )!
                                      .firstOrNull!)
                                  .where((e) => e.id == 'tabName')
                                  .toList()
                                  .firstOrNull
                                  ?.name;
                              if (_model.nextTabName == 'customizationTabId') {
                                context.pushNamed(
                                  ReadyMadeCustomizationPageWidget.routeName,
                                  queryParameters: {
                                    'recordKey': serializeParam(
                                      widget.recordKey,
                                      ParamType.String,
                                    ),
                                    'type': serializeParam(
                                      widget.type,
                                      ParamType.String,
                                    ),
                                    'customizationType': serializeParam(
                                      functions
                                          .mapParams(RentalShoppingCartGroup
                                              .rMCustomPageNextCall
                                              .act(
                                                (_model.nextResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .firstOrNull!)
                                          .where((e) =>
                                              e.id == 'cakeCustomizationType')
                                          .toList()
                                          .firstOrNull
                                          ?.name,
                                      ParamType.String,
                                    ),
                                    'quantity': serializeParam(
                                      widget.quantity,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                if (_model.nextTabName == 'dateAndTimeTabId') {
                                  context.pushNamed(
                                    EventReadOnlyPageWidget.routeName,
                                    queryParameters: {
                                      'recordKey': serializeParam(
                                        widget.recordKey,
                                        ParamType.String,
                                      ),
                                      'type': serializeParam(
                                        '0',
                                        ParamType.String,
                                      ),
                                      'denominatorId': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                      'resourceItemType': serializeParam(
                                        '5',
                                        ParamType.String,
                                      ),
                                      'quantity': serializeParam(
                                        widget.quantity,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  if (_model.nextTabName == 'userTypeId') {
                                    context.pushNamed(
                                      AnonymousLoginGuestUIWidget.routeName,
                                      queryParameters: {
                                        'params': serializeParam(
                                          functions.mapParams(
                                              RentalShoppingCartGroup
                                                  .rMCustomPageNextCall
                                                  .act(
                                                    (_model.nextResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .firstOrNull!),
                                          ParamType.DataStruct,
                                          isList: true,
                                        ),
                                        'recordKey': serializeParam(
                                          widget.recordKey,
                                          ParamType.String,
                                        ),
                                        'type': serializeParam(
                                          '0',
                                          ParamType.String,
                                        ),
                                        'denominatorId': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                        'resourceItemType': serializeParam(
                                          '5',
                                          ParamType.String,
                                        ),
                                        'quantity': serializeParam(
                                          widget.quantity,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.pushNamed(
                                      EventInfoForShoppingCartWidget.routeName,
                                      queryParameters: {
                                        'recordKey': serializeParam(
                                          widget.recordKey,
                                          ParamType.String,
                                        ),
                                        'type': serializeParam(
                                          '0',
                                          ParamType.String,
                                        ),
                                        'denominatorId': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                        'resourceItemType': serializeParam(
                                          '5',
                                          ParamType.String,
                                        ),
                                        'quantitys': serializeParam(
                                          widget.quantity,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                }
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    RentalShoppingCartGroup.rMCustomPageNextCall
                                        .errorToastMessage(
                                      (_model.nextResponse?.jsonBody ?? ''),
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
                            }
                          }

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'bqpxvm7m' /* Next */,
                        ),
                        options: FFButtonOptions(
                          height: MediaQuery.sizeOf(context).height * 0.045,
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
                    ],
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
