import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'read_only_chop_chips_model.dart';
export 'read_only_chop_chips_model.dart';

/// for ready only Strings Display
class ReadOnlyChopChipsWidget extends StatefulWidget {
  const ReadOnlyChopChipsWidget({
    super.key,
    this.parameter1,
  });

  final List<String>? parameter1;

  @override
  State<ReadOnlyChopChipsWidget> createState() =>
      _ReadOnlyChopChipsWidgetState();
}

class _ReadOnlyChopChipsWidgetState extends State<ReadOnlyChopChipsWidget> {
  late ReadOnlyChopChipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadOnlyChopChipsModel());

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) {
              final name = widget.parameter1?.toList() ?? [];

              return Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: List.generate(name.length, (nameIndex) {
                  final nameItem = name[nameIndex];
                  return FFButtonWidget(
                    onPressed: true
                        ? null
                        : () {
                            print('Button pressed ...');
                          },
                    text: nameItem,
                    options: FFButtonOptions(
                      height: MediaQuery.sizeOf(context).height * 0.045,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      borderRadius: BorderRadius.circular(14.0),
                      disabledColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      disabledTextColor:
                          FlutterFlowTheme.of(context).primaryText,
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ].divide(SizedBox(height: 10.0)),
    );
  }
}
