import '/backend/api_requests/api_calls.dart';
import '/compoents/account_comp/request_details/request_details_widget.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'request_for_event_comp_model.dart';
export 'request_for_event_comp_model.dart';

class RequestForEventCompWidget extends StatefulWidget {
  const RequestForEventCompWidget({
    super.key,
    this.requestItem,
  });

  final dynamic requestItem;

  @override
  State<RequestForEventCompWidget> createState() =>
      _RequestForEventCompWidgetState();
}

class _RequestForEventCompWidgetState extends State<RequestForEventCompWidget> {
  late RequestForEventCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestForEventCompModel());

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

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getJsonField(
                              widget.requestItem,
                              r'''$['request-_-resItemReqName']''',
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
                          Text(
                            getJsonField(
                              widget.requestItem,
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
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.deleteOutput =
                                  await AccountRequestItemInformationGroup
                                      .deleteActiveRequestCall
                                      .call(
                                token: FFAppState().SessionToken,
                                clientState:
                                    '{\"clientId\":\"nearestUpcomingEventRequestsTab__cartSubmittedUIactiveInRequestCursor\",\"cursor\":{},\"selection\":[\"${getJsonField(
                                  widget.requestItem,
                                  r'''$.id''',
                                ).toString()}\"]}',
                              );

                              if ((_model.deleteOutput?.succeeded ?? true)) {
                                if (AccountRequestItemInformationGroup
                                    .deleteActiveRequestCall
                                    .actionSucess(
                                  (_model.deleteOutput?.jsonBody ?? ''),
                                )!) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                                  (_model.deleteOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$['todo']['messages']['mainMessage']['text']''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                (_model.deleteOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$['todo']['messages']['mainMessage']['text']''',
                                              ).toString()
                                            : getJsonField(
                                                (_model.deleteOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$['todo']['messages']['toasts'][0]['text']''',
                                              ).toString(),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 3350),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                    ),
                                  );
                                  if (getJsonField(
                                        (_model.deleteOutput?.jsonBody ?? ''),
                                        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
                                      ) !=
                                      null) {
                                    FFAppState().cartCount =
                                        functions.intToString(getJsonField(
                                      (_model.deleteOutput?.jsonBody ?? ''),
                                      r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
                                    ));
                                    _model.updatePage(() {});
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Somthing went wrong',
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

                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(
                                  MyEventsWidget.routeName,
                                  queryParameters: {
                                    'tab': serializeParam(
                                      2,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
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
                                        child: CustomErrorrAltertBoxWidget(),
                                      ),
                                    );
                                  },
                                );
                              }

                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.delete_outlined,
                              color: FlutterFlowTheme.of(context).error,
                              size: 26.0,
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          functions.validateAndFormatUrl(
                              getJsonField(
                                widget.requestItem,
                                r'''$['request-_-dummyImages']''',
                              ).toString(),
                              FFDevEnvironmentValues().BaseUrl)!,
                          width: MediaQuery.sizeOf(context).width * 0.35,
                          height: MediaQuery.sizeOf(context).height * 0.17,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.png',
                            width: MediaQuery.sizeOf(context).width * 0.35,
                            height: MediaQuery.sizeOf(context).height * 0.17,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (functions.checkJsonValue(getJsonField(
                            widget.requestItem,
                            r'''$['request-_-status-_-name']''',
                          )))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                                Flexible(
                                  child: AutoSizeText(
                                    getJsonField(
                                      widget.requestItem,
                                      r'''$['request-_-status-_-name']''',
                                    ).toString().maybeHandleOverflow(
                                          maxChars: 70,
                                          replacement: '…',
                                        ),
                                    textAlign: TextAlign.start,
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
                              ].divide(SizedBox(width: 5.0)),
                            ),
                          if (functions.checkJsonValue(getJsonField(
                            widget.requestItem,
                            r'''$['request-_-date']''',
                          )))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                                Flexible(
                                  child: AutoSizeText(
                                    (String date) {
                                      return date.replaceAll(
                                          RegExp(r'\s*\(\d{4}\)'), '');
                                    }(functions.formatDate(getJsonField(
                                      widget.requestItem,
                                      r'''$['request-_-date']''',
                                    ).toString())!)
                                        .maybeHandleOverflow(
                                      maxChars: 70,
                                      replacement: '…',
                                    ),
                                    textAlign: TextAlign.start,
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
                              ].divide(SizedBox(width: 5.0)),
                            ),
                          if (functions.checkJsonValue(getJsonField(
                            widget.requestItem,
                            r'''$['request-_-timeFrame']''',
                          )))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                                Flexible(
                                  child: AutoSizeText(
                                    getJsonField(
                                      widget.requestItem,
                                      r'''$['request-_-timeFrame']''',
                                    ).toString().maybeHandleOverflow(
                                          maxChars: 70,
                                          replacement: '…',
                                        ),
                                    textAlign: TextAlign.start,
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
                              ].divide(SizedBox(width: 5.0)),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.monetization_on_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              Flexible(
                                child: Text(
                                  (String original) {
                                    return original.isNotEmpty
                                        ? original.replaceFirst(
                                            "Total Price:", "")
                                        : "";
                                  }(getJsonField(
                                    widget.requestItem,
                                    r'''$['request-_-totalPriceDisplay']''',
                                  ).toString()),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.add_task,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              Flexible(
                                child: Text(
                                  'Quantity :${valueOrDefault<String>(
                                    getJsonField(
                                      widget.requestItem,
                                      r'''$['request-_-Quantity']''',
                                    )?.toString(),
                                    '1',
                                  )}',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 7.0)),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
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
                                child: RequestDetailsWidget(
                                  details: widget.requestItem!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'im7rm6fa' /* More  Details */,
                      ),
                      options: FFButtonOptions(
                        height: MediaQuery.sizeOf(context).height * 0.04,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                        elevation: 0.3,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ],
    );
  }
}
