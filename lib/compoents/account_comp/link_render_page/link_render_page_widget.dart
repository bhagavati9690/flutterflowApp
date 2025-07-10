import '/compoents/account_comp/html_render_page/html_render_page_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'link_render_page_model.dart';
export 'link_render_page_model.dart';

class LinkRenderPageWidget extends StatefulWidget {
  const LinkRenderPageWidget({
    super.key,
    required this.name,
    required this.link,
  });

  final String? name;
  final String? link;

  static String routeName = 'linkRenderPage';
  static String routePath = 'linkRenderPage';

  @override
  State<LinkRenderPageWidget> createState() => _LinkRenderPageWidgetState();
}

class _LinkRenderPageWidgetState extends State<LinkRenderPageWidget> {
  late LinkRenderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkRenderPageModel());

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
            buttonSize: 48.0,
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
            valueOrDefault<String>(
              widget.name,
              'Name',
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).titleLargeIsCustom,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.htmlRenderPageModel,
                  updateCallback: () => safeSetState(() {}),
                  child: HtmlRenderPageWidget(
                    link: valueOrDefault<String>(
                      widget.link,
                      'Something went wrong',
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
