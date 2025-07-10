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
import 'shapes_page_model.dart';
export 'shapes_page_model.dart';

class ShapesPageWidget extends StatefulWidget {
  const ShapesPageWidget({
    super.key,
    this.parentRecordKey,
    this.recordKey,
    this.index,
  });

  final String? parentRecordKey;
  final String? recordKey;
  final String? index;

  static String routeName = 'shapesPage';
  static String routePath = 'shapesPage';

  @override
  State<ShapesPageWidget> createState() => _ShapesPageWidgetState();
}

class _ShapesPageWidgetState extends State<ShapesPageWidget> {
  late ShapesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShapesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.cakeFlavourResponse =
          await CustomCakeTwoGroup.cakeShapeCursorCall.call(
        clientState:
            '{\"clientId\":\"customCakeForMenuSectionToCart__customCakeCartWizardTabPanel\",\"index\":6,\"staticTabs\":[{\"tabName\":\"cakeFlavours\",\"recordKey\":\"2610\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeFillings\",\"recordKey\":\"2610\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeIcingsTab\",\"recordKey\":\"2610\",\"parentRecordKey\":\"-1\",\"index\":\"${widget.index}\"}]}',
        recordKey: widget.recordKey,
        parentRecordKey: widget.parentRecordKey,
        index: widget.index,
        token: FFAppState().SessionToken,
      );

      if ((_model.cakeFlavourResponse?.succeeded ?? true)) {
        _model.ocKey = CustomCakeTwoGroup.cakeShapeCursorCall.id(
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
          await CustomCakeTwoGroup.shapeListpickerCall.call(
        uiContext:
            '{\"key\":\"cakeShapesTab\",\"clientId\":\"customCakeForMenuSectionToCart__customCakeCartWizardTabPanel\",\"index\":6,\"staticTabs\":[{\"tabName\":\"cakeFlavours\",\"recordKey\":\"2610\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeFillings\",\"recordKey\":\"2610\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeIcingsTab\",\"recordKey\":\"2610\",\"parentRecordKey\":\"-1\",\"index\":\"${widget.index}\"}]}',
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
                'ez0ggdl1' /* Shapes */,
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
                                          '76o32uxa' /* Choose  any 1 */,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 6.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 15.0),
                                            child: custom_widgets
                                                .CustomChoiceChips(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.1,
                                              initialValue: CustomCakeTwoGroup
                                                  .cakeShapeCursorCall
                                                  .shapes(
                                                (_model.cakeFlavourResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              options: CustomCakeTwoGroup
                                                  .shapeListpickerCall
                                                  .id(
                                                (_model.flavourOptionsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              labels: CustomCakeTwoGroup
                                                  .shapeListpickerCall
                                                  .text(
                                                (_model.flavourOptionsResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              onTapAction: () async {},
                                            ),
                                          ),
                                        ],
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
                                  await CustomCakeTwoGroup.shapesNextCall.call(
                                recordKey: widget.parentRecordKey,
                                parentRecordKey: widget.recordKey,
                                index: widget.index,
                                token: FFAppState().SessionToken,
                                id: _model.ocKey,
                                clientState:
                                    '{\"clientId\":\"contains_cakeShapesTab__cakeShapesTab__cakeShapesUIForm\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"${widget.parentRecordKey}\",\"index\":\"${widget.index}\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                shapes:
                                    FFAppState().customChoiceChipSelection !=
                                            'null'
                                        ? FFAppState().customChoiceChipSelection
                                        : '-1',
                              );

                              if ((_model.nextResponse?.succeeded ?? true)) {
                                _model.nextParams = functions
                                    .mapParams(CustomCakeTwoGroup.shapesNextCall
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
                                  Future(() async {
                                    if (_model.nextParams
                                            .where((e) => e.id == 'tabName')
                                            .toList()
                                            .firstOrNull
                                            ?.name ==
                                        'cakeBorderTypeTab') {
                                      FFAppState().customChoiceChipSelection =
                                          '-1';

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
                              '9c97dxj8' /* Next */,
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
