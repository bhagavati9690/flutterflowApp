import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'hour_comp_detail_page_model.dart';
export 'hour_comp_detail_page_model.dart';

class HourCompDetailPageWidget extends StatefulWidget {
  const HourCompDetailPageWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final dynamic parameter1;
  final dynamic parameter2;

  @override
  State<HourCompDetailPageWidget> createState() =>
      _HourCompDetailPageWidgetState();
}

class _HourCompDetailPageWidgetState extends State<HourCompDetailPageWidget> {
  late HourCompDetailPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HourCompDetailPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.4,
          decoration: BoxDecoration(),
          child: Text(
            widget.parameter1!.toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.4,
          decoration: BoxDecoration(),
          child: Text(
            widget.parameter2!.toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
          ),
        ),
      ],
    );
  }
}
