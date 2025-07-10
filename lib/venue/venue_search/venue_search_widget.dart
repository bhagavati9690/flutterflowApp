import '/compoents/venue_comp/venue_search_comp/venue_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'venue_search_model.dart';
export 'venue_search_model.dart';

class VenueSearchWidget extends StatefulWidget {
  const VenueSearchWidget({super.key});

  static String routeName = 'venueSearch';
  static String routePath = 'venueSearch';

  @override
  State<VenueSearchWidget> createState() => _VenueSearchWidgetState();
}

class _VenueSearchWidgetState extends State<VenueSearchWidget> {
  late VenueSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueSearchModel());

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
                  'ria3w4ak' /* Search Party Venues */,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: wrapWithModel(
                  model: _model.venueSearchCompModel,
                  updateCallback: () => safeSetState(() {}),
                  child: VenueSearchCompWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
