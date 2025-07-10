import '/compoents/cake_comp/cake_search_comp/cake_search_comp_widget.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/compoents/entertainer_comp/entertainer_search_comp/entertainer_search_comp_widget.dart';
import '/compoents/rental_comp/rental_search_comp/rental_search_comp_widget.dart';
import '/compoents/venue_comp/venue_search_comp/venue_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'all_search_model.dart';
export 'all_search_model.dart';

class AllSearchWidget extends StatefulWidget {
  const AllSearchWidget({super.key});

  static String routeName = 'AllSearch';
  static String routePath = 'AllSearch';

  @override
  State<AllSearchWidget> createState() => _AllSearchWidgetState();
}

class _AllSearchWidgetState extends State<AllSearchWidget>
    with TickerProviderStateMixin {
  late AllSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllSearchModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).lemonLime,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).clbxBlack,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.goNamed(HomePageWidget.routeName);
                },
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'ya63k1ut' /* Search */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: FlutterFlowTheme.of(context).clbxBlack,
                      fontSize: 23.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                    ),
              ),
            ].divide(SizedBox(width: 5.0)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).clbxIconColor1,
                              labelPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    letterSpacing: 0.0,
                                    lineHeight: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    letterSpacing: 0.0,
                                    lineHeight: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              indicatorWeight: 7.0,
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '19seuxap' /*    Venue    */,
                                  ),
                                  icon: Icon(
                                    Icons.business_sharp,
                                    size: 26.0,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'q5h2cfda' /*    Rental    */,
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.truckMoving,
                                    size: 24.0,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '1vxth40r' /* Entertainer */,
                                  ),
                                  icon: Icon(
                                    Icons.auto_fix_high_rounded,
                                    size: 26.0,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'o67c0wog' /*     Cake     */,
                                  ),
                                  icon: Icon(
                                    Icons.cake,
                                    size: 26.0,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [
                                  () async {},
                                  () async {},
                                  () async {},
                                  () async {}
                                ][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                KeepAliveWidgetWrapper(
                                  builder: (context) => wrapWithModel(
                                    model: _model.venueSearchCompModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: VenueSearchCompWidget(),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => wrapWithModel(
                                    model: _model.rentalSearchCompModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: RentalSearchCompWidget(),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => wrapWithModel(
                                    model: _model.entertainerSearchCompModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: EntertainerSearchCompWidget(),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => wrapWithModel(
                                    model: _model.cakeSearchCompModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CakeSearchCompWidget(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                    activePage: 'Search',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
