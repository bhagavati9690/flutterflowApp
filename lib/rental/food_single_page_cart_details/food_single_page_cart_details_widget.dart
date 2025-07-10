import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'food_single_page_cart_details_model.dart';
export 'food_single_page_cart_details_model.dart';

/// foodSinglePageCartUI
class FoodSinglePageCartDetailsWidget extends StatefulWidget {
  const FoodSinglePageCartDetailsWidget({
    super.key,
    required this.recordKey,
    String? type,
    String? resourceType,
    String? quantity,
    String? variationKey,
  })  : this.type = type ?? '1',
        this.resourceType = resourceType ?? '2',
        this.quantity = quantity ?? '1',
        this.variationKey = variationKey ?? '-1';

  final String? recordKey;

  /// This is itemTYpe,
  final String type;

  final String resourceType;
  final String quantity;
  final String variationKey;

  static String routeName = 'foodSinglePageCartDetails';
  static String routePath = 'foodSinglePageCartDetails';

  @override
  State<FoodSinglePageCartDetailsWidget> createState() =>
      _FoodSinglePageCartDetailsWidgetState();
}

class _FoodSinglePageCartDetailsWidgetState
    extends State<FoodSinglePageCartDetailsWidget>
    with TickerProviderStateMixin {
  late FoodSinglePageCartDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodSinglePageCartDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.foodSinglePageDetailsouput =
          await RentalGroup.foodSinglePageDetailCall.call(
        recordKey: widget.recordKey,
        type: widget.type,
        resourceType: widget.resourceType,
        quantity: widget.quantity,
        token: FFAppState().SessionToken,
        variationKey: widget.variationKey,
      );

      if ((_model.foodSinglePageDetailsouput?.succeeded ?? true)) {
        if (FFAppState().SessionToken == '') {
          FFAppState().SessionToken =
              (_model.foodSinglePageDetailsouput?.getHeader('cbxtoken') ?? '');
        }
        _model.isPageLoad = true;
        _model.denomId = valueOrDefault<String>(
          RentalGroup.foodSinglePageDetailCall.resouceItemdenomId(
            (_model.foodSinglePageDetailsouput?.jsonBody ?? ''),
          ),
          '-1',
        );
        _model.variationName = getJsonField(
          RentalGroup.foodSinglePageDetailCall
              .denomList(
                (_model.foodSinglePageDetailsouput?.jsonBody ?? ''),
              )
              ?.where((e) =>
                  getJsonField(
                    e,
                    r'''$.id''',
                  ).toString().toString() ==
                  _model.denomId)
              .toList()
              .firstOrNull,
          r'''$.name''',
        ).toString().toString();
        _model.personServed = RentalGroup.foodSinglePageDetailCall.personServed(
          (_model.foodSinglePageDetailsouput?.jsonBody ?? ''),
        );
        _model.unitPrice = RentalGroup.foodSinglePageDetailCall.unitPrice(
          (_model.foodSinglePageDetailsouput?.jsonBody ?? ''),
        )!;
        _model.totalPrice = RentalGroup.foodSinglePageDetailCall.priceToDisplay(
          (_model.foodSinglePageDetailsouput?.jsonBody ?? ''),
        )!;
        _model.data = RentalGroup.foodSinglePageDetailCall
            .details(
              (_model.foodSinglePageDetailsouput?.jsonBody ?? ''),
            )
            ?.firstOrNull;
        safeSetState(() {});
        safeSetState(() {
          _model.countControllerValue = functions
              .stringToInt(RentalGroup.foodSinglePageDetailCall.quantity(
            (_model.foodSinglePageDetailsouput?.jsonBody ?? ''),
          ))!;
        });
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

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Visibility(
            visible: _model.isPageLoad,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).lemonLime,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          buttonSize: 42.3,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).clbxBlack,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            safeSetState(() {
                              _model.countControllerValue = 1;
                            });
                            context.safePop();
                          },
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                valueOrDefault<String>(
                                  RentalGroup.foodSinglePageDetailCall.itemName(
                                    (_model.foodSinglePageDetailsouput
                                            ?.jsonBody ??
                                        ''),
                                  ),
                                  'Namefgnghnjghnfggbfgbdfgfdgbdfbgbfdbfbfghfbgfbfgbfgbffdfvf',
                                ),
                                minFontSize: 12.0,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleLargeFamily,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleLargeIsCustom,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  RentalGroup.foodSinglePageDetailCall
                                      .resourceTypeName(
                                    (_model.foodSinglePageDetailsouput
                                            ?.jsonBody ??
                                        ''),
                                  ),
                                  'type',
                                ),
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
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (RentalGroup.foodSinglePageDetailCall.denomIdList(
                                  (_model.foodSinglePageDetailsouput
                                          ?.jsonBody ??
                                      ''),
                                ) !=
                                null &&
                            (RentalGroup.foodSinglePageDetailCall.denomIdList(
                              (_model.foodSinglePageDetailsouput?.jsonBody ??
                                  ''),
                            ))!
                                .isNotEmpty)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).lemonLime,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 16.0, 10.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'cp5f15rg' /* Variations */,
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
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).lemonLime,
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Builder(
                                          builder: (context) {
                                            final denom = RentalGroup
                                                    .foodSinglePageDetailCall
                                                    .denomList(
                                                      (_model.foodSinglePageDetailsouput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                    ?.toList() ??
                                                [];

                                            return Wrap(
                                              spacing: 14.0,
                                              runSpacing: 14.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: List.generate(
                                                  denom.length, (denomIndex) {
                                                final denomItem =
                                                    denom[denomIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.rentalPackageVariationUpdateOutput =
                                                        await RentalGroup
                                                            .rentalPackageVariationUpdateCall
                                                            .call(
                                                      id: RentalGroup
                                                          .foodSinglePageDetailCall
                                                          .formId(
                                                        (_model.foodSinglePageDetailsouput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      denominatorId:
                                                          getJsonField(
                                                        denomItem,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      clientState:
                                                          '{\"clientId\":\"foodSinglePageCartUI__foodSinglePageCartForm\",\"cursor\":{\"__cachedId\":\"${RentalGroup.foodSinglePageDetailCall.formId(
                                                        (_model.foodSinglePageDetailsouput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )}\"}}',
                                                    );

                                                    if ((_model
                                                            .rentalPackageVariationUpdateOutput
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.denomId =
                                                          getJsonField(
                                                        denomItem,
                                                        r'''$.id''',
                                                      ).toString();
                                                      _model.variationName =
                                                          getJsonField(
                                                        RentalGroup
                                                            .foodSinglePageDetailCall
                                                            .denomList(
                                                              (_model.foodSinglePageDetailsouput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            ?.where((e) =>
                                                                getJsonField(
                                                                  e,
                                                                  r'''$.id''',
                                                                ).toString() ==
                                                                _model.denomId)
                                                            .toList()
                                                            .firstOrNull,
                                                        r'''$.name''',
                                                      ).toString();
                                                      _model.data = RentalGroup
                                                          .rentalPackageVariationUpdateCall
                                                          .details(
                                                            (_model.rentalPackageVariationUpdateOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          ?.firstOrNull;
                                                      _model.unitPrice = RentalGroup
                                                          .rentalPackageVariationUpdateCall
                                                          .unitPrice(
                                                        (_model.rentalPackageVariationUpdateOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      _model.totalPrice =
                                                          RentalGroup
                                                              .rentalPackageVariationUpdateCall
                                                              .priceToDisplay(
                                                        (_model.rentalPackageVariationUpdateOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      _model.personServed =
                                                          RentalGroup
                                                              .rentalPackageVariationUpdateCall
                                                              .minPersonServerd(
                                                        (_model.rentalPackageVariationUpdateOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                      safeSetState(() {});
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: getJsonField(
                                                                denomItem,
                                                                r'''$.id''',
                                                              ).toString() ==
                                                              _model.denomId
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  8.0,
                                                                  16.0,
                                                                  8.0),
                                                      child: Text(
                                                        getJsonField(
                                                          denomItem,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  color: getJsonField(
                                                                            denomItem,
                                                                            r'''$.id''',
                                                                          ).toString() ==
                                                                          _model.denomId
                                                                      ? FlutterFlowTheme.of(context).secondaryBackground
                                                                      : FlutterFlowTheme.of(context).primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLargeIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 7.0, 10.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.variationName,
                                    'name',
                                  ),
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
                              ),
                            ],
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            decoration: BoxDecoration(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.network(
                                functions.validateAndFormatUrl(
                                    getJsonField(
                                      _model.data,
                                      r'''$.imageUrl''',
                                    ).toString(),
                                    FFDevEnvironmentValues().BaseUrl)!,
                                fit: BoxFit.contain,
                                alignment: Alignment(0.0, 0.0),
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.png',
                                  fit: BoxFit.contain,
                                  alignment: Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Wrap(
                                  spacing: 30.0,
                                  runSpacing: 11.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    if ((_model.totalPrice != '') &&
                                        (_model.totalPrice != '0'))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.12,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .monetization_on_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${functions.removePriceLabel(_model.totalPrice, true)}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLargeIsCustom,
                                                                ),
                                                          ),
                                                          Opacity(
                                                            opacity: 0.7,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'zpuhd0j9' /* TotalPrice */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation1']!),
                                        ],
                                      ),
                                    if (widget.resourceType == '1'
                                        ? false
                                        : true)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if ((_model.unitPrice != '') &&
                                              (_model.unitPrice != '0'))
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.12,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.05,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .monetization_on,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '\$${_model.unitPrice}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
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
                                                                Opacity(
                                                                  opacity: 0.7,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1zj1ngsx' /* unitprice */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 6.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation2']!),
                                              ],
                                            ),
                                        ],
                                      ),
                                    if (functions.checkJsonValue(getJsonField(
                                      _model.data,
                                      r'''$.peronServerd''',
                                    )))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.12,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      child: Icon(
                                                        Icons.people_alt_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${valueOrDefault<String>(
                                                              _model
                                                                  .personServed,
                                                              '1',
                                                            )}Serves',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLargeIsCustom,
                                                                ),
                                                          ),
                                                          Opacity(
                                                            opacity: 0.7,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'r5igeg10' /* persons */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation3']!),
                                        ],
                                      ),

                                    // Only for Cake
                                    if (functions.checkJsonValue(getJsonField(
                                      _model.data,
                                      r'''$.servedForCake''',
                                    )))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.12,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      child: Icon(
                                                        Icons.people_alt_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              RentalGroup
                                                                  .foodSinglePageDetailCall
                                                                  .servedForCake(
                                                                (_model.foodSinglePageDetailsouput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              '0',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLargeIsCustom,
                                                                ),
                                                          ),
                                                          Opacity(
                                                            opacity: 0.7,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'z3fsj0sg' /* persons */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation4']!),
                                        ],
                                      ),

                                    // Hide  for cake and food (refering Scala code)
                                    if (() {
                                      if (RentalGroup.foodSinglePageDetailCall
                                              .resourceTypeId(
                                            (_model.foodSinglePageDetailsouput
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          '5') {
                                        return false;
                                      } else if (RentalGroup
                                              .foodSinglePageDetailCall
                                              .resourceTypeId(
                                            (_model.foodSinglePageDetailsouput
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          '3') {
                                        return false;
                                      } else {
                                        return functions
                                            .checkJsonValue(getJsonField(
                                          _model.data,
                                          r'''$.accomodates''',
                                        ));
                                      }
                                    }())
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.12,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      child: Icon(
                                                        Icons.people_alt_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              RentalGroup
                                                                  .foodSinglePageDetailCall
                                                                  .accomodates(
                                                                (_model.foodSinglePageDetailsouput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              '1',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLargeIsCustom,
                                                                ),
                                                          ),
                                                          Opacity(
                                                            opacity: 0.7,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '0gc68rga' /* accomodates */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation5']!),
                                        ],
                                      ),

                                    // hide for ENtertainer (condition in scala)
                                    if (RentalGroup.foodSinglePageDetailCall
                                                .resourceTypeId(
                                              (_model.foodSinglePageDetailsouput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            '1'
                                        ? false
                                        : functions.checkJsonValue(getJsonField(
                                            _model.data,
                                            r'''$.calorie''',
                                          )))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.12,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.05,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .energy_savings_leaf,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              RentalGroup
                                                                  .foodSinglePageDetailCall
                                                                  .calorie(
                                                                (_model.foodSinglePageDetailsouput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              '1',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLargeIsCustom,
                                                                ),
                                                          ),
                                                          Opacity(
                                                            opacity: 0.7,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                't07gruzw' /* calorie */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation6']!),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (functions.isHtmlDataValid(getJsonField(
                              _model.data,
                              r'''$.description''',
                            ).toString()) ??
                            true)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'jfcedczo' /* Description :  */,
                                  ),
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
                                Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
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
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        wrapWithModel(
                                          model: _model.descriptionCompModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DescriptionCompWidget(
                                            input: getJsonField(
                                              _model.data,
                                              r'''$.description''',
                                            ).toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 2.0)),
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 16.0))
                          .addToEnd(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Wrap(
                    spacing: 26.0,
                    runSpacing: 14.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      if (widget.resourceType == '1' ? false : true)
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.35,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          child: FlutterFlowCountController(
                            decrementIconBuilder: (enabled) => Icon(
                              Icons.remove_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).secondaryText
                                  : FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                            incrementIconBuilder: (enabled) => Icon(
                              Icons.add_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleLargeFamily,
                                    letterSpacing: 16.0,
                                    lineHeight: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleLargeIsCustom,
                                  ),
                            ),
                            count: _model.countControllerValue ??= 1,
                            updateCount: (count) async {
                              safeSetState(
                                  () => _model.countControllerValue = count);
                              _model.rentalPackageQuantityUpdateOutput =
                                  await RentalGroup
                                      .rentalPackageQuantityUpdateCall
                                      .call(
                                quantity: valueOrDefault<String>(
                                  _model.countControllerValue?.toString(),
                                  '1',
                                ),
                                id: RentalGroup.foodSinglePageDetailCall.formId(
                                  (_model.foodSinglePageDetailsouput
                                          ?.jsonBody ??
                                      ''),
                                ),
                                clientState:
                                    '{\"clientId\":\"foodSinglePageCartUI__foodSinglePageCartForm\",\"cursor\":{\"__cachedId\":\"${RentalGroup.foodSinglePageDetailCall.formId(
                                  (_model.foodSinglePageDetailsouput
                                          ?.jsonBody ??
                                      ''),
                                )}\"}}',
                              );

                              if ((_model.rentalPackageVariationUpdateOutput
                                      ?.succeeded ??
                                  true)) {
                                _model.unitPrice = RentalGroup
                                    .rentalPackageQuantityUpdateCall
                                    .unitPrice(
                                  (_model.rentalPackageQuantityUpdateOutput
                                          ?.jsonBody ??
                                      ''),
                                )!;
                                _model.totalPrice = RentalGroup
                                    .rentalPackageQuantityUpdateCall
                                    .priceToDisplay(
                                  (_model.rentalPackageQuantityUpdateOutput
                                          ?.jsonBody ??
                                      ''),
                                )!;
                                _model.personServed = RentalGroup
                                    .rentalPackageQuantityUpdateCall
                                    .minpersonServed(
                                  (_model.rentalPackageQuantityUpdateOutput
                                          ?.jsonBody ??
                                      ''),
                                );
                                safeSetState(() {});
                              }

                              safeSetState(() {});
                            },
                            stepSize: 1,
                            minimum: 1,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                        ),
                      FFButtonWidget(
                        onPressed: () async {
                          _model.nextResponse = await RentalShoppingCartGroup
                              .foodSinglePageNextCall
                              .call(
                            quantity: _model.countControllerValue?.toString(),
                            resourceType: widget.resourceType,
                            dataActionType: '0',
                            type: widget.type,
                            recordKey: widget.recordKey,
                            clientState:
                                '{\"clientId\":\"foodSinglePageCartUI__foodSinglePageCartForm\",\"cursor\":{\"__cachedId\":\"${RentalGroup.foodSinglePageDetailCall.formId(
                              (_model.foodSinglePageDetailsouput?.jsonBody ??
                                  ''),
                            )}\"}}',
                            id: RentalGroup.foodSinglePageDetailCall.formId(
                              (_model.foodSinglePageDetailsouput?.jsonBody ??
                                  ''),
                            ),
                            resourceItemDenominatorId: RentalGroup
                                            .foodSinglePageDetailCall
                                            .denomIdList(
                                          (_model.foodSinglePageDetailsouput
                                                  ?.jsonBody ??
                                              ''),
                                        ) !=
                                        null &&
                                    (RentalGroup.foodSinglePageDetailCall
                                            .denomIdList(
                                      (_model.foodSinglePageDetailsouput
                                              ?.jsonBody ??
                                          ''),
                                    ))!
                                        .isNotEmpty
                                ? _model.denomId
                                : '-1',
                            token: FFAppState().SessionToken,
                          );

                          if ((_model.nextResponse?.succeeded ?? true)) {
                            if (RentalShoppingCartGroup.foodSinglePageNextCall
                                    .action(
                                      (_model.nextResponse?.jsonBody ?? ''),
                                    )
                                    ?.firstOrNull ==
                                'createFrame') {
                              context.pushNamed(
                                AnonymousLoginGuestUIWidget.routeName,
                                queryParameters: {
                                  'params': serializeParam(
                                    functions.mapParams(RentalShoppingCartGroup
                                        .foodSinglePageNextCall
                                        .act(
                                          (_model.nextResponse?.jsonBody ?? ''),
                                        )!
                                        .firstOrNull!),
                                    ParamType.DataStruct,
                                    isList: true,
                                  ),
                                  'recordKey': serializeParam(
                                    functions
                                        .mapParams(RentalShoppingCartGroup
                                            .foodSinglePageNextCall
                                            .act(
                                              (_model.nextResponse?.jsonBody ??
                                                  ''),
                                            )!
                                            .firstOrNull!)
                                        .where((e) => e.id == 'recordKey')
                                        .toList()
                                        .firstOrNull
                                        ?.name,
                                    ParamType.String,
                                  ),
                                  'type': serializeParam(
                                    functions
                                        .mapParams(RentalShoppingCartGroup
                                            .foodSinglePageNextCall
                                            .act(
                                              (_model.nextResponse?.jsonBody ??
                                                  ''),
                                            )!
                                            .firstOrNull!)
                                        .where((e) => e.id == 'type')
                                        .toList()
                                        .firstOrNull
                                        ?.name,
                                    ParamType.String,
                                  ),
                                  'denominatorId': serializeParam(
                                    false,
                                    ParamType.bool,
                                  ),
                                  'resourceItemType': serializeParam(
                                    widget.resourceType,
                                    ParamType.String,
                                  ),
                                  'quantity': serializeParam(
                                    functions.intToString(
                                        _model.countControllerValue),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              if ((functions
                                          .mapParams(RentalShoppingCartGroup
                                              .foodSinglePageNextCall
                                              .act(
                                                (_model.nextResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .firstOrNull!)
                                          .where((e) => e.id == 'tabName')
                                          .toList()
                                          .firstOrNull
                                          ?.name ==
                                      'itemDetailsTab') ||
                                  (functions
                                          .mapParams(RentalShoppingCartGroup
                                              .foodSinglePageNextCall
                                              .act(
                                                (_model.nextResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .firstOrNull!)
                                          .where((e) => e.id == 'tabName')
                                          .toList()
                                          .firstOrNull
                                          ?.name ==
                                      'dateAndTimeTabId')) {
                                context.pushNamed(
                                  EventReadOnlyPageWidget.routeName,
                                  queryParameters: {
                                    'recordKey': serializeParam(
                                      functions
                                          .mapParams(RentalShoppingCartGroup
                                              .foodSinglePageNextCall
                                              .act(
                                                (_model.nextResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .firstOrNull!)
                                          .where((e) => e.id == 'recordKey')
                                          .toList()
                                          .firstOrNull
                                          ?.name,
                                      ParamType.String,
                                    ),
                                    'type': serializeParam(
                                      functions
                                          .mapParams(RentalShoppingCartGroup
                                              .foodSinglePageNextCall
                                              .act(
                                                (_model.nextResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .firstOrNull!)
                                          .where((e) => e.id == 'type')
                                          .toList()
                                          .firstOrNull
                                          ?.name,
                                      ParamType.String,
                                    ),
                                    'resourceItemType': serializeParam(
                                      widget.resourceType,
                                      ParamType.String,
                                    ),
                                    'quantity': serializeParam(
                                      _model.countControllerValue?.toString(),
                                      ParamType.String,
                                    ),
                                    'denominatorId': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                if (functions
                                        .mapParams(RentalShoppingCartGroup
                                            .foodSinglePageNextCall
                                            .act(
                                              (_model.nextResponse?.jsonBody ??
                                                  ''),
                                            )!
                                            .firstOrNull!)
                                        .where((e) => e.id == 'tabName')
                                        .toList()
                                        .firstOrNull
                                        ?.name ==
                                    'customizationTabId') {
                                  context.pushNamed(
                                    ReadyMadeCustomizationPageWidget.routeName,
                                    queryParameters: {
                                      'recordKey': serializeParam(
                                        widget.recordKey,
                                        ParamType.String,
                                      ),
                                      'type': serializeParam(
                                        widget.type,
                                        ParamType.String,
                                      ),
                                      'customizationType': serializeParam(
                                        functions
                                            .mapParams(RentalShoppingCartGroup
                                                .foodSinglePageNextCall
                                                .act(
                                                  (_model.nextResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .firstOrNull!)
                                            .where((e) =>
                                                e.id == 'cakeCustomizationType')
                                            .toList()
                                            .firstOrNull
                                            ?.name,
                                        ParamType.String,
                                      ),
                                      'quantity': serializeParam(
                                        widget.quantity,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  if (functions
                                          .mapParams(RentalShoppingCartGroup
                                              .foodSinglePageNextCall
                                              .act(
                                                (_model.nextResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .firstOrNull!)
                                          .where((e) => e.id == 'tabName')
                                          .toList()
                                          .firstOrNull
                                          ?.name ==
                                      'userTypeId') {
                                    context.pushNamed(
                                      AnonymousLoginGuestUIWidget.routeName,
                                      queryParameters: {
                                        'params': serializeParam(
                                          functions.mapParams(
                                              RentalShoppingCartGroup
                                                  .foodSinglePageNextCall
                                                  .act(
                                                    (_model.nextResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .firstOrNull!),
                                          ParamType.DataStruct,
                                          isList: true,
                                        ),
                                        'recordKey': serializeParam(
                                          functions
                                              .mapParams(RentalShoppingCartGroup
                                                  .foodSinglePageNextCall
                                                  .act(
                                                    (_model.nextResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .firstOrNull!)
                                              .where((e) => e.id == 'recordKey')
                                              .toList()
                                              .firstOrNull
                                              ?.name,
                                          ParamType.String,
                                        ),
                                        'type': serializeParam(
                                          functions
                                              .mapParams(RentalShoppingCartGroup
                                                  .foodSinglePageNextCall
                                                  .act(
                                                    (_model.nextResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .firstOrNull!)
                                              .where((e) => e.id == 'type')
                                              .toList()
                                              .firstOrNull
                                              ?.name,
                                          ParamType.String,
                                        ),
                                        'denominatorId': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                        'resourceItemType': serializeParam(
                                          '5',
                                          ParamType.String,
                                        ),
                                        'quantity': serializeParam(
                                          functions.intToString(
                                              _model.countControllerValue),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.pushNamed(
                                      EventInfoForShoppingCartWidget.routeName,
                                      queryParameters: {
                                        'recordKey': serializeParam(
                                          functions
                                              .mapParams(RentalShoppingCartGroup
                                                  .foodSinglePageNextCall
                                                  .act(
                                                    (_model.nextResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .firstOrNull!)
                                              .where((e) => e.id == 'recordKey')
                                              .toList()
                                              .firstOrNull
                                              ?.name,
                                          ParamType.String,
                                        ),
                                        'type': serializeParam(
                                          functions
                                              .mapParams(RentalShoppingCartGroup
                                                  .foodSinglePageNextCall
                                                  .act(
                                                    (_model.nextResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .firstOrNull!)
                                              .where((e) => e.id == 'type')
                                              .toList()
                                              .firstOrNull
                                              ?.name,
                                          ParamType.String,
                                        ),
                                        'denominatorId': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                        'resourceItemType': serializeParam(
                                          widget.resourceType,
                                          ParamType.String,
                                        ),
                                        'quantitys': serializeParam(
                                          _model.countControllerValue
                                              ?.toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                }
                              }
                            }
                          }

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '5qbiurmr' /* Add to Cart */,
                        ),
                        icon: Icon(
                          Icons.shopping_cart_sharp,
                          size: 22.0,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.43,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleLargeFamily,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleLargeIsCustom,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
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
    );
  }
}
