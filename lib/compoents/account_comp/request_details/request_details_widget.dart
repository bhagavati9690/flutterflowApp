import '/backend/api_requests/api_calls.dart';
import '/compoents/account_comp/single_addon/single_addon_widget.dart';
import '/compoents/account_comp/single_included_addon/single_included_addon_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/empty_list_comp/empty_list_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'request_details_model.dart';
export 'request_details_model.dart';

///
class RequestDetailsWidget extends StatefulWidget {
  const RequestDetailsWidget({
    super.key,
    required this.details,
  });

  final dynamic details;

  @override
  State<RequestDetailsWidget> createState() => _RequestDetailsWidgetState();
}

class _RequestDetailsWidgetState extends State<RequestDetailsWidget> {
  late RequestDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestDetailsModel());

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
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
                        getJsonField(
                          widget.details,
                          r'''$['request-_-resItemReqName']''',
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
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getJsonField(
                              widget.details,
                              r'''$['request-_-resourceItemSection-_-itemCategory-_-parent-_-basicPartyInfo-_-busPartyIdentifier-_-name']''',
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 1.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Image.network(
                                    getJsonField(
                                      widget.details,
                                      r'''$['request-_-dummyImages']''',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        getJsonField(
                                          widget.details,
                                          r'''$['request-_-totalPriceDisplay']''',
                                        ).toString(),
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
                                        getJsonField(
                                          widget.details,
                                          r'''$['request-_-status-_-name']''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
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
                          visible: functions.isHtmlDataValid(getJsonField(
                                widget.details,
                                r'''$['request-_-resItemReqDescription']''',
                              ).toString()) ??
                              true,
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
                                      'molfaswh' /* Description */,
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
                                    r'''$['request-_-resItemReqDescription']''',
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
                              r'''$['request-_-resourceItemSection-_-itemCategory-_-parent-_-basicPartyInfo-_-address-_-address']''',
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
                                        getJsonField(
                                          widget.details,
                                          r'''$['request-_-resourceItemSection-_-itemCategory-_-parent-_-basicPartyInfo-_-address-_-address']''',
                                        ).toString(),
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
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                widget.details,
                                                r'''$['request-_-date']''',
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
                                            valueOrDefault<String>(
                                              getJsonField(
                                                widget.details,
                                                r'''$['request-_-timeFrame']''',
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
                                            '0u41g1ql' /* Qty : */,
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
                                            valueOrDefault<String>(
                                              getJsonField(
                                                widget.details,
                                                r'''$['request-_-Quantity']''',
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
                                        Flexible(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '7defm9ho' /* kid : */,
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
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                widget.details,
                                                r'''$.request.kidsInvitee''',
                                              )?.toString(),
                                              '00',
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
                                          Icons.account_circle,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Flexible(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'nqeyqx8b' /* Adult : */,
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
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                widget.details,
                                                r'''$.request.adultInvitee''',
                                              )?.toString(),
                                              '00',
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
                                          Icons.wc_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        Flexible(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'iipddrwj' /* Total  : */,
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
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                widget.details,
                                                r'''$.request.totalInvitee''',
                                              )?.toString(),
                                              '00',
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
                          ],
                        ),
                      ),
                    ),
                    if (functions.checkJsonValue(getJsonField(
                      widget.details,
                      r'''$.addon''',
                    )))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: ExpandableNotifier(
                            controller: _model.expandableExpandableController1,
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
                                      'ad9x9p0h' /* AddOn */,
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
                                                  'b0ks0wq6' /* AddOns */,
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
                                                      .apiRequestCompleter1 ??=
                                                  Completer<ApiCallResponse>()
                                                    ..complete(
                                                        AccountRequestItemInformationGroup
                                                            .requestAddOnCall
                                                            .call(
                                                      token: FFAppState()
                                                          .SessionToken,
                                                      parentRecordKey:
                                                          getJsonField(
                                                        widget.details,
                                                        r'''$.id''',
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
                                            final listViewAddonRequestAddOnResponse =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final addon =
                                                    AccountRequestItemInformationGroup
                                                            .requestAddOnCall
                                                            .details(
                                                              listViewAddonRequestAddOnResponse
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
                                                            InkWell(
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
                                                                _model.includedAddonDelete1 =
                                                                    await AccountRequestItemInformationGroup
                                                                        .deleteAddonCall
                                                                        .call(
                                                                  token: FFAppState()
                                                                      .SessionToken,
                                                                  aclientState:
                                                                      '{\"clientId\":\"eventRequestsAddonUI__items_addon_\",\"cursor\":{\"parentRecordKey\":\"${getJsonField(
                                                                    widget
                                                                        .details,
                                                                    r'''$.id''',
                                                                  ).toString()}\"},\"selection\":[\"${getJsonField(
                                                                    addonItem,
                                                                    r'''$._id''',
                                                                  ).toString()}\"]}',
                                                                );

                                                                if ((_model
                                                                        .includedAddonDelete1
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  if (AccountRequestItemInformationGroup
                                                                      .deleteAddonCall
                                                                      .actions(
                                                                    (_model.includedAddonDelete1
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          AccountRequestItemInformationGroup
                                                                              .deleteAddonCall
                                                                              .text(
                                                                            (_model.includedAddonDelete1?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4400),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Somthing went wrong',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    );
                                                                  }

                                                                  safeSetState(() =>
                                                                      _model.apiRequestCompleter1 =
                                                                          null);
                                                                  await _model
                                                                      .waitForApiRequestCompleted1();
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Somthing went wrong',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                    ),
                                                                  );
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
                                                              'Keynp7_${addonIndex.toString()}',
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
                                                              r'''$.totalPriceDisplay''',
                                                            ),
                                                            unitPrice:
                                                                getJsonField(
                                                              addonItem,
                                                              r'''$.unitPriceDisplay''',
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
                                                  'wl0a3n8d' /* AddOns Group */,
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
                                                      .apiRequestCompleter3 ??=
                                                  Completer<ApiCallResponse>()
                                                    ..complete(
                                                        AccountRequestItemInformationGroup
                                                            .requestAddOnGroupsCall
                                                            .call(
                                                      parentRecordKey:
                                                          getJsonField(
                                                        widget.details,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      token: FFAppState()
                                                          .SessionToken,
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
                                            final listViewaddonGroupRequestAddOnGroupsResponse =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final addonGroup =
                                                    AccountRequestItemInformationGroup
                                                            .requestAddOnGroupsCall
                                                            .details(
                                                              listViewaddonGroupRequestAddOnGroupsResponse
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            InkWell(
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
                                                                _model.includedAddonDelete2 =
                                                                    await AccountRequestItemInformationGroup
                                                                        .deleteAddonCall
                                                                        .call(
                                                                  token: FFAppState()
                                                                      .SessionToken,
                                                                  aclientState:
                                                                      '{\"clientId\":\"eventRequestsAddonUI__items_addon_\",\"cursor\":{\"parentRecordKey\":\"${getJsonField(
                                                                    widget
                                                                        .details,
                                                                    r'''$.id''',
                                                                  ).toString()}\"},\"selection\":[\"${getJsonField(
                                                                    addonGroupItem,
                                                                    r'''$._id''',
                                                                  ).toString()}\"]}',
                                                                );

                                                                if ((_model
                                                                        .includedAddonDelete2
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  if (AccountRequestItemInformationGroup
                                                                      .deleteAddonCall
                                                                      .actions(
                                                                    (_model.includedAddonDelete2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          AccountRequestItemInformationGroup
                                                                              .deleteAddonCall
                                                                              .text(
                                                                            (_model.includedAddonDelete2?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    );
                                                                  }
                                                                  safeSetState(() =>
                                                                      _model.apiRequestCompleter3 =
                                                                          null);
                                                                  await _model
                                                                      .waitForApiRequestCompleted3();
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Somthing went wrong',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                    ),
                                                                  );
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
                                                          ],
                                                        ),
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
                                                              'Keyscc_${addonGroupIndex.toString()}',
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
                                                              r'''$.totalPriceDisplay''',
                                                            ),
                                                            unitPrice:
                                                                getJsonField(
                                                              addonGroupItem,
                                                              r'''$.unitPriceDisplay''',
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
                      r'''$.included''',
                    )))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: ExpandableNotifier(
                            controller: _model.expandableExpandableController2,
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
                                      'cs9bhnbm' /* Included Addon */,
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
                                                  '1znbx96m' /* AddOns */,
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
                                                      .apiRequestCompleter4 ??=
                                                  Completer<ApiCallResponse>()
                                                    ..complete(
                                                        AccountRequestItemInformationGroup
                                                            .requestIncludedAddonCall
                                                            .call(
                                                      token: FFAppState()
                                                          .SessionToken,
                                                      parentRecordKey:
                                                          getJsonField(
                                                        widget.details,
                                                        r'''$.id''',
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
                                            final listViewincludedRequestIncludedAddonResponse =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final included =
                                                    AccountRequestItemInformationGroup
                                                            .requestIncludedAddonCall
                                                            .details(
                                                              listViewincludedRequestIncludedAddonResponse
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
                                                  primary: false,
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            InkWell(
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
                                                                _model.includedAddonDelete4 =
                                                                    await AccountRequestItemInformationGroup
                                                                        .deleteAddonCall
                                                                        .call(
                                                                  token: FFAppState()
                                                                      .SessionToken,
                                                                  aclientState:
                                                                      '{\"clientId\":\"eventRequestsAddonUI__items_addon_\",\"cursor\":{\"parentRecordKey\":\"${getJsonField(
                                                                    widget
                                                                        .details,
                                                                    r'''$.id''',
                                                                  ).toString()}\"},\"selection\":[\"${getJsonField(
                                                                    includedItem,
                                                                    r'''$._id''',
                                                                  ).toString()}\"]}',
                                                                );

                                                                if ((_model
                                                                        .includedAddonDelete4
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  safeSetState(() =>
                                                                      _model.apiRequestCompleter4 =
                                                                          null);
                                                                  await _model
                                                                      .waitForApiRequestCompleted4();
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
                                                          ],
                                                        ),
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
                                                              'Key94e_${includedIndex.toString()}',
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
                                                  'f7mx42tf' /* AddOns Group */,
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
                                          future: (_model
                                                      .apiRequestCompleter2 ??=
                                                  Completer<ApiCallResponse>()
                                                    ..complete(
                                                        AccountRequestItemInformationGroup
                                                            .requestIncludedGroupsAddonCall
                                                            .call(
                                                      parentRecordKey:
                                                          getJsonField(
                                                        widget.details,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      token: FFAppState()
                                                          .SessionToken,
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
                                            final listViewincludedGroupRequestIncludedGroupsAddonResponse =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final includedGroup =
                                                    AccountRequestItemInformationGroup
                                                            .requestIncludedGroupsAddonCall
                                                            .details(
                                                              listViewincludedGroupRequestIncludedGroupsAddonResponse
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            InkWell(
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
                                                                _model.includedAddonDelete3 =
                                                                    await AccountRequestItemInformationGroup
                                                                        .deleteAddonCall
                                                                        .call(
                                                                  token: FFAppState()
                                                                      .SessionToken,
                                                                  aclientState:
                                                                      '{\"clientId\":\"eventRequestsAddonUI__items_addon_\",\"cursor\":{\"parentRecordKey\":\"${getJsonField(
                                                                    widget
                                                                        .details,
                                                                    r'''$.id''',
                                                                  ).toString()}\"},\"selection\":[\"${getJsonField(
                                                                    includedGroupItem,
                                                                    r'''$._id''',
                                                                  ).toString()}\"]}',
                                                                );

                                                                if ((_model
                                                                        .includedAddonDelete3
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  safeSetState(() =>
                                                                      _model.apiRequestCompleter2 =
                                                                          null);
                                                                  await _model
                                                                      .waitForApiRequestCompleted2();
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
                                                          ],
                                                        ),
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
                                                              'Keyxe5_${includedGroupIndex.toString()}',
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
