import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/compoents/common_comp/variation_selection_comp/variation_selection_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'package_variation_page_model.dart';
export 'package_variation_page_model.dart';

class PackageVariationPageWidget extends StatefulWidget {
  const PackageVariationPageWidget({
    super.key,
    required this.resourceItemId,
    required this.recordKey,
    required this.type,
    this.spaceId,
    this.packageId,
  });

  final String? resourceItemId;
  final int? recordKey;
  final int? type;
  final int? spaceId;
  final int? packageId;

  static String routeName = 'PackageVariationPage';
  static String routePath = 'packageVariationPage';

  @override
  State<PackageVariationPageWidget> createState() =>
      _PackageVariationPageWidgetState();
}

class _PackageVariationPageWidgetState
    extends State<PackageVariationPageWidget> {
  late PackageVariationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PackageVariationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.variationQuery = ClientQueryStruct(
        clientId: 'variationTabUI__variationTabUIGrid',
        cursor: CursorStruct(
          parentRecordKey: widget.resourceItemId,
        ),
      );
      safeSetState(() {});
      if ('0' == '1') {
        _model.apiResultx08 = await VenuesGroup.venuePackageVariationCall.call(
          queryJson: _model.variationQuery?.toMap(),
        );

        if ((_model.apiResultx08?.succeeded ?? true)) {
          _model.variationList = functions
              .mapNameIdSearchable((_model.apiResultx08?.jsonBody ?? ''))!
              .toList()
              .cast<NameIdSearchableStruct>();
          _model.apiLoaded = true;
          safeSetState(() {});
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
      } else {
        _model.spaceVariationDetails =
            await VenuesGroup.venueSpaceVariationDetailsCall.call(
          query:
              '{\"clientId\":\"variationTabUI__variationTabUIGrid\",\"cursor\":{\"parentRecordKey\":\"${widget.resourceItemId}\"},\"selection\":[],\"currentPage\":1}',
        );

        if ((_model.spaceVariationDetails?.succeeded ?? true)) {
          _model.variationList = functions
              .mapNameIdSearchable(
                  (_model.spaceVariationDetails?.jsonBody ?? ''))!
              .toList()
              .cast<NameIdSearchableStruct>();
          _model.apiLoaded = true;
          safeSetState(() {});
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
                'u2sispha' /* Select Variation */,
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
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (context) {
                            final item =
                                VenuesGroup.venueSpaceVariationDetailsCall
                                        .details(
                                          (_model.spaceVariationDetails
                                                  ?.jsonBody ??
                                              ''),
                                        )
                                        ?.toList() ??
                                    [];

                            return ListView.separated(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: item.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, itemIndex) {
                                final itemItem = item[itemIndex];
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 2.0, 10.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      DateAndTimeTab1Widget
                                                          .routeName,
                                                      queryParameters: {
                                                        'recordKey':
                                                            serializeParam(
                                                          functions.stringToInt(
                                                              widget.recordKey
                                                                  ?.toString()),
                                                          ParamType.int,
                                                        ),
                                                        'type': serializeParam(
                                                          functions.stringToInt(
                                                              widget.type
                                                                  ?.toString()),
                                                          ParamType.int,
                                                        ),
                                                        'packageId':
                                                            serializeParam(
                                                          widget.packageId !=
                                                                  null
                                                              ? functions.stringToInt(
                                                                  widget
                                                                      .packageId
                                                                      ?.toString())
                                                              : null,
                                                          ParamType.int,
                                                        ),
                                                        'spaceId':
                                                            serializeParam(
                                                          widget.spaceId !=
                                                                  null
                                                              ? functions.stringToInt(
                                                                  widget
                                                                      .spaceId
                                                                      ?.toString())
                                                              : null,
                                                          ParamType.int,
                                                        ),
                                                        'denominatorId':
                                                            serializeParam(
                                                          functions.stringToInt(
                                                              getJsonField(
                                                            itemItem,
                                                            r'''$._id''',
                                                          ).toString()),
                                                          ParamType.int,
                                                        ),
                                                        'denomName':
                                                            serializeParam(
                                                          getJsonField(
                                                            itemItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
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
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              itemItem,
                                                              r'''$['name']''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .plusJakartaSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF14181B),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Divider(
                                                                thickness: 2.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                child: Image
                                                                    .network(
                                                                  functions.validateAndFormatUrl(
                                                                      getJsonField(
                                                                        itemItem,
                                                                        r'''$['image-_-url']''',
                                                                      ).toString(),
                                                                      FFDevEnvironmentValues().BaseUrl)!,
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.35,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.35,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (functions
                                                                            .checkJsonValue(getJsonField(
                                                                          itemItem,
                                                                          r'''$.formatedPrice''',
                                                                        )))
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () {
                                                                                print('Button pressed ...');
                                                                              },
                                                                              text: functions.priceFormat(getJsonField(
                                                                                itemItem,
                                                                                r'''$.pricing''',
                                                                              ).toString())!,
                                                                              icon: Icon(
                                                                                Icons.price_change,
                                                                                size: 15.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: MediaQuery.sizeOf(context).height * 0.03,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (functions.checkJsonValue(getJsonField(
                                                                              itemItem,
                                                                              r'''$['resourceItem-_-additionalInfo-_-availAge-_-minAge']''',
                                                                            )) ||
                                                                            functions.checkJsonValue(getJsonField(
                                                                              itemItem,
                                                                              r'''$['resourceItem-_-additionalInfo-_-availAge-_-maxAge']''',
                                                                            )))
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () {
                                                                                print('Button pressed ...');
                                                                              },
                                                                              text: '${getJsonField(
                                                                                itemItem,
                                                                                r'''$['resourceItem-_-additionalInfo-_-availAge-_-minAge']''',
                                                                              ).toString()} - ${getJsonField(
                                                                                itemItem,
                                                                                r'''$['resourceItem-_-additionalInfo-_-availAge-_-maxAge']''',
                                                                              ).toString()}',
                                                                              icon: Icon(
                                                                                Icons.family_restroom_outlined,
                                                                                size: 15.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: MediaQuery.sizeOf(context).height * 0.03,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (functions.checkJsonValue(getJsonField(
                                                                              itemItem,
                                                                              r'''$['minDuration']''',
                                                                            )) ||
                                                                            functions.checkJsonValue(getJsonField(
                                                                              itemItem,
                                                                              r'''$['maxDuration']''',
                                                                            )))
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () {
                                                                                print('Button pressed ...');
                                                                              },
                                                                              text: '${getJsonField(
                                                                                itemItem,
                                                                                r'''$['minDuration']''',
                                                                              ).toString()} - ${getJsonField(
                                                                                itemItem,
                                                                                r'''$['maxDuration']''',
                                                                              ).toString()}',
                                                                              icon: Icon(
                                                                                Icons.timer_rounded,
                                                                                size: 15.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: MediaQuery.sizeOf(context).height * 0.03,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(0.0),
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
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Html(
                                                                  data:
                                                                      getJsonField(
                                                                    itemItem,
                                                                    r'''$['description']''',
                                                                  ).toString(),
                                                                  onLinkTap: (url,
                                                                          _,
                                                                          __) =>
                                                                      launchURL(
                                                                          url!),
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
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FFButtonWidget(
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
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: VariationSelectionCompWidget(
                                            variationList: _model.variationList,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(
                                    () => _model.selectedVariation = value));

                                if (_model.selectedVariation != null) {
                                  context.pushNamed(
                                    DateAndTimeTab1Widget.routeName,
                                    queryParameters: {
                                      'recordKey': serializeParam(
                                        functions.stringToInt(
                                            widget.recordKey?.toString()),
                                        ParamType.int,
                                      ),
                                      'type': serializeParam(
                                        functions.stringToInt(
                                            widget.type?.toString()),
                                        ParamType.int,
                                      ),
                                      'packageId': serializeParam(
                                        widget.packageId != null
                                            ? functions.stringToInt(
                                                widget.packageId?.toString())
                                            : null,
                                        ParamType.int,
                                      ),
                                      'spaceId': serializeParam(
                                        widget.spaceId != null
                                            ? functions.stringToInt(
                                                widget.spaceId?.toString())
                                            : null,
                                        ParamType.int,
                                      ),
                                      'denominatorId': serializeParam(
                                        functions.stringToInt(
                                            _model.selectedVariation?.id),
                                        ParamType.int,
                                      ),
                                      'denomName': serializeParam(
                                        _model.selectedVariation?.name,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '68868xe3' /* Next */,
                              ),
                              icon: Icon(
                                Icons.shopping_cart_sharp,
                                size: 22.0,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.55,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleLargeFamily,
                                      color: FlutterFlowTheme.of(context)
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
                                borderRadius: BorderRadius.circular(18.0),
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
        ),
      ),
    );
  }
}
