import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'html_render_page_model.dart';
export 'html_render_page_model.dart';

class HtmlRenderPageWidget extends StatefulWidget {
  const HtmlRenderPageWidget({
    super.key,
    required this.link,
  });

  final String? link;

  @override
  State<HtmlRenderPageWidget> createState() => _HtmlRenderPageWidgetState();
}

class _HtmlRenderPageWidgetState extends State<HtmlRenderPageWidget> {
  late HtmlRenderPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HtmlRenderPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: FlutterFlowWebView(
        content: widget.link!,
        bypass: true,
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        verticalScroll: false,
        horizontalScroll: false,
      ),
    );
  }
}
