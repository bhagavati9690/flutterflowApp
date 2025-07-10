import '/backend/api_requests/api_calls.dart';
import '/compoents/allvendor_search_comp/place_activity_comp/place_activity_comp_widget.dart';
import '/compoents/common_comp/name_filter/name_filter_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'vendor_request_comp_model.dart';
export 'vendor_request_comp_model.dart';

class VendorRequestCompWidget extends StatefulWidget {
  const VendorRequestCompWidget({
    super.key,
    required this.parentRecordKey,
  });

  final String? parentRecordKey;

  @override
  State<VendorRequestCompWidget> createState() =>
      _VendorRequestCompWidgetState();
}

class _VendorRequestCompWidgetState extends State<VendorRequestCompWidget> {
  late VendorRequestCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VendorRequestCompModel());

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
                          await VendorGroup
                              .requestPageSubmissionDateListPickerCall
                              .call(
                        parentRecordKey: widget.parentRecordKey,
                        uiContext:
                            '{\"key\":\"vendorRequests\",\"params\":{\"format\":[\"js\"]},\"component\":{\"clientId\":\"vendorRequests__vendorShoppingCartTopFilterPanel\",\"clientState\":{\"clientId\":\"vendorRequests__vendorShoppingCartTopFilterPanel\"}}}',
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
                                      .requestPageSubmissionDateListPickerCall
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
                        safeSetState(
                            () => _model.listViewPagingController?.refresh());
                        await _model.waitForOnePageForListView();
                      }

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'e8c97gnf' /* Submission Date */,
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
                      iconColor: _model.submissionDateLabel != null &&
                              _model.submissionDateLabel != ''
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FFAppConstants.vendorSecondaryColor,
                      color: _model.submissionDateLabel != null &&
                              _model.submissionDateLabel != ''
                          ? FFAppConstants.vendorSecondaryColor
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: _model.submissionDateLabel != null &&
                                    _model.submissionDateLabel != ''
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FFAppConstants.vendorSecondaryColor,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: _model.submissionDateLabel != null &&
                                _model.submissionDateLabel != ''
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FFAppConstants.vendorSecondaryColor,
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
                          .clbxEnShoppingCartStatusCursorCall
                          .call(
                        token: FFAppState().SessionToken,
                      );

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
                                      .clbxEnShoppingCartStatusCursorCall
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
                        safeSetState(
                            () => _model.listViewPagingController?.refresh());
                        await _model.waitForOnePageForListView();
                      }

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'c3fiokq9' /* Cart Status */,
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
                      iconColor: _model.cartStatusLabel != null &&
                              _model.cartStatusLabel != ''
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FFAppConstants.vendorSecondaryColor,
                      color: _model.cartStatusLabel != null &&
                              _model.cartStatusLabel != ''
                          ? FFAppConstants.vendorSecondaryColor
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: _model.cartStatusLabel != null &&
                                    _model.cartStatusLabel != ''
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FFAppConstants.vendorSecondaryColor,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: _model.cartStatusLabel != null &&
                                _model.cartStatusLabel != ''
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FFAppConstants.vendorSecondaryColor,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),
                Builder(
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
                              child: NameFilterWidget(
                                lable: 'Name',
                                selected: _model.prospectName,
                              ),
                            ),
                          );
                        },
                      ).then((value) =>
                          safeSetState(() => _model.nameResponse = value));

                      _model.prospectName = _model.nameResponse;
                      safeSetState(
                          () => _model.listViewPagingController?.refresh());
                      await _model.waitForOnePageForListView();

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'quh28gpd' /* Prospect Name */,
                    ),
                    icon: Icon(
                      Icons.person,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      iconPadding: EdgeInsets.all(0.0),
                      iconColor: _model.prospectName != null &&
                              _model.prospectName != ''
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FFAppConstants.vendorSecondaryColor,
                      color: _model.prospectName != null &&
                              _model.prospectName != ''
                          ? FFAppConstants.vendorSecondaryColor
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: _model.prospectName != null &&
                                    _model.prospectName != ''
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FFAppConstants.vendorSecondaryColor,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: _model.prospectName != null &&
                                _model.prospectName != ''
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FFAppConstants.vendorSecondaryColor,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),
                Builder(
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
                              child: NameFilterWidget(
                                lable: 'Email',
                                selected: _model.email,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(
                          () => _model.emailFilterResponse = value));

                      _model.email = _model.emailFilterResponse;
                      safeSetState(
                          () => _model.listViewPagingController?.refresh());
                      await _model.waitForOnePageForListView();

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'y4wji2hl' /* Prospect email */,
                    ),
                    icon: Icon(
                      Icons.mail,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      iconPadding: EdgeInsets.all(0.0),
                      iconColor: _model.email != null && _model.email != ''
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FFAppConstants.vendorSecondaryColor,
                      color: _model.email != null && _model.email != ''
                          ? FFAppConstants.vendorSecondaryColor
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: _model.email != null && _model.email != ''
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FFAppConstants.vendorSecondaryColor,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: _model.email != null && _model.email != ''
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FFAppConstants.vendorSecondaryColor,
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
        if (false)
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
                      safeSetState(
                          () => _model.listViewPagingController?.refresh());
                      await _model.waitForOnePageForListView();
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
              child: PagedListView<ApiPagingParams, dynamic>(
                pagingController: _model.setListViewController(
                  (nextPageMarker) => VendorGroup.vendorAllRequestCall.call(
                    start: nextPageMarker.nextPageNumber * 20,
                    page: nextPageMarker.numItems + 1,
                    limit: 20,
                    token: FFAppState().SessionToken,
                    clientState:
                        '{\"clientId\":\"vendorRequests__vendorRequestsForInfoShoppingGrid\",\"cursor\":{\"parentRecordKey\":\"${widget.parentRecordKey}\"},\"selection\":[]}',
                    filters: functions.vendorRequestInputFilter(
                        _model.submissionDateId,
                        _model.cartStatusId,
                        _model.prospectName,
                        _model.email,
                        null,
                        null),
                  ),
                ),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                reverse: false,
                scrollDirection: Axis.vertical,
                builderDelegate: PagedChildBuilderDelegate<dynamic>(
                  // Customize what your widget looks like when it's loading the first page.
                  firstPageProgressIndicatorBuilder: (_) => Center(
                    child: SizedBox(
                      width: 11.0,
                      height: 11.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  ),
                  // Customize what your widget looks like when it's loading another page.
                  newPageProgressIndicatorBuilder: (_) => Center(
                    child: SizedBox(
                      width: 11.0,
                      height: 11.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  ),

                  itemBuilder: (context, _, requestsIndex) {
                    final requestsItem = _model
                        .listViewPagingController!.itemList![requestsIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${getJsonField(
                                    requestsItem,
                                    r'''$['shoppingCart-_-consumerName']''',
                                  ).toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleMediumIsCustom,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${getJsonField(
                                    requestsItem,
                                    r'''$['shoppingCart-_-consumerPhoneNumber']''',
                                  ).toString()}',
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
                                Text(
                                  '\$ ${getJsonField(
                                    requestsItem,
                                    r'''$['shoppingCart-_-totalCost']''',
                                  ).toString()}',
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
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${getJsonField(
                                    requestsItem,
                                    r'''$['shoppingCart-_-consumerMailId']''',
                                  ).toString()}',
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
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${getJsonField(
                                        requestsItem,
                                        r'''$['shoppingCart-_-status-_-name']''',
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
                                        r'''$.submissionDate''',
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
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    _model.convertToOrderResponse =
                                        await VendorGroup
                                            .vendorRequestConvertToOrderCall
                                            .call(
                                      clientState:
                                          '{\"clientId\":\"vendorRequests__vendorRequestsForInfoShoppingGrid\",\"cursor\":{\"parentRecordKey\":\"${widget.parentRecordKey}\"},\"selection\":[\"${getJsonField(
                                        requestsItem,
                                        r'''$._id''',
                                      ).toString()}\"],\"currentPage\":1}',
                                      recordKey: widget.parentRecordKey,
                                      resourceId: widget.parentRecordKey,
                                    );

                                    if ((_model.convertToOrderResponse
                                            ?.succeeded ??
                                        true)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            VendorGroup
                                                .vendorRequestConvertToOrderCall
                                                .toastMsg(
                                              (_model.convertToOrderResponse
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
                                    'vw9ob2mo' /* Convert to Order */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 35.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconAlignment: IconAlignment.end,
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FFAppState().userType == 'vendor'
                                        ? FFAppConstants.vendorSecondaryColor
                                        : FFAppConstants.consumerSecondaryColor,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      RespondRequestListWidget.routeName,
                                      queryParameters: {
                                        'parentRecordKey': serializeParam(
                                          getJsonField(
                                            requestsItem,
                                            r'''$._id''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'recordKey': serializeParam(
                                          widget.parentRecordKey,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'cwufvczp' /* Respond */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 35.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconAlignment: IconAlignment.end,
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FFAppState().userType == 'vendor'
                                        ? FFAppConstants.vendorSecondaryColor
                                        : FFAppConstants.consumerSecondaryColor,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ].divide(SizedBox(height: 2.0)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
