import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'filter_not_found_comp_model.dart';
export 'filter_not_found_comp_model.dart';

class FilterNotFoundCompWidget extends StatefulWidget {
  const FilterNotFoundCompWidget({super.key});

  @override
  State<FilterNotFoundCompWidget> createState() =>
      _FilterNotFoundCompWidgetState();
}

class _FilterNotFoundCompWidgetState extends State<FilterNotFoundCompWidget> {
  late FilterNotFoundCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterNotFoundCompModel());

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.3,
          height: MediaQuery.sizeOf(context).width * 0.3,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).lemonLime,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.manage_search_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 47.0,
          ),
        ),
        Text(
          FFLocalizations.of(context).getText(
            'sdddrtbs' /* No Filter's Found */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).headlineMediumIsCustom,
              ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'rgh8sfyi' /* We couldn't find any items mat... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).labelLargeIsCustom,
                  ),
            ),
          ),
        ),
      ].divide(SizedBox(height: 24.0)),
    );
  }
}
