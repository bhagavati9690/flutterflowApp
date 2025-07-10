import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'error_page_view_compoent_model.dart';
export 'error_page_view_compoent_model.dart';

class ErrorPageViewCompoentWidget extends StatefulWidget {
  const ErrorPageViewCompoentWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<ErrorPageViewCompoentWidget> createState() =>
      _ErrorPageViewCompoentWidgetState();
}

class _ErrorPageViewCompoentWidgetState
    extends State<ErrorPageViewCompoentWidget> {
  late ErrorPageViewCompoentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErrorPageViewCompoentModel());

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
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).lemonLime,
            Color(0xFFF0D18C),
            Color(0xFFF6C0BA),
            FlutterFlowTheme.of(context).secondaryBackground
          ],
          stops: [0.1, 0.4, 0.7, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
      ),
      child: Stack(
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
          ))
            Opacity(
              opacity: 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/celebratix_logo_e.png',
                  width: double.infinity,
                  height: 400.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.asset(
                      'assets/images/Adobe_Express_-_file.png',
                      width: MediaQuery.sizeOf(context).width * 0.398,
                      height: MediaQuery.sizeOf(context).height * 0.265,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.frown,
                        color: FlutterFlowTheme.of(context).error,
                        size: 70.0,
                      ),
                    ),
                  Flexible(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ersx0x4d' /* Sorry !   */,
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: Color(0xFFE11B26),
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineMediumIsCustom,
                              ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      valueOrDefault<String>(
                        widget.text,
                        'Somthing Went Wrong',
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: Color(0xFFE90E1F),
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineMediumIsCustom,
                              ),
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
