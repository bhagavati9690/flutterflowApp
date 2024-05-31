import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'celebration_type_compoent_model.dart';
export 'celebration_type_compoent_model.dart';

class CelebrationTypeCompoentWidget extends StatefulWidget {
  const CelebrationTypeCompoentWidget({
    super.key,
    this.image,
    this.name,
  });

  final String? image;
  final String? name;

  @override
  State<CelebrationTypeCompoentWidget> createState() =>
      _CelebrationTypeCompoentWidgetState();
}

class _CelebrationTypeCompoentWidgetState
    extends State<CelebrationTypeCompoentWidget> {
  late CelebrationTypeCompoentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CelebrationTypeCompoentModel());

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
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            color: FlutterFlowTheme.of(context).secondaryText,
            offset: const Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            valueOrDefault<String>(
              widget.name,
              'Unknown',
            ),
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                widget.image!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
