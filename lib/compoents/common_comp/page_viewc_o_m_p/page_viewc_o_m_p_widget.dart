import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'page_viewc_o_m_p_model.dart';
export 'page_viewc_o_m_p_model.dart';

class PageViewcOMPWidget extends StatefulWidget {
  const PageViewcOMPWidget({
    super.key,
    this.photos,
  });

  final List<dynamic>? photos;

  @override
  State<PageViewcOMPWidget> createState() => _PageViewcOMPWidgetState();
}

class _PageViewcOMPWidgetState extends State<PageViewcOMPWidget> {
  late PageViewcOMPModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageViewcOMPModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.photos!.firstOrNull!.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Flexible(
            child: Builder(
              builder: (context) {
                final image = widget.photos?.toList() ?? [];
                if (image.isEmpty) {
                  return Image.asset(
                    'assets/images/image-not-found-1-scaled.png',
                  );
                }

                return Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 34.0),
                      child: PageView.builder(
                        controller: _model.pageViewController ??=
                            PageController(
                                initialPage: max(0, min(0, image.length - 1))),
                        scrollDirection: Axis.horizontal,
                        itemCount: image.length,
                        itemBuilder: (context, imageIndex) {
                          final imageItem = image[imageIndex];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              functions.validateAndFormatUrl(
                                  imageItem.toString(),
                                  FFDevEnvironmentValues().BaseUrl)!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.png',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 17.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(
                                  initialPage:
                                      max(0, min(0, image.length - 1))),
                          count: image.length,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            safeSetState(() {});
                          },
                          effect: smooth_page_indicator.SlideEffect(
                            spacing: 4.0,
                            radius: 7.0,
                            dotWidth: 10.0,
                            dotHeight: 10.0,
                            dotColor: FlutterFlowTheme.of(context).alternate,
                            activeDotColor:
                                FlutterFlowTheme.of(context).primaryText,
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
