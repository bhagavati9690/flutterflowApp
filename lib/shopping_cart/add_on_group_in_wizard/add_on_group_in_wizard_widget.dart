import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
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
import 'add_on_group_in_wizard_model.dart';
export 'add_on_group_in_wizard_model.dart';

class AddOnGroupInWizardWidget extends StatefulWidget {
  const AddOnGroupInWizardWidget({
    super.key,
    this.currentGroupId,
    String? recordKey,
    String? type,
  })  : this.recordKey = recordKey ?? '-1',
        this.type = type ?? '-1';

  final String? currentGroupId;

  /// not present for venue
  final String recordKey;

  final String type;

  static String routeName = 'AddOnGroupInWizard';
  static String routePath = 'addOnGroupInWizard';

  @override
  State<AddOnGroupInWizardWidget> createState() =>
      _AddOnGroupInWizardWidgetState();
}

class _AddOnGroupInWizardWidgetState extends State<AddOnGroupInWizardWidget> {
  late AddOnGroupInWizardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddOnGroupInWizardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.gridCursorResponse = await AddonGroupGroup.addOnGroupGridCall.call(
        token: FFAppState().SessionToken,
        currentAddonGroupId: widget.currentGroupId,
      );

      if ((_model.gridCursorResponse?.succeeded ?? true)) {
        _model.ocKey = AddonGroupGroup.addOnGroupGridCall.id(
          (_model.gridCursorResponse?.jsonBody ?? ''),
        );
        _model.checkboxresponse =
            await AddonGroupGroup.addOnGroupCheckboxCursorCall.call(
          token: FFAppState().SessionToken,
          currentAddonGroupId: widget.currentGroupId,
          uiContext:
              '{\"key\":\"venueAddOnsGroupCartUI\",\"clientId\":\"contains_venueAddOnsGroupCartUI__venueAddOnsGroupCartUI__venuePackageGroupAddonForm\",\"cursor\":{\"parentRecordKey\":\"${widget.currentGroupId}\",\"__cachedId\":\"${_model.ocKey}\"}}',
        );

        _model.radioCursorResponse =
            await AddonGroupGroup.radioButtonCursorCall.call(
          token: FFAppState().SessionToken,
          currentAddonGroupId: widget.currentGroupId,
          uiContext:
              '{\"key\":\"venueAddOnsGroupCartUI\",\"clientId\":\"contains_venueAddOnsGroupCartUI__venueAddOnsGroupCartUI__venuePackageGroupAddonForm\",\"cursor\":{\"parentRecordKey\":\"${widget.currentGroupId}\",\"__cachedId\":\"${_model.ocKey}\"}}',
        );

        _model.apiLoaded = true;
        _model.enableRadioButton =
            AddonGroupGroup.addOnGroupGridCall.maxNumInclItem(
                  (_model.gridCursorResponse?.jsonBody ?? ''),
                ) ==
                1;
        _model.totalPrice =
            AddonGroupGroup.addOnGroupGridCall.totalPriceDisplay(
          (_model.gridCursorResponse?.jsonBody ?? ''),
        )!;
        safeSetState(() {});
        FFAppState().customChoiceChipSelection = '-1';
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
                size: 24.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'g84oftk3' /* Addons Group */,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 24.0),
                      child: Wrap(
                        spacing: 16.0,
                        runSpacing: 16.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          if (_model.apiLoaded && !_model.enableRadioButton)
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 750.0,
                              ),
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${valueOrDefault<String>(
                                          AddonGroupGroup.addOnGroupGridCall
                                              .groupName(
                                            (_model.gridCursorResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          'Group Name',
                                        )}   (Choose any ${valueOrDefault<String>(
                                          AddonGroupGroup.addOnGroupGridCall
                                              .maxNumInclItem(
                                                (_model.gridCursorResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              ?.toString(),
                                          'count',
                                        )})',
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
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  '${_model.totalPrice}',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: FlutterFlowCheckboxGroup(
                                          options: AddonGroupGroup
                                              .addOnGroupCheckboxCursorCall
                                              .text(
                                                (_model.checkboxresponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList(),
                                          onChanged: (val) => safeSetState(() =>
                                              _model.checkboxGroupValues = val),
                                          controller: _model
                                                  .checkboxGroupValueController ??=
                                              FormFieldController<List<String>>(
                                            List.from(
                                                functions.initialCheckBoxes(
                                                        (_model.checkboxresponse
                                                                ?.jsonBody ??
                                                            ''),
                                                        AddonGroupGroup
                                                            .addOnGroupGridCall
                                                            .addonId(
                                                              (_model.gridCursorResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .toList()) ??
                                                    []),
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          checkboxBorderRadius:
                                              BorderRadius.circular(4.0),
                                          initialized:
                                              _model.checkboxGroupValues !=
                                                  null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (_model.apiLoaded && _model.enableRadioButton)
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 750.0,
                              ),
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
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${valueOrDefault<String>(
                                          AddonGroupGroup.addOnGroupGridCall
                                              .groupName(
                                            (_model.gridCursorResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          'Group Name',
                                        )}   (Choose any ${valueOrDefault<String>(
                                          AddonGroupGroup.addOnGroupGridCall
                                              .maxNumInclItem(
                                                (_model.gridCursorResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              ?.toString(),
                                          'count',
                                        )})',
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
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${_model.totalPrice}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleLarge
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF14181B),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              custom_widgets.CustomChoiceChips(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.1,
                                                initialValue: AddonGroupGroup
                                                    .addOnGroupGridCall
                                                    .checkBoxAddonId(
                                                  (_model.gridCursorResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                options: AddonGroupGroup
                                                    .radioButtonCursorCall
                                                    .id(
                                                  (_model.radioCursorResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                labels: AddonGroupGroup
                                                    .radioButtonCursorCall
                                                    .text(
                                                  (_model.radioCursorResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                onTapAction: () async {
                                                  _model.radioChangedResponse =
                                                      await AddonGroupGroup
                                                          .radioButtonChangedCall
                                                          .call(
                                                    radioButtonId: FFAppState()
                                                        .customChoiceChipSelection,
                                                    id: _model.ocKey,
                                                    clientState:
                                                        '{\"clientId\":\"contains_venueAddOnsGroupCartUI__venueAddOnsGroupCartUI__venuePackageGroupAddonForm\",\"cursor\":{\"parentRecordKey\":\"${widget.currentGroupId}\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                  );

                                                  if ((_model
                                                          .radioChangedResponse
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.totalPrice =
                                                        AddonGroupGroup
                                                            .radioButtonChangedCall
                                                            .totalPrice(
                                                      (_model.radioChangedResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                  }

                                                  safeSetState(() {});
                                                },
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.nextResponse = await AddonGroupGroup
                                      .addOnGroupNextCall
                                      .call(
                                    token: FFAppState().SessionToken,
                                    id: _model.ocKey,
                                    clientState:
                                        '{\"clientId\":\"contains_venueAddOnsGroupCartUI__venueAddOnsGroupCartUI__venuePackageGroupAddonForm\",\"cursor\":{\"parentRecordKey\":\"${widget.currentGroupId}\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                    addonId: _model.enableRadioButton
                                        ? ''
                                        : functions.stringListToString(
                                            _model.checkboxGroupValues!
                                                .toList(),
                                            (_model.checkboxresponse
                                                    ?.jsonBody ??
                                                '')),
                                    radiobuttonId: _model.enableRadioButton
                                        ? FFAppState().customChoiceChipSelection
                                        : '',
                                    recordKey: widget.currentGroupId,
                                    parentRecordKey: widget.recordKey,
                                    type: widget.type,
                                  );

                                  if (AddonGroupGroup.addOnGroupNextCall
                                      .actionSuccess(
                                    (_model.nextResponse?.jsonBody ?? ''),
                                  )!) {
                                    if (AddonGroupGroup.addOnGroupNextCall
                                            .action(
                                              (_model.nextResponse?.jsonBody ??
                                                  ''),
                                            )
                                            ?.firstOrNull ==
                                        'redirect') {
                                      context.goNamed(
                                          ShoppingCartSummaryCopyWidget
                                              .routeName);
                                    } else {
                                      if (functions
                                              .mapParamsForAddons((_model
                                                      .nextResponse?.jsonBody ??
                                                  ''))
                                              .where((e) => e.id == 'tabName')
                                              .toList()
                                              .firstOrNull
                                              ?.name ==
                                          'addOnsGroupTab') {
                                        context.pushNamed(
                                          AddOnGroupInWizardWidget.routeName,
                                          queryParameters: {
                                            'currentGroupId': serializeParam(
                                              functions
                                                  .mapParamsForAddons((_model
                                                          .nextResponse
                                                          ?.jsonBody ??
                                                      ''))
                                                  .where((e) =>
                                                      e.id ==
                                                      'currentAddonGroupId')
                                                  .toList()
                                                  .firstOrNull
                                                  ?.name,
                                              ParamType.String,
                                            ),
                                            'recordKey': serializeParam(
                                              widget.recordKey,
                                              ParamType.String,
                                            ),
                                            'type': serializeParam(
                                              widget.type,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        if (functions
                                                .mapParamsForAddons((_model
                                                        .nextResponse
                                                        ?.jsonBody ??
                                                    ''))
                                                .where((e) => e.id == 'tabName')
                                                .toList()
                                                .firstOrNull
                                                ?.name ==
                                            'deliveryTab') {
                                          context.pushNamed(
                                            ShoppingCartDeliveryPageWidget
                                                .routeName,
                                            queryParameters: {
                                              'recordKey': serializeParam(
                                                widget.recordKey,
                                                ParamType.String,
                                              ),
                                              'resourceType': serializeParam(
                                                functions
                                                    .mapParamsForAddons((_model
                                                            .nextResponse
                                                            ?.jsonBody ??
                                                        ''))
                                                    .where((e) =>
                                                        e.id == 'resourceType')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name,
                                                ParamType.String,
                                              ),
                                              'type': serializeParam(
                                                widget.type,
                                                ParamType.String,
                                              ),
                                              'quantity': serializeParam(
                                                '1',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          context.pushNamed(
                                            AddOnPageInWizardWidget.routeName,
                                            queryParameters: {
                                              'parentRecordkey': serializeParam(
                                                functions
                                                    .mapParamsForAddons((_model
                                                            .nextResponse
                                                            ?.jsonBody ??
                                                        ''))
                                                    .where((e) =>
                                                        e.id ==
                                                        'parentRecordKey')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name,
                                                ParamType.String,
                                              ),
                                              'recordKey': serializeParam(
                                                functions
                                                    .mapParamsForAddons((_model
                                                            .nextResponse
                                                            ?.jsonBody ??
                                                        ''))
                                                    .where((e) =>
                                                        e.id ==
                                                        'resourceItemType')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name,
                                                ParamType.String,
                                              ),
                                              'item': serializeParam(
                                                functions
                                                    .mapParamsForAddons((_model
                                                            .nextResponse
                                                            ?.jsonBody ??
                                                        ''))
                                                    .where(
                                                        (e) => e.id == 'item')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name,
                                                ParamType.String,
                                              ),
                                              'type': serializeParam(
                                                functions
                                                    .mapParamsForAddons((_model
                                                            .nextResponse
                                                            ?.jsonBody ??
                                                        ''))
                                                    .where(
                                                        (e) => e.id == 'type')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name,
                                                ParamType.String,
                                              ),
                                              'resourceType': serializeParam(
                                                functions
                                                    .mapParamsForAddons((_model
                                                            .nextResponse
                                                            ?.jsonBody ??
                                                        ''))
                                                    .where((e) =>
                                                        e.id == 'resourceType')
                                                    .toList()
                                                    .firstOrNull
                                                    ?.name,
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
                                          AddonGroupGroup.addOnGroupNextCall
                                              .toastMsg(
                                            (_model.nextResponse?.jsonBody ??
                                                ''),
                                          )!,
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
                                  '7cp2i4f3' /* Next */,
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
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
