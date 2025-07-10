import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'rating_comp_model.dart';
export 'rating_comp_model.dart';

class RatingCompWidget extends StatefulWidget {
  const RatingCompWidget({
    super.key,
    String? rank,
  }) : this.rank = rank ?? '0';

  final String rank;

  @override
  State<RatingCompWidget> createState() => _RatingCompWidgetState();
}

class _RatingCompWidgetState extends State<RatingCompWidget> {
  late RatingCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterFlowTheme.of(context).primary,
      ),
      direction: Axis.horizontal,
      rating: valueOrDefault<double>(
        functions.stringToIntegerConversion(widget.rank),
        0.0,
      ),
      unratedColor: FlutterFlowTheme.of(context).clbxBackground,
      itemCount: 5,
      itemSize: 24.0,
    );
  }
}
