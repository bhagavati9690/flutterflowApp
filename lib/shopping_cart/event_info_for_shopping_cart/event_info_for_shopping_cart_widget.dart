import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/compoents/common_comp/timer_picker_comp/timer_picker_comp_widget.dart';
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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'event_info_for_shopping_cart_model.dart';
export 'event_info_for_shopping_cart_model.dart';

/// Steps
class EventInfoForShoppingCartWidget extends StatefulWidget {
  const EventInfoForShoppingCartWidget({
    super.key,
    required this.recordKey,
    required this.type,
    this.packageId,
    this.spaceId,
    this.denominatorId,
    this.resourceItemId,
    this.resourceItemType,
    this.quantitys,
    bool? customCake,
    this.nextUI,
    this.from,
  }) : this.customCake = customCake ?? false;

  final String? recordKey;
  final String? type;
  final String? packageId;
  final String? spaceId;
  final bool? denominatorId;
  final String? resourceItemId;
  final String? resourceItemType;
  final String? quantitys;
  final bool customCake;
  final String? nextUI;
  final String? from;

  static String routeName = 'EventInfoForShoppingCart';
  static String routePath = 'eventInfoForShoppingCart';

  @override
  State<EventInfoForShoppingCartWidget> createState() =>
      _EventInfoForShoppingCartWidgetState();
}

