import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'map_venue_model.dart';
export 'map_venue_model.dart';

class MapVenueWidget extends StatefulWidget {
  const MapVenueWidget({
    super.key,
    this.filter,
    String? searchQuery,
    required this.start,
    required this.pageNumber,
    this.sortOrder,
    required this.sortOrderType,
  }) : searchQuery = searchQuery ?? '*';

  final String? filter;
  final String searchQuery;
  final int? start;
  final int? pageNumber;
  final String? sortOrder;
  final String? sortOrderType;

  @override
  State<MapVenueWidget> createState() => _MapVenueWidgetState();
}

class _MapVenueWidgetState extends State<MapVenueWidget> {
  late MapVenueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapVenueModel());

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
            child: FutureBuilder<ApiCallResponse>(
              future: VenuesGroup.getAllVenuesMapCall.call(
                filters: widget.filter,
                startIndex: widget.start,
                pageNumber: widget.pageNumber,
                searchText: widget.searchQuery,
                limit: 30,
                sortOrderType: widget.sortOrderType,
                sortOrder: widget.sortOrder,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: SpinKitRing(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20.0,
                      ),
                    ),
                  );
                }
                final mapCustomWidgetGetAllVenuesMapResponse = snapshot.data!;
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.MapCustomWidget(
                    width: double.infinity,
                    height: double.infinity,
                    startingZoom: 15.0,
                    markerData: functions
                        .mapLoadInformation(VenuesGroup.getAllVenuesMapCall
                            .details(
                              mapCustomWidgetGetAllVenuesMapResponse.jsonBody,
                            )
                            ?.toList()),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 9.0, 9.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primaryText,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 52.0,
                fillColor: FlutterFlowTheme.of(context).primaryText,
                icon: Icon(
                  Icons.view_list_rounded,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
