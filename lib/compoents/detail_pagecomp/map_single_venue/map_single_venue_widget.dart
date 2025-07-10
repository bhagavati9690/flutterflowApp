import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'map_single_venue_model.dart';
export 'map_single_venue_model.dart';

class MapSingleVenueWidget extends StatefulWidget {
  const MapSingleVenueWidget({
    super.key,
    required this.details,
  });

  final dynamic details;

  @override
  State<MapSingleVenueWidget> createState() => _MapSingleVenueWidgetState();
}

class _MapSingleVenueWidgetState extends State<MapSingleVenueWidget> {
  late MapSingleVenueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapSingleVenueModel());

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
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1.04,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.SingleMapWidget(
              width: double.infinity,
              height: double.infinity,
              startingZoom: 15.0,
              markerData: functions.singlemapLoadInformation(widget.details),
            ),
          ),
        ],
      ),
    );
  }
}
