import '/backend/api_requests/api_calls.dart';
import '/compoents/account_comp/single_addon/single_addon_widget.dart';
import '/compoents/account_comp/single_included_addon/single_included_addon_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/empty_list_comp/empty_list_comp_widget.dart';
import '/compoents/summary_page_comp/addon_count_change_comp/addon_count_change_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'cart_item_detail_model.dart';
export 'cart_item_detail_model.dart';

///
class CartItemDetailWidget extends StatefulWidget {
  const CartItemDetailWidget({
    super.key,
    required this.details,
    this.travelFeeLabel,
    bool? customCake,
  }) : this.customCake = customCake ?? false;

  final dynamic details;

  /// deliveryFee for rental , cake and travel fee for entertainer
  final String? travelFeeLabel;

  final bool customCake;

  @override
  State<CartItemDetailWidget> createState() => _CartItemDetailWidgetState();
}

class _CartItemDetailWidgetState extends State<CartItemDetailWidget> {
  late CartItemDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemDetailModel());

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lemonLime,
              ),
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.customCake
                            ? getJsonField(
                                widget.details,
                                r'''$['menuSection-_-resItemSection-_-name']''',
                              ).toString()
                            : getJsonField(
                                widget.details,
                                r'''$.resourceItemName''',
                              ).toString(),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyLargeIsCustom,
                            ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.customCake
                                ? getJsonField(
                                    widget.details,
                                    r'''$['bakery']''',
                                  ).toString()
                                : getJsonField(
                                    widget.details,
                                    r'''$['resourceItemRequest-_-vendorName']''',
                                  ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyLargeIsCustom,
                                ),
                          ),
                          if (functions.checkJsonValue(getJsonField(
                                widget.details,
                                r'''$['resourceItemRequest-_-vendorAddress']''',
                              )) ||
                              functions.checkJsonValue(getJsonField(
                                widget.details,
                                r'''$['menuItemRequest-_-resourceItemRequest-_-vendorAddress']''',
                              )))
                            Text(
                              widget.customCake
                                  ? getJsonField(
                                      widget.details,
                                      r'''$['menuItemRequest-_-resourceItemRequest-_-vendorAddress']''',
                                    ).toString()
                                  : getJsonField(
                                      widget.details,
                                      r'''$['resourceItemRequest-_-vendorAddress']''',
                                    ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyLargeIsCustom,
                                  ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 1.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Image.network(
                                    widget.customCake
                                        ? getJsonField(
                                            widget.details,
                                            r'''$.bakeryLogo''',
                                          ).toString()
                                        : getJsonField(
                                            widget.details,
                                            r'''$.vendorLogo''',
                                          ).toString(),
                                    width: MediaQuery.sizeOf(context).width *
                                        0.278,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.105,
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      width: MediaQuery.sizeOf(context).width *
                                          0.278,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.105,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${getJsonField(
                                          widget.details,
                                          r'''$.totalPrice''',
                                        ).toString()}',
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
                                      Text(
                                        'Each : ${widget.customCake ? getJsonField(
                                            widget.details,
                                            r'''$['menuItemRequest-_-resourceItemRequest-_-basePriceStringFmt']''',
                                          ).toString() : getJsonField(
                                            widget.details,
                                            r'''$['resourceItemRequest-_-unitPriceStringFmt']''',
                                          ).toString()}',
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
                                      if (functions.checkJsonValue(getJsonField(
                                        widget.details,
                                        r'''$['additionalInfo-_-deliveryFee']''',
                                      )))
                                        Text(
                                          '${widget.travelFeeLabel}${getJsonField(
                                            widget.details,
                                            r'''$['additionalInfo-_-deliveryFee']''',
                                          ).toString()}',
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
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 7.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Visibility(
                          visible: functions.checkJsonValue(getJsonField(
                            widget.details,
                            r'''$['request-_-resItemReqDescription']''',
                          )),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.description_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'i3inn0ou' /* Description */,
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
                                  ),
                                ].divide(SizedBox(width: 5.0)),
                              ),
                              wrapWithModel(
                                model: _model.descriptionCompModel,
                                updateCallback: () => safeSetState(() {}),
                                child: DescriptionCompWidget(
                                  input: getJsonField(
                                    widget.details,
                                    r'''$['resourceItemRequest-_-itemDescription']''',
                                  ).toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (functions.checkJsonValue(getJsonField(
                                  widget.details,
                                  r'''$.Address''',
                                )) ||
                                functions.checkJsonValue(getJsonField(
                                  widget.details,
                                  r'''$['requestAddInfo-_-locationWithLabel']''',
                                )))
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Flexible(
                                      child: Text(
                                        widget.customCake
                                            ? getJsonField(
                                                widget.details,
                                                r'''$['requestAddInfo-_-locationWithLabel']''',
                                              ).toString()
                                            : '${getJsonField(
                                                widget.details,
                                                r'''$.deliveryType_txt''',
                                              ).toString()} : ${getJsonField(
                                                widget.details,
                                                r'''$.Address''',
                                              ).toString()}',
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
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Flexible(
                                          child: Text(
                                            widget.customCake
                                                ? valueOrDefault<String>(
                                                    getJsonField(
                                                      widget.details,
                                                      r'''$['menuItemRequest-_-resourceItemRequest-_-date']''',
                                                    )?.toString(),
                                                    'date',
                                                  )
                                                : valueOrDefault<String>(
                                                    getJsonField(
                                                      widget.details,
                                                      r'''$['resourceItemRequest-_-date']''',
                                                    )?.toString(),
                                                    'date',
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
                                        ),
                                      ].divide(SizedBox(width: 2.0)),
                                    ),
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.timer_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Flexible(
                                          child: Text(
                                            widget.customCake
                                                ? valueOrDefault<String>(
                                                    getJsonField(
                                                      widget.details,
                                                      r'''$['menuItemRequest-_-resourceItemRequest-_-itemTime']''',
                                                    )?.toString(),
                                                    'time',
                                                  )
                                                : valueOrDefault<String>(
                                                    getJsonField(
                                                      widget.details,
                                                      r'''$['resourceItemRequest-_-itemTime']''',
                                                    )?.toString(),
                                                    'time',
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
                                        ),
                                      ].divide(SizedBox(width: 2.0)),
                                    ),
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '9nqcvo4i' /* Qty : */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            widget.customCake
                                                ? valueOrDefault<String>(
                                                    getJsonField(
                                                      widget.details,
                                                      r'''$.quantity''',
                                                    )?.toString(),
                                                    'quantity',
                                                  )
                                                : valueOrDefault<String>(
                                                    getJsonField(
                                                      widget.details,
                                                      r'''$['resourceItemRequest-_-Quantity']''',
                                                    )?.toString(),
                                                    'quantity',
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
                                        ),
                                      ].divide(SizedBox(width: 2.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (!widget.customCake)
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.child_care_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'xshdl85n' /* kid : */,
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
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['resourceItemRequest-_-kidsInvitee']''',
                                                )?.toString(),
                                                '00',
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
                                        ].divide(SizedBox(width: 2.0)),
                                      ),
                                    ),
                                    Flexible(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.account_circle,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '15sew88q' /* Adult : */,
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
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['resourceItemRequest-_-adultInvitee']''',
                                                )?.toString(),
                                                '00',
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
                                        ].divide(SizedBox(width: 2.0)),
                                      ),
                                    ),
                                    Flexible(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.wc_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          Flexible(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'h2okuovw' /* Total  : */,
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
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['resourceItemRequest-_-totalInvitee']''',
                                                )?.toString(),
                                                '00',
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
                                        ].divide(SizedBox(width: 2.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (functions.checkJsonValue(getJsonField(
                      widget.details,
                      r'''$['menuItemRequest-_-customTextColorWithLabel']''',
                    )))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          getJsonField(
                            widget.details,
                            r'''$['menuItemRequest-_-customTextColorWithLabel']''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    if (functions.checkJsonValue(getJsonField(
                      widget.details,
                      r'''$['menuItemRequest-_-customTextWithLabel']''',
                    )))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          getJsonField(
                            widget.details,
                            r'''$['menuItemRequest-_-customTextWithLabel']''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    if (functions.checkJsonValue(getJsonField(
                      widget.details,
                      r'''$['defaultOptions-_-defaultOptionLabel']''',
                    )))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            child: Container(
                              width: double.infinity,
                              color: Color(0x00000000),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController1,
                                child: ExpandablePanel(
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        widget.details,
                                        r'''$['defaultOptions-_-defaultOptionLabel']''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-flavours']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-flavours']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-secFlavour']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-secFlavour']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-terFlavour']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-terFlavour']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-fillings']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-fillings']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-secFilling']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-secFilling']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-terFilling']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-terFilling']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-cakeIcing']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-cakeIcing']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-secCakeIcing']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-secCakeIcing']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-size']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-size']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-layer']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-layer']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-borderType']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-borderType']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-color']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-color']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-shape']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-shape']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-themeName']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-themeName']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['defaultOptions-_-decorType']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['defaultOptions-_-decorType']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
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
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (functions.checkJsonValue(getJsonField(
                      widget.details,
                      r'''$['defaultOptions-_-defaultOptionLabel']''',
                    )))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            child: Container(
                              width: double.infinity,
                              color: Color(0x00000000),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController2,
                                child: ExpandablePanel(
                                  header: Visibility(
                                    visible:
                                        functions.checkJsonValue(getJsonField(
                                      widget.details,
                                      r'''$.cakeCustomization''',
                                    )),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        getJsonField(
                                          widget.details,
                                          r'''$.cakeCustomization''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-flavours']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-flavours']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-secFlavour']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-secFlavour']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-terFlavour']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-terFlavour']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-fillings']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-fillings']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-secFilling']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-secFilling']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-terFilling']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-terFilling']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-cakeIcing']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-cakeIcing']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-secCakeIcing']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-secCakeIcing']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-size']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-size']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-layer']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-layer']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-borderType']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-borderType']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-color']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-color']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-shape']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-shape']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-themeName']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-themeName']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-decorType']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-decorType']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
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
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (widget.customCake)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            child: Container(
                              width: double.infinity,
                              color: Color(0x00000000),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController3,
                                child: ExpandablePanel(
                                  header: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vja9kpqa' /* Customization Options */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                  collapsed: Container(),
                                  expanded: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-flavours']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-flavours']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-secFlavour']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-secFlavour']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-terFlavour']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-terFlavour']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-fillings']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-fillings']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-secFilling']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-secFilling']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-terFilling']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-terFilling']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-cakeIcing']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-cakeIcing']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-secCakeIcing']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-secCakeIcing']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-size']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-size']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-layer']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-layer']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-borderType']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-borderType']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-color']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-color']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-shape']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-shape']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-themeName']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-themeName']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          if (functions
                                              .checkJsonValue(getJsonField(
                                            widget.details,
                                            r'''$['customizationOptions-_-decorType']''',
                                          )))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                getJsonField(
                                                  widget.details,
                                                  r'''$['customizationOptions-_-decorType']''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
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
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (functions.checkJsonValue(getJsonField(
                      widget.details,
                      r'''$.addOn''',
                    )))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: ExpandableNotifier(
                            controller: _model.expandableExpandableController4,
                            child: ExpandablePanel(
                              header: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '2rkwwdv0' /* AddOn */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 7.0)),
                              ),
                              collapsed: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'dw2hqyzp' /* AddOns */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      letterSpacing: 0.0,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumIsCustom,
                                                    ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.all(6.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FutureBuilder<ApiCallResponse>(
                                          future: (_model
                                                      .apiRequestCompleter ??=
                                                  Completer<ApiCallResponse>()
                                                    ..complete(
                                                        ShoppingCartSummaryUIGroup
                                                            .addOnSingleCall
                                                            .call(
                                                      resourceType: '0',
                                                      token: FFAppState()
                                                          .SessionToken,
                                                      parentRecordKey:
                                                          getJsonField(
                                                        widget.details,
                                                        r'''$._id''',
                                                      ).toString(),
                                                    )))
                                              .future,
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
                                            final listViewAddonAddOnSingleResponse =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final addon =
                                                    ShoppingCartSummaryUIGroup
                                                            .addOnSingleCall
                                                            .details(
                                                              listViewAddonAddOnSingleResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [];
                                                if (addon.isEmpty) {
                                                  return EmptyListCompWidget(
                                                    text:
                                                        'This package does not contain addon item',
                                                  );
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: addon.length,
                                                  itemBuilder:
                                                      (context, addonIndex) {
                                                    final addonItem =
                                                        addon[addonIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
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
                                                                  _model.includedAddonDelete1 =
                                                                      await ShoppingCartSummaryUIGroup
                                                                          .addOnDeleteCall
                                                                          .call(
                                                                    clientState:
                                                                        '{\"clientId\":\"cartAddonUI__items_addon_\",\"cursor\":{\"parentRecordKey\":\"${getJsonField(
                                                                      widget
                                                                          .details,
                                                                      r'''$._id''',
                                                                    ).toString()}\"},\"selection\":[\"${getJsonField(
                                                                      addonItem,
                                                                      r'''$._id''',
                                                                    ).toString()}\"]}',
                                                                    token: FFAppState()
                                                                        .SessionToken,
                                                                  );

                                                                  if ((_model
                                                                          .includedAddonDelete1
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    safeSetState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted();
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .delete_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Builder(
                                                              builder: (context) =>
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            WebViewAware(
                                                                          child:
                                                                              AddonCountChangeCompWidget(
                                                                            initVal:
                                                                                '1',
                                                                            parentRecordKey:
                                                                                getJsonField(
                                                                              widget.details,
                                                                              r'''$._id''',
                                                                            ).toString(),
                                                                            recordKey:
                                                                                getJsonField(
                                                                              addonItem,
                                                                              r'''$._id''',
                                                                            ).toString(),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '2hdmscef' /* Change Qty  */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .singleAddonModels1
                                                              .getModel(
                                                            addonIndex
                                                                .toString(),
                                                            addonIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              SingleAddonWidget(
                                                            key: Key(
                                                              'Key3kx_${addonIndex.toString()}',
                                                            ),
                                                            name: getJsonField(
                                                              addonItem,
                                                              r'''$.inclResItem''',
                                                            ),
                                                            quantity:
                                                                getJsonField(
                                                              addonItem,
                                                              r'''$.Quantity''',
                                                            ),
                                                            image: getJsonField(
                                                              addonItem,
                                                              r'''$.imageURL''',
                                                            ),
                                                            totalPrice:
                                                                getJsonField(
                                                              addonItem,
                                                              r'''$.totalPrice''',
                                                            ),
                                                            unitPrice:
                                                                getJsonField(
                                                              addonItem,
                                                              r'''$.unitPrice''',
                                                            ),
                                                            description:
                                                                getJsonField(
                                                              addonItem,
                                                              r'''$.inclResItemDescription''',
                                                            ),
                                                            id: getJsonField(
                                                              addonItem,
                                                              r'''$._id''',
                                                            ),
                                                            parenRecordKey:
                                                                getJsonField(
                                                              widget.details,
                                                              r'''$.id''',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'dwasfds3' /* AddOns Group */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      letterSpacing: 0.0,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumIsCustom,
                                                    ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.all(6.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FutureBuilder<ApiCallResponse>(
                                          future: ShoppingCartSummaryUIGroup
                                              .addonGroupCall
                                              .call(
                                            resourceType: '0',
                                            token: FFAppState().SessionToken,
                                            parentRecordKey: getJsonField(
                                              widget.details,
                                              r'''$._id''',
                                            ).toString(),
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
                                            final listViewaddonGroupAddonGroupResponse =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final addonGroup =
                                                    ShoppingCartSummaryUIGroup
                                                            .addonGroupCall
                                                            .details(
                                                              listViewaddonGroupAddonGroupResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [];
                                                if (addonGroup.isEmpty) {
                                                  return EmptyListCompWidget(
                                                    text:
                                                        'This package does not contain group addon item',
                                                  );
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: addonGroup.length,
                                                  itemBuilder: (context,
                                                      addonGroupIndex) {
                                                    final addonGroupItem =
                                                        addonGroup[
                                                            addonGroupIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .singleAddonModels2
                                                              .getModel(
                                                            addonGroupIndex
                                                                .toString(),
                                                            addonGroupIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              SingleAddonWidget(
                                                            key: Key(
                                                              'Keylgl_${addonGroupIndex.toString()}',
                                                            ),
                                                            name: getJsonField(
                                                              addonGroupItem,
                                                              r'''$.inclResItem''',
                                                            ),
                                                            quantity:
                                                                getJsonField(
                                                              addonGroupItem,
                                                              r'''$.Quantity''',
                                                            ),
                                                            image: getJsonField(
                                                              addonGroupItem,
                                                              r'''$.imageURL''',
                                                            ),
                                                            totalPrice:
                                                                getJsonField(
                                                              addonGroupItem,
                                                              r'''$.totalPrice''',
                                                            ),
                                                            unitPrice:
                                                                getJsonField(
                                                              addonGroupItem,
                                                              r'''$.unitPrice''',
                                                            ),
                                                            description:
                                                                getJsonField(
                                                              addonGroupItem,
                                                              r'''$.inclResItemDescription''',
                                                            ),
                                                            id: getJsonField(
                                                              addonGroupItem,
                                                              r'''$._id''',
                                                            ),
                                                            parenRecordKey:
                                                                getJsonField(
                                                              widget.details,
                                                              r'''$.id''',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (functions.checkJsonValue(getJsonField(
                      widget.details,
                      r'''$.addonGroup''',
                    )))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: ExpandableNotifier(
                            controller: _model.expandableExpandableController5,
                            child: ExpandablePanel(
                              header: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'x1bx7uy6' /* Included Addon */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 6.0)),
                              ),
                              collapsed: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '34qwelxp' /* AddOns */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      letterSpacing: 0.0,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumIsCustom,
                                                    ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.all(6.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FutureBuilder<ApiCallResponse>(
                                          future: ShoppingCartSummaryUIGroup
                                              .includedSingleCall
                                              .call(
                                            token: FFAppState().SessionToken,
                                            resourceType: '0',
                                            parentRecordKey: getJsonField(
                                              widget.details,
                                              r'''$._id''',
                                            ).toString(),
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
                                            final listViewincludedIncludedSingleResponse =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final included =
                                                    ShoppingCartSummaryUIGroup
                                                            .includedSingleCall
                                                            .details(
                                                              listViewincludedIncludedSingleResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [];
                                                if (included.isEmpty) {
                                                  return EmptyListCompWidget(
                                                    text:
                                                        'This package does not contain  included addon item',
                                                  );
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: included.length,
                                                  itemBuilder:
                                                      (context, includedIndex) {
                                                    final includedItem =
                                                        included[includedIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .singleIncludedAddonModels1
                                                              .getModel(
                                                            includedIndex
                                                                .toString(),
                                                            includedIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              SingleIncludedAddonWidget(
                                                            key: Key(
                                                              'Keyg5g_${includedIndex.toString()}',
                                                            ),
                                                            id: getJsonField(
                                                              includedItem,
                                                              r'''$._id''',
                                                            ),
                                                            name: getJsonField(
                                                              includedItem,
                                                              r'''$.inclResItem''',
                                                            ),
                                                            image: getJsonField(
                                                              includedItem,
                                                              r'''$.imageURL''',
                                                            ),
                                                            quantity:
                                                                getJsonField(
                                                              includedItem,
                                                              r'''$.Quantity''',
                                                            ),
                                                            description:
                                                                getJsonField(
                                                              includedItem,
                                                              r'''$.inclResItemDescription''',
                                                            ),
                                                            parenRecordKey:
                                                                getJsonField(
                                                              widget.details,
                                                              r'''$.id''',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '9bq0kijn' /* AddOns Group */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      letterSpacing: 0.0,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumIsCustom,
                                                    ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FutureBuilder<ApiCallResponse>(
                                          future: ShoppingCartSummaryUIGroup
                                              .includedGroupCall
                                              .call(
                                            token: FFAppState().SessionToken,
                                            resourceType: '0',
                                            parentRecordKey: getJsonField(
                                              widget.details,
                                              r'''$._id''',
                                            ).toString(),
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
                                            final listViewincludedGroupIncludedGroupResponse =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final includedGroup =
                                                    ShoppingCartSummaryUIGroup
                                                            .includedGroupCall
                                                            .details(
                                                              listViewincludedGroupIncludedGroupResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [];
                                                if (includedGroup.isEmpty) {
                                                  return EmptyListCompWidget(
                                                    text:
                                                        'This package does not contain included group addon item',
                                                  );
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      includedGroup.length,
                                                  itemBuilder: (context,
                                                      includedGroupIndex) {
                                                    final includedGroupItem =
                                                        includedGroup[
                                                            includedGroupIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .singleIncludedAddonModels2
                                                              .getModel(
                                                            includedGroupIndex
                                                                .toString(),
                                                            includedGroupIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              SingleIncludedAddonWidget(
                                                            key: Key(
                                                              'Keyum6_${includedGroupIndex.toString()}',
                                                            ),
                                                            id: getJsonField(
                                                              includedGroupItem,
                                                              r'''$._id''',
                                                            ),
                                                            name: getJsonField(
                                                              includedGroupItem,
                                                              r'''$.inclResItem''',
                                                            ),
                                                            image: getJsonField(
                                                              includedGroupItem,
                                                              r'''$.imageURL''',
                                                            ),
                                                            description:
                                                                getJsonField(
                                                              includedGroupItem,
                                                              r'''$.inclResItemDescription''',
                                                            ),
                                                            quantity:
                                                                getJsonField(
                                                              includedGroupItem,
                                                              r'''$.Quantity''',
                                                            ),
                                                            parenRecordKey:
                                                                getJsonField(
                                                              widget.details,
                                                              r'''$._id''',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ]
                      .divide(SizedBox(height: 7.0))
                      .addToEnd(SizedBox(height: 16.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
