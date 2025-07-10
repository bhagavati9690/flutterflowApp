import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/compoents/allvendor_search_comp/location_change_comp/location_change_comp_widget.dart';
import '/compoents/common_comp/celebration_type_compoent/celebration_type_compoent_widget.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = 'homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.SessionOut = InstantTimer.periodic(
            duration: Duration(milliseconds: 3500000),
            callback: (timer) async {
              FFAppState().IsLoggedInUser = false;
              FFAppState().SessionToken = '';
              FFAppState().custmorName = 'Guest';
              FFAppState().eventId = '';
              FFAppState().cartCount = '';
              FFAppState().currentUserId = null;
              FFAppState().currentUser = UserStruct();
              FFAppState().userType = 'consumer';
              FFAppState().profilePic =
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/celebratix-u9fafm/assets/733pip1s33kw/profile.jpeg';

              context.goNamed(
                HomePageWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
            startImmediately: false,
          );
        }),
      ]);
      FFAppState().SerchtextVenue = '';
      if (FFAppState().locationCalled) {
        if (!(await getPermissionStatus(locationPermission))) {
          await requestPermission(locationPermission);
        }
        _model.currentPosition = await actions.determinePosition();
        _model.apiResultLocation =
            await LocationsApiGroup.getLocationFromLatLongCall.call(
          longitude: functions.getLongitude(_model.currentPosition),
          latitude: functions.getLatitude(_model.currentPosition),
        );

        _model.assignLocation = await AccountInfoGroup.assignLocationCall.call(
          country: LocationsApiGroup.getLocationFromLatLongCall.country(
            (_model.apiResultLocation?.jsonBody ?? ''),
          ),
          postalCode: LocationsApiGroup.getLocationFromLatLongCall.postalCode(
            (_model.apiResultLocation?.jsonBody ?? ''),
          ),
          geometrycoordinates0: functions.getLongitude(_model.currentPosition),
          geometrycoordinates1: functions.getLatitude(_model.currentPosition),
          stateProvince: LocationsApiGroup.getLocationFromLatLongCall.region(
            (_model.apiResultLocation?.jsonBody ?? ''),
          ),
          cityTown: LocationsApiGroup.getLocationFromLatLongCall.place(
            (_model.apiResultLocation?.jsonBody ?? ''),
          ),
          token: FFAppState().SessionToken,
        );

        if (AccountInfoGroup.assignLocationCall.actionSucess(
          (_model.assignLocation?.jsonBody ?? ''),
        )!) {
          FFAppState().latitude =
              functions.getLatitude(_model.currentPosition)!;
          FFAppState().longituade =
              functions.getLongitude(_model.currentPosition)!;
          FFAppState().country =
              LocationsApiGroup.getLocationFromLatLongCall.country(
            (_model.apiResultLocation?.jsonBody ?? ''),
          )!;
          FFAppState().place =
              LocationsApiGroup.getLocationFromLatLongCall.place(
            (_model.apiResultLocation?.jsonBody ?? ''),
          )!;
          FFAppState().pincode =
              LocationsApiGroup.getLocationFromLatLongCall.postalCode(
            (_model.apiResultLocation?.jsonBody ?? ''),
          )!;
          FFAppState().region =
              LocationsApiGroup.getLocationFromLatLongCall.region(
            (_model.apiResultLocation?.jsonBody ?? ''),
          )!;
          FFAppState().locationCalled = false;
          FFAppState().SessionToken =
              (_model.assignLocation?.getHeader('cbxtoken') ?? '');
          _model.visibleTabResponse = await VisibleTabCall.call(
            state: valueOrDefault<String>(
              LocationsApiGroup.getLocationFromLatLongCall.region(
                (_model.apiResultLocation?.jsonBody ?? ''),
              ),
              'MA',
            ),
            token: FFAppState().SessionToken,
          );

          if ((_model.visibleTabResponse?.succeeded ?? true)) {
            FFAppState().rentalVisible =
                functions.stringToBool(VisibleTabCall.rental(
              (_model.visibleTabResponse?.jsonBody ?? ''),
            ));
            FFAppState().entertainerVisible =
                functions.stringToBool(VisibleTabCall.entertainer(
              (_model.visibleTabResponse?.jsonBody ?? ''),
            ));
            FFAppState().cakeVisible =
                functions.stringToBool(VisibleTabCall.cake(
              (_model.visibleTabResponse?.jsonBody ?? ''),
            ));
          }
        }
      }
      if (!FFAppState().IsLoggedInUser) {
        _model.apiResultHomeLoginAction =
            await AccountInfoGroup.loginAccountCall.call(
          email: FFAppState().Email,
          password: FFAppState().password,
          rememberMe: true,
          token: FFAppState().SessionToken,
        );

        if (AccountInfoGroup.loginAccountCall.actionSuccess(
              (_model.apiResultHomeLoginAction?.jsonBody ?? ''),
            ) ==
            true) {
          FFAppState().IsLoggedInUser = true;
          FFAppState().SessionToken =
              (_model.apiResultHomeLoginAction?.getHeader('cbxtoken') ?? '');
          FFAppState().cartCount = AccountInfoGroup.loginAccountCall
              .cartCount(
                (_model.apiResultHomeLoginAction?.jsonBody ?? ''),
              )!
              .toString();
          _model.personInfo = await AccountInfoGroup.myInformationCall.call(
            token: FFAppState().SessionToken,
          );

          FFAppState().custmorName = AccountInfoGroup.myInformationCall.name(
            (_model.personInfo?.jsonBody ?? ''),
          )!;
          FFAppState().profilePic =
              AccountInfoGroup.myInformationCall.profilePic(
            (_model.personInfo?.jsonBody ?? ''),
          )!;
        } else {
          FFAppState().SessionToken =
              (_model.apiResultHomeLoginAction?.getHeader('cbxtoken') ?? '');
          FFAppState().IsLoggedInUser = false;
        }
      }
      _model.currentUserResponse = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'email',
          isEqualTo: FFAppState().Email,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().currentUserId = _model.currentUserResponse?.reference;
      FFAppState().currentUser = UserStruct(
        displayName: _model.currentUserResponse?.displayName,
        emails: _model.currentUserResponse?.email,
        referenceId: _model.currentUserResponse?.reference.id,
      );
      safeSetState(() {});
      if (!isWeb) {
        if (FFDevEnvironmentValues().BaseUrl == 'https://celebratix.com') {
          unawaited(
            () async {}(),
          );
        }
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1790.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: AppBar(
            backgroundColor: FFAppState().userType == 'vendor'
                ? Color(0xFF73EBE1)
                : FlutterFlowTheme.of(context).lemonLime,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: false,
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FFAppState().userType == 'vendor'
                  ? FFAppConstants.vendorPrimaryColor
                  : FFAppConstants.consumerPrimaryColor,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/celebratix_logo_e.png',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.504,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.067,
                                        fit: BoxFit.contain,
                                        alignment: Alignment(-1.0, 0.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if ((FFAppState().cartCount == '0') ||
                              (FFAppState().cartCount != ''))
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if ((FFAppState().cartCount != '0') &&
                                        (FFAppState().cartCount != ''))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 10.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                ShoppingCartSummaryCopyWidget
                                                    .routeName);
                                          },
                                          child: badges.Badge(
                                            badgeContent: Text(
                                              FFAppState().cartCount,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    color: Color(0xFF009E36),
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallIsCustom,
                                                  ),
                                            ),
                                            showBadge: true,
                                            shape: badges.BadgeShape.circle,
                                            badgeColor: Color(0x00FFFFFF),
                                            elevation: 0.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            position:
                                                badges.BadgePosition.topEnd(),
                                            animationType:
                                                badges.BadgeAnimationType.scale,
                                            toAnimate: false,
                                            child: Visibility(
                                              visible: (FFAppState()
                                                          .cartCount !=
                                                      '0') &&
                                                  (FFAppState().cartCount !=
                                                          ''),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor: Color(0x00FFFFFF),
                                                icon: Icon(
                                                  Icons.shopping_cart,
                                                  color: Color(0xFFFF0010),
                                                  size: 26.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                      ShoppingCartSummaryCopyWidget
                                                          .routeName);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                        ].divide(SizedBox(width: 0.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(MyAccountWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.person,
                                          color: FlutterFlowTheme.of(context)
                                              .clbxBlack,
                                          size: 24.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 9.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              'Hi ${FFAppState().custmorName}',
                                              'Hi Guest',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .clbxBlack,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 7.0))
                                        .around(SizedBox(width: 7.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              '${FFAppState().place},${FFAppState().region}',
                                              'Location',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .clbxBlack,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showAlignedDialog(
                                              context: context,
                                              isGlobal: false,
                                              avoidOverflow: true,
                                              targetAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        child:
                                                            LocationChangeCompWidget(
                                                          latitude: FFAppState()
                                                              .latitude,
                                                          longitude:
                                                              FFAppState()
                                                                  .longituade,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.locationUpdateOutput =
                                                    value));

                                            _model.assignLocation1 =
                                                await AccountInfoGroup
                                                    .assignLocationCall
                                                    .call(
                                              country: _model.locationUpdateOutput
                                                              ?.country !=
                                                          null &&
                                                      _model.locationUpdateOutput
                                                              ?.country !=
                                                          ''
                                                  ? _model.locationUpdateOutput
                                                      ?.country
                                                  : FFAppState().country,
                                              postalCode: _model
                                                              .locationUpdateOutput
                                                              ?.postalCode !=
                                                          null &&
                                                      _model.locationUpdateOutput
                                                              ?.postalCode !=
                                                          ''
                                                  ? _model.locationUpdateOutput
                                                      ?.postalCode
                                                  : FFAppState().pincode,
                                              geometrycoordinates0: _model
                                                          .locationUpdateOutput
                                                          ?.longitude !=
                                                      null
                                                  ? _model.locationUpdateOutput
                                                      ?.longitude
                                                  : FFAppState().longituade,
                                              geometrycoordinates1: _model
                                                          .locationUpdateOutput
                                                          ?.latitude !=
                                                      null
                                                  ? _model.locationUpdateOutput
                                                      ?.latitude
                                                  : FFAppState().latitude,
                                              stateProvince: _model
                                                              .locationUpdateOutput
                                                              ?.region !=
                                                          null &&
                                                      _model.locationUpdateOutput
                                                              ?.region !=
                                                          ''
                                                  ? _model.locationUpdateOutput
                                                      ?.region
                                                  : FFAppState().region,
                                              cityTown: _model.locationUpdateOutput
                                                              ?.place !=
                                                          null &&
                                                      _model.locationUpdateOutput
                                                              ?.place !=
                                                          ''
                                                  ? _model.locationUpdateOutput
                                                      ?.place
                                                  : FFAppState().place,
                                              token: FFAppState().SessionToken,
                                            );

                                            if (AccountInfoGroup
                                                .assignLocationCall
                                                .actionSucess(
                                              (_model.assignLocation1
                                                      ?.jsonBody ??
                                                  ''),
                                            )!) {
                                              FFAppState().latitude = _model
                                                          .locationUpdateOutput
                                                          ?.latitude !=
                                                      null
                                                  ? _model.locationUpdateOutput!
                                                      .latitude
                                                  : FFAppState().latitude;
                                              FFAppState().longituade = _model
                                                          .locationUpdateOutput
                                                          ?.longitude !=
                                                      null
                                                  ? _model.locationUpdateOutput!
                                                      .longitude
                                                  : FFAppState().longituade;
                                              FFAppState().place = _model
                                                              .locationUpdateOutput
                                                              ?.place !=
                                                          null &&
                                                      _model.locationUpdateOutput
                                                              ?.place !=
                                                          ''
                                                  ? _model.locationUpdateOutput!
                                                      .place
                                                  : FFAppState().place;
                                              FFAppState().pincode = _model
                                                              .locationUpdateOutput
                                                              ?.postalCode !=
                                                          null &&
                                                      _model.locationUpdateOutput
                                                              ?.postalCode !=
                                                          ''
                                                  ? _model.locationUpdateOutput!
                                                      .postalCode
                                                  : FFAppState().pincode;
                                              FFAppState().country = _model
                                                              .locationUpdateOutput
                                                              ?.country !=
                                                          null &&
                                                      _model.locationUpdateOutput
                                                              ?.country !=
                                                          ''
                                                  ? _model.locationUpdateOutput!
                                                      .country
                                                  : FFAppState().country;
                                              FFAppState().region = _model
                                                              .locationUpdateOutput
                                                              ?.region !=
                                                          null &&
                                                      _model.locationUpdateOutput
                                                              ?.region !=
                                                          ''
                                                  ? _model.locationUpdateOutput!
                                                      .region
                                                  : FFAppState().region;
                                              _model.visibleTabResponse2 =
                                                  await VisibleTabCall.call(
                                                state: _model.locationUpdateOutput
                                                                ?.region !=
                                                            null &&
                                                        _model.locationUpdateOutput
                                                                ?.region !=
                                                            ''
                                                    ? _model
                                                        .locationUpdateOutput
                                                        ?.region
                                                    : FFAppState().region,
                                                token:
                                                    FFAppState().SessionToken,
                                              );

                                              if ((_model.visibleTabResponse2
                                                      ?.succeeded ??
                                                  true)) {
                                                FFAppState().rentalVisible =
                                                    functions.stringToBool(
                                                        VisibleTabCall.rental(
                                                  (_model.visibleTabResponse2
                                                          ?.jsonBody ??
                                                      ''),
                                                ));
                                                FFAppState()
                                                        .entertainerVisible =
                                                    functions.stringToBool(
                                                        VisibleTabCall
                                                            .entertainer(
                                                  (_model.visibleTabResponse2
                                                          ?.jsonBody ??
                                                      ''),
                                                ));
                                                FFAppState().cakeVisible =
                                                    functions.stringToBool(
                                                        VisibleTabCall.cake(
                                                  (_model.visibleTabResponse2
                                                          ?.jsonBody ??
                                                      ''),
                                                ));
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: FFAppState().userType ==
                                                      'vendor'
                                                  ? Color(0xFF73EBE1)
                                                  : FlutterFlowTheme.of(context)
                                                      .lemonLime,
                                            ),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.08,
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.08,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/map.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation']!),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 0.0)),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 40.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/celebratix_logo_e.png',
                                      width: MediaQuery.sizeOf(context).width *
                                          0.175,
                                      height: 39.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 9.0, 0.0),
                                          child: Text(
                                            '${FFAppState().place},${FFAppState().region}${FFAppState().pincode}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
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
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'xj5cdeo8' /* Welcome Bhagavati */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontStyle: FontStyle.italic,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'hmpfxi0g' /* Sign In */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 0.5,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        icon: Icon(
                                          Icons.notifications_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ].divide(SizedBox(width: 0.0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Wrap(
                            spacing: 26.0,
                            runSpacing: 11.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(VenueSearchWidget.routeName);
                                },
                                text: FFLocalizations.of(context).getText(
                                  'uxozoy3f' /* Venue */,
                                ),
                                icon: FaIcon(
                                  FontAwesomeIcons.solidBuilding,
                                  size: 23.0,
                                ),
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.37,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconColor: Colors.white,
                                  color: FFAppState().userType == 'vendor'
                                      ? FFAppConstants.vendorSecondaryColor
                                      : FFAppConstants.consumerSecondaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 1.0,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              if (FFAppState().rentalVisible)
                                FFButtonWidget(
                                  onPressed: () async {
                                    context
                                        .goNamed(RentalSearchWidget.routeName);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'qifsyye2' /* Rental */,
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.truck,
                                    size: 23.0,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.37,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor: Colors.white,
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
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                    elevation: 1.0,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              if (FFAppState().entertainerVisible)
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.goNamed(
                                        EntertainerSearchWidget.routeName);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'wdndqbla' /* Entertainer */,
                                  ),
                                  icon: Icon(
                                    Icons.auto_fix_high,
                                    size: 23.0,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.37,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor: Colors.white,
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
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                    elevation: 1.0,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              if (FFAppState().cakeVisible)
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.goNamed(CakeSearchWidget.routeName);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '7465lqfn' /* Cake */,
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.birthdayCake,
                                    size: 23.0,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.37,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor: Color(0xFFFFFDFD),
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
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                    elevation: 1.0,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'ctgcrqe8' /* Food */,
                                  ),
                                  icon: Icon(
                                    Icons.fastfood_sharp,
                                    size: 23.0,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.27,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor: Colors.white,
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    elevation: 1.0,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (isWeb)
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FlutterFlowVideoPlayer(
                                        path:
                                            'assets/videos/index1-var1_(2)_(online-video-cutter.com).mp4',
                                        videoType: VideoType.asset,
                                        autoPlay: true,
                                        looping: true,
                                        showControls: false,
                                        allowFullScreen: false,
                                        allowPlaybackSpeedMenu: false,
                                      ),
                                    ],
                                  ),
                                if (!isWeb)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.25,
                                        child: custom_widgets.YoyoPlayerWidget(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.25,
                                        ),
                                      ),
                                    ],
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'dki02tyh' /* Discover  Venues */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context.goNamed(
                                            AllVenueWidget.routeName,
                                            queryParameters: {
                                              'venueSearchQuery':
                                                  serializeParam(
                                                '*',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'j6mbssdo' /* See All */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 33.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.underline,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF4F4E9),
                                    border: Border.all(
                                      color: Color(0xFFE3E3E2),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 14.0, 0.0, 14.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          child: CarouselSlider(
                                            items: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    AllVenueWidget.routeName,
                                                    queryParameters: {
                                                      'venueSearchQuery':
                                                          serializeParam(
                                                        '*',
                                                        ParamType.String,
                                                      ),
                                                      'activityTypeAgg':
                                                          serializeParam(
                                                        _model.princessFavorite,
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .celebrationTypeCompoentModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      CelebrationTypeCompoentWidget(
                                                    name: 'Princess Favorite',
                                                    image:
                                                        '/assets/images/celebration/venue/princessfav.jpg',
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    AllVenueWidget.routeName,
                                                    queryParameters: {
                                                      'venueSearchQuery':
                                                          serializeParam(
                                                        '*',
                                                        ParamType.String,
                                                      ),
                                                      'sportstypeAgg':
                                                          serializeParam(
                                                        _model.coporateParty,
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .celebrationTypeCompoentModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      CelebrationTypeCompoentWidget(
                                                    name: 'Corporate Party',
                                                    image:
                                                        '/assets/images/celebration/venue/corporate.jpg',
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    AllVenueWidget.routeName,
                                                    queryParameters: {
                                                      'venueSearchQuery':
                                                          serializeParam(
                                                        '*',
                                                        ParamType.String,
                                                      ),
                                                      'activityTypeAgg':
                                                          serializeParam(
                                                        _model.artParty,
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .celebrationTypeCompoentModel3,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      CelebrationTypeCompoentWidget(
                                                    name: 'Art Party',
                                                    image:
                                                        '/assets/images/celebration/venue/artparty.jpg',
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    AllVenueWidget.routeName,
                                                    queryParameters: {
                                                      'venueSearchQuery':
                                                          serializeParam(
                                                        '*',
                                                        ParamType.String,
                                                      ),
                                                      'venueTypeAgg':
                                                          serializeParam(
                                                        _model.sports,
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .celebrationTypeCompoentModel4,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      CelebrationTypeCompoentWidget(
                                                    name: 'Sports',
                                                    image:
                                                        '/assets/images/celebration/venue/sports.jpg',
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    AllVenueWidget.routeName,
                                                    queryParameters: {
                                                      'venueSearchQuery':
                                                          serializeParam(
                                                        '*',
                                                        ParamType.String,
                                                      ),
                                                      'activityTypeAgg':
                                                          serializeParam(
                                                        _model.funActivity,
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .celebrationTypeCompoentModel5,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      CelebrationTypeCompoentWidget(
                                                    name: 'Fun Activity',
                                                    image:
                                                        '/assets/images/celebration/venue/funactivity.jpg',
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    AllVenueWidget.routeName,
                                                    queryParameters: {
                                                      'venueSearchQuery':
                                                          serializeParam(
                                                        '*',
                                                        ParamType.String,
                                                      ),
                                                      'ageRangeAgg':
                                                          serializeParam(
                                                        _model.adultCelebration,
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .celebrationTypeCompoentModel6,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      CelebrationTypeCompoentWidget(
                                                    name: 'Adult Celebration',
                                                    image:
                                                        '/assets/images/celebration/venue/adultceleb.jpg',
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    AllVenueWidget.routeName,
                                                    queryParameters: {
                                                      'venueSearchQuery':
                                                          serializeParam(
                                                        '*',
                                                        ParamType.String,
                                                      ),
                                                      'ageRangeAgg':
                                                          serializeParam(
                                                        _model.firstBirthday,
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .celebrationTypeCompoentModel7,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      CelebrationTypeCompoentWidget(
                                                    image:
                                                        '/assets/images/celebration/venue/firstbirthday.jpg',
                                                    name: 'First Birthday',
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    AllVenueWidget.routeName,
                                                    queryParameters: {
                                                      'venueSearchQuery':
                                                          serializeParam(
                                                        '*',
                                                        ParamType.String,
                                                      ),
                                                      'activityTypeAgg':
                                                          serializeParam(
                                                        _model.education,
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .celebrationTypeCompoentModel8,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      CelebrationTypeCompoentWidget(
                                                    name: 'Education',
                                                    image:
                                                        '/assets/images/celebration/venue/educational.jpg',
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    AllVenueWidget.routeName,
                                                    queryParameters: {
                                                      'venueSearchQuery':
                                                          serializeParam(
                                                        '*',
                                                        ParamType.String,
                                                      ),
                                                      'venueTypeAgg':
                                                          serializeParam(
                                                        _model.banquetHall,
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .celebrationTypeCompoentModel9,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      CelebrationTypeCompoentWidget(
                                                    name: 'Banquet Hall',
                                                    image:
                                                        '/assets/images/celebration/venue/banquet.jpg',
                                                  ),
                                                ),
                                              ),
                                            ],
                                            carouselController: _model
                                                    .venueCarouselController ??=
                                                CarouselSliderController(),
                                            options: CarouselOptions(
                                              initialPage: 0,
                                              viewportFraction: 0.5,
                                              disableCenter: true,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.25,
                                              enableInfiniteScroll: true,
                                              scrollDirection: Axis.horizontal,
                                              autoPlay: true,
                                              autoPlayAnimationDuration:
                                                  Duration(milliseconds: 800),
                                              autoPlayInterval: Duration(
                                                  milliseconds: (800 + 4000)),
                                              autoPlayCurve: Curves.linear,
                                              pauseAutoPlayInFiniteScroll: true,
                                              onPageChanged: (index, _) => _model
                                                      .venueCarouselCurrentIndex =
                                                  index,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                        .addToStart(SizedBox(height: 5.0))
                                        .addToEnd(SizedBox(height: 10.0)),
                                  ),
                                ),
                                if (FFAppState().rentalVisible)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 30.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9la7rozv' /* Discover Rentals */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.goNamed(
                                              AllRentalWidget.routeName,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'drcy6q6z' /* See All */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 33.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.black,
                                                      letterSpacing: 0.0,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (FFAppState().rentalVisible)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF4F4E9),
                                      border: Border.all(
                                        color: Color(0xFFE3E3E2),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 14.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child: CarouselSlider(
                                              items: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllRentalWidget.routeName,
                                                      queryParameters: {
                                                        'rentalSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'rentalsectioncategory':
                                                            serializeParam(
                                                          _model.tentTableChair,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel10,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Tent/Table/Chair',
                                                      image:
                                                          '/assets/images/celebration/rental/tent-table.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllRentalWidget.routeName,
                                                      queryParameters: {
                                                        'rentalSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'rentalsectioncategory':
                                                            serializeParam(
                                                          _model.inflatables,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel11,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Inflatables',
                                                      image:
                                                          '/assets/images/celebration/rental/inflatable.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllRentalWidget.routeName,
                                                      queryParameters: {
                                                        'rentalSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'rentalsectioncategory':
                                                            serializeParam(
                                                          _model
                                                              .foodMachineConcession,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel12,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Food Machines',
                                                      image:
                                                          '/assets/images/celebration/rental/concessions.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllRentalWidget.routeName,
                                                      queryParameters: {
                                                        'rentalSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'rentalsectioncategory':
                                                            serializeParam(
                                                          _model.funGames,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel13,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Fun /Games',
                                                      image:
                                                          '/assets/images/celebration/rental/pinball.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllRentalWidget.routeName,
                                                      queryParameters: {
                                                        'rentalSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'rentalsectioncategory':
                                                            serializeParam(
                                                          _model
                                                              .audioVisualElectrical,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel14,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Audio/Visual',
                                                      image:
                                                          '/assets/images/celebration/rental/audio-visual.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllRentalWidget.routeName,
                                                      queryParameters: {
                                                        'rentalSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'rentalsectioncategory':
                                                            serializeParam(
                                                          _model.decoration,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel15,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Decoration',
                                                      image:
                                                          '/assets/images/celebration/rental/decoration.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllRentalWidget.routeName,
                                                      queryParameters: {
                                                        'rentalSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'rentalsectioncategory':
                                                            serializeParam(
                                                          _model
                                                              .stageDanceFloor,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel16,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      image:
                                                          '/assets/images/celebration/rental/stagedance.jpg',
                                                      name: 'Stage Dance',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllRentalWidget.routeName,
                                                      queryParameters: {
                                                        'rentalSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'rentalsectioncategory':
                                                            serializeParam(
                                                          _model
                                                              .servingCatering,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel17,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Serving/Catering',
                                                      image:
                                                          '/assets/images/celebration/rental/serving.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllRentalWidget.routeName,
                                                      queryParameters: {
                                                        'rentalSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'rentalsectioncategory':
                                                            serializeParam(
                                                          _model.photoBooth,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel18,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Photo Booth',
                                                      image:
                                                          '/assets/images/celebration/rental/photobooth.jpg',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              carouselController: _model
                                                      .rentalCarouselController ??=
                                                  CarouselSliderController(),
                                              options: CarouselOptions(
                                                initialPage: 0,
                                                viewportFraction: 0.5,
                                                disableCenter: true,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.25,
                                                enableInfiniteScroll: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: false,
                                                onPageChanged: (index, _) =>
                                                    _model.rentalCarouselCurrentIndex =
                                                        index,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .addToStart(SizedBox(height: 5.0))
                                          .addToEnd(SizedBox(height: 20.0)),
                                    ),
                                  ),
                                if (FFAppState().entertainerVisible)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 30.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ktso0bgl' /* Discover Entertainers */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.goNamed(
                                              AllEntertainerWidget.routeName,
                                              queryParameters: {
                                                'entertainerSerchQuery':
                                                    serializeParam(
                                                  '*',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'r1wmxhme' /* See All */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 33.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.black,
                                                      letterSpacing: 0.0,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (FFAppState().entertainerVisible)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF4F4E9),
                                      border: Border.all(
                                        color: Color(0xFFE3E3E2),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 14.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child: CarouselSlider(
                                              items: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllEntertainerWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'entertainerSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'entertainercategory':
                                                            serializeParam(
                                                          _model.magician,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel19,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Magician',
                                                      image:
                                                          '/assets/images/celebration/entertainment/magician-1.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllEntertainerWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'entertainerSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'entertainercategory':
                                                            serializeParam(
                                                          _model
                                                              .facePainterBallon,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel20,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Face Painters',
                                                      image:
                                                          '/assets/images/celebration/entertainment/face-painting-1.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllEntertainerWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'entertainerSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'entertainercategory':
                                                            serializeParam(
                                                          _model
                                                              .clownCharacters,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel21,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Clawn/Characters',
                                                      image:
                                                          '/assets/images/celebration/entertainment/costumed-character-clown-1.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllEntertainerWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'entertainerSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'entertainercategory':
                                                            serializeParam(
                                                          _model.puppetShow,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel22,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name:
                                                          'Puppet/StoryTelling',
                                                      image:
                                                          '/assets/images/celebration/entertainment/puppet-story.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllEntertainerWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'entertainerSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'entertainercategory':
                                                            serializeParam(
                                                          _model
                                                              .decoratorFoodBar,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel23,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Decorator',
                                                      image:
                                                          '/assets/images/celebration/entertainment/bar-decorator.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllEntertainerWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'entertainerSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'entertainercategory':
                                                            serializeParam(
                                                          _model
                                                              .mobileGamesSports,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel24,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Mobile Games',
                                                      image:
                                                          '/assets/images/celebration/entertainment/mobilegames.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllEntertainerWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'entertainerSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'entertainercategory':
                                                            serializeParam(
                                                          _model.musicDance,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel25,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      image:
                                                          '/assets/images/celebration/entertainment/musician.jpg',
                                                      name: 'Music/Dance',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllEntertainerWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'entertainerSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'entertainercategory':
                                                            serializeParam(
                                                          _model.wedding,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel26,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Wedding',
                                                      image:
                                                          '/assets/images/celebration/entertainment/wedding.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllEntertainerWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'entertainerSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'entertainercategory':
                                                            serializeParam(
                                                          _model.photography,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel27,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Photographer',
                                                      image:
                                                          '/assets/images/celebration/entertainment/photographer.jpg',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              carouselController: _model
                                                      .entertainerCarouselController ??=
                                                  CarouselSliderController(),
                                              options: CarouselOptions(
                                                initialPage: 0,
                                                viewportFraction: 0.5,
                                                disableCenter: true,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.25,
                                                enableInfiniteScroll: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: false,
                                                onPageChanged: (index, _) =>
                                                    _model.entertainerCarouselCurrentIndex =
                                                        index,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .addToStart(SizedBox(height: 5.0))
                                          .addToEnd(SizedBox(height: 20.0)),
                                    ),
                                  ),
                                if (FFAppState().cakeVisible)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 30.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0sp3dp19' /* Discover Cakes */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.goNamed(
                                              AllCakesWidget.routeName,
                                              queryParameters: {
                                                'cakeSerchQuery':
                                                    serializeParam(
                                                  '*',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'd2rkmayo' /* See All */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 33.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.black,
                                                      letterSpacing: 0.0,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (FFAppState().cakeVisible)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF4F4E9),
                                      border: Border.all(
                                        color: Color(0xFFE3E3E2),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 14.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child: CarouselSlider(
                                              items: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllCakesWidget.routeName,
                                                      queryParameters: {
                                                        'cakeSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'themeCategory':
                                                            serializeParam(
                                                          _model
                                                              .firstBirthdayCake,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel28,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'First Birthday',
                                                      image:
                                                          '/assets/images/celebration/venue/firstbirthday.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllCakesWidget.routeName,
                                                      queryParameters: {
                                                        'cakeSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'themeCategory':
                                                            serializeParam(
                                                          _model.boysBirthday,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel29,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Boys Birthday',
                                                      image:
                                                          '/assets/images/celebration/cake/boys-birthday-cakes-superhero.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllCakesWidget.routeName,
                                                      queryParameters: {
                                                        'cakeSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'themeCategory':
                                                            serializeParam(
                                                          _model.girlBirthday,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel30,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Girls Birthday',
                                                      image:
                                                          '/assets/images/celebration/cake/girls-birthday-cakes-2.jpeg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllCakesWidget.routeName,
                                                      queryParameters: {
                                                        'cakeSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'themeCategory':
                                                            serializeParam(
                                                          _model.adultBirthday,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel31,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Adult Birthday',
                                                      image:
                                                          '/assets/images/celebration/cake/adult-cake.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllCakesWidget.routeName,
                                                      queryParameters: {
                                                        'cakeSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'themeCategory':
                                                            serializeParam(
                                                          _model.babyShower,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel32,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Baby Shower',
                                                      image:
                                                          '/assets/images/celebration/cake/babyshower-cake.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllCakesWidget.routeName,
                                                      queryParameters: {
                                                        'cakeSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'themeCategory':
                                                            serializeParam(
                                                          _model.graduation,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel33,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Graduation',
                                                      image:
                                                          '/assets/images/celebration/cake/graduation.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllCakesWidget.routeName,
                                                      queryParameters: {
                                                        'cakeSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'themeCategory':
                                                            serializeParam(
                                                          _model.holiday,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel34,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      image:
                                                          '/assets/images/celebration/cake/holidays-cake.jpg',
                                                      name: 'Holiday',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllCakesWidget.routeName,
                                                      queryParameters: {
                                                        'cakeSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'themeCategory':
                                                            serializeParam(
                                                          _model.specialEvents,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel35,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Special Events',
                                                      image:
                                                          '/assets/images/celebration/cake/special-events-cake2.jpg',
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.goNamed(
                                                      AllCakesWidget.routeName,
                                                      queryParameters: {
                                                        'cakeSerchQuery':
                                                            serializeParam(
                                                          '*',
                                                          ParamType.String,
                                                        ),
                                                        'themeCategory':
                                                            serializeParam(
                                                          _model.weddingCake,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .celebrationTypeCompoentModel36,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CelebrationTypeCompoentWidget(
                                                      name: 'Wedding Cake',
                                                      image:
                                                          '/assets/images/celebration/cake/wedding-cake1.jpg',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              carouselController: _model
                                                      .cakeCarouselController ??=
                                                  CarouselSliderController(),
                                              options: CarouselOptions(
                                                initialPage: 0,
                                                viewportFraction: 0.5,
                                                disableCenter: true,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.25,
                                                enableInfiniteScroll: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: false,
                                                onPageChanged: (index, _) =>
                                                    _model.cakeCarouselCurrentIndex =
                                                        index,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .addToStart(SizedBox(height: 5.0))
                                          .addToEnd(SizedBox(height: 31.0)),
                                    ),
                                  ),
                              ]
                                  .divide(SizedBox(height: 10.0))
                                  .addToEnd(SizedBox(height: 40.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarWidget(
                      activePage: 'Home',
                    ),
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
