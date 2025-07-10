import '/compoents/common_comp/description_bottom_sheet_web_view/description_bottom_sheet_web_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'description_comp_model.dart';
export 'description_comp_model.dart';

class DescriptionCompWidget extends StatefulWidget {
  const DescriptionCompWidget({
    super.key,
    required this.input,
  });

  final String? input;

  @override
  State<DescriptionCompWidget> createState() => _DescriptionCompWidgetState();
}

class _DescriptionCompWidgetState extends State<DescriptionCompWidget> {
  late DescriptionCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescriptionCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          MarkdownBody(
            data: functions.convertDescriptionStringToMarkDown(functions
                .truncateHtmlPreservingTags(widget.input!, 150)
                .name)!,
            selectable: false,
            onTapLink: (_, url, __) => launchURL(url!),
          ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            FlutterFlowWebView(
              content: functions
                  .truncateHtmlPreservingTags(widget.input!, 150)
                  .name,
              height: MediaQuery.sizeOf(context).height * 0.1,
              verticalScroll: false,
              horizontalScroll: false,
              html: true,
            ),
          if (functions.truncateHtmlPreservingTags(widget.input!, 150).id ==
              '1')
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: DescriptionBottomSheetWebViewWidget(
                              input: widget.input!,
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'jti65hah' /* View more .... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
