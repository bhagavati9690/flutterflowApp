import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'error_compoent_model.dart';
export 'error_compoent_model.dart';

class ErrorCompoentWidget extends StatefulWidget {
  const ErrorCompoentWidget({super.key});

  @override
  State<ErrorCompoentWidget> createState() => _ErrorCompoentWidgetState();
}

class _ErrorCompoentWidgetState extends State<ErrorCompoentWidget> {
  late ErrorCompoentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErrorCompoentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      child: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/celebratix_logo_e.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                    child: FaIcon(
                      FontAwesomeIcons.frown,
                      color: FlutterFlowTheme.of(context).error,
                      size: 70.0,
                    ),
                  ),
                  Text(
                    'No results found',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).error,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      'No item found your search criteria',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).tertiary,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ),
                ].divide(const SizedBox(height: 20.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
