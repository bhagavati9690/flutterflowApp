import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'document_comp_model.dart';
export 'document_comp_model.dart';

/// create one coloumn with row with flexible text in both coloumn
class DocumentCompWidget extends StatefulWidget {
  const DocumentCompWidget({
    super.key,
    required this.data,
  });

  final List<dynamic>? data;

  @override
  State<DocumentCompWidget> createState() => _DocumentCompWidgetState();
}

class _DocumentCompWidgetState extends State<DocumentCompWidget> {
  late DocumentCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocumentCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(
            builder: (context) {
              final document = widget.data!.toList();

              return ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: document.length,
                separatorBuilder: (_, __) => SizedBox(height: 8.0),
                itemBuilder: (context, documentIndex) {
                  final documentItem = document[documentIndex];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onDoubleTap: () async {
                          await launchURL(getJsonField(
                            documentItem,
                            r'''$['document-_-url']''',
                          ).toString());
                        },
                        onLongPress: () async {
                          await launchURL(getJsonField(
                            documentItem,
                            r'''$['document-_-url']''',
                          ).toString());
                        },
                        child: FFButtonWidget(
                          onPressed: () async {
                            await launchURL(getJsonField(
                              documentItem,
                              r'''$['document-_-url']''',
                            ).toString());
                          },
                          text: getJsonField(
                            documentItem,
                            r'''$['document-_-name']''',
                          ).toString(),
                          icon: FaIcon(
                            FontAwesomeIcons.externalLinkAlt,
                            size: 16.0,
                          ),
                          options: FFButtonOptions(
                            height: MediaQuery.sizeOf(context).height * 0.04,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconAlignment: IconAlignment.end,
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconColor: FlutterFlowTheme.of(context).primary,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelLargeIsCustom,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            hoverColor: FlutterFlowTheme.of(context).primary,
                            hoverTextColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
