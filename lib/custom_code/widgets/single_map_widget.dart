// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as l1;

class SingleMapWidget extends StatefulWidget {
  const SingleMapWidget({
    super.key,
    this.width,
    this.height,
    this.markerData,
    this.startingZoom,
  });

  final double? width;
  final double? height;
  final MarkerInfoStruct? markerData;
  final double? startingZoom;

  @override
  State<SingleMapWidget> createState() => _SingleMapWidgetState();
}

class _SingleMapWidgetState extends State<SingleMapWidget> {
  Marker? singleMarker;
  double iconSize = 40.0; // Define iconSize here

  @override
  void initState() {
    super.initState();
    if (widget.markerData != null) {
      addMarkerToMap(widget.markerData!);
    }
  }

  void addMarkerToMap(MarkerInfoStruct markerInfo) {
    final point = markerInfo.point;
    if (point != null && point.latitude != null && point.longitude != null) {
      setState(() {
        singleMarker = Marker(
          point: l1.LatLng(point.latitude, point.longitude),
          height: iconSize,
          width: iconSize,
          child: GestureDetector(
            onTap: () {
              // Handle marker tap here
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 40), // Spacer for the close button
                              Text(
                                '${markerInfo.name}',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Address: ${markerInfo.address}\n\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0.0,
                          top: 0.0,
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.black),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(
              Icons.location_pin,
              color: Colors.red,
              size: iconSize,
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    l1.LatLng defaultCenter = l1.LatLng(0, 0); // Default center

    if (widget.markerData != null) {
      final markerPoint = widget.markerData!.point;
      if (markerPoint != null) {
        defaultCenter = l1.LatLng(markerPoint.latitude, markerPoint.longitude);
      }
    }

    return Container(
      width: widget.width,
      height: widget.height,
      child: FlutterMap(
        options: MapOptions(
          initialCenter: defaultCenter,
          initialZoom: widget.startingZoom ?? 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/jayantam/clusdvg5200bw01r586lbhn2m/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiamF5YW50YW0iLCJhIjoiY2sydXFyZGZxMXAwczNudWlpY3JrcHB5MiJ9.8WEXuNB2Dyby6iFDjijbJA',
          ),
          if (singleMarker != null) MarkerLayer(markers: [singleMarker!]),
        ],
      ),
    );
  }
}
