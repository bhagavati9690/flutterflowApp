import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'custom_cake_d_n_t_model.dart';
export 'custom_cake_d_n_t_model.dart';

/// customCakeDateNTimeTab
class CustomCakeDNTWidget extends StatefulWidget {
  const CustomCakeDNTWidget({
    super.key,
    this.bakeryId,
    String? menuSectionId,
    this.index,
  }) : this.menuSectionId = menuSectionId ?? '-1';

  final String? bakeryId;
  final String menuSectionId;
  final String? index;

  static String routeName = 'customCakeDNT';
  static String routePath = 'customCakeDNT';

  @override
  State<CustomCakeDNTWidget> createState() => _CustomCakeDNTWidgetState();
}

class _CustomCakeDNTWidgetState extends State<CustomCakeDNTWidget> {
  late CustomCakeDNTModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomCakeDNTModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.onDate = getCurrentTimestamp;
      _model.menuSectionCursorResponse =
          await CustomCakeGroup.menuSectionAndVariationCusorCall.call(
        parentRecordKey: widget.menuSectionId,
        bakeryId: widget.bakeryId,
        index: widget.index,
        token: FFAppState().SessionToken,
      );

      if ((_model.menuSectionCursorResponse?.succeeded ?? true)) {
        _model.ocKey = CustomCakeGroup.menuSectionAndVariationCusorCall.id(
          (_model.menuSectionCursorResponse?.jsonBody ?? ''),
        );
        _model.variationPresent =
            CustomCakeGroup.menuSectionAndVariationCusorCall.denomPresent(
                      (_model.menuSectionCursorResponse?.jsonBody ?? ''),
                    ) ==
                    'true'
                ? true
                : false;
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

      _model.menuSectionListpickerResponse =
          await CustomCakeGroup.menuSectionsListPickerCursorCall.call(
        token: FFAppState().SessionToken,
        uiContext:
            '{\"key\":\"cakeCustomItemDateAndTimeShoppingCartUI\",\"params\":{\"format\":[\"js\"],\"bakeryId\":[\"380\"],\"from\":[\"cake\"],\"recordKey\":[\"-1\"],\"type\":[\"cakeCustomMadeItem\"],\"index\":[\"1\"]},\"component\":{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm\",\"clientState\":{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm\",\"cursor\":{\"380\":\"380\",\"bakeryId\":\"380\",\"parentRecordKey\":\"-1\",\"index\":\"1\",\"__cachedId\":\"${_model.ocKey}\"}}}}',
      );

      _model.dateandTimeResponse =
          await CustomCakeGroup.customDateNtimeTabCursorCall.call(
        parentRecordKey: widget.bakeryId,
        recordKey: widget.menuSectionId,
        index: '1',
        token: FFAppState().SessionToken,
      );

      if ((_model.dateandTimeResponse?.succeeded ?? true)) {
        _model.ocForDate = CustomCakeGroup.customDateNtimeTabCursorCall.id(
          (_model.dateandTimeResponse?.jsonBody ?? ''),
        );
        _model.totalPrice =
            CustomCakeGroup.customDateNtimeTabCursorCall.totalPriceDisplay(
          (_model.dateandTimeResponse?.jsonBody ?? ''),
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

      _model.apiLoaded = true;
      safeSetState(() {});
      if (CustomCakeGroup.menuSectionAndVariationCusorCall.bakeryMenuSectionId(
                (_model.menuSectionCursorResponse?.jsonBody ?? ''),
              ) !=
              null &&
          CustomCakeGroup.menuSectionAndVariationCusorCall.bakeryMenuSectionId(
                (_model.menuSectionCursorResponse?.jsonBody ?? ''),
              ) !=
              '') {
        _model.menuSectionChangedonPageLoad =
            await CustomCakeGroup.menuSectionChangedCall.call(
          token: FFAppState().SessionToken,
          id: _model.ocForDate,
          clientState:
              '{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"380\",\"index\":\"1\",\"__cachedId\":\"${_model.ocForDate}\"}}',
          recordKey: '-1',
          parentRecordKey: CustomCakeGroup.menuSectionAndVariationCusorCall
              .bakeryMenuSectionId(
            (_model.menuSectionCursorResponse?.jsonBody ?? ''),
          ),
          onDate: functions.dateToString(getCurrentTimestamp),
        );

        _model.variationLispickerResponse =
            await CustomCakeGroup.customCakeDNTVariationListpickerCall.call(
          uiContext:
              '{\"key\":\"cakeCustomItemDateAndTimeShoppingCartUI\",\"params\":{\"format\":[\"js\"],\"bakeryId\":[\"${widget.bakeryId}\"],\"from\":[\"cake\"],\"recordKey\":[\"-1\"],\"type\":[\"cakeCustomMadeItem\"],\"index\":[\"${widget.index}\"]},\"component\":{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm\",\"clientState\":{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm\",\"cursor\":{\"bakeryId\":\"${widget.bakeryId}\",\"parentRecordKey\":\"-1\",\"index\":\"${widget.index}\",\"__cachedId\":\"${_model.ocKey}\"}}}}',
        );
      }
    });

    _model.switchValue = false;
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
                '93nvdkub' /* Custom Cake */,
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
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.apiLoaded)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
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
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'yp28hk4g' /* Menu Section Selection */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                        ],
                                      ),
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      custom_widgets.CustomChoiceChips(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.1,
                                        initialValue: CustomCakeGroup
                                            .menuSectionAndVariationCusorCall
                                            .bakeryMenuSectionId(
                                          (_model.menuSectionCursorResponse
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        options: CustomCakeGroup
                                            .menuSectionsListPickerCursorCall
                                            .id(
                                          (_model.menuSectionListpickerResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )!,
                                        labels: CustomCakeGroup
                                            .menuSectionsListPickerCursorCall
                                            .text(
                                          (_model.menuSectionListpickerResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )!,
                                        onTapAction: () async {
                                          _model.menuSectionSetResponse =
                                              await CustomCakeGroup
                                                  .menuSectionChangedToSetInSessionCopyCall
                                                  .call(
                                            clientState:
                                                '{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm\",\"cursor\":{\"bakeryId\":\"${widget.bakeryId}\",\"parentRecordKey\":\"-1\",\"index\":\"${widget.index}\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                            token: FFAppState().SessionToken,
                                            bakeryMenuSectionId: FFAppState()
                                                .customChoiceChipSelection,
                                            id: _model.ocKey,
                                          );

                                          _model.menuSectionChanged =
                                              await CustomCakeGroup
                                                  .menuSectionChangedCall
                                                  .call(
                                            token: FFAppState().SessionToken,
                                            id: _model.ocForDate,
                                            clientState:
                                                '{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem\",\"cursor\":{\"recordKey\":\"${FFAppState().customChoiceChipSelection}\",\"parentRecordKey\":\"${widget.bakeryId}\",\"index\":\"${widget.index}\",\"__cachedId\":\"${_model.ocForDate}\"}}',
                                            recordKey: '-1',
                                            parentRecordKey: FFAppState()
                                                .customChoiceChipSelection,
                                            onDate: functions.dateToString(
                                                getCurrentTimestamp),
                                          );

                                          if ((_model.menuSectionChanged
                                                  ?.succeeded ??
                                              true)) {
                                            if (_model.variationPresent) {
                                              _model.newVariationListResponse =
                                                  await CustomCakeGroup
                                                      .customCakeDNTVariationListpickerCall
                                                      .call(
                                                uiContext:
                                                    '{\"key\":\"cakeCustomItemDateAndTimeShoppingCartUI\",\"params\":{\"format\":[\"js\"],\"bakeryId\":[\"${widget.bakeryId}\"],\"from\":[\"cake\"],\"recordKey\":[\"-1\"],\"type\":[\"cakeCustomMadeItem\"],\"index\":[\"${widget.index}\"]},\"component\":{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm\",\"clientState\":{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm\",\"cursor\":{\"bakeryId\":\"${widget.bakeryId}\",\"parentRecordKey\":\"-1\",\"index\":\"${widget.index}\",\"__cachedId\":\"${_model.ocKey}\"}}}}',
                                              );

                                              if ((_model
                                                      .newVariationListResponse
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.variationLP = functions
                                                    .mapEnums((_model
                                                            .newVariationListResponse
                                                            ?.jsonBody ??
                                                        ''))
                                                    .toList()
                                                    .cast<
                                                        NameIdSearchableStruct>();
                                                safeSetState(() {});
                                              }
                                            }
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (_model.apiLoaded &&
                              _model.variationPresent &&
                              (FFAppState().customChoiceChipSelection != '-1'))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
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
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ymrgvlic' /* Variety */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                        ],
                                      ),
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        custom_widgets.CustomChoiceChips(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.1,
                                          initialValue: CustomCakeGroup
                                              .menuSectionAndVariationCusorCall
                                              .bakeryMenuSectionId(
                                            (_model.menuSectionCursorResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          options: CustomCakeGroup
                                              .menuSectionsListPickerCursorCall
                                              .id(
                                            (_model.menuSectionListpickerResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!,
                                          labels: CustomCakeGroup
                                              .menuSectionsListPickerCursorCall
                                              .text(
                                            (_model.menuSectionListpickerResponse
                                                    ?.jsonBody ??
                                                ''),
                                          )!,
                                          onTapAction: () async {
                                            _model.asssasd =
                                                await CustomCakeGroup
                                                    .menuSectionChangedCall
                                                    .call(
                                              token: FFAppState().SessionToken,
                                              id: _model.ocForDate,
                                              clientState:
                                                  '{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"380\",\"index\":\"1\",\"__cachedId\":\"${_model.ocForDate}\"}}',
                                              recordKey: '-1',
                                              parentRecordKey: FFAppState()
                                                  .customChoiceChipSelection,
                                              onDate: functions.dateToString(
                                                  getCurrentTimestamp),
                                            );

                                            if ((_model.asssasd?.succeeded ??
                                                true)) {
                                              _model.totalPrice = '';
                                            }

                                            safeSetState(() {});
                                          },
                                        ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.1,
                                        child:
                                            custom_widgets.CustomChoiceChipsTwo(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.1,
                                          options: _model.variationLP
                                              .map((e) => e.id)
                                              .toList(),
                                          labels: _model.variationLP
                                              .map((e) => e.name)
                                              .toList(),
                                          onTapAction: () async {
                                            _model.variationChangedResponse =
                                                await CustomCakeGroup
                                                    .menuSectionDenomChangedToSetInSessionCall
                                                    .call(
                                              clientState:
                                                  '{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm\",\"cursor\":{\"bakeryId\":\"${widget.bakeryId}\",\"parentRecordKey\":\"-1\",\"index\":\"${widget.index}\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                              selectedDenomId: FFAppState()
                                                  .customChoiceChipSelection2,
                                              id: _model.ocKey,
                                            );

                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (_model.apiLoaded)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 48.0),
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
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'uyf34wp8' /* Date Time Selection */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                        ],
                                      ),
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.7,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.47,
                                        child: custom_widgets.ItemDate(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.7,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.47,
                                          disabledDays: _model.disabledDays,
                                          preselectedDate: _model.onDate!,
                                          onTapActionDate: () async {
                                            _model.dateChangedResponse =
                                                await CustomCakeGroup
                                                    .dateChangedCall
                                                    .call(
                                              clientState:
                                                  '{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem\",\"cursor\":{\"recordKey\":\"2610\",\"parentRecordKey\":\"380\",\"index\":\"0\",\"__cachedId\":\"${_model.ocForDate}\"}}',
                                              id: _model.ocForDate,
                                              token: FFAppState().SessionToken,
                                              onDate: functions.dateToString(
                                                  FFAppState().ItemDate),
                                            );

                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ttoikc0b' /* Start time */,
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
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'oajwqcki' /* AM */,
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
                                                Switch.adaptive(
                                                  value: _model.switchValue!,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.switchValue =
                                                            newValue);
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  activeTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  inactiveTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'f8vcdgze' /* PM */,
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: CustomCakeGroup
                                            .startTimeCursorCall
                                            .call(
                                          token: FFAppState().SessionToken,
                                          uiContext:
                                              '{\"key\":\"cakeCustomItemDateAndTimeShoppingCartUI\",\"params\":{\"format\":[\"js\"],\"bakeryId\":[\"380\"],\"from\":[\"cake\"],\"recordKey\":[\"-1\"],\"type\":[\"cakeCustomMadeItem\"],\"index\":[\"1\"]},\"component\":{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem\",\"clientState\":{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"380\",\"index\":\"1\",\"__cachedId\":\"${_model.ocForDate}\"}}}}',
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final columnStartTimeCursorResponse =
                                              snapshot.data!;

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: FlutterFlowChoiceChips(
                                                  options: (_model.switchValue!
                                                          ? functions.getPMFormList(
                                                              CustomCakeGroup
                                                                  .startTimeCursorCall
                                                                  .text(
                                                                    columnStartTimeCursorResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.toList())!
                                                          : functions.getAMFromList(
                                                              CustomCakeGroup
                                                                  .startTimeCursorCall
                                                                  .text(
                                                                    columnStartTimeCursorResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.toList())!)
                                                      .map((label) =>
                                                          ChipData(label))
                                                      .toList(),
                                                  onChanged: (val) async {
                                                    safeSetState(() => _model
                                                            .choiceChipsValue =
                                                        val?.firstOrNull);
                                                    _model.startTimeChanged =
                                                        await CustomCakeGroup
                                                            .startTimeChangeCall
                                                            .call(
                                                      clientState:
                                                          '{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem\",\"cursor\":{\"recordKey\":\"-1\",\"parentRecordKey\":\"380\",\"index\":\"1\",\"__cachedId\":\"${_model.ocForDate}\"}}',
                                                      id: _model.ocForDate,
                                                      token: FFAppState()
                                                          .SessionToken,
                                                      startTime: functions
                                                          .convertTimeIntoSecondInString(
                                                              functions
                                                                  .getTimeFromStringWithAMPM(
                                                                      _model
                                                                          .choiceChipsValue)),
                                                    );

                                                    safeSetState(() {});
                                                  },
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    iconSize: 16.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    iconSize: 16.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  chipSpacing: 8.0,
                                                  rowSpacing: 8.0,
                                                  multiselect: false,
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
                                            ],
                                          );
                                        },
                                      ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                      ))
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '817dc66z' /* Total Price */,
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
                                            Text(
                                              '\$ ${_model.totalPrice}',
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
                                          ],
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
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Text(
                                      functions.removePriceLabel(
                                          valueOrDefault<String>(
                                            _model.totalPrice,
                                            'Get a Quote',
                                          ),
                                          true),
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
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.nextResponse =
                                          await CustomCakeGroup
                                              .customCakeNextCall
                                              .call(
                                        clientState:
                                            '{\"clientId\":\"cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem\",\"cursor\":{\"recordKey\":\"${FFAppState().customChoiceChipSelection}\",\"parentRecordKey\":\"${widget.bakeryId}\",\"index\":\"${widget.index}\",\"__cachedId\":\"${_model.ocForDate}\"}}',
                                        id: _model.ocForDate,
                                        onDate: functions.dateToString(
                                            FFAppState().ItemDate),
                                        startTime: functions
                                            .convertTimeIntoSecondInString(
                                                functions
                                                    .getTimeFromStringWithAMPM(
                                                        _model
                                                            .choiceChipsValue)),
                                        token: FFAppState().SessionToken,
                                        index: widget.index,
                                      );

                                      if (CustomCakeGroup.customCakeNextCall
                                              .actionSuccess(
                                            (_model.nextResponse?.jsonBody ??
                                                ''),
                                          ) ==
                                          true) {
                                        FFAppState().cartCount = functions
                                            .intToString(CustomCakeGroup
                                                .customCakeNextCall
                                                .cartCount(
                                          (_model.nextResponse?.jsonBody ?? ''),
                                        ));
                                        _model.nextParams = functions
                                            .mapParams(CustomCakeGroup
                                                .customCakeNextCall
                                                .act(
                                                  (_model.nextResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .firstOrNull!)
                                            .toList()
                                            .cast<NameIdSearchableStruct>();
                                        await Future.wait([
                                          Future(() async {
                                            if (_model.nextParams
                                                    .where((e) =>
                                                        e.id == 'tabName')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name ==
                                                'cakeFlavours') {
                                              context.pushNamed(
                                                FlavoursPageWidget.routeName,
                                                queryParameters: {
                                                  'parentRecordKey':
                                                      serializeParam(
                                                    FFAppState()
                                                        .customChoiceChipSelection,
                                                    ParamType.String,
                                                  ),
                                                  'recordKey': serializeParam(
                                                    '-1',
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
                                                    .where((e) =>
                                                        e.id == 'tabName')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name ==
                                                'priceTab') {
                                              context.pushNamed(
                                                CustomCakeDeliveryTabWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'recordKey': serializeParam(
                                                    '-1',
                                                    ParamType.String,
                                                  ),
                                                  'parentRecordKey':
                                                      serializeParam(
                                                    FFAppState()
                                                        .customChoiceChipSelection,
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
                                                    .where((e) =>
                                                        e.id == 'tabName')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name ==
                                                'cakeFillings') {
                                              context.pushNamed(
                                                FillingsPageWidget.routeName,
                                                queryParameters: {
                                                  'parentRecordKey':
                                                      serializeParam(
                                                    FFAppState()
                                                        .customChoiceChipSelection,
                                                    ParamType.String,
                                                  ),
                                                  'recordKey': serializeParam(
                                                    '-1',
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
                                                    .where((e) =>
                                                        e.id == 'tabName')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name ==
                                                'cakeIcingsTab') {
                                              context.pushNamed(
                                                IcingPageWidget.routeName,
                                                queryParameters: {
                                                  'parentRecordKey':
                                                      serializeParam(
                                                    FFAppState()
                                                        .customChoiceChipSelection,
                                                    ParamType.String,
                                                  ),
                                                  'recordKey': serializeParam(
                                                    '-1',
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
                                                    .where((e) =>
                                                        e.id == 'tabName')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name ==
                                                'cakeIcingsTab') {
                                              context.pushNamed(
                                                ShapesPageWidget.routeName,
                                                queryParameters: {
                                                  'parentRecordKey':
                                                      serializeParam(
                                                    FFAppState()
                                                        .customChoiceChipSelection,
                                                    ParamType.String,
                                                  ),
                                                  'recordKey': serializeParam(
                                                    '-1',
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
                                                    .where((e) =>
                                                        e.id == 'tabName')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name ==
                                                'cakeDecorTypeTab') {
                                              context.pushNamed(
                                                DecorPageWidget.routeName,
                                                queryParameters: {
                                                  'parentRecordKey':
                                                      serializeParam(
                                                    FFAppState()
                                                        .customChoiceChipSelection,
                                                    ParamType.String,
                                                  ),
                                                  'recordKey': serializeParam(
                                                    '-1',
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
                                                    .where((e) =>
                                                        e.id == 'tabName')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name ==
                                                'cakeColorTab') {
                                              context.pushNamed(
                                                ColorPageWidget.routeName,
                                                queryParameters: {
                                                  'parentRecordKey':
                                                      serializeParam(
                                                    FFAppState()
                                                        .customChoiceChipSelection,
                                                    ParamType.String,
                                                  ),
                                                  'recordKey': serializeParam(
                                                    '-1',
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
                                                    .where((e) =>
                                                        e.id == 'tabName')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name ==
                                                'cakeLayersTab') {
                                              context.pushNamed(
                                                LayerPageWidget.routeName,
                                                queryParameters: {
                                                  'parentRecordKey':
                                                      serializeParam(
                                                    FFAppState()
                                                        .customChoiceChipSelection,
                                                    ParamType.String,
                                                  ),
                                                  'recordKey': serializeParam(
                                                    '-1',
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
                                                    .where((e) =>
                                                        e.id == 'tabName')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name ==
                                                'cakeBorderTypeTab') {
                                              context.pushNamed(
                                                BorderPageWidget.routeName,
                                                queryParameters: {
                                                  'parentRecordKey':
                                                      serializeParam(
                                                    FFAppState()
                                                        .customChoiceChipSelection,
                                                    ParamType.String,
                                                  ),
                                                  'recordKey': serializeParam(
                                                    '-1',
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
                                        FFAppState().customChoiceChipSelection =
                                            '-1';
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              CustomCakeGroup.customCakeNextCall
                                                  .toastMsg(
                                                (_model.nextResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                      '6bzv1w0e' /* Next */,
                                    ),
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.55,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      borderRadius: BorderRadius.circular(12.0),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
