import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'counter_comp_model.dart';
export 'counter_comp_model.dart';

/// Created because of the dynamic children issue
class CounterCompWidget extends StatefulWidget {
  const CounterCompWidget({
    super.key,
    int? quantity,
    this.resourceItemType,
    this.parentRecordKey,
    this.caller,
    this.selection,
  }) : this.quantity = quantity ?? 0;

  final int quantity;
  final String? resourceItemType;
  final String? parentRecordKey;
  final String? caller;
  final String? selection;

  @override
  State<CounterCompWidget> createState() => _CounterCompWidgetState();
}

class _CounterCompWidgetState extends State<CounterCompWidget> {
  late CounterCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CounterCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 120.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        shape: BoxShape.rectangle,
      ),
      child: FlutterFlowCountController(
        decrementIconBuilder: (enabled) => Icon(
          Icons.remove_rounded,
          color: enabled
              ? FlutterFlowTheme.of(context).secondaryText
              : FlutterFlowTheme.of(context).alternate,
          size: 24.0,
        ),
        incrementIconBuilder: (enabled) => Icon(
          Icons.add_rounded,
          color: enabled
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).alternate,
          size: 24.0,
        ),
        countBuilder: (count) => Text(
          count.toString(),
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).titleLargeIsCustom,
              ),
        ),
        count: _model.countControllerValue ??= widget.quantity,
        updateCount: (count) async {
          safeSetState(() => _model.countControllerValue = count);
          _model.addonQuantityChangedResponse =
              await AddonGroupGroup.quantityActionCall.call(
            token: FFAppState().SessionToken,
            quantity: _model.countControllerValue?.toString(),
            resourceItemType: widget.resourceItemType,
            parentRecordKey: widget.parentRecordKey,
            caller: widget.caller,
            clientState:
                '{\"clientId\":\"contains_venueAddonsGridUI__venueAddonsGridUI__venueAddonsUIGrid\",\"cursor\":{\"recordKey\":\"${widget.resourceItemType}\",\"parentRecordKey\":\"${widget.parentRecordKey}\"},\"selection\":[\"${widget.selection}\"]}',
          );

          if ((_model.addonQuantityChangedResponse?.succeeded ?? true)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AddonGroupGroup.quantityActionCall.toastsMsg(
                    (_model.addonQuantityChangedResponse?.jsonBody ?? ''),
                  )!,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 1500),
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
              ),
            );
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    title: Text('Oops'),
                    content: Text('Something went wrong'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          safeSetState(() {});
        },
        stepSize: 1,
        minimum: 0,
        contentPadding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      ),
    );
  }
}