class _EventInfoForShoppingCartWidgetState
    extends State<EventInfoForShoppingCartWidget> {
  late EventInfoForShoppingCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventInfoForShoppingCartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.first = true;
      _model.second = false;
      _model.third = false;
      safeSetState(() {});
      _model.eventCursorOutput =
          await ShoppingCartGroup.shoppingCartEventEditCursorCall.call(
        token: FFAppState().SessionToken,
      );

      _model.celebrationTypeEnumReponse =
          await ShoppingCartGroup.cLBXEnCelebrationTypeCall.call(
        uiContext:
            '{\"key\":\"eventInfoForShoppingCart\",\"params\":{\"format\":[\"js\"],\"resourceType\":[\"0\"],\"from\":[\"venue\"],\"recordKey\":[\"225661\"],\"type\":[\"1\"]},\"component\":{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"clientState\":{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"cursor\":{\"__recordKey\":\"225661\",\"__cachedId\":\"${ShoppingCartGroup.shoppingCartEventEditCursorCall.ocKey(
          (_model.eventCursorOutput?.jsonBody ?? ''),
        )}\"}}}}',
        token: FFAppState().SessionToken,
      );

      if ((_model.celebrationTypeEnumReponse?.succeeded ?? true)) {
        _model.celebrationTypeEnum = functions
            .mapEnums((_model.celebrationTypeEnumReponse?.jsonBody ?? ''))
            .toList()
            .cast<NameIdSearchableStruct>();
      }
      if ((_model.eventCursorOutput?.succeeded ?? true)) {
        safeSetState(() {
          _model.countControllerValue1 = functions.stringToInt(
              ShoppingCartGroup.shoppingCartEventEditCursorCall.noOfKids(
            (_model.eventCursorOutput?.jsonBody ?? ''),
          ))!;
        });
        safeSetState(() {
          _model.countControllerValue2 = functions.stringToInt(
              ShoppingCartGroup.shoppingCartEventEditCursorCall.noOfAdults(
            (_model.eventCursorOutput?.jsonBody ?? ''),
          ))!;
        });
        safeSetState(() {
          _model.countControllerValue3 = functions.stringToInt(
              ShoppingCartGroup.shoppingCartEventEditCursorCall.totalInvitees(
            (_model.eventCursorOutput?.jsonBody ?? ''),
          ))!;
        });
        await Future.wait([
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall.eventName(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall.eventName(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.eventNameTextController?.text =
                    ShoppingCartGroup.shoppingCartEventEditCursorCall.eventName(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .celebrateeFirstName(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .celebrateeFirstName(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.celebrateeFirstNameTextController?.text =
                    ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .celebrateeFirstName(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .celebrateeLastName(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .celebrateeLastName(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.celebrateeLastNameTextController?.text =
                    ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .celebrateeLastName(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall.celebrateeAge(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall.celebrateeAge(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.celebrateeAgeTextController?.text = ShoppingCartGroup
                    .shoppingCartEventEditCursorCall
                    .celebrateeAge(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .celebrateeGender(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .celebrateeGender(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.celebrationTypeDropdownValueController?.value =
                    ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .celebrateeGender(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall.eventTheme(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall.eventTheme(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.enterThemeTxtTextController?.text = ShoppingCartGroup
                    .shoppingCartEventEditCursorCall
                    .eventTheme(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .eventDescription(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall
                        .eventDescription(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.eventDescriptionTextController?.text = ShoppingCartGroup
                    .shoppingCartEventEditCursorCall
                    .eventDescription(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            _model.ocKey =
                ShoppingCartGroup.shoppingCartEventEditCursorCall.ocKey(
              (_model.eventCursorOutput?.jsonBody ?? ''),
            );
            safeSetState(() {});
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall.bldgNum(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall.bldgNum(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.buildingNumberTextController?.text =
                    ShoppingCartGroup.shoppingCartEventEditCursorCall.bldgNum(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall.floorSection(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall.floorSection(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.flooreTextController?.text = ShoppingCartGroup
                    .shoppingCartEventEditCursorCall
                    .floorSection(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall.street(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall.street(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.strretNameTextController?.text =
                    ShoppingCartGroup.shoppingCartEventEditCursorCall.street(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall.cityTown(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall.cityTown(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.cityTownTextController?.text =
                    ShoppingCartGroup.shoppingCartEventEditCursorCall.cityTown(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall.stateProvince(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall.stateProvince(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.stateTextController?.text = ShoppingCartGroup
                    .shoppingCartEventEditCursorCall
                    .stateProvince(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
          Future(() async {
            if (ShoppingCartGroup.shoppingCartEventEditCursorCall.postalCode(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    null &&
                ShoppingCartGroup.shoppingCartEventEditCursorCall.postalCode(
                      (_model.eventCursorOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
              safeSetState(() {
                _model.stateTextController?.text = ShoppingCartGroup
                    .shoppingCartEventEditCursorCall
                    .postalCode(
                  (_model.eventCursorOutput?.jsonBody ?? ''),
                )!;
              });
            }
          }),
        ]);
        _model.apiLoaded = true;
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

    _model.eventNameTextController ??= TextEditingController();
    _model.eventNameFocusNode ??= FocusNode();

    _model.inquiryCommentsTextController ??= TextEditingController();
    _model.inquiryCommentsFocusNode ??= FocusNode();

    _model.celebrateeFirstNameTextController ??= TextEditingController();
    _model.celebrateeFirstNameFocusNode ??= FocusNode();

    _model.celebrateeLastNameTextController ??= TextEditingController();
    _model.celebrateeLastNameFocusNode ??= FocusNode();

    _model.celebrateeAgeTextController ??= TextEditingController();
    _model.celebrateeAgeFocusNode ??= FocusNode();

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.enterThemeTxtTextController ??= TextEditingController();
    _model.enterThemeTxtFocusNode ??= FocusNode();

    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.eventDescriptionTextController ??= TextEditingController();
    _model.eventDescriptionFocusNode ??= FocusNode();

    _model.addressTextController ??= TextEditingController();
    _model.addressFocusNode ??= FocusNode();

    _model.buildingNumberTextController ??= TextEditingController();
    _model.buildingNumberFocusNode ??= FocusNode();

    _model.postalCodeTextController ??= TextEditingController();
    _model.postalCodeFocusNode ??= FocusNode();

    _model.flooreTextController ??= TextEditingController();
    _model.flooreFocusNode ??= FocusNode();

    _model.strretNameTextController ??= TextEditingController();
    _model.strretNameFocusNode ??= FocusNode();

    _model.cityTownTextController ??= TextEditingController();
    _model.cityTownFocusNode ??= FocusNode();

    _model.stateTextController ??= TextEditingController();
    _model.stateFocusNode ??= FocusNode();

    _model.countryTextController ??= TextEditingController();
    _model.countryFocusNode ??= FocusNode();

    _model.loacalAreaTextController ??= TextEditingController();
    _model.loacalAreaFocusNode ??= FocusNode();

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
                '1ts7xg4h' /* Event Details */,
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
                    fontSize: 26.0,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.18,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.01,
                                  decoration: BoxDecoration(
                                    color: _model.first
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.18,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.01,
                                    decoration: BoxDecoration(
                                      color: _model.second
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.18,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.01,
                                  decoration: BoxDecoration(
                                    color: _model.third
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.18,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.01,
                                  decoration: BoxDecoration(
                                    color: _model.fourth
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 7.0)),
                        ),
                      ),
                    ),
                  ),
                  if (_model.first)
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Form(
                                    key: _model.formKey3,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.eventNameTextController,
                                                                        focusNode:
                                                                            _model.eventNameFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.eventNameTextController',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            if (_model.formKey3.currentState == null ||
                                                                                !_model.formKey3.currentState!.validate()) {
                                                                              return;
                                                                            }
                                                                            if (_model.celebrationTypeDropdownValue ==
                                                                                null) {
                                                                              return;
                                                                            }
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'yog334fv' /* Enter Event Name */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .eventNameTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child: FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: ShoppingCartGroup
                                                                          .cLBXEnCelebrationTypeCall
                                                                          .call(
                                                                        uiContext:
                                                                            '{\"key\":\"eventInfoForShoppingCart\",\"params\":{\"format\":[\"js\"],\"resourceType\":[\"0\"],\"from\":[\"venue\"],\"recordKey\":[\"225661\"],\"type\":[\"1\"]},\"component\":{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"clientState\":{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"cursor\":{\"__recordKey\":\"225661\",\"__cachedId\":\"${ShoppingCartGroup.shoppingCartEventEditCursorCall.ocKey(
                                                                          (_model.eventCursorOutput?.jsonBody ??
                                                                              ''),
                                                                        )}\"}}}}',
                                                                        token: FFAppState()
                                                                            .SessionToken,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 11.0,
                                                                              height: 11.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final celebrationTypeDropdownCLBXEnCelebrationTypeResponse =
                                                                            snapshot.data!;

                                                                        return FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.celebrationTypeDropdownValueController ??=
                                                                              FormFieldController<String>(
                                                                            _model.celebrationTypeDropdownValue ??=
                                                                                ShoppingCartGroup.shoppingCartEventEditCursorCall.eventCelebrationType(
                                                                              (_model.eventCursorOutput?.jsonBody ?? ''),
                                                                            ),
                                                                          ),
                                                                          options: List<String>.from(ShoppingCartGroup
                                                                              .cLBXEnCelebrationTypeCall
                                                                              .id(
                                                                            celebrationTypeDropdownCLBXEnCelebrationTypeResponse.jsonBody,
                                                                          )!),
                                                                          optionLabels: ShoppingCartGroup
                                                                              .cLBXEnCelebrationTypeCall
                                                                              .name(
                                                                            celebrationTypeDropdownCLBXEnCelebrationTypeResponse.jsonBody,
                                                                          )!,
                                                                          onChanged:
                                                                              (val) async {
                                                                            safeSetState(() =>
                                                                                _model.celebrationTypeDropdownValue = val);
                                                                            _model.setCelebrationTypeResponse =
                                                                                await ShoppingCartGroup.eventChangedCelebrationTypeCall.call(
                                                                              token: FFAppState().SessionToken,
                                                                              celebrationTypeId: _model.celebrationTypeDropdownValue,
                                                                              ocKey: _model.ocKey,
                                                                              clientState: '{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"cursor\":{\"__recordKey\":\"225661\",\"__cachedId\":\"${ShoppingCartGroup.shoppingCartEventEditCursorCall.ocKey(
                                                                                (_model.eventCursorOutput?.jsonBody ?? ''),
                                                                              )}\"}}',
                                                                            );

                                                                            if (!(_model.setCelebrationTypeResponse?.succeeded ??
                                                                                true)) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: Text('Oops'),
                                                                                      content: Text('Something went wrong'),
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

                                                                            safeSetState(() {});
                                                                          },
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              40.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            '15xsf4nb' /* Celebration Type... */,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isOverButton:
                                                                              false,
                                                                          isSearchable:
                                                                              false,
                                                                          isMultiSelect:
                                                                              false,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (widget.nextUI !=
                                                            null &&
                                                        widget.nextUI != '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'rdd00j1o' /* Inquiry */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .inquiryCommentsTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .inquiryCommentsFocusNode,
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'nsfydpfm' /* Enter your inquiry here */,
                                                                      ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    maxLines: 8,
                                                                    minLines: 2,
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    validator: _model
                                                                        .inquiryCommentsTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'd4t144rk' /* Guests */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'bpkzd0x6' /* Kids */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          42.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.38,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        FlutterFlowCountController(
                                                                      decrementIconBuilder:
                                                                          (enabled) =>
                                                                              Icon(
                                                                        Icons
                                                                            .remove_rounded,
                                                                        color: enabled
                                                                            ? FlutterFlowTheme.of(context).secondaryText
                                                                            : FlutterFlowTheme.of(context).alternate,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      incrementIconBuilder:
                                                                          (enabled) =>
                                                                              Icon(
                                                                        Icons
                                                                            .add_rounded,
                                                                        color: enabled
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).alternate,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      countBuilder:
                                                                          (count) =>
                                                                              Text(
                                                                        count
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                      count: _model
                                                                              .countControllerValue1 ??=
                                                                          functions.stringToInt(ShoppingCartGroup
                                                                              .shoppingCartEventEditCursorCall
                                                                              .noOfKids(
                                                                        (_model.eventCursorOutput?.jsonBody ??
                                                                            ''),
                                                                      ))!,
                                                                      updateCount:
                                                                          (count) async {
                                                                        safeSetState(() =>
                                                                            _model.countControllerValue1 =
                                                                                count);
                                                                        safeSetState(
                                                                            () {
                                                                          _model.countControllerValue3 =
                                                                              valueOrDefault<int>(
                                                                            (_model.countControllerValue1!) +
                                                                                (_model.countControllerValue2!),
                                                                            0,
                                                                          );
                                                                        });
                                                                      },
                                                                      stepSize:
                                                                          1,
                                                                      minimum:
                                                                          0,
                                                                      maximum:
                                                                          100,
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'oo67fcd7' /* Adults */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          42.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.38,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        FlutterFlowCountController(
                                                                      decrementIconBuilder:
                                                                          (enabled) =>
                                                                              Icon(
                                                                        Icons
                                                                            .remove_rounded,
                                                                        color: enabled
                                                                            ? FlutterFlowTheme.of(context).secondaryText
                                                                            : FlutterFlowTheme.of(context).alternate,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      incrementIconBuilder:
                                                                          (enabled) =>
                                                                              Icon(
                                                                        Icons
                                                                            .add_rounded,
                                                                        color: enabled
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).alternate,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      countBuilder:
                                                                          (count) =>
                                                                              Text(
                                                                        count
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                      count: _model
                                                                              .countControllerValue2 ??=
                                                                          functions.stringToInt(ShoppingCartGroup
                                                                              .shoppingCartEventEditCursorCall
                                                                              .noOfAdults(
                                                                        (_model.eventCursorOutput?.jsonBody ??
                                                                            ''),
                                                                      ))!,
                                                                      updateCount:
                                                                          (count) async {
                                                                        safeSetState(() =>
                                                                            _model.countControllerValue2 =
                                                                                count);
                                                                        safeSetState(
                                                                            () {
                                                                          _model.countControllerValue3 =
                                                                              ((_model.countControllerValue1!) + (_model.countControllerValue2!));
                                                                        });
                                                                      },
                                                                      stepSize:
                                                                          1,
                                                                      minimum:
                                                                          0,
                                                                      maximum:
                                                                          100,
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'lcp6c774' /* Total Invitees */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          42.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.38,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        FlutterFlowCountController(
                                                                      decrementIconBuilder:
                                                                          (enabled) =>
                                                                              Icon(
                                                                        Icons
                                                                            .remove_rounded,
                                                                        color: enabled
                                                                            ? FlutterFlowTheme.of(context).secondaryText
                                                                            : FlutterFlowTheme.of(context).alternate,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      incrementIconBuilder:
                                                                          (enabled) =>
                                                                              Icon(
                                                                        Icons
                                                                            .add_rounded,
                                                                        color: enabled
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).alternate,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      countBuilder:
                                                                          (count) =>
                                                                              Text(
                                                                        count
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                      count: _model
                                                                              .countControllerValue3 ??=
                                                                          functions.stringToInt(ShoppingCartGroup
                                                                              .shoppingCartEventEditCursorCall
                                                                              .totalInvitees(
                                                                        (_model.eventCursorOutput?.jsonBody ??
                                                                            ''),
                                                                      ))!,
                                                                      updateCount:
                                                                          (count) async {
                                                                        safeSetState(() =>
                                                                            _model.countControllerValue3 =
                                                                                count);
                                                                        safeSetState(
                                                                            () {
                                                                          _model.countControllerValue1 =
                                                                              0;
                                                                        });
                                                                        safeSetState(
                                                                            () {
                                                                          _model.countControllerValue2 =
                                                                              0;
                                                                        });
                                                                      },
                                                                      stepSize:
                                                                          1,
                                                                      minimum:
                                                                          0,
                                                                      maximum:
                                                                          100,
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
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
                                                                  'hc8vrx3b' /* Celebratee  */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleLargeIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .celebrateeFirstNameTextController,
                                                                focusNode: _model
                                                                    .celebrateeFirstNameFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'kjj79e31' /* Enter Celebratee Name */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .celebrateeFirstNameTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .celebrateeLastNameTextController,
                                                                focusNode: _model
                                                                    .celebrateeLastNameFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'fl8wxjvx' /* Enter Celebratee Last Name */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .celebrateeLastNameTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          16.0),
                                                                  child: FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future: ShoppingCartGroup
                                                                        .cLBXEnPersonGenderCall
                                                                        .call(
                                                                      token: FFAppState()
                                                                          .SessionToken,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                11.0,
                                                                            height:
                                                                                11.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final genderDropDownCLBXEnPersonGenderResponse =
                                                                          snapshot
                                                                              .data!;

                                                                      return FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.genderDropDownValueController ??=
                                                                                FormFieldController<String>(
                                                                          _model.genderDropDownValue ??= ShoppingCartGroup
                                                                              .shoppingCartEventEditCursorCall
                                                                              .celebrateeGender(
                                                                            (_model.eventCursorOutput?.jsonBody ??
                                                                                ''),
                                                                          ),
                                                                        ),
                                                                        options: List<String>.from(ShoppingCartGroup
                                                                            .cLBXEnPersonGenderCall
                                                                            .id(
                                                                          genderDropDownCLBXEnPersonGenderResponse
                                                                              .jsonBody,
                                                                        )!),
                                                                        optionLabels: ShoppingCartGroup
                                                                            .cLBXEnPersonGenderCall
                                                                            .text(
                                                                          genderDropDownCLBXEnPersonGenderResponse
                                                                              .jsonBody,
                                                                        )!,
                                                                        onChanged:
                                                                            (val) =>
                                                                                safeSetState(() => _model.genderDropDownValue = val),
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.4,
                                                                        height:
                                                                            40.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'ypt2tup7' /* Gender */,
                                                                        ),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        borderWidth:
                                                                            1.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            false,
                                                                        isSearchable:
                                                                            false,
                                                                        isMultiSelect:
                                                                            false,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            16.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .celebrateeAgeTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .celebrateeAgeFocusNode,
                                                                      autofocus:
                                                                          false,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'y7czdbhj' /* Celebratee Age */,
                                                                        ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .celebrateeAgeTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                      inputFormatters: [
                                                                        FilteringTextInputFormatter.allow(
                                                                            RegExp('[0-9]'))
                                                                      ],
                                                                    ),
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
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey3.currentState == null ||
                                      !_model.formKey3.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.celebrationTypeDropdownValue ==
                                      null) {
                                    return;
                                  }
                                  _model.second = true;
                                  _model.first = false;
                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'tkw2fsiy' /* Next */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsets.all(8.0),
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
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ],
                      ),
                    ),
                  if (_model.second)
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Form(
                                    key: _model.formKey2,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (_model.apiLoaded)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.47,
                                                              child: custom_widgets
                                                                  .CustomCalendar2(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.7,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.47,
                                                                disabledDays: _model
                                                                    .disabledDays,
                                                                preselectedDate:
                                                                    functions.convertStringToDate(ShoppingCartGroup
                                                                        .shoppingCartEventEditCursorCall
                                                                        .eventDate(
                                                                  (_model.eventCursorOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!)!,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .timerPickerCompModel1,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    TimerPickerCompWidget(
                                                                  startTime: 0,
                                                                  endTime:
                                                                      84600,
                                                                  initialHr: functions.getHourFromDateTime(functions.getTimeFromString(
                                                                      ShoppingCartGroup
                                                                          .shoppingCartEventEditCursorCall
                                                                          .eventStartTime(
                                                                    (_model.eventCursorOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!)),
                                                                  initMin: functions.getMinutesFromDateTime(functions.getTimeFromString(
                                                                      ShoppingCartGroup
                                                                          .shoppingCartEventEditCursorCall
                                                                          .eventStartTime(
                                                                    (_model.eventCursorOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!)),
                                                                  label:
                                                                      'Start Time : ',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .timerPickerCompModel2,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    TimerPickerCompWidget(
                                                                  startTime: 0,
                                                                  endTime:
                                                                      84600,
                                                                  initialHr: functions.getHourFromDateTime(functions.getTimeFromString(
                                                                      ShoppingCartGroup
                                                                          .shoppingCartEventEditCursorCall
                                                                          .eventEndTime(
                                                                    (_model.eventCursorOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!)),
                                                                  initMin: functions.getMinutesFromDateTime(functions.getTimeFromString(
                                                                      ShoppingCartGroup
                                                                          .shoppingCartEventEditCursorCall
                                                                          .eventEndTime(
                                                                    (_model.eventCursorOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!)),
                                                                  label:
                                                                      'End Time : ',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.second = false;
                                  _model.first = true;
                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'objhvpcs' /* Back */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsets.all(8.0),
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
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model
                                          .timerPickerCompModel1.selectedTime! <
                                      _model.timerPickerCompModel2
                                          .selectedTime!) {
                                    _model.third = true;
                                    _model.second = false;
                                    safeSetState(() {});
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please ensure the start time is earlier than the end time',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 2050),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                    );
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'mo547pii' /* Next */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsets.all(8.0),
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
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ],
                      ),
                    ),
                  if (_model.fourth)
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Form(
                                    key: _model.formKey1,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Container(
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Color(0x00000000),
                                                  child: ExpandableNotifier(
                                                    controller: _model
                                                        .expandableExpandableController1,
                                                    child: ExpandablePanel(
                                                      header: Padding(
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
                                                            'spzsftk1' /* Theme */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLargeIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      collapsed: Container(),
                                                      expanded:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          2.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.3,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '6gmvfafs' /* Has Theme : */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              visualDensity: VisualDensity.compact,
                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.checkboxValue ??= functions.stringToBool(ShoppingCartGroup.shoppingCartEventEditCursorCall.hasTheme(
                                                                                  (_model.eventCursorOutput?.jsonBody ?? ''),
                                                                                )) ==
                                                                                true,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              safeSetState(() => _model.checkboxValue = newValue!);

                                                                              if (!newValue!) {
                                                                                safeSetState(() {
                                                                                  _model.themeCatDropDownValueController?.value = ("");
                                                                                });
                                                                                safeSetState(() {
                                                                                  _model.enterThemeTxtTextController?.text = '';
                                                                                });
                                                                              }
                                                                            },
                                                                            side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                ? BorderSide(
                                                                                    width: 2,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  )
                                                                                : null,
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            checkColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: ShoppingCartGroup
                                                                          .dynamicThemeCategoryCall
                                                                          .call(
                                                                        token: FFAppState()
                                                                            .SessionToken,
                                                                        uiContext:
                                                                            '{\"key\":\"eventInfoForShoppingCart\",\"params\":{\"format\":[\"js\"],\"resourceType\":[\"0\"],\"from\":[\"venue\"],\"recordKey\":[\"225661\"],\"type\":[\"1\"]},\"component\":{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"clientState\":{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"cursor\":{\"__recordKey\":\"225661\",\"__cachedId\":\"${ShoppingCartGroup.shoppingCartEventEditCursorCall.ocKey(
                                                                          (_model.eventCursorOutput?.jsonBody ??
                                                                              ''),
                                                                        )}\"}}}}',
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 11.0,
                                                                              height: 11.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final themeCatDropDownDynamicThemeCategoryResponse =
                                                                            snapshot.data!;

                                                                        return FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.themeCatDropDownValueController ??=
                                                                              FormFieldController<String>(
                                                                            _model.themeCatDropDownValue ??= functions.stringToBool(ShoppingCartGroup.shoppingCartEventEditCursorCall.hasTheme(
                                                                              (_model.eventCursorOutput?.jsonBody ?? ''),
                                                                            ))
                                                                                ? ShoppingCartGroup.shoppingCartEventEditCursorCall.eventThemeCategory(
                                                                                    (_model.eventCursorOutput?.jsonBody ?? ''),
                                                                                  )
                                                                                : '',
                                                                          ),
                                                                          options: List<String>.from(ShoppingCartGroup
                                                                              .dynamicThemeCategoryCall
                                                                              .id(
                                                                            themeCatDropDownDynamicThemeCategoryResponse.jsonBody,
                                                                          )!),
                                                                          optionLabels: ShoppingCartGroup
                                                                              .dynamicThemeCategoryCall
                                                                              .text(
                                                                            themeCatDropDownDynamicThemeCategoryResponse.jsonBody,
                                                                          )!,
                                                                          onChanged: (val) =>
                                                                              safeSetState(() => _model.themeCatDropDownValue = val),
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.5,
                                                                          height:
                                                                              40.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'iszmzk1u' /* Theme Category */,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          borderWidth:
                                                                              0.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          disabled:
                                                                              _model.checkboxValue == false,
                                                                          isOverButton:
                                                                              false,
                                                                          isSearchable:
                                                                              false,
                                                                          isMultiSelect:
                                                                              false,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .enterThemeTxtTextController,
                                                                  focusNode: _model
                                                                      .enterThemeTxtFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  readOnly:
                                                                      _model.checkboxValue ==
                                                                          false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'okva6e55' /* Enter Theme */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  validator: _model
                                                                      .enterThemeTxtTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
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
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                color: Color(0x00000000),
                                                child: ExpandableNotifier(
                                                  controller: _model
                                                      .expandableExpandableController2,
                                                  child: ExpandablePanel(
                                                    header: Padding(
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
                                                          'rnmea9os' /* Alternate Date */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLargeIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                    collapsed: Container(),
                                                    expanded:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
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
                                                                    'v5mrve5q' /* Alternate date 1  */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.7,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.47,
                                                            child: custom_widgets
                                                                .AltDate1Event(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.47,
                                                              disabledDays: _model
                                                                  .disabledDays,
                                                              preselectedDate: functions
                                                                  .convertStringToDate(
                                                                      ShoppingCartGroup
                                                                          .shoppingCartEventEditCursorCall
                                                                          .altDate1(
                                                                (_model.eventCursorOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
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
                                                                    'how3kjm5' /* Alternate date 2 */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.47,
                                                              child: custom_widgets
                                                                  .AltDate2Event(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.7,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.47,
                                                                disabledDays: _model
                                                                    .disabledDays,
                                                                preselectedDate:
                                                                    functions.convertStringToDate(ShoppingCartGroup
                                                                        .shoppingCartEventEditCursorCall
                                                                        .altDate2(
                                                                  (_model.eventCursorOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!),
                                                              ),
                                                            ),
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  border: Border
                                                                      .all(
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'gq14x713' /* Alternate Date 1 */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .calendar_today,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  border: Border
                                                                      .all(
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'jiv9oi2s' /* Alternate Date 2 */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .calendar_today,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
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
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Container(
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Color(0x00000000),
                                                  child: ExpandableNotifier(
                                                    controller: _model
                                                        .expandableExpandableController3,
                                                    child: ExpandablePanel(
                                                      header: Padding(
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
                                                            'q76i13bg' /* OtherDetails */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLargeIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      collapsed: Container(),
                                                      expanded:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .eventDescriptionTextController,
                                                                  focusNode: _model
                                                                      .eventDescriptionFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '64u4j34f' /* Description */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  validator: _model
                                                                      .eventDescriptionTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: ShoppingCartGroup
                                                                    .cLBXEnEventStatusCall
                                                                    .call(
                                                                  token: FFAppState()
                                                                      .SessionToken,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            11.0,
                                                                        height:
                                                                            11.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final eventStatusDropDownCLBXEnEventStatusResponse =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .eventStatusDropDownValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.eventStatusDropDownValue ??= ShoppingCartGroup
                                                                          .shoppingCartEventEditCursorCall
                                                                          .eventStatus(
                                                                        (_model.eventCursorOutput?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                    ),
                                                                    options: List<
                                                                            String>.from(
                                                                        ShoppingCartGroup
                                                                            .cLBXEnEventStatusCall
                                                                            .id(
                                                                      eventStatusDropDownCLBXEnEventStatusResponse
                                                                          .jsonBody,
                                                                    )!),
                                                                    optionLabels:
                                                                        ShoppingCartGroup
                                                                            .cLBXEnEventStatusCall
                                                                            .text(
                                                                      eventStatusDropDownCLBXEnEventStatusResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.eventStatusDropDownValue =
                                                                                val),
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        40.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ioztfr0p' /* Event Status */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
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
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.third = true;
                                  _model.fourth = false;
                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  '8jqhyzdg' /* Back */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsets.all(8.0),
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
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.eventSaveResponse =
                                      await ShoppingCartGroup
                                          .eventFormNextActionCall
                                          .call(
                                    id: ShoppingCartGroup
                                        .shoppingCartEventEditCursorCall
                                        .ocKey(
                                      (_model.eventCursorOutput?.jsonBody ??
                                          ''),
                                    ),
                                    token: FFAppState().SessionToken,
                                    upComingEvent: ShoppingCartGroup
                                        .shoppingCartEventEditCursorCall
                                        .upComingEvent(
                                      (_model.eventCursorOutput?.jsonBody ??
                                          ''),
                                    ),
                                    eventname:
                                        _model.eventNameTextController.text,
                                    eventcelebration:
                                        _model.celebrationTypeDropdownValue,
                                    email: ShoppingCartGroup
                                        .shoppingCartEventEditCursorCall
                                        .email(
                                      (_model.eventCursorOutput?.jsonBody ??
                                          ''),
                                    ),
                                    phone: ShoppingCartGroup
                                        .shoppingCartEventEditCursorCall
                                        .phone(
                                      (_model.eventCursorOutput?.jsonBody ??
                                          ''),
                                    ),
                                    eventidealDate: functions.dateToString(
                                        FFAppState().customCalendar2Selection),
                                    noOfKids: _model.countControllerValue1,
                                    noOfAdults: _model.countControllerValue2,
                                    totalInvitees: _model.countControllerValue3,
                                    celebrateeFirstName: _model
                                        .celebrateeFirstNameTextController.text,
                                    celebrateeLastName: _model
                                        .celebrateeLastNameTextController.text,
                                    celebrateeAge:
                                        _model.celebrateeAgeTextController.text,
                                    celebrateeGender:
                                        _model.genderDropDownValue,
                                    eventdescription: _model
                                        .eventDescriptionTextController.text,
                                    opsHoursstartTime:
                                        functions.getTimeFromDateNTime(_model
                                            .timerPickerCompModel1
                                            .selectedTime!),
                                    opsHoursendTime:
                                        functions.getTimeFromDateNTime(_model
                                            .timerPickerCompModel2
                                            .selectedTime!),
                                    eventadditionalInfoidealDateAlt1:
                                        FFAppState().altDate1Event != null
                                            ? functions.dateToString(
                                                FFAppState().altDate1Event)
                                            : '',
                                    eventadditionalInfoidealDateAlt2:
                                        FFAppState().ItemAltDate2 != null
                                            ? functions.dateToString(
                                                FFAppState().ItemAltDate2)
                                            : '',
                                    hasTheme: _model.checkboxValue,
                                    eventthemeCategory: _model.checkboxValue!
                                        ? _model.themeCatDropDownValue
                                        : '',
                                    eventtheme:
                                        _model.enterThemeTxtTextController.text,
                                    eventeventStatus:
                                        _model.eventStatusDropDownValue,
                                    eventaddressstreet:
                                        _model.strretNameTextController.text,
                                    eventaddresscityTown:
                                        _model.cityTownTextController.text,
                                    eventaddressstateProvince:
                                        _model.stateTextController.text,
                                    eventaddresspostalCode:
                                        _model.postalCodeTextController.text,
                                    eventaddressbldgNum: _model
                                        .buildingNumberTextController.text,
                                    inquireComments: _model
                                        .inquiryCommentsTextController.text,
                                    next: widget.nextUI,
                                    recordKey: functions
                                        .stringToInt(widget.recordKey),
                                    from: widget.from,
                                  );

                                  if ((_model.eventSaveResponse?.succeeded ??
                                      true)) {
                                    if (ShoppingCartGroup
                                            .eventFormNextActionCall
                                            .actionSuccess(
                                          (_model.eventSaveResponse?.jsonBody ??
                                              ''),
                                        ) ==
                                        true) {
                                      FFAppState().altDate1Event = null;
                                      FFAppState().altDate2Event = null;
                                      if (widget.customCake) {
                                        context.pushNamed(
                                          CustomCakeDNTWidget.routeName,
                                          queryParameters: {
                                            'bakeryId': serializeParam(
                                              widget.type,
                                              ParamType.String,
                                            ),
                                            'menuSectionId': serializeParam(
                                              widget.packageId,
                                              ParamType.String,
                                            ),
                                            'index': serializeParam(
                                              widget.recordKey,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        if (widget.nextUI ==
                                            'checkoutGreetingUI') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Inquiry sent to vendor',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          );

                                          context.pushNamed(
                                              HomePageWidget.routeName);
                                        } else {
                                          if (widget.denominatorId!) {
                                            context.pushNamed(
                                              PackageVariationPageWidget
                                                  .routeName,
                                              queryParameters: {
                                                'resourceItemId':
                                                    serializeParam(
                                                  functions
                                                      .stringToInt(widget
                                                          .resourceItemId)
                                                      ?.toString(),
                                                  ParamType.String,
                                                ),
                                                'recordKey': serializeParam(
                                                  functions.stringToInt(
                                                      widget.recordKey),
                                                  ParamType.int,
                                                ),
                                                'type': serializeParam(
                                                  functions.stringToInt(
                                                      widget.type),
                                                  ParamType.int,
                                                ),
                                                'spaceId': serializeParam(
                                                  widget.spaceId != null &&
                                                          widget.spaceId != ''
                                                      ? functions.stringToInt(
                                                          widget.spaceId)
                                                      : null,
                                                  ParamType.int,
                                                ),
                                                'packageId': serializeParam(
                                                  widget.packageId != null &&
                                                          widget.packageId !=
                                                              ''
                                                      ? functions.stringToInt(
                                                          widget.packageId)
                                                      : null,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            context.pushNamed(
                                              DateAndTimeTab1Widget.routeName,
                                              queryParameters: {
                                                'recordKey': serializeParam(
                                                  functions.stringToInt(
                                                      widget.recordKey),
                                                  ParamType.int,
                                                ),
                                                'type': serializeParam(
                                                  functions.stringToInt(
                                                      widget.type),
                                                  ParamType.int,
                                                ),
                                                'packageId': serializeParam(
                                                  widget.packageId != null &&
                                                          widget.packageId !=
                                                              ''
                                                      ? functions.stringToInt(
                                                          widget.packageId)
                                                      : null,
                                                  ParamType.int,
                                                ),
                                                'denominatorId': serializeParam(
                                                  null,
                                                  ParamType.int,
                                                ),
                                                'spaceId': serializeParam(
                                                  widget.spaceId != null &&
                                                          widget.spaceId != ''
                                                      ? functions.stringToInt(
                                                          widget.spaceId)
                                                      : null,
                                                  ParamType.int,
                                                ),
                                                'resourceItemType':
                                                    serializeParam(
                                                  widget.resourceItemType,
                                                  ParamType.String,
                                                ),
                                                'quantity': serializeParam(
                                                  widget.quantitys,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        }
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            ShoppingCartGroup
                                                .eventFormNextActionCall
                                                .errorToastMsg(
                                              (_model.eventSaveResponse
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
                                              Duration(milliseconds: 2150),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      );
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('Oops'),
                                            content:
                                                Text('Something went wrong'),
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
                                  '8vlnpzf8' /* Next */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsets.all(8.0),
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
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ],
                      ),
                    ),
                  if (_model.third)
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.third = false;
                                            _model.fourth = true;
                                            safeSetState(() {});
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'j2b24yg5' /* Skip */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  letterSpacing: 0.0,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeIsCustom,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'xf63u505' /* Address */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLargeIsCustom,
                                              ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                    TextFormField(
                                      controller: _model.addressTextController,
                                      focusNode: _model.addressFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.addressTextController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          _model.showAddressSuggestion = true;
                                          _model.populateAddressOutput =
                                              await ShoppingCartGroup
                                                  .eventAddressCall
                                                  .call(
                                            token: FFAppState().SessionToken,
                                            addressToSearch: _model
                                                .addressTextController.text,
                                            id: _model.ocKey,
                                            clientState:
                                                '{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"cursor\":{\"__recordKey\":\"88242\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                          );

                                          await Future.wait([
                                            Future(() async {
                                              safeSetState(() {
                                                _model.buildingNumberTextController
                                                        ?.text =
                                                    ShoppingCartGroup
                                                        .eventAddressCall
                                                        .buildno(
                                                  (_model.populateAddressOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                              });
                                            }),
                                            Future(() async {
                                              safeSetState(() {
                                                _model.postalCodeTextController
                                                        ?.text =
                                                    ShoppingCartGroup
                                                        .eventAddressCall
                                                        .postalcode(
                                                  (_model.populateAddressOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                              });
                                            }),
                                            Future(() async {
                                              safeSetState(() {
                                                _model.strretNameTextController
                                                        ?.text =
                                                    ShoppingCartGroup
                                                        .eventAddressCall
                                                        .street(
                                                  (_model.populateAddressOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                              });
                                            }),
                                            Future(() async {
                                              safeSetState(() {
                                                _model.cityTownTextController
                                                        ?.text =
                                                    ShoppingCartGroup
                                                        .eventAddressCall
                                                        .city(
                                                  (_model.populateAddressOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                              });
                                            }),
                                            Future(() async {
                                              safeSetState(() {
                                                _model.stateTextController
                                                        ?.text =
                                                    ShoppingCartGroup
                                                        .eventAddressCall
                                                        .state(
                                                  (_model.populateAddressOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                              });
                                            }),
                                          ]);

                                          safeSetState(() {});
                                        },
                                      ),
                                      onFieldSubmitted: (_) async {
                                        _model.showAddressSuggestion = false;
                                      },
                                      autofocus: false,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'ozd98cqj' /* Type Street Address .... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyLargeIsCustom,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        suffixIcon: Icon(
                                          Icons.place,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyLargeIsCustom,
                                          ),
                                      maxLines: null,
                                      validator: _model
                                          .addressTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        if (!isAndroid && !isiOS)
                                          TextInputFormatter.withFunction(
                                              (oldValue, newValue) {
                                            return TextEditingValue(
                                              selection: newValue.selection,
                                              text: newValue.text
                                                  .toCapitalization(
                                                      TextCapitalization.words),
                                            );
                                          }),
                                      ],
                                    ),
                                    if (_model.showAddressSuggestion)
                                      FutureBuilder<ApiCallResponse>(
                                        future: ShoppingCartGroup
                                            .eventAddressSuggestionCall
                                            .call(
                                          query:
                                              _model.addressTextController.text,
                                          token: FFAppState().SessionToken,
                                          uiContext:
                                              '{\"key\":\"eventInfoForShoppingCart\",\"params\":{\"format\":[\"js\"],\"resourceType\":[\"0\"],\"from\":[\"venue\"],\"recordKey\":[\"88242\"],\"type\":[\"1\"]},\"component\":{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"clientState\":{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"cursor\":{\"__recordKey\":\"88242\",\"__cachedId\":\"${_model.ocKey}\"}}}}',
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
                                          final addresSuggestinContainerEventAddressSuggestionResponse =
                                              snapshot.data!;

                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x1E000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                  spreadRadius: 0.0,
                                                )
                                              ],
                                            ),
                                            child: Visibility(
                                              visible: ShoppingCartGroup
                                                      .eventAddressSuggestionCall
                                                      .totalCount(
                                                    addresSuggestinContainerEventAddressSuggestionResponse
                                                        .jsonBody,
                                                  )! >
                                                  1,
                                              child: Builder(
                                                builder: (context) {
                                                  final item = ShoppingCartGroup
                                                          .eventAddressSuggestionCall
                                                          .text(
                                                            addresSuggestinContainerEventAddressSuggestionResponse
                                                                .jsonBody,
                                                          )
                                                          ?.toList() ??
                                                      [];

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: item.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 10.0),
                                                    itemBuilder:
                                                        (context, itemIndex) {
                                                      final itemItem =
                                                          item[itemIndex];
                                                      return Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            safeSetState(() {
                                                              _model.addressTextController
                                                                      ?.text =
                                                                  itemItem;
                                                            });
                                                            _model.populateAddressOutput2 =
                                                                await ShoppingCartGroup
                                                                    .eventAddressCall
                                                                    .call(
                                                              token: FFAppState()
                                                                  .SessionToken,
                                                              addressToSearch:
                                                                  _model
                                                                      .addressTextController
                                                                      .text,
                                                              id: _model.ocKey,
                                                              clientState:
                                                                  '{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"cursor\":{\"__recordKey\":\"88242\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                            );

                                                            await Future.wait([
                                                              Future(() async {
                                                                safeSetState(
                                                                    () {
                                                                  _model.buildingNumberTextController
                                                                          ?.text =
                                                                      ShoppingCartGroup
                                                                          .eventAddressCall
                                                                          .buildno(
                                                                    (_model.populateAddressOutput2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!;
                                                                });
                                                              }),
                                                              Future(() async {
                                                                safeSetState(
                                                                    () {
                                                                  _model.postalCodeTextController
                                                                          ?.text =
                                                                      ShoppingCartGroup
                                                                          .eventAddressCall
                                                                          .postalcode(
                                                                    (_model.populateAddressOutput2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!;
                                                                });
                                                              }),
                                                              Future(() async {
                                                                safeSetState(
                                                                    () {
                                                                  _model.strretNameTextController
                                                                          ?.text =
                                                                      ShoppingCartGroup
                                                                          .eventAddressCall
                                                                          .street(
                                                                    (_model.populateAddressOutput2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!;
                                                                });
                                                              }),
                                                              Future(() async {
                                                                safeSetState(
                                                                    () {
                                                                  _model.cityTownTextController
                                                                          ?.text =
                                                                      ShoppingCartGroup
                                                                          .eventAddressCall
                                                                          .city(
                                                                    (_model.populateAddressOutput2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!;
                                                                });
                                                              }),
                                                              Future(() async {
                                                                safeSetState(
                                                                    () {
                                                                  _model.stateTextController
                                                                          ?.text =
                                                                      ShoppingCartGroup
                                                                          .eventAddressCall
                                                                          .state(
                                                                    (_model.populateAddressOutput2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!;
                                                                });
                                                              }),
                                                            ]);
                                                            _model.showAddressSuggestion =
                                                                false;

                                                            safeSetState(() {});
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .search_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  itemItem,
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
                                                            ].divide(SizedBox(
                                                                width: 7.0)),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: TextFormField(
                                            controller: _model
                                                .buildingNumberTextController,
                                            focusNode:
                                                _model.buildingNumberFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'y39wm9f1' /* Building Number */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                            validator: _model
                                                .buildingNumberTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              if (!isAndroid && !isiOS)
                                                TextInputFormatter.withFunction(
                                                    (oldValue, newValue) {
                                                  return TextEditingValue(
                                                    selection:
                                                        newValue.selection,
                                                    text: newValue.text
                                                        .toCapitalization(
                                                            TextCapitalization
                                                                .words),
                                                  );
                                                }),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: TextFormField(
                                            controller:
                                                _model.postalCodeTextController,
                                            focusNode:
                                                _model.postalCodeFocusNode,
                                            autofocus: false,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'cet20nrx' /* Postal Code */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .postalCodeTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: TextFormField(
                                            controller:
                                                _model.flooreTextController,
                                            focusNode: _model.flooreFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'wo3igxf5' /* Floor/Section */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                            validator: _model
                                                .flooreTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              if (!isAndroid && !isiOS)
                                                TextInputFormatter.withFunction(
                                                    (oldValue, newValue) {
                                                  return TextEditingValue(
                                                    selection:
                                                        newValue.selection,
                                                    text: newValue.text
                                                        .toCapitalization(
                                                            TextCapitalization
                                                                .words),
                                                  );
                                                }),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: TextFormField(
                                            controller:
                                                _model.strretNameTextController,
                                            focusNode:
                                                _model.strretNameFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'ndj00ybk' /* Street Name */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                            minLines: 1,
                                            validator: _model
                                                .strretNameTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              if (!isAndroid && !isiOS)
                                                TextInputFormatter.withFunction(
                                                    (oldValue, newValue) {
                                                  return TextEditingValue(
                                                    selection:
                                                        newValue.selection,
                                                    text: newValue.text
                                                        .toCapitalization(
                                                            TextCapitalization
                                                                .words),
                                                  );
                                                }),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: TextFormField(
                                            controller:
                                                _model.cityTownTextController,
                                            focusNode: _model.cityTownFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '9umg2isn' /* City/Town */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                            validator: _model
                                                .cityTownTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              if (!isAndroid && !isiOS)
                                                TextInputFormatter.withFunction(
                                                    (oldValue, newValue) {
                                                  return TextEditingValue(
                                                    selection:
                                                        newValue.selection,
                                                    text: newValue.text
                                                        .toCapitalization(
                                                            TextCapitalization
                                                                .words),
                                                  );
                                                }),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: TextFormField(
                                            controller:
                                                _model.stateTextController,
                                            focusNode: _model.stateFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'doq9c9xj' /* State */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                            validator: _model
                                                .stateTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              if (!isAndroid && !isiOS)
                                                TextInputFormatter.withFunction(
                                                    (oldValue, newValue) {
                                                  return TextEditingValue(
                                                    selection:
                                                        newValue.selection,
                                                    text: newValue.text
                                                        .toCapitalization(
                                                            TextCapitalization
                                                                .words),
                                                  );
                                                }),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: TextFormField(
                                            controller:
                                                _model.countryTextController,
                                            focusNode: _model.countryFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            textInputAction:
                                                TextInputAction.done,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'hq5fa0sn' /* Country */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                            maxLines: null,
                                            validator: _model
                                                .countryTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              if (!isAndroid && !isiOS)
                                                TextInputFormatter.withFunction(
                                                    (oldValue, newValue) {
                                                  return TextEditingValue(
                                                    selection:
                                                        newValue.selection,
                                                    text: newValue.text
                                                        .toCapitalization(
                                                            TextCapitalization
                                                                .words),
                                                  );
                                                }),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: TextFormField(
                                            controller:
                                                _model.loacalAreaTextController,
                                            focusNode:
                                                _model.loacalAreaFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            textInputAction:
                                                TextInputAction.done,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'nwoib6zc' /* Local Area */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLargeIsCustom,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                            maxLines: null,
                                            validator: _model
                                                .loacalAreaTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              if (!isAndroid && !isiOS)
                                                TextInputFormatter.withFunction(
                                                    (oldValue, newValue) {
                                                  return TextEditingValue(
                                                    selection:
                                                        newValue.selection,
                                                    text: newValue.text
                                                        .toCapitalization(
                                                            TextCapitalization
                                                                .words),
                                                  );
                                                }),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 11.0)),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.second = true;
                                  _model.third = false;
                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  '4a5mefx8' /* Back */,
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
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.third = false;
                                  _model.fourth = true;
                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'cssv9i0q' /* next */,
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
    );
  }
}
