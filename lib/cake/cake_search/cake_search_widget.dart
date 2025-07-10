import '/compoents/cake_comp/cake_search_comp/cake_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'cake_search_model.dart';
export 'cake_search_model.dart';

class CakeSearchWidget extends StatefulWidget {
  const CakeSearchWidget({super.key});

  static String routeName = 'CakeSearch';
  static String routePath = 'cakeSearch';

  @override
  State<CakeSearchWidget> createState() => _CakeSearchWidgetState();
}

class _CakeSearchWidgetState extends State<CakeSearchWidget> {
  late CakeSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CakeSearchModel());

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
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 43.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 25.0,
            ),
            onPressed: () async {
              context.goNamed(HomePageWidget.routeName);
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '6b13yj3h' /* Search Bakeries */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                ),
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
                  model: _model.cakeSearchCompModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CakeSearchCompWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
