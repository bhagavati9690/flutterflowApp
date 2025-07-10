import '/backend/api_requests/api_calls.dart';
import '/compoents/allvendor_search_comp/place_activity_comp/place_activity_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'vendor_inquiry_comp_model.dart';
export 'vendor_inquiry_comp_model.dart';

class VendorInquiryCompWidget extends StatefulWidget {
  const VendorInquiryCompWidget({
    super.key,
    required this.parentRecordKey,
  });

  final String? parentRecordKey;

  @override
  State<VendorInquiryCompWidget> createState() =>
      _VendorInquiryCompWidgetState();
}

class _VendorInquiryCompWidgetState extends State<VendorInquiryCompWidget> {
  late VendorInquiryCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VendorInquiryCompModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(9.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) => FFButtonWidget(
                    onPressed: () async {
                      _model.submissionDateListPickerResponse =
                          await VendorGroup.enquiryDateListpickerCall.call(
                        parentRecordKey: widget.parentRecordKey,
                      );

                      if ((_model.submissionDateListPickerResponse?.succeeded ??
                          true)) {
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
                                child: PlaceActivityCompWidget(
                                  lable: 'Submission Date',
                                  partyListItem: VendorGroup
                                      .enquiryDateListpickerCall
                                      .details(
                                    (_model.submissionDateListPickerResponse
                                            ?.jsonBody ??
                                        ''),
                                  ),
                                  selected: _model.submissionDateId,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(
                            () => _model.dateAlertBoxResponse = value));

                        _model.submissionDateId =
                            _model.dateAlertBoxResponse?.id;
                        _model.submissionDateLabel =
                            _model.dateAlertBoxResponse?.name;
                        safeSetState(() => _model.apiRequestCompleter = null);
                        await _model.waitForApiRequestCompleted();
                      }

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'fwvkotyi' /* Submission Date */,
                    ),
                    icon: Icon(
                      Icons.date_range_outlined,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      iconPadding: EdgeInsets.all(0.0),
                      iconColor: FFAppState().userType == 'vendor'
                          ? Color(0xFF225956)
                          : FlutterFlowTheme.of(context).primary,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FFAppState().userType == 'vendor'
                            ? FFAppConstants.vendorSecondaryColor
                            : FFAppConstants.consumerSecondaryColor,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),
                Builder(
                  builder: (context) => FFButtonWidget(
                    onPressed: () async {
                      _model.shoppingCartStatusResponse = await VendorGroup
                          .cLBXEnProspectInquiryStatusCall
                          .call();

                      if ((_model.shoppingCartStatusResponse?.succeeded ??
                          true)) {
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
                                child: PlaceActivityCompWidget(
                                  lable: 'Shopping Cart Status',
                                  partyListItem: VendorGroup
                                      .cLBXEnProspectInquiryStatusCall
                                      .details(
                                    (_model.shoppingCartStatusResponse
                                            ?.jsonBody ??
                                        ''),
                                  ),
                                  selected: _model.cartStatusId,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(
                            () => _model.cartStatusAlertBoxResponse = value));

                        _model.cartStatusId =
                            _model.cartStatusAlertBoxResponse?.id;
                        _model.cartStatusLabel =
                            _model.cartStatusAlertBoxResponse?.name;
                        safeSetState(() => _model.apiRequestCompleter = null);
                        await _model.waitForApiRequestCompleted();
                      }

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'zjldh6z8' /* Cart Status */,
                    ),
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      iconPadding: EdgeInsets.all(0.0),
                      iconColor: FFAppState().userType == 'vendor'
                          ? Color(0xFF225956)
                          : FlutterFlowTheme.of(context).primary,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FFAppState().userType == 'vendor'
                            ? FFAppConstants.vendorSecondaryColor
                            : FFAppConstants.consumerSecondaryColor,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),
              ].divide(SizedBox(width: 5.0)),
            ),
          ),
        ),
        if ((_model.cartStatusLabel != null && _model.cartStatusLabel != '') ||
            (_model.submissionDateLabel != null &&
                _model.submissionDateLabel != '') ||
            (_model.prospectName != null && _model.prospectName != '') ||
            (_model.email != null && _model.email != ''))
          Padding(
            padding: EdgeInsets.all(9.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.cartStatusId = null;
                      _model.cartStatusLabel = null;
                      _model.submissionDateId = null;
                      _model.submissionDateLabel = null;
                      _model.prospectName = null;
                      _model.email = null;
                      safeSetState(() => _model.apiRequestCompleter = null);
                      await _model.waitForApiRequestCompleted();
                    },
                    child: Icon(
                      Icons.clear,
                      color: Color(0xFFDF0000),
                      size: 24.0,
                    ),
                  ),
                  if (_model.submissionDateLabel != null &&
                      _model.submissionDateLabel != '')
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: _model.submissionDateLabel!,
                      icon: Icon(
                        Icons.date_range_outlined,
                        size: 20.0,
                      ),
                      options: FFButtonOptions(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        iconPadding: EdgeInsets.all(0.0),
                        iconColor: FFAppState().userType == 'vendor'
                            ? Color(0xFF225956)
                            : FlutterFlowTheme.of(context).primary,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .titleSmallIsCustom,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FFAppState().userType == 'vendor'
                              ? FFAppConstants.vendorSecondaryColor
                              : FFAppConstants.consumerSecondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      showLoadingIndicator: false,
                    ),
                  if (_model.cartStatusLabel != null &&
                      _model.cartStatusLabel != '')
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: _model.cartStatusLabel!,
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 20.0,
                      ),
                      options: FFButtonOptions(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        iconPadding: EdgeInsets.all(0.0),
                        iconColor: FFAppState().userType == 'vendor'
                            ? Color(0xFF225956)
                            : FlutterFlowTheme.of(context).primary,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .titleSmallIsCustom,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FFAppState().userType == 'vendor'
                              ? FFAppConstants.vendorSecondaryColor
                              : FFAppConstants.consumerSecondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      showLoadingIndicator: false,
                    ),
                  if (_model.prospectName != null && _model.prospectName != '')
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: _model.prospectName!,
                      icon: Icon(
                        Icons.person,
                        size: 20.0,
                      ),
                      options: FFButtonOptions(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        iconPadding: EdgeInsets.all(0.0),
                        iconColor: FFAppState().userType == 'vendor'
                            ? Color(0xFF225956)
                            : FlutterFlowTheme.of(context).primary,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .titleSmallIsCustom,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FFAppState().userType == 'vendor'
                              ? FFAppConstants.vendorSecondaryColor
                              : FFAppConstants.consumerSecondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      showLoadingIndicator: false,
                    ),
                  if (_model.email != null && _model.email != '')
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: _model.email!,
                      icon: Icon(
                        Icons.mail,
                        size: 20.0,
                      ),
                      options: FFButtonOptions(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        iconPadding: EdgeInsets.all(0.0),
                        iconColor: FFAppState().userType == 'vendor'
                            ? Color(0xFF225956)
                            : FlutterFlowTheme.of(context).primary,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .titleSmallIsCustom,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FFAppState().userType == 'vendor'
                              ? FFAppConstants.vendorSecondaryColor
                              : FFAppConstants.consumerSecondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      showLoadingIndicator: false,
                    ),
                ].divide(SizedBox(width: 5.0)),
              ),
            ),
          ),
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FutureBuilder<ApiCallResponse>(
                future: (_model
                        .apiRequestCompleter ??= Completer<ApiCallResponse>()
                      ..complete(VendorGroup.vendorAllInquiryCursorCall.call(
                        clientState:
                            '{\"clientId\":\"customerInquiries__customerInquiriesUIGrid\",\"cursor\":{\"parentRecordKey\":\"${widget.parentRecordKey}\"},\"selection\":[]}',
                        filters: functions.vendorRequestInputFilter(
                            null,
                            null,
                            null,
                            null,
                            _model.submissionDateId,
                            _model.cartStatusId),
                      )))
                    .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
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
                  final listViewVendorAllInquiryCursorResponse = snapshot.data!;

                  return Builder(
                    builder: (context) {
                      final requests = VendorGroup.vendorAllInquiryCursorCall
                              .details(
                                listViewVendorAllInquiryCursorResponse.jsonBody,
                              )
                              ?.toList() ??
                          [];

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: requests.length,
                        itemBuilder: (context, requestsIndex) {
                          final requestsItem = requests[requestsIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${getJsonField(
                                          requestsItem,
                                          r'''$.comments''',
                                        ).toString()}',
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
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${getJsonField(
                                            requestsItem,
                                            r'''$.comments''',
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
                                      ],
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${getJsonField(
                                          requestsItem,
                                          r'''$['status-_-name']''',
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
                                        '${getJsonField(
                                          requestsItem,
                                          r'''$.lastModifiedOn''',
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
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            VendorInquiryResponseWidget
                                                .routeName,
                                            queryParameters: {
                                              'parentRecordKey': serializeParam(
                                                widget.parentRecordKey,
                                                ParamType.String,
                                              ),
                                              'recordKey': serializeParam(
                                                getJsonField(
                                                  requestsItem,
                                                  r'''$._id''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'w442xgsp' /* Respond */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 35.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconAlignment: IconAlignment.end,
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color:
                                              FFAppState().userType == 'vendor'
                                                  ? FFAppConstants
                                                      .vendorSecondaryColor
                                                  : FFAppConstants
                                                      .consumerSecondaryColor,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          _model.closeInquiryResponse =
                                              await VendorGroup
                                                  .closeInquiryActionCall
                                                  .call(
                                            clientState:
                                                '{\"clientId\":\"customerInquiries__customerInquiriesUIGrid\",\"cursor\":{\"parentRecordKey\":\"${widget.parentRecordKey}\"},\"selection\":[\"${getJsonField(
                                              requestsItem,
                                              r'''$._id''',
                                            ).toString()}\"]}',
                                          );

                                          if ((_model.closeInquiryResponse
                                                  ?.succeeded ??
                                              true)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  VendorGroup
                                                      .closeInquiryActionCall
                                                      .toastTxt(
                                                    (_model.closeInquiryResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!,
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            );
                                            safeSetState(() => _model
                                                .apiRequestCompleter = null);
                                            await _model
                                                .waitForApiRequestCompleted();
                                          }

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'uhjsq0kv' /* Close Inquiry */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 35.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color:
                                              FFAppState().userType == 'vendor'
                                                  ? FFAppConstants
                                                      .vendorSecondaryColor
                                                  : FFAppConstants
                                                      .consumerSecondaryColor,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
