import '/compoents/common_comp/nav_bar_item/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    required this.activePage,
  });

  final String? activePage;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 5.0, 0.0),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: Color(0x7839D2C0),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      'b0g5awk8' /* 2 */,
                                    ),
                                    maxLines: 1,
                                    minFontSize: 8.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.navBarItemModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: NavBarItemWidget(
                                active: Icon(
                                  Icons.shopping_cart,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                notactive: Icon(
                                  Icons.shopping_cart_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                currentPage: 'Cart',
                                activePage: widget.activePage!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (FFAppState().userType != 'vendor')
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              HomePageWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 100),
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.navBarItemModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: NavBarItemWidget(
                              active: Icon(
                                Icons.home,
                                color: FFAppState().userType == 'vendor'
                                    ? FFAppConstants.vendorSecondaryColor
                                    : FFAppConstants.consumerSecondaryColor,
                                size: 30.0,
                              ),
                              notactive: Icon(
                                Icons.home_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              currentPage: 'Home',
                              activePage: widget.activePage!,
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().userType != 'vendor')
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              AllSearchWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.scale,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 100),
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.navBarItemModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: NavBarItemWidget(
                              active: Icon(
                                Icons.find_in_page,
                                color: FFAppState().userType == 'vendor'
                                    ? FFAppConstants.vendorSecondaryColor
                                    : FFAppConstants.consumerSecondaryColor,
                                size: 30.0,
                              ),
                              notactive: Icon(
                                Icons.find_in_page_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              currentPage: 'Search',
                              activePage: widget.activePage!,
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().userType == 'vendor')
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              VendorDashboardWidget.routeName,
                              queryParameters: {
                                'parentRecordKey': serializeParam(
                                  FFAppState().resourceId.toString(),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.scale,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 100),
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.navBarItemModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: NavBarItemWidget(
                              active: Icon(
                                Icons.data_thresholding,
                                color: FFAppState().userType == 'vendor'
                                    ? FFAppConstants.vendorSecondaryColor
                                    : FFAppConstants.consumerSecondaryColor,
                                size: 30.0,
                              ),
                              notactive: Icon(
                                Icons.data_thresholding_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              currentPage: 'Dashboard',
                              activePage: widget.activePage!,
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().userType == 'vendor')
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              VendorOrderPageWidget.routeName,
                              queryParameters: {
                                'parentRecordKey': serializeParam(
                                  FFAppState().resourceId.toString(),
                                  ParamType.String,
                                ),
                                'preSelectedTab': serializeParam(
                                  'default',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.scale,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 100),
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.navBarItemModel5,
                            updateCallback: () => safeSetState(() {}),
                            child: NavBarItemWidget(
                              active: Icon(
                                Icons.shop_rounded,
                                color: FFAppState().userType == 'vendor'
                                    ? FFAppConstants.vendorSecondaryColor
                                    : FFAppConstants.consumerSecondaryColor,
                                size: 30.0,
                              ),
                              notactive: Icon(
                                Icons.shop_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              currentPage: 'Order',
                              activePage: widget.activePage!,
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().userType == 'vendor')
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: wrapWithModel(
                          model: _model.navBarItemModel6,
                          updateCallback: () => safeSetState(() {}),
                          child: NavBarItemWidget(
                            active: Icon(
                              Icons.edit_calendar,
                              color: FFAppState().userType == 'vendor'
                                  ? FFAppConstants.vendorSecondaryColor
                                  : FFAppConstants.consumerSecondaryColor,
                              size: 30.0,
                            ),
                            notactive: Icon(
                              Icons.calendar_today,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            currentPage: 'Schedule',
                            activePage: widget.activePage!,
                          ),
                        ),
                      ),
                    if (FFAppState().IsLoggedInUser &&
                        (FFAppState().userType != 'vendor'))
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              MyEventsWidget.routeName,
                              queryParameters: {
                                'tab': serializeParam(
                                  0,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );
                          },
                          child: wrapWithModel(
                            model: _model.navBarItemModel7,
                            updateCallback: () => safeSetState(() {}),
                            child: NavBarItemWidget(
                              active: Icon(
                                Icons.celebration_sharp,
                                color: FFAppState().userType == 'vendor'
                                    ? FFAppConstants.vendorSecondaryColor
                                    : FFAppConstants.consumerSecondaryColor,
                                size: 30.0,
                              ),
                              notactive: Icon(
                                Icons.celebration_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              currentPage: 'Events',
                              activePage: widget.activePage!,
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().IsLoggedInUser)
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(AllChatsWidget.routeName);
                          },
                          child: wrapWithModel(
                            model: _model.navBarItemModel8,
                            updateCallback: () => safeSetState(() {}),
                            child: NavBarItemWidget(
                              active: Icon(
                                Icons.mail,
                                color: FFAppState().userType == 'vendor'
                                    ? FFAppConstants.vendorSecondaryColor
                                    : FFAppConstants.consumerSecondaryColor,
                                size: 30.0,
                              ),
                              notactive: Icon(
                                Icons.mail_outline,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              currentPage: 'Inbox',
                              activePage: widget.activePage!,
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed(MyAccountWidget.routeName);
                        },
                        child: wrapWithModel(
                          model: _model.navBarItemModel9,
                          updateCallback: () => safeSetState(() {}),
                          child: NavBarItemWidget(
                            active: Icon(
                              Icons.account_box,
                              color: FFAppState().userType == 'vendor'
                                  ? FFAppConstants.vendorSecondaryColor
                                  : FFAppConstants.consumerSecondaryColor,
                              size: 30.0,
                            ),
                            notactive: Icon(
                              Icons.account_box_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            currentPage: 'Account',
                            activePage: widget.activePage!,
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 18.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
