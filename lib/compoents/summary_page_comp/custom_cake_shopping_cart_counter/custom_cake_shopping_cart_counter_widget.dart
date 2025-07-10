import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_cake_shopping_cart_counter_model.dart';
export 'custom_cake_shopping_cart_counter_model.dart';

class CustomCakeShoppingCartCounterWidget extends StatefulWidget {
  const CustomCakeShoppingCartCounterWidget({
    super.key,
    int? quantity,
    required this.id,
  }) : this.quantity = quantity ?? 1;

  final int quantity;
  final String? id;

  @override
  State<CustomCakeShoppingCartCounterWidget> createState() =>
      _CustomCakeShoppingCartCounterWidgetState();
}

class _CustomCakeShoppingCartCounterWidgetState
    extends State<CustomCakeShoppingCartCounterWidget> {
  late CustomCakeShoppingCartCounterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomCakeShoppingCartCounterModel());

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
          _model.actionResponse = await ShoppingCartSummaryUIGroup
              .customCakeQuantityActionCall
              .call(
            quantity: _model.countControllerValue?.toString(),
            token: FFAppState().SessionToken,
            clientstate:
                '{\"clientId\":\"shoppingCartSummary__customCakeSummaryUIGrid\",\"cursor\":{},\"selection\":[\"${widget.id}\"]}',
          );

          if ((_model.actionResponse?.succeeded ?? true)) {
            context.pushNamed(ShoppingCartSummaryCopyWidget.routeName);
          }

          safeSetState(() {});
        },
        stepSize: 1,
        contentPadding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      ),
    );
  }
}
