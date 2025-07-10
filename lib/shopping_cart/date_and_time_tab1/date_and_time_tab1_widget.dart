import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'date_and_time_tab1_model.dart';
export 'date_and_time_tab1_model.dart';

class DateAndTimeTab1Widget extends StatefulWidget {
  const DateAndTimeTab1Widget({
    super.key,
    required this.recordKey,
    required this.type,
    this.packageId,
    this.denominatorId,
    this.denomName,
    this.spaceId,
    String? resourceItemType,
    String? quantity,
  })  : this.resourceItemType = resourceItemType ?? '0',
        this.quantity = quantity ?? '1';

  /// packageId or spaceid
  final int? recordKey;

  /// In venue, type 1 is for package and 0 is for halls
  final int? type;

  final int? packageId;
  final int? denominatorId;
  final String? denomName;
  final int? spaceId;

  /// This is actually resourceType
  final String resourceItemType;

  final String quantity;

  static String routeName = 'DateAndTimeTab1';
  static String routePath = 'dateAndTimeTab1';

  @override
  State<DateAndTimeTab1Widget> createState() => _DateAndTimeTab1WidgetState();
}

class _DateAndTimeTab1WidgetState extends State<DateAndTimeTab1Widget> {
  late DateAndTimeTab1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DateAndTimeTab1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.onDate = getCurrentTimestamp;
      _model.dateAndTimeTabCursorResponse =
          await ShoppingCartGroup.dateAndTimeTabCursorCall.call(
        token: FFAppState().SessionToken,
        recordKey: widget.recordKey?.toString(),
        type: widget.type?.toString(),
        cache: 'server',
        resourceItemType: widget.resourceItemType,
        quantity: widget.quantity,
      );

