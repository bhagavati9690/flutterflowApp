import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'similar_vendor_comp_model.dart';
export 'similar_vendor_comp_model.dart';

class SimilarVendorCompWidget extends StatefulWidget {
  const SimilarVendorCompWidget({
    super.key,
    this.price,
    this.name,
    this.rank,
    this.image,
  });

  final dynamic price;
  final dynamic name;
  final dynamic rank;
  final dynamic image;

  @override
  State<SimilarVendorCompWidget> createState() =>
      _SimilarVendorCompWidgetState();
}

class _SimilarVendorCompWidgetState extends State<SimilarVendorCompWidget> {
  late SimilarVendorCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimilarVendorCompModel());

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
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    functions.validateAndFormatUrl(widget.image?.toString(),
                        FFDevEnvironmentValues().BaseUrl)!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      valueOrDefault<String>(
                        widget.name?.toString(),
                        'Name',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    valueOrDefault<String>(
                      widget.price?.toString(),
                      'NA',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  onRatingUpdate: (newValue) =>
                      safeSetState(() => _model.ratingBarValue = newValue),
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  direction: Axis.horizontal,
                  initialRating: _model.ratingBarValue ??=
                      valueOrDefault<double>(
                    functions.stringToIntegerConversion(valueOrDefault<String>(
                      widget.rank?.toString(),
                      '0',
                    )),
                    0.0,
                  ),
                  unratedColor: FlutterFlowTheme.of(context).alternate,
                  itemCount: 5,
                  itemSize: 26.0,
                  glowColor: FlutterFlowTheme.of(context).primaryText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
