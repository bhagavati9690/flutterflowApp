import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/error_page_view_compoent/error_page_view_compoent_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'renta_package_model.dart';
export 'renta_package_model.dart';

/// RentalItem
class RentaPackageWidget extends StatefulWidget {
  const RentaPackageWidget({
    super.key,
    required this.id,
  });

  final String? id;

  static String routeName = 'RentaPackage';
  static String routePath = 'rentaPackage';

  @override
  State<RentaPackageWidget> createState() => _RentaPackageWidgetState();
}

class _RentaPackageWidgetState extends State<RentaPackageWidget> {
  late RentaPackageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RentaPackageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.rentalPackageOuput = await RentalGroup.rentalPackageCall.call(
        clientState:
            '{\"clientId\":\"viewRentalDetail__rentalPkgGrid\",\"cursor\":{\"parentRecordKey\":\"${widget.id}\"},\"selection\":[]}',
      );

      if ((_model.rentalPackageOuput?.succeeded ?? true)) {
        _model.isPageLoad = true;
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).lemonLime,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'g753io3i' /* Rental Package */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineSmallFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: !FlutterFlowTheme.of(context)
                              .headlineSmallIsCustom,
                        ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Visibility(
              visible: _model.isPageLoad,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    if (!(RentalGroup.rentalPackageCall.details(
                              (_model.rentalPackageOuput?.jsonBody ?? ''),
                            ) !=
                            null &&
                        (RentalGroup.rentalPackageCall.details(
                          (_model.rentalPackageOuput?.jsonBody ?? ''),
                        ))!
                            .isNotEmpty))
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.errorPageViewCompoentModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ErrorPageViewCompoentWidget(
                              text: 'Items Not Present',
                            ),
                          ),
                        ],
                      ),
                    if (RentalGroup.rentalPackageCall.details(
                              (_model.rentalPackageOuput?.jsonBody ?? ''),
                            ) !=
                            null &&
                        (RentalGroup.rentalPackageCall.details(
                          (_model.rentalPackageOuput?.jsonBody ?? ''),
                        ))!
                            .isNotEmpty)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    '${RentalGroup.rentalPackageCall.totalCount(
                                          (_model.rentalPackageOuput
                                                  ?.jsonBody ??
                                              ''),
                                        )?.toString()}  items available',
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
                              ],
                            ),
                          ),
                          Flexible(
                            child: Builder(
                              builder: (context) {
                                final rentalPackage =
                                    RentalGroup.rentalPackageCall
                                            .details(
                                              (_model.rentalPackageOuput
                                                      ?.jsonBody ??
                                                  ''),
                                            )
                                            ?.toList() ??
                                        [];

                                return ListView.separated(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  itemCount: rentalPackage.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 10.0),
                                  itemBuilder: (context, rentalPackageIndex) {
                                    final rentalPackageItem =
                                        rentalPackage[rentalPackageIndex];
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 2.0, 10.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            child:
                                                                Image.network(
                                                              functions.validateAndFormatUrl(
                                                                  getJsonField(
                                                                    rentalPackageItem,
                                                                    r'''$.imageURL''',
                                                                  ).toString(),
                                                                  FFDevEnvironmentValues().BaseUrl)!,
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.35,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.22,
                                                              fit: BoxFit
                                                                  .contain,
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                'assets/images/error_image.png',
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.22,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        rentalPackageItem,
                                                                        r'''$['rentalPckg-_-resourcePackage-_-resourceItem-_-name']''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.plusJakartaSans(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF14181B),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .monetization_on,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              getJsonField(
                                                                                rentalPackageItem,
                                                                                r'''$['price']''',
                                                                              )?.toString(),
                                                                              'NA',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 4.0)),
                                                                    ),
                                                                    if (functions
                                                                        .checkJsonValue(
                                                                            getJsonField(
                                                                      rentalPackageItem,
                                                                      r'''$['rentalPckg-_-resourceItemDuartionFormatted']''',
                                                                    )))
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.timer_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                rentalPackageItem,
                                                                                r'''$['rentalPckg-_-resourceItemDuartionFormatted']''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4.0)),
                                                                      ),
                                                                    if (functions
                                                                        .checkJsonValue(
                                                                            getJsonField(
                                                                      rentalPackageItem,
                                                                      r'''$['rentalPckg-_-resourcePackage-_-defaultInvitee']''',
                                                                    )))
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.people_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                rentalPackageItem,
                                                                                r'''$['rentalPckg-_-resourcePackage-_-defaultInvitee']''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4.0)),
                                                                      ),
                                                                    if (functions
                                                                        .checkJsonValue(
                                                                            getJsonField(
                                                                      rentalPackageItem,
                                                                      r'''$['rentalPckg-_-resourcePackage-_-resourceItem-_-resource-_-ageRange']''',
                                                                    )))
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.nature_people_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                rentalPackageItem,
                                                                                r'''$['rentalPckg-_-resourcePackage-_-resourceItem-_-resource-_-ageRange']''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4.0)),
                                                                      ),
                                                                    if (functions
                                                                        .checkJsonValue(
                                                                            getJsonField(
                                                                      rentalPackageItem,
                                                                      r'''$['rentalPckg-_-resourcePackage-_-packagePrimaryActivity-_-activityType-_-name']''',
                                                                    )))
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.spoke,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                rentalPackageItem,
                                                                                r'''$['rentalPckg-_-resourcePackage-_-packagePrimaryActivity-_-activityType-_-name']''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4.0)),
                                                                      ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          1.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
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
                                                              context.pushNamed(
                                                                FoodSinglePageCartDetailsWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'recordKey':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      rentalPackageItem,
                                                                      r'''$._id''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'type':
                                                                      serializeParam(
                                                                    '1',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'resourceType':
                                                                      serializeParam(
                                                                    '2',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Column(
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
                                                                          16.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderRadius:
                                                                        8.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .navigate_next_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        FoodSinglePageCartDetailsWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'recordKey':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              rentalPackageItem,
                                                                              r'''$._id''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'type':
                                                                              serializeParam(
                                                                            '1',
                                                                            ParamType.String,
                                                                          ),
                                                                          'resourceType':
                                                                              serializeParam(
                                                                            '2',
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                      if (functions
                                                              .isHtmlDataValid(
                                                                  getJsonField(
                                                            rentalPackageItem,
                                                            r'''$['rentalPckg-_-resourcePackage-_-resourceItem-_-description']''',
                                                          ).toString()) ??
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'usjvdckk' /* Description :  */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyLargeIsCustom,
                                                                    ),
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .descriptionCompModels
                                                                    .getModel(
                                                                  rentalPackageIndex
                                                                      .toString(),
                                                                  rentalPackageIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    DescriptionCompWidget(
                                                                  key: Key(
                                                                    'Keyzi7_${rentalPackageIndex.toString()}',
                                                                  ),
                                                                  input:
                                                                      getJsonField(
                                                                    rentalPackageItem,
                                                                    r'''$['rentalPckg-_-resourcePackage-_-resourceItem-_-description']''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 2.0)),
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
                                    );
                                  },
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
        ),
      ),
    );
  }
}
