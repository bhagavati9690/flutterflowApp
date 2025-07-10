import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'custom_cake_delivery_tab_model.dart';
export 'custom_cake_delivery_tab_model.dart';

class CustomCakeDeliveryTabWidget extends StatefulWidget {
  const CustomCakeDeliveryTabWidget({
    super.key,
    this.recordKey,
    this.parentRecordKey,
    this.index,
  });

  final String? recordKey;
  final String? parentRecordKey;
  final String? index;

  static String routeName = 'customCakeDeliveryTab';
  static String routePath = 'customCakeDeliveryTab';

  @override
  State<CustomCakeDeliveryTabWidget> createState() =>
      _CustomCakeDeliveryTabWidgetState();
}

class _CustomCakeDeliveryTabWidgetState
    extends State<CustomCakeDeliveryTabWidget> {
  late CustomCakeDeliveryTabModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomCakeDeliveryTabModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.deliveryCursor = await CustomCakeTwoGroup
          .cakeItemPriceAndDeliveryCursorForCustomItemCall
          .call(
        recordKey: widget.recordKey,
        parentRecordKey: widget.parentRecordKey,
        index: widget.index,
        token: FFAppState().SessionToken,
        clientState:
            '{\"clientId\":\"customCakeForMenuSectionToCart__customCakeCartWizardTabPanel\",\"index\":10,\"staticTabs\":[{\"tabName\":\"cakeFlavours\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeFillings\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeIcingsTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeShapesTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeColorTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"0\"},{\"tabName\":\"cakeLayersTab\",\"recordKey\":\"2611\",\"parentRecordKey\":\"-1\",\"index\":\"${widget.index}\"}]}',
      );

      if ((_model.deliveryCursor?.succeeded ?? true)) {
        _model.ocKey = CustomCakeTwoGroup
            .cakeItemPriceAndDeliveryCursorForCustomItemCall
            .id(
          (_model.deliveryCursor?.jsonBody ?? ''),
        );
        _model.unitPrice = CustomCakeTwoGroup
            .cakeItemPriceAndDeliveryCursorForCustomItemCall
            .unitPrice(
          (_model.deliveryCursor?.jsonBody ?? ''),
        );
        _model.totalPrice = CustomCakeTwoGroup
            .cakeItemPriceAndDeliveryCursorForCustomItemCall
            .totalPrice(
          (_model.deliveryCursor?.jsonBody ?? ''),
        );
        _model.standDist = CustomCakeTwoGroup
            .cakeItemPriceAndDeliveryCursorForCustomItemCall
            .standarddistance(
          (_model.deliveryCursor?.jsonBody ?? ''),
        );
        _model.standRate = CustomCakeTwoGroup
            .cakeItemPriceAndDeliveryCursorForCustomItemCall
            .standardPlusdeliveryRate(
          (_model.deliveryCursor?.jsonBody ?? ''),
        );
        _model.currentTravelDistance = CustomCakeTwoGroup
            .cakeItemPriceAndDeliveryCursorForCustomItemCall
            .distance(
          (_model.deliveryCursor?.jsonBody ?? ''),
        );
        _model.travelDeliveryFees = CustomCakeTwoGroup
            .cakeItemPriceAndDeliveryCursorForCustomItemCall
            .travelFeesperDistance(
          (_model.deliveryCursor?.jsonBody ?? ''),
        );
        _model.travelFees = CustomCakeTwoGroup
            .cakeItemPriceAndDeliveryCursorForCustomItemCall
            .deliveryFeePerUnit(
          (_model.deliveryCursor?.jsonBody ?? ''),
        );
        safeSetState(() {
          _model.countControllerValue = functions.stringToInt(CustomCakeTwoGroup
              .cakeItemPriceAndDeliveryCursorForCustomItemCall
              .quantity(
            (_model.deliveryCursor?.jsonBody ?? ''),
          ))!;
        });
        safeSetState(() {
          _model.switchValue = (CustomCakeTwoGroup
                  .cakeItemPriceAndDeliveryCursorForCustomItemCall
                  .deliveryType(
                (_model.deliveryCursor?.jsonBody ?? ''),
              ) ==
              '1');
        });
        safeSetState(() {
          _model.addressTextController?.text = CustomCakeTwoGroup
              .cakeItemPriceAndDeliveryCursorForCustomItemCall
              .address(
            (_model.deliveryCursor?.jsonBody ?? ''),
          )!;
        });
        safeSetState(() {
          _model.textController1?.text = CustomCakeTwoGroup
              .cakeItemPriceAndDeliveryCursorForCustomItemCall
              .customText(
            (_model.deliveryCursor?.jsonBody ?? ''),
          )!;
        });
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

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue = true;
    _model.addressTextController ??= TextEditingController();
    _model.addressFocusNode ??= FocusNode();

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
                'lo0p1whz' /* Price */,
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
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'l7vj7ey4' /* Quantity */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleLargeIsCustom,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 120.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              Icon(
                                            Icons.remove_rounded,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 24.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              Icon(
                                            Icons.add_rounded,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 24.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
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
                                          count: _model.countControllerValue ??=
                                              1,
                                          updateCount: (count) async {
                                            safeSetState(() => _model
                                                .countControllerValue = count);
                                            _model.countChanged =
                                                await CustomCakeTwoGroup
                                                    .deliveryPageQuantityChangedCall
                                                    .call(
                                              index: widget.index,
                                              quantity: _model
                                                  .countControllerValue
                                                  ?.toString(),
                                              id: _model.ocKey,
                                              token: FFAppState().SessionToken,
                                              clientState:
                                                  '{\"clientId\":\"contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm\",\"cursor\":{\"recordKey\":\"2611\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                            );

                                            if ((_model
                                                    .countChanged?.succeeded ??
                                                true)) {
                                              _model.totalPrice = CustomCakeTwoGroup
                                                  .deliveryPageQuantityChangedCall
                                                  .totalPrice(
                                                (_model.countChanged
                                                        ?.jsonBody ??
                                                    ''),
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                          stepSize: 1,
                                          maximum: 10,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          'Unit Price : \$${_model.unitPrice}',
                                          style: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
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
                                  16.0, 16.0, 16.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '7t4ks2t9' /* Cake Message */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleLargeIsCustom,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 3.0),
                                          child: Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController1,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'csh6cnto' /* Enter Cake Message here */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
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
                                                    FlutterFlowTheme.of(context)
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
                                                  .textController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'hidtz7i5' /* Cake message Color  */,
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
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5gm42kh7' /* Option 1 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ksqnv7ls' /* Option 2 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qgfewomm' /* Option 3 */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () =>
                                                    _model.dropDownValue = val),
                                            width: 150.0,
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
                                              'b9euyc1d' /* Select... */,
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 45.0),
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
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'i5agzqtn' /* Delivery Details */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.roboto(
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
                                      height: 10.0,
                                      thickness: 2.0,
                                      color: Color(0xFFE0E3E7),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'hzqy70ka' /* Delivery Type */,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5ucijkbm' /* Delivery */,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Switch.adaptive(
                                                value: _model.switchValue!,
                                                onChanged: (newValue) async {
                                                  safeSetState(() => _model
                                                      .switchValue = newValue);
                                                  if (newValue) {
                                                    _model.deliveryTypechanged =
                                                        await CustomCakeTwoGroup
                                                            .deliveryTypeChangdCall
                                                            .call(
                                                      deliveryType:
                                                          _model.switchValue!
                                                              ? '1'
                                                              : '0',
                                                      clientState:
                                                          '{\"clientId\":\"contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm\",\"cursor\":{\"recordKey\":\"2611\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                      recordKey: widget
                                                          .parentRecordKey,
                                                      id: _model.ocKey,
                                                      token: FFAppState()
                                                          .SessionToken,
                                                    );

                                                    if ((_model
                                                            .deliveryTypechanged
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.totalPrice =
                                                          CustomCakeTwoGroup
                                                              .deliveryTypeChangdCall
                                                              .totalPrice(
                                                        (_model.deliveryTypechanged
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                      _model.currentTravelDistance =
                                                          CustomCakeTwoGroup
                                                              .deliveryTypeChangdCall
                                                              .distance(
                                                        (_model.deliveryTypechanged
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                      _model.travelFees =
                                                          CustomCakeTwoGroup
                                                              .deliveryTypeChangdCall
                                                              .deliveryFeePerUnit(
                                                        (_model.deliveryTypechanged
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                      safeSetState(() {
                                                        _model.addressTextController
                                                                ?.text =
                                                            CustomCakeTwoGroup
                                                                .deliveryTypeChangdCall
                                                                .address(
                                                          (_model.deliveryTypechanged
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!;
                                                      });
                                                    }

                                                    safeSetState(() {});
                                                  } else {
                                                    _model.deliveryTypechangedCopy =
                                                        await CustomCakeTwoGroup
                                                            .deliveryTypeChangdCall
                                                            .call(
                                                      deliveryType:
                                                          _model.switchValue!
                                                              ? '1'
                                                              : '0',
                                                      clientState:
                                                          '{\"clientId\":\"contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm\",\"cursor\":{\"recordKey\":\"2611\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                      recordKey: widget
                                                          .parentRecordKey,
                                                      id: _model.ocKey,
                                                      token: FFAppState()
                                                          .SessionToken,
                                                    );

                                                    if ((_model
                                                            .deliveryTypechangedCopy
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.totalPrice =
                                                          CustomCakeTwoGroup
                                                              .deliveryTypeChangdCall
                                                              .totalPrice(
                                                        (_model.deliveryTypechangedCopy
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                      _model.currentTravelDistance =
                                                          CustomCakeTwoGroup
                                                              .deliveryTypeChangdCall
                                                              .distance(
                                                        (_model.deliveryTypechangedCopy
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                      _model.travelFees =
                                                          CustomCakeTwoGroup
                                                              .deliveryTypeChangdCall
                                                              .deliveryFeePerUnit(
                                                        (_model.deliveryTypechangedCopy
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                      safeSetState(() {
                                                        _model.addressTextController
                                                                ?.text =
                                                            CustomCakeTwoGroup
                                                                .deliveryTypeChangdCall
                                                                .address(
                                                          (_model.deliveryTypechangedCopy
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!;
                                                      });
                                                    }

                                                    safeSetState(() {});
                                                  }
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveThumbColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'x815hdwa' /* Pick up */,
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
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.addressTextController,
                                        focusNode: _model.addressFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.addressTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            _model.showAddressSuggestions =
                                                true;
                                            safeSetState(() {});
                                            await CustomCakeTwoGroup
                                                .populateAddressInCustomCall
                                                .call(
                                              recordKey:
                                                  widget.parentRecordKey,
                                              address: _model
                                                  .addressTextController.text,
                                              id: _model.ocKey,
                                              token: FFAppState().SessionToken,
                                              clientState:
                                                  '{\"clientId\":\"contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm\",\"cursor\":{\"recordKey\":\"2611\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                            );
                                          },
                                        ),
                                        onFieldSubmitted: (_) async {
                                          _model.showAddressSuggestions = false;
                                        },
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        textInputAction: TextInputAction.next,
                                        readOnly: _model.switchValue!,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'bpr8u0j2' /* Type Street Address .... */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                        TextCapitalization
                                                            .words),
                                              );
                                            }),
                                        ],
                                      ),
                                    ),
                                    if (_model.showAddressSuggestions)
                                      FutureBuilder<ApiCallResponse>(
                                        future: CustomCakeTwoGroup
                                            .cakeDeliveryCursorAddressSuggestionsCall
                                            .call(
                                          token: FFAppState().SessionToken,
                                          query:
                                              _model.addressTextController.text,
                                          uiContext:
                                              '{\"key\":\"CustomcakeItemPriceAndDeliveryInfoUI\",\"params\":{\"format\":[\"js\",\"js\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"customCakeForMenuSectionToCart__customCakeCartWizardTabPanel\\\",\\\"index\\\":10,\\\"staticTabs\\\":[{\\\"tabName\\\":\\\"cakeFlavours\\\",\\\"recordKey\\\":\\\"2611\\\",\\\"parentRecordKey\\\":\\\"-1\\\",\\\"index\\\":\\\"0\\\"},{\\\"tabName\\\":\\\"cakeFillings\\\",\\\"recordKey\\\":\\\"2611\\\",\\\"parentRecordKey\\\":\\\"-1\\\",\\\"index\\\":\\\"0\\\"},{\\\"tabName\\\":\\\"cakeIcingsTab\\\",\\\"recordKey\\\":\\\"2611\\\",\\\"parentRecordKey\\\":\\\"-1\\\",\\\"index\\\":\\\"0\\\"},{\\\"tabName\\\":\\\"cakeShapesTab\\\",\\\"recordKey\\\":\\\"2611\\\",\\\"parentRecordKey\\\":\\\"-1\\\",\\\"index\\\":\\\"0\\\"},{\\\"tabName\\\":\\\"cakeColorTab\\\",\\\"recordKey\\\":\\\"2611\\\",\\\"parentRecordKey\\\":\\\"-1\\\",\\\"index\\\":\\\"0\\\"},{\\\"tabName\\\":\\\"cakeLayersTab\\\",\\\"recordKey\\\":\\\"2611\\\",\\\"parentRecordKey\\\":\\\"-1\\\",\\\"index\\\":\\\"0\\\"}]}\"],\"renderTo\":[\"contains_CustomcakeItemPriceAndDeliveryInfoUI\"],\"recordKey\":[\"2611\"],\"parentRecordKey\":[\"-1\"],\"index\":[\"0\"]},\"component\":{\"clientId\":\"contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm\",\"clientState\":{\"clientId\":\"contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm\",\"cursor\":{\"recordKey\":\"2611\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}}}}',
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
                                          final addresSuggestinContainerCakeDeliveryCursorAddressSuggestionsResponse =
                                              snapshot.data!;

                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Visibility(
                                              visible: CustomCakeTwoGroup
                                                      .cakeDeliveryCursorAddressSuggestionsCall
                                                      .totalCount(
                                                    addresSuggestinContainerCakeDeliveryCursorAddressSuggestionsResponse
                                                        .jsonBody,
                                                  )! >
                                                  1,
                                              child: Builder(
                                                builder: (context) {
                                                  final item = CustomCakeTwoGroup
                                                          .cakeDeliveryCursorAddressSuggestionsCall
                                                          .details(
                                                            addresSuggestinContainerCakeDeliveryCursorAddressSuggestionsResponse
                                                                .jsonBody,
                                                          )
                                                          ?.toList() ??
                                                      [];

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
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
                                                                  getJsonField(
                                                                itemItem,
                                                                r'''$.text''',
                                                              ).toString();
                                                            });
                                                            _model.populateAddressResponse =
                                                                await CustomCakeTwoGroup
                                                                    .populateAddressInCustomCall
                                                                    .call(
                                                              recordKey: widget
                                                                  .parentRecordKey,
                                                              address: _model
                                                                  .addressTextController
                                                                  .text,
                                                              id: _model.ocKey,
                                                              token: FFAppState()
                                                                  .SessionToken,
                                                              clientState:
                                                                  '{\"clientId\":\"contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm\",\"cursor\":{\"recordKey\":\"2611\",\"parentRecordKey\":\"2611\",\"index\":\"0\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                                            );

                                                            _model.totalPrice =
                                                                CustomCakeTwoGroup
                                                                    .populateAddressInCustomCall
                                                                    .totalPrice(
                                                              (_model.populateAddressResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.currentTravelDistance =
                                                                CustomCakeTwoGroup
                                                                    .populateAddressInCustomCall
                                                                    .distance(
                                                              (_model.populateAddressResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.travelFees =
                                                                CustomCakeTwoGroup
                                                                    .populateAddressInCustomCall
                                                                    .deliveryFeePerUnit(
                                                              (_model.populateAddressResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.buildingNo =
                                                                CustomCakeTwoGroup
                                                                    .populateAddressInCustomCall
                                                                    .bldgNum(
                                                              (_model.populateAddressResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.floorSection =
                                                                CustomCakeTwoGroup
                                                                    .populateAddressInCustomCall
                                                                    .floorSection(
                                                              (_model.populateAddressResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.street =
                                                                CustomCakeTwoGroup
                                                                    .populateAddressInCustomCall
                                                                    .street(
                                                              (_model.populateAddressResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.city =
                                                                CustomCakeTwoGroup
                                                                    .populateAddressInCustomCall
                                                                    .cityTown(
                                                              (_model.populateAddressResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.state =
                                                                CustomCakeTwoGroup
                                                                    .populateAddressInCustomCall
                                                                    .stateProvince(
                                                              (_model.populateAddressResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.postal =
                                                                CustomCakeTwoGroup
                                                                    .populateAddressInCustomCall
                                                                    .postalCode(
                                                              (_model.populateAddressResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            );
                                                            _model.showAddressSuggestions =
                                                                false;
                                                            safeSetState(() {});

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
                                                                  getJsonField(
                                                                    itemItem,
                                                                    r'''$.text''',
                                                                  ).toString(),
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
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (_model.standDist != null &&
                                              _model.standDist != '')
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'fz9hgg9s' /* Standard Distance  */,
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
                                                Text(
                                                  '${_model.standDist}',
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
                                          if (_model.standRate != null &&
                                              _model.standRate != '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'mr9lbfp7' /* Standard Rate  */,
                                                    ),
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
                                                  Text(
                                                    '${_model.standRate}',
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
                                                ],
                                              ),
                                            ),
                                          if (_model.currentTravelDistance !=
                                                  null &&
                                              _model.currentTravelDistance !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'xpab1kof' /* Current Travel Distance  */,
                                                    ),
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
                                                  Text(
                                                    '${_model.currentTravelDistance}',
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
                                                ],
                                              ),
                                            ),
                                          if (_model.travelDeliveryFees !=
                                                  null &&
                                              _model.travelDeliveryFees != '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'mhzl9sn9' /* Travel Delivery Rate  */,
                                                    ),
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
                                                  Text(
                                                    '${_model.travelDeliveryFees}',
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
                                                ],
                                              ),
                                            ),
                                          if (_model.travelFees != null &&
                                              _model.travelFees != '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ub1010qi' /* Travel Fees */,
                                                    ),
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
                                                  Text(
                                                    '${_model.travelFees}',
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
                                                ],
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
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'd7p3icce' /* Total Price  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                          Text(
                                            '${_model.totalPrice}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                              _model.nextResponse = await CustomCakeTwoGroup
                                  .deliveryNextCall
                                  .call(
                                clientState:
                                    '{\"clientId\":\"contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm\",\"cursor\":{\"recordKey\":\"2611\",\"parentRecordKey\":\"${widget.parentRecordKey}\",\"index\":\"${widget.index}\",\"__cachedId\":\"${_model.ocKey}\"}}',
                                parentRecordKey: widget.parentRecordKey,
                                denomId: widget.recordKey,
                                id: _model.ocKey,
                                token: FFAppState().SessionToken,
                                customText: _model.textController1.text,
                                address: _model.addressTextController.text,
                                building: _model.buildingNo,
                                floor: _model.floorSection,
                                street: _model.street,
                                area: _model.localArea,
                                city: _model.city,
                                state: _model.state,
                                postal: _model.postal,
                                quantity:
                                    _model.countControllerValue?.toString(),
                                deliveryType: _model.switchValue! ? '1' : '0',
                              );

                              if ((_model.nextResponse?.succeeded ?? true)) {
                                context.pushNamed(
                                    ShoppingCartSummaryCopyWidget.routeName);
                              }

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'monasvvj' /* Next */,
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
