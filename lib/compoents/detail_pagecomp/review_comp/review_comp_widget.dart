import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'review_comp_model.dart';
export 'review_comp_model.dart';

class ReviewCompWidget extends StatefulWidget {
  const ReviewCompWidget({
    super.key,
    this.name,
    String? rating,
    String? likes,
  })  : this.rating = rating ?? '0',
        this.likes = likes ?? '0';

  final String? name;
  final String rating;
  final String likes;

  @override
  State<ReviewCompWidget> createState() => _ReviewCompWidgetState();
}

class _ReviewCompWidgetState extends State<ReviewCompWidget> {
  late ReviewCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewCompModel());

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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.4,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.name,
                        'Name',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                    RatingBar.builder(
                      onRatingUpdate: (newValue) =>
                          safeSetState(() => _model.ratingBarValue = newValue),
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      direction: Axis.horizontal,
                      initialRating: _model.ratingBarValue ??=
                          functions.stringToIntegerConversion(widget.rating)!,
                      unratedColor: FlutterFlowTheme.of(context).alternate,
                      itemCount: 5,
                      itemSize: 22.0,
                      glowColor: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ].divide(SizedBox(height: 7.0)),
                ),
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidThumbsUp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                      Flexible(
                        child: Text(
                          valueOrDefault<String>(
                            widget.likes,
                            ' likes',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    ].divide(SizedBox(width: 7.0)),
                  ),
                ),
              ),
            ],
          ),
        ].divide(SizedBox(height: 8.0)),
      ),
    );
  }
}