      if ((_model.dateAndTimeTabCursorResponse?.succeeded ?? true)) {
        _model.dateRestrictionApiOutput =
            await DateAndTimeTabGroup.dateRestrictionCall.call(
          token: FFAppState().SessionToken,
          uicontext:
              '{\"key\":\"dateAndTimeTab\",\"params\":{\"format\":[\"js\"],\"resourceItemType\":[\"${widget.resourceItemType}\"],\"recordKey\":[\"${widget.recordKey?.toString()}\"],\"timeSlotId\":[\"-1\"],\"type\":[\"${widget.type?.toString()}\"]},\"component\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"clientState\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}}}',
          filters:
              '[{\"attribute\":\"dateRange\",\"value\":{\"from\":\"${functions.getFiltersForCalendars()?.firstOrNull}\",\"to\":\"${functions.getFiltersForCalendars()?.lastOrNull}\"}}]',
        );

        if ((_model.dateRestrictionApiOutput?.succeeded ?? true)) {
          _model.dateRestrictionResponse = functions
              .mapDisabledDays(
                  (_model.dateRestrictionApiOutput?.jsonBody ?? ''))!
              .toList()
              .cast<NameIdSearchableStruct>();
          _model.variationDropDownPresent =
              ShoppingCartGroup.dateAndTimeTabCursorCall.denominaorId(
                        (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
                      ) !=
                      null &&
                  ShoppingCartGroup.dateAndTimeTabCursorCall.denominaorId(
                        (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
                      ) !=
                      '';
          _model.disabledDays = functions
              .getDisabledDays(_model.dateRestrictionResponse.toList())!
              .toList()
              .cast<int>();
          _model.ocKey = ShoppingCartGroup.dateAndTimeTabCursorCall.id(
            (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
          )!;
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  title: Text('Oops'),
                  content: Text('DateRestriction not accessed'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
        }

        if (widget.denominatorId != null) {
          _model.setDenomResponse =
              await DateAndTimeTabGroup.setDenominatorCall.call(
            token: FFAppState().SessionToken,
            resourceItemType: widget.resourceItemType,
            type: widget.type?.toString(),
            parentRecordKey: widget.recordKey?.toString(),
            id: _model.ocKey,
            denominatorId: widget.denominatorId?.toString(),
            clientState:
                '{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
          );
        }
        if (ShoppingCartGroup.dateAndTimeTabCursorCall
                .hideCondnForCakeTypeItems(
              (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
            ) ==
            'true') {
          safeSetState(() {
            _model.cakeMessageTextController?.text =
                ShoppingCartGroup.dateAndTimeTabCursorCall.customText(
              (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
            )!;
          });
          safeSetState(() {
            _model.cakeMsgColorDpValueController?.value =
                ShoppingCartGroup.dateAndTimeTabCursorCall.customColor(
              (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
            )!;
          });
          _model.colourEnumResponse =
              await DateAndTimeTabGroup.cLBXEnColorTypeCall.call(
            uiContext:
                '{\"key\":\"dateAndTimeTab\",\"params\":{\"format\":[\"js\",\"js\"],\"quantity\":[\"1\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"cakeSinglePageWizard__cakeSinglePageWizardId\\\",\\\"index\\\":1,\\\"staticTabs\\\":[{\\\"tabName\\\":\\\"customizationTabId\\\",\\\"resourceItemType\\\":\\\"5\\\",\\\"resourceType\\\":\\\"5\\\",\\\"type\\\":\\\"0\\\",\\\"recordKey\\\":\\\"9719\\\",\\\"quantity\\\":\\\"1\\\",\\\"basic\\\":\\\"false\\\",\\\"menuSection\\\":\\\"false\\\",\\\"variations\\\":\\\"-1\\\",\\\"fromCustomization\\\":\\\"true\\\",\\\"cakeCustomizationType\\\":\\\"4\\\"}]}\"],\"renderTo\":[\"contains_dateAndTimeTab\"],\"resourceItemType\":[\"5\"],\"resourceType\":[\"5\"],\"menuSection\":[\"false\"],\"variations\":[\"-1\"],\"recordKey\":[\"9719\"],\"type\":[\"0\"],\"basic\":[\"false\"],\"cakeCustomizationType\":[\"0\"],\"fromCustomization\":[\"true\"]},\"component\":{\"clientId\":\"contains_dateAndTimeTab__dateAndTimeTab__dateAndTimeForm\",\"clientState\":{\"clientId\":\"contains_dateAndTimeTab__dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}}}',
          );

          if ((_model.colourEnumResponse?.succeeded ?? true)) {
            _model.colorEnum = functions
                .mapEnums((_model.colourEnumResponse?.jsonBody ?? ''))
                .toList()
                .cast<NameIdSearchableStruct>();
          }
        }
        _model.startTimeResponse =
            await ShoppingCartGroup.dateNTimeTabStartTimeCall.call(
          uiContext:
              '{\"key\":\"dateAndTimeTab\",\"params\":{\"format\":[\"js\"],\"resourceItemType\":[\"${widget.resourceItemType}\"],\"recordKey\":[\"${widget.recordKey?.toString()}\"],\"type\":[\"${widget.type?.toString()}\"]},\"component\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"clientState\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}}} ',
          token: FFAppState().SessionToken,
        );

        if ((_model.startTimeResponse?.succeeded ?? true)) {
          _model.startTimeList = ShoppingCartGroup.dateNTimeTabStartTimeCall
              .text(
                (_model.startTimeResponse?.jsonBody ?? ''),
              )!
              .toList()
              .cast<String>();
        }
        _model.ocKey = ShoppingCartGroup.dateAndTimeTabCursorCall.id(
          (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
        )!;
        _model.endTime = ShoppingCartGroup.dateAndTimeTabCursorCall.endTime(
          (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
        )!;
        _model.totalPrice =
            ShoppingCartGroup.dateAndTimeTabCursorCall.priceToDisplay(
          (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
        )!;
        _model.kids = functions
            .stringToInt(ShoppingCartGroup.dateAndTimeTabCursorCall.noOfKids(
          (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
        ))!;
        _model.adults = functions
            .stringToInt(ShoppingCartGroup.dateAndTimeTabCursorCall.noOfAdults(
          (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
        ))!;
        _model.totalInvitees = functions.stringToInt(
            ShoppingCartGroup.dateAndTimeTabCursorCall.totalInvitees(
          (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
        ));
        _model.onDate = functions.convertStringToDate(
            ShoppingCartGroup.dateAndTimeTabCursorCall.onDate(
          (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
        )!);
        _model.isDateDefined = true;
        _model.altDate1 = ShoppingCartGroup.dateAndTimeTabCursorCall.altdate1(
                      (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.dateAndTimeTabCursorCall.altdate1(
                      (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
                    ) !=
                    ''
            ? ShoppingCartGroup.dateAndTimeTabCursorCall.altdate1(
                (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
              )
            : '';
        _model.altDate2 = ShoppingCartGroup.dateAndTimeTabCursorCall.altdate2(
                      (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.dateAndTimeTabCursorCall.altdate2(
                      (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
                    ) !=
                    ''
            ? ShoppingCartGroup.dateAndTimeTabCursorCall.altdate2(
                (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
              )
            : '';
        _model.minDeposit =
            ShoppingCartGroup.dateAndTimeTabCursorCall.minDepositVal(
          (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
        );
        safeSetState(() {
          _model.kidsCountControllerValue = _model.kids;
        });
        safeSetState(() {
          _model.adultsCountControllerValue = _model.adults;
        });
        safeSetState(() {
          _model.totalCountControllerValue = _model.totalInvitees!;
        });
        safeSetState(() {
          _model.startTimeToggleValue = (functions.stringToInt(
                      ShoppingCartGroup.dateAndTimeTabCursorCall.startTime(
                    (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
                  ))! >
                  43200
              ? true
              : false);
        });
        safeSetState(() {
          _model.daysDPValueController?.value =
              ShoppingCartGroup.dateAndTimeTabCursorCall.day(
            (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
          )!;
        });
        if (_model.variationDropDownPresent) {
          safeSetState(() {
            _model.variationDropDownValueController?.value =
                ShoppingCartGroup.dateAndTimeTabCursorCall.denominaorId(
              (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
            )!;
          });
        }
        _model.apiLoaded = true;
        _model.duration = ShoppingCartGroup.dateAndTimeTabCursorCall.hour(
          (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
        );
        safeSetState(() {});
        safeSetState(() {
          _model.hoursDpValueController?.value = _model.duration!;
        });
        _model.durationSet = true;
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

    _model.startTimeToggleValue = functions.stringToInt(
                ShoppingCartGroup.dateAndTimeTabCursorCall.startTime(
              (_model.dateAndTimeTabCursorResponse?.jsonBody ?? ''),
            ))! >
            43200
        ? true
        : false;
    _model.switchValue = false;
    _model.cakeMessageTextController ??= TextEditingController();
    _model.cakeMessageFocusNode ??= FocusNode();

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
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
              buttonSize: 48.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'qeojhdzg' /* Date and Time Selection */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ],
                ),
              ),
              centerTitle: false,
              expandedTitleScale: 1.0,
            ),
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 8.0),
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
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                ShoppingCartGroup
                                                    .dateAndTimeTabCursorCall
                                                    .name(
                                                  (_model.dateAndTimeTabCursorResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'Name',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if ((widget.denomName != null &&
                                  widget.denomName != '') &&
                              !_model.variationDropDownPresent)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
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
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  'Variation : ${widget.denomName}',
                                                  'Variation Name',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (_model.variationDropDownPresent &&
                              (widget.resourceItemType == '0'))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
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
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FutureBuilder<ApiCallResponse>(
                                            future: DateAndTimeTabGroup
                                                .variationOptionsCall
                                                .call(
                                              token: FFAppState().SessionToken,
                                              uiContext:
                                                  '{\"key\":\"dateAndTimeTab\",\"params\":{\"format\":[\"js\"],\"resourceItemType\":[\"0\"],\"recordKey\":[\"${widget.recordKey?.toString()}\"],\"timeSlotId\":[\"-1\"],\"type\":[\"${widget.type?.toString()}\"]},\"component\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"clientState\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}}}',
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
                                              final variationDropDownVariationOptionsResponse =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .variationDropDownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.variationDropDownValue ??=
                                                      ShoppingCartGroup
                                                          .dateAndTimeTabCursorCall
                                                          .denominaorId(
                                                    (_model.dateAndTimeTabCursorResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                ),
                                                options: List<String>.from(
                                                    DateAndTimeTabGroup
                                                        .variationOptionsCall
                                                        .id(
                                                  variationDropDownVariationOptionsResponse
                                                      .jsonBody,
                                                )!),
                                                optionLabels:
                                                    DateAndTimeTabGroup
                                                        .variationOptionsCall
                                                        .text(
                                                  variationDropDownVariationOptionsResponse
                                                      .jsonBody,
                                                )!,
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                          .variationDropDownValue =
                                                      val);
                                                  _model.setDenomFromDropDown =
                                                      await DateAndTimeTabGroup
                                                          .setDenominatorCall
                                                          .call(
                                                    token: FFAppState()
                                                        .SessionToken,
                                                    resourceItemType: '0',
                                                    type: widget.type
                                                        ?.toString(),
                                                    parentRecordKey: widget
                                                        .recordKey
                                                        ?.toString(),
                                                    denominatorId: _model
                                                        .variationDropDownValue,
                                                    id: _model.ocKey,
                                                    clientState:
                                                        '{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                  );

                                                  if ((_model
                                                          .setDenomFromDropDown
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.totalPrice =
                                                        DateAndTimeTabGroup
                                                            .setDenominatorCall
                                                            .priceToDisplay(
                                                      (_model.setDenomFromDropDown
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                  }

                                                  safeSetState(() {});
                                                },
                                                width: 200.0,
                                                height: 40.0,
                                                textStyle:
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
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'o2gfcs0v' /* Select variation... */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (functions.checkJsonValue(getJsonField(
                            (_model.dateAndTimeTabCursorResponse?.jsonBody ??
                                ''),
                            r'''$.details[:]['depositTemplate-_-denomName']''',
                          )))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
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
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                'Variation : ${valueOrDefault<String>(
                                                  ShoppingCartGroup
                                                      .dateAndTimeTabCursorCall
                                                      .denomNae(
                                                    (_model.dateAndTimeTabCursorResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  'Denom',
                                                )}',
                                                'Variation Name',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
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
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
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
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.isDateDefined)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.7,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.47,
                                      child: custom_widgets.ItemDate(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.7,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.47,
                                        preselectedDate: _model.onDate!,
                                        disabledDays: _model.disabledDays,
                                        onTapActionDate: () async {
                                          _model.onDateChangedApiResponse =
                                              await ShoppingCartGroup
                                                  .dateNTimeTabOnDatechangeCall
                                                  .call(
                                            token: FFAppState().SessionToken,
                                            self: 'onDate',
                                            recordKey:
                                                widget.recordKey?.toString(),
                                            resourceItemType:
                                                widget.resourceItemType,
                                            type: widget.type?.toString(),
                                            oc: _model.ocKey,
                                            client:
                                                '{\"clientId\":\"contains_dateAndTimeTab__dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                            onDate: functions.dateToString(
                                                FFAppState().ItemDate),
                                          );

                                          if ((_model.onDateChangedApiResponse
                                                  ?.succeeded ??
                                              true)) {
                                            _model.startTimeChangeForDate =
                                                await ShoppingCartGroup
                                                    .dateNTimeTabStartTimeCall
                                                    .call(
                                              token: FFAppState().SessionToken,
                                              uiContext:
                                                  '{\"key\":\"dateAndTimeTab\",\"params\":{\"format\":[\"js\"],\"resourceItemType\":[\"${widget.resourceItemType}\"],\"recordKey\":[\"${widget.recordKey?.toString()}\"],\"type\":[\"${widget.type?.toString()}\"]},\"component\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"clientState\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}}} ',
                                            );

                                            if ((_model.startTimeChangeForDate
                                                    ?.succeeded ??
                                                true)) {
                                              _model.startTimeList =
                                                  ShoppingCartGroup
                                                      .dateNTimeTabStartTimeCall
                                                      .text(
                                                        (_model.startTimeChangeForDate
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                      .toList()
                                                      .cast<String>();
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text(
                                                        'Something went wrong'),
                                                    content: Text(
                                                        'Please try again'),
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
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          if (!functions.stringToBool(ShoppingCartGroup
                              .dateAndTimeTabCursorCall
                              .isTimeSlotAvailable(
                            (_model.dateAndTimeTabCursorResponse?.jsonBody ??
                                ''),
                          )))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 10.0),
                              child: Container(
                                width: double.infinity,
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
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'pb80dju4' /* Start Time :  */,
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
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '6oyereof' /* AM */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                        ),
                                                      ),
                                                      Switch.adaptive(
                                                        value: _model
                                                            .startTimeToggleValue!,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.startTimeToggleValue =
                                                                  newValue);
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        inactiveTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'qcqop6sb' /* PM */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (_model.apiLoaded)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.85,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          primary: false,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              FlutterFlowChoiceChips(
                                                                options: (_model
                                                                            .startTimeToggleValue!
                                                                        ? functions.getPMFormList(_model
                                                                            .startTimeList
                                                                            .toList())!
                                                                        : functions.getAMFromList(_model
                                                                            .startTimeList
                                                                            .toList())!)
                                                                    .map((label) =>
                                                                        ChipData(
                                                                            label))
                                                                    .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.startTimeChoiceChipsValue =
                                                                          val?.firstOrNull);
                                                                  _model.startTimeChangedResponse =
                                                                      await DateAndTimeTabGroup
                                                                          .startTimeChangedCall
                                                                          .call(
                                                                    token: FFAppState()
                                                                        .SessionToken,
                                                                    recordKey: widget
                                                                        .recordKey
                                                                        ?.toString(),
                                                                    resourceItemType:
                                                                        widget
                                                                            .resourceItemType,
                                                                    type: widget
                                                                        .type
                                                                        ?.toString(),
                                                                    quantity:
                                                                        widget
                                                                            .quantity,
                                                                    id: _model
                                                                        .ocKey,
                                                                    clientState:
                                                                        '{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                                    startTime: functions
                                                                        .convertTimeIntoSecondInString(
                                                                            functions.getTimeFromStringWithAMPM(_model.startTimeChoiceChipsValue)),
                                                                  );

                                                                  if ((_model
                                                                          .startTimeChangedResponse
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    _model.endTime =
                                                                        DateAndTimeTabGroup
                                                                            .startTimeChangedCall
                                                                            .endTimeInString(
                                                                      (_model.startTimeChangedResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!;
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            title:
                                                                                Text('StartTime not saved'),
                                                                            content:
                                                                                Text('Something went wrong'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                selectedChipStyle:
                                                                    ChipStyle(
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                  iconColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  iconSize:
                                                                      16.0,
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                unselectedChipStyle:
                                                                    ChipStyle(
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                  iconColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  iconSize:
                                                                      16.0,
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                chipSpacing:
                                                                    8.0,
                                                                rowSpacing: 8.0,
                                                                multiselect:
                                                                    false,
                                                                initialized:
                                                                    _model.startTimeChoiceChipsValue !=
                                                                        null,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                controller: _model
                                                                        .startTimeChoiceChipsValueController ??=
                                                                    FormFieldController<
                                                                        List<
                                                                            String>>(
                                                                  [
                                                                    functions.getTimeWithAMPMFromSecondsString(ShoppingCartGroup
                                                                        .dateAndTimeTabCursorCall
                                                                        .startTime(
                                                                      (_model.dateAndTimeTabCursorResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ))!
                                                                  ],
                                                                ),
                                                                wrapped: true,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (widget.resourceItemType == '2')
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ovbnvndd' /* Days :  */,
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
                                              Flexible(
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .daysDPValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.daysDPValue ??= '',
                                                  ),
                                                  options: List<String>.from([
                                                    '1',
                                                    '2',
                                                    '3',
                                                    '4',
                                                    '5',
                                                    '6',
                                                    '7',
                                                    '8',
                                                    '9',
                                                    '10',
                                                    '11'
                                                  ]),
                                                  optionLabels: [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'wsjisx8v' /* 1  day */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'n8epye7e' /* 2 days */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'oyhht0g7' /* 3 days */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'caiwt31q' /* 4 days */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'fagw53tp' /* 5 days */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'uzn97ejz' /* 6 days */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1f9aklzz' /* 7 days */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '5og3kwet' /* 8 days */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'akyir34g' /* 9  days */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '0hum9puq' /* 10 days */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'h5wsyb72' /* 11 days */,
                                                    )
                                                  ],
                                                  onChanged: (val) async {
                                                    safeSetState(() => _model
                                                        .daysDPValue = val);
                                                    _model.dayChangedResponse =
                                                        await DateAndTimeTabGroup
                                                            .onDayChangedRentalCall
                                                            .call(
                                                      recordKey: widget
                                                          .recordKey
                                                          ?.toString(),
                                                      resourceItemType: widget
                                                          .resourceItemType,
                                                      type: widget.type
                                                          ?.toString(),
                                                      parentRecordKey: widget
                                                          .recordKey
                                                          ?.toString(),
                                                      day: _model.daysDPValue,
                                                      id: _model.ocKey,
                                                      token: FFAppState()
                                                          .SessionToken,
                                                      clientstate:
                                                          '{\"clientId\":\"contains_dateAndTimeTab__dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                    );

                                                    if ((_model
                                                            .dayChangedResponse
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.totalPrice =
                                                          DateAndTimeTabGroup
                                                              .onDayChangedRentalCall
                                                              .priceToDisplay(
                                                        (_model.dayChangedResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      _model.minDeposit =
                                                          DateAndTimeTabGroup
                                                              .onDayChangedRentalCall
                                                              .minDepositVal(
                                                        (_model.dayChangedResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  width: 200.0,
                                                  height: 40.0,
                                                  textStyle:
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
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'nuax45fn' /* Select number of days */,
                                                  ),
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (widget.resourceItemType != '5')
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1uuijb1v' /* Duration :  */,
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
                                              if (_model.durationSet)
                                                Flexible(
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .hoursDpValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.hoursDpValue ??=
                                                          _model.duration,
                                                    ),
                                                    options: List<String>.from([
                                                      '1',
                                                      '2',
                                                      '3',
                                                      '4',
                                                      '5',
                                                      '6',
                                                      '7',
                                                      '8',
                                                      '9',
                                                      '10',
                                                      '11'
                                                    ]),
                                                    optionLabels: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'spsufljk' /* 1 hr */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'qqkcukih' /* 2 hr */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jv9h3unl' /* 3 hr */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'w47wlbt3' /* 4 hr */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ih8zetn2' /* 5 hr */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'lkmhrk6b' /* 6 hr */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'khy7qhnb' /* 7 hr */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'z8pxxb1t' /* 8 hr */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'c0qeb0zc' /* 9  hr */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '685plcs2' /* 10 hr */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9uvg2y87' /* 11 hr */,
                                                      )
                                                    ],
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                          .hoursDpValue = val);
                                                      _model.hourChanged =
                                                          await DateAndTimeTabGroup
                                                              .onHourChangedCall
                                                              .call(
                                                        token: FFAppState()
                                                            .SessionToken,
                                                        resourceItemType: widget
                                                            .resourceItemType,
                                                        type: widget.type
                                                            ?.toString(),
                                                        recordKey: widget
                                                            .recordKey
                                                            ?.toString(),
                                                        id: _model.ocKey,
                                                        hour:
                                                            _model.hoursDpValue,
                                                        clientState:
                                                            '{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                        quantity:
                                                            widget.quantity,
                                                      );

                                                      if ((_model.hourChanged
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.endTime =
                                                            DateAndTimeTabGroup
                                                                .onHourChangedCall
                                                                .endTimeInString(
                                                          (_model.hourChanged
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!;
                                                        _model.totalPrice =
                                                            DateAndTimeTabGroup
                                                                .onHourChangedCall
                                                                .priceToDisplay(
                                                          (_model.hourChanged
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!;
                                                        _model.duration =
                                                            _model.hoursDpValue;
                                                        _model.minDeposit =
                                                            DateAndTimeTabGroup
                                                                .onHourChangedCall
                                                                .minDepositVal(
                                                          (_model.hourChanged
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        _model.startTimeChangedForHour =
                                                            await ShoppingCartGroup
                                                                .dateNTimeTabStartTimeCall
                                                                .call(
                                                          token: FFAppState()
                                                              .SessionToken,
                                                          uiContext:
                                                              '{\"key\":\"dateAndTimeTab\",\"params\":{\"format\":[\"js\"],\"resourceItemType\":[\"${widget.resourceItemType}\"],\"recordKey\":[\"${widget.recordKey?.toString()}\"],\"type\":[\"${widget.type?.toString()}\"]},\"component\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"clientState\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}}} ',
                                                        );

                                                        if ((_model
                                                                .startTimeChangedForHour
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.startTimeList =
                                                              ShoppingCartGroup
                                                                  .dateNTimeTabStartTimeCall
                                                                  .text(
                                                                    (_model.startTimeChangedForHour
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                        }
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                title: Text(
                                                                    'Hours not set'),
                                                                content: Text(
                                                                    'Something went wrong'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    width: 200.0,
                                                    height: 40.0,
                                                    textStyle:
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
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '64otnv30' /* Select number of hours */,
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
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    if (widget.resourceItemType != '5')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    'End Time : ${_model.endTime}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                if (widget.resourceItemType ==
                                                    '2')
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
                                                        'End Date : ${ShoppingCartGroup.dateAndTimeTabCursorCall.nextDay(
                                                          (_model.dateAndTimeTabCursorResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}',
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
                          if (functions.stringToBool(ShoppingCartGroup
                              .dateAndTimeTabCursorCall
                              .isTimeSlotAvailable(
                            (_model.dateAndTimeTabCursorResponse?.jsonBody ??
                                ''),
                          )))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 10.0),
                              child: Container(
                                width: double.infinity,
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
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4spr68ro' /* Start Time :   */,
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
                                                      ),
                                                    ],
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'h2jd58vm' /* AM */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                          ),
                                                        ),
                                                        Switch.adaptive(
                                                          value: _model
                                                              .switchValue!,
                                                          onChanged:
                                                              (newValue) async {
                                                            safeSetState(() =>
                                                                _model.switchValue =
                                                                    newValue);
                                                          },
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          inactiveTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'j5z2awuj' /* PM */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: DateAndTimeTabGroup
                                                        .startTimeForSlotsCall
                                                        .call(
                                                      token: FFAppState()
                                                          .SessionToken,
                                                      uiContext:
                                                          '{\"key\":\"dateAndTimeTab\",\"params\":{\"format\":[\"js\"],\"recordKey\":[\"${widget.recordKey?.toString()}\"],\"type\":[\"${widget.type?.toString()}\"]},\"component\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"clientState\":{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}}} ',
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
                                                      final containerStartTimeForSlotsResponse =
                                                          snapshot.data!;

                                                      return Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.85,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              custom_widgets
                                                                  .CustomChoiceChips(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.8,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.1,
                                                                options:
                                                                    DateAndTimeTabGroup
                                                                        .startTimeForSlotsCall
                                                                        .id(
                                                                  containerStartTimeForSlotsResponse
                                                                      .jsonBody,
                                                                )!,
                                                                labels: DateAndTimeTabGroup
                                                                    .startTimeForSlotsCall
                                                                    .text(
                                                                  containerStartTimeForSlotsResponse
                                                                      .jsonBody,
                                                                )!,
                                                                initialValue:
                                                                    ShoppingCartGroup
                                                                        .dateAndTimeTabCursorCall
                                                                        .startTimeSlot(
                                                                  (_model.dateAndTimeTabCursorResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                onTapAction:
                                                                    () async {
                                                                  _model.timeSlotChangedResponse =
                                                                      await DateAndTimeTabGroup
                                                                          .timeSlotChangedCall
                                                                          .call(
                                                                    token: FFAppState()
                                                                        .SessionToken,
                                                                    recordKey: widget
                                                                        .recordKey
                                                                        ?.toString(),
                                                                    resourceItemType:
                                                                        '0',
                                                                    type: widget
                                                                        .type
                                                                        ?.toString(),
                                                                    quantity:
                                                                        '-1',
                                                                    startTimeSlot:
                                                                        FFAppState()
                                                                            .customChoiceChipSelection,
                                                                    id: _model
                                                                        .ocKey,
                                                                    clientState:
                                                                        '{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                                  );

                                                                  if ((_model
                                                                          .timeSlotChangedResponse
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    _model.endTime =
                                                                        DateAndTimeTabGroup
                                                                            .timeSlotChangedCall
                                                                            .endTimeSlotInString(
                                                                      (_model.timeSlotChangedResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!;
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'End Time : ${_model.endTime}',
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (widget.resourceItemType != '5')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 10.0),
                              child: Container(
                                width: double.infinity,
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
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'roa8eb83' /* Kids */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                          Flexible(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.38,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: FlutterFlowCountController(
                                                decrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.remove_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 24.0,
                                                ),
                                                incrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.add_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 24.0,
                                                ),
                                                countBuilder: (count) => Text(
                                                  count.toString(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                count: _model
                                                        .kidsCountControllerValue ??=
                                                    _model.kids,
                                                updateCount: (count) async {
                                                  safeSetState(() => _model
                                                          .kidsCountControllerValue =
                                                      count);
                                                  _model.kidsChangedResponse =
                                                      await DateAndTimeTabGroup
                                                          .kidsChangedCall
                                                          .call(
                                                    token: FFAppState()
                                                        .SessionToken,
                                                    recordKey: widget.recordKey
                                                        ?.toString(),
                                                    resourceItemType: widget
                                                        .resourceItemType,
                                                    type: widget.type
                                                        ?.toString(),
                                                    id: _model.ocKey,
                                                    kids: _model
                                                        .kidsCountControllerValue
                                                        ?.toString(),
                                                    clientState:
                                                        '{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                  );

                                                  if ((_model
                                                          .kidsChangedResponse
                                                          ?.succeeded ??
                                                      true)) {
                                                    safeSetState(() {
                                                      _model.totalCountControllerValue =
                                                          functions.stringToInt(
                                                              DateAndTimeTabGroup
                                                                  .kidsChangedCall
                                                                  .totalInvitee(
                                                        (_model.kidsChangedResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))!;
                                                    });
                                                    _model.totalPrice =
                                                        DateAndTimeTabGroup
                                                            .kidsChangedCall
                                                            .priceToDisplay(
                                                      (_model.kidsChangedResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                  }

                                                  safeSetState(() {});
                                                },
                                                stepSize: 1,
                                                minimum: 0,
                                                maximum: 100,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            12.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9xtgjg6a' /* Adults */,
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
                                          Flexible(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.38,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: FlutterFlowCountController(
                                                decrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.remove_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 24.0,
                                                ),
                                                incrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.add_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 24.0,
                                                ),
                                                countBuilder: (count) => Text(
                                                  count.toString(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                count: _model
                                                        .adultsCountControllerValue ??=
                                                    _model.adults,
                                                updateCount: (count) async {
                                                  safeSetState(() => _model
                                                          .adultsCountControllerValue =
                                                      count);
                                                  _model.adultChangedResponse =
                                                      await DateAndTimeTabGroup
                                                          .adultsChangedCall
                                                          .call(
                                                    token: FFAppState()
                                                        .SessionToken,
                                                    recordKey: widget.recordKey
                                                        ?.toString(),
                                                    resourceItemType: widget
                                                        .resourceItemType,
                                                    type: widget.type
                                                        ?.toString(),
                                                    adults: _model
                                                        .adultsCountControllerValue
                                                        ?.toString(),
                                                    ocKey: _model.ocKey,
                                                    clientState:
                                                        '{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                  );

                                                  if ((_model
                                                          .adultChangedResponse
                                                          ?.succeeded ??
                                                      true)) {
                                                    safeSetState(() {
                                                      _model.totalCountControllerValue =
                                                          functions.stringToInt(
                                                              DateAndTimeTabGroup
                                                                  .adultsChangedCall
                                                                  .totalInvitees(
                                                        (_model.adultChangedResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))!;
                                                    });
                                                    _model.totalPrice =
                                                        DateAndTimeTabGroup
                                                            .adultsChangedCall
                                                            .priceToDisplay(
                                                      (_model.adultChangedResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                  }

                                                  safeSetState(() {});
                                                },
                                                stepSize: 1,
                                                minimum: 0,
                                                maximum: 100,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            12.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2t8rghy6' /* Total Invitees */,
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
                                          Flexible(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.38,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: FlutterFlowCountController(
                                                decrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.remove_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 24.0,
                                                ),
                                                incrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.add_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 24.0,
                                                ),
                                                countBuilder: (count) => Text(
                                                  count.toString(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                count: _model
                                                        .totalCountControllerValue ??=
                                                    _model.totalInvitees!,
                                                updateCount: (count) async {
                                                  safeSetState(() => _model
                                                          .totalCountControllerValue =
                                                      count);
                                                  _model.totalInviteesChangedResponse =
                                                      await DateAndTimeTabGroup
                                                          .totalInviteeChangedCall
                                                          .call(
                                                    token: FFAppState()
                                                        .SessionToken,
                                                    recordKey: widget.recordKey
                                                        ?.toString(),
                                                    resourceItemType: widget
                                                        .resourceItemType,
                                                    type: widget.type
                                                        ?.toString(),
                                                    totalInvitees: _model
                                                        .totalCountControllerValue
                                                        ?.toString(),
                                                    ocKey: _model.ocKey,
                                                    clientState:
                                                        '{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                  );

                                                  if ((_model
                                                          .totalInviteesChangedResponse
                                                          ?.succeeded ??
                                                      true)) {
                                                    safeSetState(() {
                                                      _model.kidsCountControllerValue =
                                                          0;
                                                    });
                                                    safeSetState(() {
                                                      _model.adultsCountControllerValue =
                                                          0;
                                                    });
                                                    _model.totalPrice =
                                                        DateAndTimeTabGroup
                                                            .totalInviteeChangedCall
                                                            .priceToDisplay(
                                                      (_model.totalInviteesChangedResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                  }

                                                  safeSetState(() {});
                                                },
                                                stepSize: 1,
                                                minimum: 0,
                                                maximum: 100,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            12.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (ShoppingCartGroup.dateAndTimeTabCursorCall
                                  .hideCondnForCakeTypeItems(
                                (_model.dateAndTimeTabCursorResponse
                                        ?.jsonBody ??
                                    ''),
                              ) ==
                              'true')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 10.0),
                              child: Container(
                                width: double.infinity,
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
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ojk66amf' /* Cake message */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    decoration: TextDecoration
                                                        .underline,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              child: TextFormField(
                                                controller: _model
                                                    .cakeMessageTextController,
                                                focusNode:
                                                    _model.cakeMessageFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumIsCustom,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'hsscllfq' /* Enter cake message */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumIsCustom,
                                                          ),
                                                  enabledBorder:
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
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .cakeMessageTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'f6kqlo2f' /* Cake message color */,
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
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .cakeMsgColorDpValueController ??=
                                                FormFieldController<String>(
                                              _model.cakeMsgColorDpValue ??= '',
                                            ),
                                            options: List<String>.from(_model
                                                .colorEnum
                                                .map((e) => e.id)
                                                .toList()),
                                            optionLabels: _model.colorEnum
                                                .map((e) => e.name)
                                                .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                    .cakeMsgColorDpValue = val),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.4,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'hyhk3xka' /* Select... */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (_model.apiLoaded)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 150.0),
                              child: Container(
                                width: double.infinity,
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
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  color: Color(0x00000000),
                                  child: ExpandableNotifier(
                                    controller:
                                        _model.expandableExpandableController,
                                    child: ExpandablePanel(
                                      header: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'k40f099q' /* Alternate Date */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                decoration:
                                                    TextDecoration.underline,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleLargeIsCustom,
                                              ),
                                        ),
                                      ),
                                      collapsed: Container(),
                                      expanded: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ysm0jb3a' /* Alternate date 1  */,
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
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.47,
                                            child: custom_widgets.ItemAltDate1(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.7,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.47,
                                              disabledDays: _model.disabledDays,
                                              preselectedDate: _model.apiLoaded
                                                  ? functions
                                                      .convertStringToDate(
                                                          _model.altDate1!)
                                                  : null,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jwyvfc56' /* Alternate date 2 */,
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
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.47,
                                            child: custom_widgets.ItemAltDate2(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.7,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.47,
                                              disabledDays: _model.disabledDays,
                                              preselectedDate: _model.apiLoaded
                                                  ? functions
                                                      .convertStringToDate(
                                                          _model.altDate2!)
                                                  : null,
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
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 40.0),
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
                                  borderRadius: BorderRadius.circular(16.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget.resourceItemType == '2')
                                      Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Unit Price :  \$ ${valueOrDefault<String>(
                                                ShoppingCartGroup
                                                    .dateAndTimeTabCursorCall
                                                    .unitPrice(
                                                  (_model.dateAndTimeTabCursorResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                '0.0',
                                              )}',
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
                                      ),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Total Price :  \$ ${_model.totalPrice}',
                                            style: FlutterFlowTheme.of(context)
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
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
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
                                  borderRadius: BorderRadius.circular(16.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((valueOrDefault<String>(
                                              ShoppingCartGroup
                                                  .dateAndTimeTabCursorCall
                                                  .minDepositVal(
                                                (_model.dateAndTimeTabCursorResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              '0.0',
                                            ) !=
                                            '0') &&
                                        (valueOrDefault<String>(
                                              ShoppingCartGroup
                                                  .dateAndTimeTabCursorCall
                                                  .minDepositVal(
                                                (_model.dateAndTimeTabCursorResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              '0.0',
                                            ) !=
                                            '0.0'))
                                      Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Min Deposit :  \$ ${valueOrDefault<String>(
                                                ShoppingCartGroup
                                                    .dateAndTimeTabCursorCall
                                                    .minDepositVal(
                                                  (_model.dateAndTimeTabCursorResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                '0.0',
                                              )}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if ((widget.resourceItemType == '2') &&
                                        (valueOrDefault<String>(
                                              ShoppingCartGroup
                                                  .dateAndTimeTabCursorCall
                                                  .unitPrice(
                                                (_model.dateAndTimeTabCursorResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              '0.0',
                                            ) !=
                                            '0'))
                                      Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Unit Price :  \$ ${valueOrDefault<String>(
                                                ShoppingCartGroup
                                                    .dateAndTimeTabCursorCall
                                                    .unitPrice(
                                                  (_model.dateAndTimeTabCursorResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                '0.0',
                                              )}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            _model.totalPrice,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (!functions.stringToBool(
                                                ShoppingCartGroup
                                                    .dateAndTimeTabCursorCall
                                                    .isTimeSlotAvailable(
                                          (_model.dateAndTimeTabCursorResponse
                                                  ?.jsonBody ??
                                              ''),
                                        ))
                                            ? () {
                                                if (_model.startTimeChoiceChipsValue ==
                                                        null ||
                                                    _model.startTimeChoiceChipsValue ==
                                                        '') {
                                                  return false;
                                                } else if (widget
                                                        .resourceItemType ==
                                                    '5') {
                                                  return true;
                                                } else if (_model
                                                            .hoursDpValue ==
                                                        null ||
                                                    _model.hoursDpValue == '') {
                                                  return false;
                                                } else {
                                                  return true;
                                                }
                                              }()
                                            : true) {
                                          _model.dateNTimeSaveResponse =
                                              await DateAndTimeTabGroup.saveCall
                                                  .call(
                                            token: FFAppState().SessionToken,
                                            recordKey:
                                                widget.recordKey?.toString(),
                                            resourceItemType:
                                                widget.resourceItemType,
                                            type: widget.type?.toString(),
                                            basic: 'false',
                                            from: 'false',
                                            rental:
                                                widget.recordKey?.toString(),
                                            item: 'false',
                                            quantity: widget.quantity,
                                            variation: '-1',
                                            clientstate:
                                                '{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                            id: _model.ocKey,
                                            quantityWithoutAp: widget.quantity,
                                            onDate: functions.dateToString(
                                                FFAppState().ItemDate),
                                            hour: () {
                                              if (functions.stringToBool(
                                                  ShoppingCartGroup
                                                      .dateAndTimeTabCursorCall
                                                      .isTimeSlotAvailable(
                                                (_model.dateAndTimeTabCursorResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ))) {
                                                return '';
                                              } else if (widget
                                                      .resourceItemType ==
                                                  '5') {
                                                return '2';
                                              } else {
                                                return _model.hoursDpValue;
                                              }
                                            }(),
                                            noOfKids: _model
                                                .kidsCountControllerValue
                                                ?.toString(),
                                            noOfAdults: _model
                                                .adultsCountControllerValue
                                                ?.toString(),
                                            totalInvitees: _model
                                                .totalCountControllerValue
                                                ?.toString(),
                                            discount: false,
                                            package: ShoppingCartGroup
                                                .dateAndTimeTabCursorCall
                                                .resourceItemId(
                                              (_model.dateAndTimeTabCursorResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            startTime: functions
                                                .convertTimeIntoSecondInString(
                                                    functions
                                                        .getTimeFromStringWithAMPM(
                                                            _model
                                                                .startTimeChoiceChipsValue)),
                                            startTimeSlot: functions.stringToBool(
                                                    ShoppingCartGroup
                                                        .dateAndTimeTabCursorCall
                                                        .isTimeSlotAvailable(
                                              (_model.dateAndTimeTabCursorResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ))
                                                ? FFAppState()
                                                    .customChoiceChipSelection
                                                : '',
                                            endTimeSlot: functions.stringToBool(
                                                    ShoppingCartGroup
                                                        .dateAndTimeTabCursorCall
                                                        .isTimeSlotAvailable(
                                              (_model.dateAndTimeTabCursorResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ))
                                                ? _model.endTime
                                                : '',
                                            altdate1: functions.dateToString(
                                                FFAppState().ItemAltDate1),
                                            altdate2: functions.dateToString(
                                                FFAppState().ItemAltDate2),
                                            denominatorId: () {
                                              if (widget.denominatorId !=
                                                  null) {
                                                return functions
                                                    .stringToInt(widget
                                                        .denominatorId
                                                        ?.toString())
                                                    ?.toString();
                                              } else if ((widget
                                                          .resourceItemType !=
                                                      '0') &&
                                                  (ShoppingCartGroup
                                                              .dateAndTimeTabCursorCall
                                                              .denominaorId(
                                                            (_model.dateAndTimeTabCursorResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          null &&
                                                      ShoppingCartGroup
                                                              .dateAndTimeTabCursorCall
                                                              .denominaorId(
                                                            (_model.dateAndTimeTabCursorResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          '')) {
                                                return ShoppingCartGroup
                                                    .dateAndTimeTabCursorCall
                                                    .denominaorId(
                                                  (_model.dateAndTimeTabCursorResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                );
                                              } else if (_model
                                                  .variationDropDownPresent) {
                                                return _model
                                                    .variationDropDownValue;
                                              } else {
                                                return '';
                                              }
                                            }(),
                                            customText: ShoppingCartGroup
                                                        .dateAndTimeTabCursorCall
                                                        .hideCondnForCakeTypeItems(
                                                      (_model.dateAndTimeTabCursorResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) ==
                                                    'true'
                                                ? _model
                                                    .cakeMessageTextController
                                                    .text
                                                : '',
                                            customColor: (ShoppingCartGroup
                                                            .dateAndTimeTabCursorCall
                                                            .hideCondnForCakeTypeItems(
                                                          (_model.dateAndTimeTabCursorResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        'true') &&
                                                    (_model.cakeMsgColorDpValue !=
                                                            null &&
                                                        _model.cakeMsgColorDpValue !=
                                                            '')
                                                ? _model.cakeMsgColorDpValue
                                                : '',
                                          );

                                          if ((_model.dateNTimeSaveResponse
                                                  ?.succeeded ??
                                              true)) {
                                            if (functions.stringToBool(
                                                    DateAndTimeTabGroup.saveCall
                                                        .success(
                                                          (_model.dateNTimeSaveResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        ?.toString()) ==
                                                true) {
                                              if (DateAndTimeTabGroup.saveCall
                                                      .actionSuccessForRestriction(
                                                    (_model.dateNTimeSaveResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  true) {
                                                _model.toastMessageIndex =
                                                    valueOrDefault<int>(
                                                  DateAndTimeTabGroup.saveCall
                                                      .popUpMsgText(
                                                        (_model.dateNTimeSaveResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      ?.length,
                                                  0,
                                                );
                                                while (
                                                    _model.toastMessageIndex >
                                                        0) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        (DateAndTimeTabGroup
                                                            .saveCall
                                                            .popUpMsgText(
                                                              (_model.dateNTimeSaveResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .elementAtOrNull(
                                                                _model.toastMessageIndex -
                                                                    1))!,
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2100),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  );
                                                  _model.toastMessageIndex =
                                                      _model.toastMessageIndex +
                                                          -1;
                                                }
                                                FFAppState().ItemAltDate1 =
                                                    null;
                                                FFAppState().ItemAltDate2 =
                                                    null;
                                                FFAppState()
                                                        .customChoiceChipSelection =
                                                    '-1';
                                                if (DateAndTimeTabGroup.saveCall
                                                        .cartCount(
                                                      (_model.dateNTimeSaveResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    null) {
                                                  FFAppState().cartCount =
                                                      functions.intToString(
                                                          DateAndTimeTabGroup
                                                              .saveCall
                                                              .cartCount(
                                                    (_model.dateNTimeSaveResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                } else {
                                                  FFAppState().cartCount =
                                                      functions.intToString(
                                                          DateAndTimeTabGroup
                                                              .saveCall
                                                              .cartCountForAnonymous(
                                                    (_model.dateNTimeSaveResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ));
                                                }

                                                if (DateAndTimeTabGroup.saveCall
                                                        .action(
                                                          (_model.dateNTimeSaveResponse
                                                                  ?.jsonBody ??
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
                                                                  .dateNTimeSaveResponse
                                                                  ?.jsonBody ??
                                                              ''))
                                                          .where((e) =>
                                                              e.id == 'tabName')
                                                          .toList()
                                                          .firstOrNull
                                                          ?.name ==
                                                      'addOnsGroupTab') {
                                                    context.pushNamed(
                                                      AddOnGroupInWizardWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'currentGroupId':
                                                            serializeParam(
                                                          functions
                                                              .mapParamsForAddons((_model
                                                                      .dateNTimeSaveResponse
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
                                                        'recordKey':
                                                            serializeParam(
                                                          widget.recordKey
                                                              ?.toString(),
                                                          ParamType.String,
                                                        ),
                                                        'type': serializeParam(
                                                          widget.type
                                                              ?.toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    if (functions
                                                            .mapParamsForAddons((_model
                                                                    .dateNTimeSaveResponse
                                                                    ?.jsonBody ??
                                                                ''))
                                                            .where((e) =>
                                                                e.id ==
                                                                'tabName')
                                                            .toList()
                                                            .firstOrNull
                                                            ?.name ==
                                                        'deliveryTab') {
                                                      context.pushNamed(
                                                        ShoppingCartDeliveryPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'recordKey':
                                                              serializeParam(
                                                            functions
                                                                .mapParamsForAddons((_model
                                                                        .dateNTimeSaveResponse
                                                                        ?.jsonBody ??
                                                                    ''))
                                                                .where((e) =>
                                                                    e.id ==
                                                                    'recordKey')
                                                                .toList()
                                                                .firstOrNull
                                                                ?.name,
                                                            ParamType.String,
                                                          ),
                                                          'resourceType':
                                                              serializeParam(
                                                            functions
                                                                .mapParamsForAddons((_model
                                                                        .dateNTimeSaveResponse
                                                                        ?.jsonBody ??
                                                                    ''))
                                                                .where((e) =>
                                                                    e.id ==
                                                                    'resourceType')
                                                                .toList()
                                                                .firstOrNull
                                                                ?.name,
                                                            ParamType.String,
                                                          ),
                                                          'type':
                                                              serializeParam(
                                                            functions
                                                                .mapParamsForAddons((_model
                                                                        .dateNTimeSaveResponse
                                                                        ?.jsonBody ??
                                                                    ''))
                                                                .where((e) =>
                                                                    e.id ==
                                                                    'type')
                                                                .toList()
                                                                .firstOrNull
                                                                ?.name,
                                                            ParamType.String,
                                                          ),
                                                          'quantity':
                                                              serializeParam(
                                                            functions
                                                                .mapParamsForAddons((_model
                                                                        .dateNTimeSaveResponse
                                                                        ?.jsonBody ??
                                                                    ''))
                                                                .where((e) =>
                                                                    e.id ==
                                                                    'quantity')
                                                                .toList()
                                                                .firstOrNull
                                                                ?.name,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      _model.addOnTemplate = functions
                                                          .mapParamsForAddonsInTemplate(
                                                              (_model.dateNTimeSaveResponse
                                                                      ?.jsonBody ??
                                                                  ''));

                                                      context.pushNamed(
                                                        AddOnPageInWizardWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'parentRecordkey':
                                                              serializeParam(
                                                            _model.addOnTemplate
                                                                ?.recordKey,
                                                            ParamType.String,
                                                          ),
                                                          'recordKey':
                                                              serializeParam(
                                                            _model.addOnTemplate
                                                                ?.resourceItemId,
                                                            ParamType.String,
                                                          ),
                                                          'item':
                                                              serializeParam(
                                                            _model.addOnTemplate
                                                                ?.firstTab,
                                                            ParamType.String,
                                                          ),
                                                          'type':
                                                              serializeParam(
                                                            _model.addOnTemplate
                                                                ?.type,
                                                            ParamType.String,
                                                          ),
                                                          'resourceType':
                                                              serializeParam(
                                                            widget
                                                                .resourceItemType,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    }
                                                  }
                                                }
                                              } else {
                                                _model.toastMessageIndex =
                                                    DateAndTimeTabGroup.saveCall
                                                        .popUpMsgText(
                                                          (_model.dateNTimeSaveResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                        .length;
                                                while (
                                                    _model.toastMessageIndex >
                                                        0) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        (DateAndTimeTabGroup
                                                            .saveCall
                                                            .popUpMsgText(
                                                              (_model.dateNTimeSaveResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .elementAtOrNull(
                                                                _model.toastMessageIndex -
                                                                    1))!,
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2050),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  );
                                                  _model.toastMessageIndex =
                                                      _model.toastMessageIndex +
                                                          -1;
                                                }
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: Text('oops'),
                                                      content: Text((_model
                                                                  .dateNTimeSaveResponse
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toString()),
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
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text(
                                                        'Couldn\'t submit this resquest'),
                                                    content: Text(
                                                        'Something went wrong'),
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
                                        } else {
                                          if (!functions.stringToBool(
                                              ShoppingCartGroup
                                                  .dateAndTimeTabCursorCall
                                                  .isTimeSlotAvailable(
                                            (_model.dateAndTimeTabCursorResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ))) {
                                            if (_model.startTimeChoiceChipsValue ==
                                                    null ||
                                                _model.startTimeChoiceChipsValue ==
                                                    '') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Please select Start time',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 2100),
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
                                                    'Please  select duration',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 2000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              );
                                            }
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'n96nujbk' /* Next */,
                                      ),
                                      icon: Icon(
                                        Icons.shopping_cart_sharp,
                                        size: 22.0,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.55,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleLargeIsCustom,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                          topLeft: Radius.circular(18.0),
                                          topRight: Radius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                  ],
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
            ),
          ),
        ),
      ),
    );
  }
}
