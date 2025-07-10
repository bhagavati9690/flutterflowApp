import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'shopping_cart_delivery_page_model.dart';
export 'shopping_cart_delivery_page_model.dart';

class ShoppingCartDeliveryPageWidget extends StatefulWidget {
  const ShoppingCartDeliveryPageWidget({
    super.key,
    this.recordKey,
    this.resourceType,
    this.type,
    this.quantity,
  });

  final String? recordKey;
  final String? resourceType;
  final String? type;
  final String? quantity;

  static String routeName = 'ShoppingCartDeliveryPage';
  static String routePath = 'shoppingCartDeliveryPage';

  @override
  State<ShoppingCartDeliveryPageWidget> createState() =>
      _ShoppingCartDeliveryPageWidgetState();
}

class _ShoppingCartDeliveryPageWidgetState
    extends State<ShoppingCartDeliveryPageWidget> {
  late ShoppingCartDeliveryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShoppingCartDeliveryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.deliveryCursorResponse =
          await RentalShoppingCartGroup.deliveryPageCursorCall.call(
        token: FFAppState().SessionToken,
        resourceType: widget.resourceType,
        type: widget.type,
        recordKey: widget.recordKey,
        quantity: widget.quantity,
      );

      if ((_model.deliveryCursorResponse?.succeeded ?? true)) {
        _model.ocKey = RentalShoppingCartGroup.deliveryPageCursorCall.ocKey(
          (_model.deliveryCursorResponse?.jsonBody ?? ''),
        );
        _model.standDistance =
            RentalShoppingCartGroup.deliveryPageCursorCall.standarddistance(
          (_model.deliveryCursorResponse?.jsonBody ?? ''),
        );
        _model.standRate = RentalShoppingCartGroup.deliveryPageCursorCall
            .standardPlusdeliveryRate(
          (_model.deliveryCursorResponse?.jsonBody ?? ''),
        );
        _model.currentTravelDistance =
            RentalShoppingCartGroup.deliveryPageCursorCall.distance(
          (_model.deliveryCursorResponse?.jsonBody ?? ''),
        );
        _model.travelDeliveryRate = RentalShoppingCartGroup
            .deliveryPageCursorCall
            .travelFeesperDistance(
          (_model.deliveryCursorResponse?.jsonBody ?? ''),
        );
        _model.travelFees =
            RentalShoppingCartGroup.deliveryPageCursorCall.totalTravelFee(
          (_model.deliveryCursorResponse?.jsonBody ?? ''),
        );
        _model.totalPrice =
            RentalShoppingCartGroup.deliveryPageCursorCall.totalPrice(
          (_model.deliveryCursorResponse?.jsonBody ?? ''),
        );
        safeSetState(() {});
        safeSetState(() {
          _model.switchValue =
              (RentalShoppingCartGroup.deliveryPageCursorCall.deliveryType(
                    (_model.deliveryCursorResponse?.jsonBody ?? ''),
                  ) ==
                  '1');
        });
        safeSetState(() {
          _model.addressTextController?.text =
              RentalShoppingCartGroup.deliveryPageCursorCall.address(
            (_model.deliveryCursorResponse?.jsonBody ?? ''),
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
                size: 22.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                '15ri8739' /* Delivery */,
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
                              Container(
                                width: double.infinity,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '3hex499t' /* Item Details */,
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
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                RentalShoppingCartGroup
                                                    .deliveryPageCursorCall
                                                    .name(
                                                  (_model.deliveryCursorResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'Item Name',
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${valueOrDefault<String>(
                                                  RentalShoppingCartGroup
                                                      .deliveryPageCursorCall
                                                      .itemTotalPriceDisplay(
                                                    (_model.deliveryCursorResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  '\$ 0.0',
                                                )}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
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
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ody5rphj' /* Delivery Details */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF14181B),
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                              Flexible(
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'rkur7jms' /* Delivery Type */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
                                                          ),
                                                ),
                                              ),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'vgeto7j1' /* Delivery */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Switch.adaptive(
                                                        value:
                                                            _model.switchValue!,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.switchValue =
                                                                  newValue);
                                                          if (newValue) {
                                                            _model.deliveryTypechanged =
                                                                await RentalShoppingCartGroup
                                                                    .deliveryTypeChangedCall
                                                                    .call(
                                                              recordKey: widget
                                                                  .recordKey,
                                                              token: FFAppState()
                                                                  .SessionToken,
                                                              id: _model.ocKey,
                                                              deliveryType:
                                                                  _model.switchValue!
                                                                      ? '1'
                                                                      : '0',
                                                              clientState:
                                                                  '{\"clientId\":\"contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}',
                                                            );

                                                            if ((_model
                                                                    .deliveryTypechanged
                                                                    ?.succeeded ??
                                                                true)) {
                                                              _model.travelFees =
                                                                  RentalShoppingCartGroup
                                                                      .deliveryTypeChangedCall
                                                                      .totalTravelFee(
                                                                (_model.deliveryTypechanged
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              );
                                                              _model.totalPrice =
                                                                  RentalShoppingCartGroup
                                                                      .deliveryTypeChangedCall
                                                                      .totalPrice(
                                                                (_model.deliveryTypechanged
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              );
                                                              _model.currentTravelDistance =
                                                                  RentalShoppingCartGroup
                                                                      .deliveryTypeChangedCall
                                                                      .distance(
                                                                (_model.deliveryTypechanged
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              );
                                                              safeSetState(() {
                                                                _model.addressTextController
                                                                        ?.text =
                                                                    RentalShoppingCartGroup
                                                                        .deliveryTypeChangedCall
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
                                                                await RentalShoppingCartGroup
                                                                    .deliveryTypeChangedCall
                                                                    .call(
                                                              recordKey: widget
                                                                  .recordKey,
                                                              token: FFAppState()
                                                                  .SessionToken,
                                                              id: _model.ocKey,
                                                              deliveryType:
                                                                  _model.switchValue!
                                                                      ? '1'
                                                                      : '0',
                                                              clientState:
                                                                  '{\"clientId\":\"contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}',
                                                            );

                                                            if ((_model
                                                                    .deliveryTypechangedCopy
                                                                    ?.succeeded ??
                                                                true)) {
                                                              _model.travelFees =
                                                                  RentalShoppingCartGroup
                                                                      .deliveryTypeChangedCall
                                                                      .totalTravelFee(
                                                                (_model.deliveryTypechangedCopy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              );
                                                              _model.totalPrice =
                                                                  RentalShoppingCartGroup
                                                                      .deliveryTypeChangedCall
                                                                      .totalPrice(
                                                                (_model.deliveryTypechangedCopy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              );
                                                              _model.currentTravelDistance =
                                                                  RentalShoppingCartGroup
                                                                      .deliveryTypeChangedCall
                                                                      .distance(
                                                                (_model.deliveryTypechangedCopy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              );
                                                              safeSetState(() {
                                                                _model.addressTextController
                                                                        ?.text =
                                                                    RentalShoppingCartGroup
                                                                        .deliveryTypeChangedCall
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
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'x4vuh6ss' /* Pick up */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                          Opacity(
                                            opacity:
                                                _model.switchValue! ? 0.4 : 1.0,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .addressTextController,
                                                focusNode:
                                                    _model.addressFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.addressTextController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    _model.showAddressSuggesstions =
                                                        true;
                                                    safeSetState(() {});
                                                    await RentalShoppingCartGroup
                                                        .deliveryPopulateAddressCall
                                                        .call(
                                                      token: FFAppState()
                                                          .SessionToken,
                                                      id: _model.ocKey,
                                                      address: _model
                                                          .addressTextController
                                                          .text,
                                                      clientState:
                                                          '{\"clientId\":\"contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}',
                                                    );
                                                  },
                                                ),
                                                onFieldSubmitted: (_) async {
                                                  _model.showAddressSuggesstions =
                                                      false;
                                                },
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                textInputAction:
                                                    TextInputAction.next,
                                                readOnly: _model.switchValue!,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'maugqz4x' /* Type Street Address .... */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeIsCustom,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                                  suffixIcon: Icon(
                                                    Icons.place,
                                                  ),
                                                ),
                                                style:
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
                                                maxLines: null,
                                                validator: _model
                                                    .addressTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  if (!isAndroid && !isiOS)
                                                    TextInputFormatter
                                                        .withFunction((oldValue,
                                                            newValue) {
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
                                          ),
                                          if (_model.showAddressSuggesstions)
                                            FutureBuilder<ApiCallResponse>(
                                              future: RentalShoppingCartGroup
                                                  .deliveryAddressSuggesionCall
                                                  .call(
                                                query: _model
                                                    .addressTextController.text,
                                                token:
                                                    FFAppState().SessionToken,
                                                uicontext:
                                                    '{\"key\":\"shoppingCartDeliveryUI\",\"params\":{\"format\":[\"js\",\"js\"],\"quantity\":[\"1\"],\"a:clientState\":[\"{\\\"clientId\\\":\\\"rentalItemShoppingWizard__rentalShoppingCartWizardTabPanel\\\",\\\"index\\\":3,\\\"staticTabs\\\":[{\\\"tabName\\\":\\\"itemDetailsTab\\\",\\\"quantity\\\":\\\"1\\\",\\\"type\\\":\\\"0\\\",\\\"item\\\":\\\"true\\\",\\\"resourceItemType\\\":\\\"2\\\",\\\"recordKey\\\":\\\"22746\\\"}]}\"],\"renderTo\":[\"contains_shoppingCartDeliveryUI\"],\"resourceType\":[\"2\"],\"recordKey\":[\"22746\"],\"type\":[\"0\"]},\"component\":{\"clientId\":\"contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm\",\"clientState\":{\"clientId\":\"contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}}}',
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
                                                final addresSuggestinContainerDeliveryAddressSuggesionResponse =
                                                    snapshot.data!;

                                                return Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Visibility(
                                                    visible: RentalShoppingCartGroup
                                                            .deliveryAddressSuggesionCall
                                                            .totalCount(
                                                          addresSuggestinContainerDeliveryAddressSuggesionResponse
                                                              .jsonBody,
                                                        )! >
                                                        1,
                                                    child: Builder(
                                                      builder: (context) {
                                                        final item =
                                                            RentalShoppingCartGroup
                                                                    .deliveryAddressSuggesionCall
                                                                    .details(
                                                                      addresSuggestinContainerDeliveryAddressSuggesionResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.toList() ??
                                                                [];

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              item.length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 10.0),
                                                          itemBuilder: (context,
                                                              itemIndex) {
                                                            final itemItem =
                                                                item[itemIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
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
                                                                onTap:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.addressTextController
                                                                            ?.text =
                                                                        getJsonField(
                                                                      itemItem,
                                                                      r'''$.text''',
                                                                    ).toString();
                                                                  });
                                                                  _model.populateAddressResponse =
                                                                      await RentalShoppingCartGroup
                                                                          .deliveryPopulateAddressCall
                                                                          .call(
                                                                    token: FFAppState()
                                                                        .SessionToken,
                                                                    id: _model
                                                                        .ocKey,
                                                                    address: _model
                                                                        .addressTextController
                                                                        .text,
                                                                    clientState:
                                                                        '{\"clientId\":\"contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}',
                                                                  );

                                                                  _model.travelFees =
                                                                      RentalShoppingCartGroup
                                                                          .deliveryPopulateAddressCall
                                                                          .totalTravelFee(
                                                                    (_model.populateAddressResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.currentTravelDistance =
                                                                      RentalShoppingCartGroup
                                                                          .deliveryPopulateAddressCall
                                                                          .distance(
                                                                    (_model.populateAddressResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.totalPrice =
                                                                      RentalShoppingCartGroup
                                                                          .deliveryPopulateAddressCall
                                                                          .totalPrice(
                                                                    (_model.populateAddressResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.bldgNum =
                                                                      RentalShoppingCartGroup
                                                                          .deliveryPopulateAddressCall
                                                                          .bldgNum(
                                                                    (_model.populateAddressResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.floorSection =
                                                                      RentalShoppingCartGroup
                                                                          .deliveryPopulateAddressCall
                                                                          .floorSection(
                                                                    (_model.populateAddressResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.street =
                                                                      RentalShoppingCartGroup
                                                                          .deliveryPopulateAddressCall
                                                                          .street(
                                                                    (_model.populateAddressResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.cityTown =
                                                                      RentalShoppingCartGroup
                                                                          .deliveryPopulateAddressCall
                                                                          .cityTown(
                                                                    (_model.populateAddressResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.state =
                                                                      RentalShoppingCartGroup
                                                                          .deliveryPopulateAddressCall
                                                                          .stateProvince(
                                                                    (_model.populateAddressResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.postalCode =
                                                                      RentalShoppingCartGroup
                                                                          .deliveryPopulateAddressCall
                                                                          .postalCode(
                                                                    (_model.populateAddressResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  );
                                                                  _model.showAddressSuggesstions =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});

                                                                  safeSetState(
                                                                      () {});
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
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          itemItem,
                                                                          r'''$.text''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          7.0)),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (_model.standDistance !=
                                                        null &&
                                                    _model.standDistance != '')
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'r445xh3u' /* Standard Distance  */,
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
                                                      Text(
                                                        '${_model.standDistance}',
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
                                                if (_model.standRate != null &&
                                                    _model.standRate != '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'yccqj9fh' /* Standard Rate  */,
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
                                                        Text(
                                                          '${_model.standRate}',
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
                                                      ],
                                                    ),
                                                  ),
                                                if (_model.currentTravelDistance !=
                                                        null &&
                                                    _model.currentTravelDistance !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'peb3ivs3' /* Current Travel Distance  */,
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
                                                        Text(
                                                          '${_model.currentTravelDistance}',
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
                                                      ],
                                                    ),
                                                  ),
                                                if (_model.travelDeliveryRate !=
                                                        null &&
                                                    _model.travelDeliveryRate !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'mrv9g8bw' /* Travel Delivery Rate  */,
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
                                                        Text(
                                                          '${_model.travelDeliveryRate}',
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
                                                      ],
                                                    ),
                                                  ),
                                                if (_model.travelFees != null &&
                                                    _model.travelFees != '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'v89wir48' /* Travel Fees */,
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
                                                        Text(
                                                          '\$ ${_model.travelFees}',
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
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ork48e5s' /* Total Price  */,
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
                                                            fontSize: 22.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                Text(
                                                  '\$ ${_model.totalPrice}',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 22.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await RentalShoppingCartGroup.deliveryPageNextCall
                                  .call(
                                token: FFAppState().SessionToken,
                                clientState:
                                    '{\"clientId\":\"contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm\",\"cursor\":{\"__cachedId\":\"${_model.ocKey}\"}}',
                                recordKey: widget.recordKey,
                                quantity: widget.quantity,
                                resourceType: widget.resourceType,
                                type: widget.type,
                                id: _model.ocKey,
                                deliveryType: _model.switchValue! ? '1' : '0',
                                address: _model.addressTextController.text,
                                buildno: _model.bldgNum,
                                floor: _model.floorSection,
                                street: _model.street,
                                city: _model.cityTown,
                                state: _model.state,
                                postalCode: _model.postalCode,
                              );

                              context.goNamed(
                                  ShoppingCartSummaryCopyWidget.routeName);
                            },
                            text: FFLocalizations.of(context).getText(
                              'fvsaylt9' /* Next */,
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
