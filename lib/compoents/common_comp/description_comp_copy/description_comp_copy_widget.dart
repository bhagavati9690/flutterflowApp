import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'description_comp_copy_model.dart';
export 'description_comp_copy_model.dart';

class DescriptionCompCopyWidget extends StatefulWidget {
  const DescriptionCompCopyWidget({
    super.key,
    required this.input,
    required this.des,
  });

  final String? input;
  final dynamic des;

  @override
  State<DescriptionCompCopyWidget> createState() =>
      _DescriptionCompCopyWidgetState();
}

class _DescriptionCompCopyWidgetState extends State<DescriptionCompCopyWidget> {
  late DescriptionCompCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescriptionCompCopyModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          color: Color(0x00000000),
          child: ExpandableNotifier(
            controller: _model.expandableExpandableController,
            child: ExpandablePanel(
              header: Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(),
              ),
              collapsed: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  MarkdownBody(
                    data: functions.convertDescriptionToMarkdown(functions
                        .truncateHtmlPreservingTags(widget.input!, 150)
                        .toMap()),
                    selectable: true,
                    onTapLink: (_, url, __) => launchURL(url!),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '1p3lkahf' /* ... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyLargeIsCustom,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              expanded: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  MarkdownBody(
                    data: functions.convertDescriptionToMarkdown(widget.des!),
                    selectable: true,
                    onTapLink: (_, url, __) => launchURL(url!),
                  ),
                ],
              ),
              theme: ExpandableThemeData(
                tapHeaderToExpand: true,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                hasIcon: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
