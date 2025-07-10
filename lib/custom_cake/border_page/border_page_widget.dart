import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'border_page_model.dart';
export 'border_page_model.dart';

class BorderPageWidget extends StatefulWidget {
  const BorderPageWidget({
    super.key,
    this.parentRecordKey,
    this.recordKey,
    this.index,
  });

  final String? parentRecordKey;
  final String? recordKey;
  final String? index;

  static String routeName = 'borderPage';
  static String routePath = 'borderPage';

  @override
  State<BorderPageWidget> createState() => _BorderPageWidgetState();
}

class _BorderPageWidgetState extends State<BorderPageWidget> {
  late BorderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BorderPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.cakeFlavourResponse = await CustomCakeTwoGroup.cakeBorderCall.call(
        aclientState:
            '{\"clientId\":\"customCakeForMenuSectionToCart__customCakeCartWizardTabPanel\",\"index\":10,\"staticTabs\":[{\"tabName\":\"cakeFlavours\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeFillings\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeIcingsTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeShapesTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeDecorTypeTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeColorTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeLayersTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"${widget.index}\"}]}',
        recordKey: widget.recordKey,
        parentRecordKey: widget.parentRecordKey,
        index: widget.index,
        token: FFAppState().SessionToken,
      );

      if ((_model.cakeFlavourResponse?.succeeded ?? true)) {
        _model.ocKey = CustomCakeTwoGroup.cakeBorderCall.id(
          (_model.cakeFlavourResponse?.jsonBody ?? ''),
        );
        _model.selectionPrice =
            CustomCakeTwoGroup.cakeBorderCall.priceOfMenuSectionOption(
          (_model.cakeFlavourResponse?.jsonBody ?? ''),
        );
        _model.totalPrice = CustomCakeTwoGroup.cakeBorderCall.totalPrice(
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
          await CustomCakeTwoGroup.borderListPickerCall.call(
        uiContext:
            '{\"key\":\"cakeBorderTypeTab\",\"clientId\":\"customCakeForMenuSectionToCart__customCakeCartWizardTabPanel\",\"index\":10,\"staticTabs\":[{\"tabName\":\"cakeFlavours\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeFillings\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeIcingsTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeShapesTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeDecorTypeTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeColorTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeLayersTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"}]}',
        recordKey: widget.parentRecordKey,
        parentRecordKey: widget.recordKey,
        token: FFAppState().SessionToken,
      );

      if ((_model.flavourOptionsResponse?.succeeded ?? true)) {
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
                'l0yhl8y8' /* Border */,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.apiLoaded)
                            Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '9v6kx3kl' /* Choose  any 1 */,
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
                                                  !FlutterFlowTheme.of(context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
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
                                                  'mf1ud8dr' /* Selection Price */,
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
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                '\$ ${_model.selectionPrice}',
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (_model.selectionPrice != '0')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 10.0),
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
                                                  '185hk1o0' /* Total Price */,
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
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                '\$ ${_model.selectionPrice}',
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 15.0),
                                          child:
                                              custom_widgets.CustomChoiceChips(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.1,
                                            initialValue: CustomCakeTwoGroup
                                                .cakeBorderCall
                                                .borderTypes(
                                              (_model.cakeFlavourResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            options: CustomCakeTwoGroup
                                                .borderListPickerCall
                                                .id(
                                              (_model.flavourOptionsResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            )!,
                                            labels: CustomCakeTwoGroup
                                                .borderListPickerCall
                                                .text(
                                              (_model.flavourOptionsResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            )!,
                                            onTapAction: () async {
                                              _model.layerChangedResponse =
                                                  await CustomCakeTwoGroup
                                                      .borderChangedCall
                                                      .call(
                                                clientState:
                                                    '{\"clientId\":\"contains_cakeBorderTypeTab__cakeBorderTypeTab__cakeBorderUIForm\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                id: _model.ocKey,
                                                token:
                                                    FFAppState().SessionToken,
                                                borderTypes: FFAppState()
                                                            .customChoiceChipSelection !=
                                                        'null'
                                                    ? FFAppState()
                                                        .customChoiceChipSelection
                                                    : '-1',
                                              );

                                              if ((_model.layerChangedResponse
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.selectionPrice =
                                                    CustomCakeTwoGroup
                                                        .borderChangedCall
                                                        .priceOfMenuSectionOption(
                                                  (_model.layerChangedResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                );
                                                _model.totalPrice =
                                                    CustomCakeTwoGroup
                                                        .borderChangedCall
                                                        .totalPrice(
                                                  (_model.layerChangedResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                                  await CustomCakeTwoGroup.borderNextCall.call(
                                borderTypes:
                                    FFAppState().customChoiceChipSelection !=
                                            'null'
                                        ? FFAppState().customChoiceChipSelection
                                        : '-1',
                                recordKey: widget.recordKey,
                                index: widget.index,
                                id: _model.ocKey,
                                token: FFAppState().SessionToken,
                                clientState:
                                    '{\"clientId\":\"contains_cakeBorderTypeTab__cakeBorderTypeTab__cakeBorderUIForm\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"${widget.parentRecordKey}\",\"index\":\"${widget.index}\",\"__cachedId\":\"${_model.ocKey}\"}}',
                              );

                              if ((_model.nextResponse?.succeeded ?? true)) {
                                _model.nextParams = functions
                                    .mapParams(CustomCakeTwoGroup.borderNextCall
                                        .act(
                                          (_model.nextResponse?.jsonBody ?? ''),
                                        )!
                                        .firstOrNull!)
                                    .toList()
                                    .cast<NameIdSearchableStruct>();
                                await Future.wait([
                                  Future(() async {
                                    if (_model.nextParams
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'priceTab') {
                                      FFAppState().customChoiceChipSelection =
                                          '-1';

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
                                    if (_model.nextParams
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeFlavours') {
                                      FFAppState().customChoiceChipSelection =
                                          '-1';

                                      context.pushNamed(
                                        FlavoursPageWidget.routeName,
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
                                    if (_model.nextParams
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeFillings') {
                                      FFAppState().customChoiceChipSelection =
                                          '-1';

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
                                    if (_model.nextParams
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeIcingsTab') {
                                      FFAppState().customChoiceChipSelection =
                                          '-1';

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
                                    if (_model.nextParams
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeShapesTab ') {
                                      FFAppState().customChoiceChipSelection =
                                          '-1';

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
                                    if (_model.nextParams
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeDecorTypeTab') {
                                      FFAppState().customChoiceChipSelection =
                                          '-1';

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
                                    if (_model.nextParams
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeColorTab') {
                                      FFAppState().customChoiceChipSelection =
                                          '-1';

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
                                    if (_model.nextParams
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeLayersTab') {
                                      FFAppState().customChoiceChipSelection =
                                          '-1';

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
                                ]);
                              }

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'n848iif1' /* Next */,
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
