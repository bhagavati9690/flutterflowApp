// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:latlong2/latlong.dart' as l1;

class MapCustomWidget extends StatefulWidget {
  const MapCustomWidget({
    super.key,
    this.width,
    this.height,
    this.markerData,
    this.startingZoom,
  });

  final double? width;
  final double? height;
  final List<MarkerInfoStruct>? markerData;
  final double? startingZoom;

  @override
  State<MapCustomWidget> createState() => _MapCustomWidgetState();
}

class _MapCustomWidgetState extends State<MapCustomWidget> {
  List<Marker> allMarkers = [];
  double iconSize = 24.0; // Define iconSize here

  @override
  void initState() {
    super.initState();
    print("No ");
    if (widget.markerData != null && widget.markerData!.isNotEmpty) {
      addMarkersToMap(widget.markerData!);
    }
  }

  void addMarkersToMap(List<MarkerInfoStruct>? markerData) {
    print("No marker information extracted.");
    if (markerData != null) {
      for (MarkerInfoStruct markerInfo in markerData) {
        print('Marker tapped!  ${markerInfo}');
        final point = markerInfo.point;
        if (point != null) {
          final latitude = point.latitude;
          final longitude = point.longitude;
          if (latitude != null && longitude != null) {
            allMarkers.add(
              Marker(
                point: l1.LatLng(latitude!, longitude!),
                height: 12,
                width: 12,
                alignment: Alignment(0, -12),
                child: GestureDetector(
                  onTap: () {
                    // Handle marker tap here
                    print('Marker tapped!');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Theme(
                          data: ThemeData(
                            // Change the background color of the dialog here
                            dialogBackgroundColor:
                                Colors.white, // Example color
                          ),
                          child: AlertDialog(
                            title: Text(
                              '${markerInfo.name}',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            content: Text(
                              'Address: ${markerInfo.address}\n\nPrice: ${markerInfo.price}\n\nActivityType: ${markerInfo.activityType}\n\nActivityCategory: ${markerInfo.activityCategory}\n\nVenueType: ${markerInfo.venueType}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    );

                    /* showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            '${markerInfo.name}',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          content: Text(
                            'Address: ${markerInfo.address}\n\nPrice: ${markerInfo.price}\n\nActivityType: ${markerInfo.activityType}\n\nActivityCategory: ${markerInfo.activityCategory}\n\nVenueType: ${markerInfo.venueType}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );*/
                  },
/*                  onTapCancel: () {
                    setState(() {
                      // Reset the icon size when tap is cancelled
                      iconSize = 24.0;
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      // Reset the icon size when tap is released
                      iconSize = 24.0;
                    });
                  },*/
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: iconSize,
                  ),
                ),
              ),
            );
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    l1.LatLng defaultCenter = l1.LatLng(0, 0); // Default center

    if (widget.markerData != null && widget.markerData!.isNotEmpty) {
      // Get the coordinates of the first marker
      final firstMarker = widget.markerData![0];
      final firstMarkerPoint = firstMarker.point;
      if (firstMarkerPoint != null) {
        defaultCenter =
            l1.LatLng(firstMarkerPoint.latitude!, firstMarkerPoint.longitude!);
      }
    }
    return FlutterMap(
      options: MapOptions(
        /*center: l1.LatLng(
            widget.startingPoint.latitude, widget.startingPoint.longitude),
        zoom: widget.startingZoom,*/
        center: defaultCenter,
        zoom: widget.startingZoom,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/jayantam/clusdvg5200bw01r586lbhn2m/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiamF5YW50YW0iLCJhIjoiY2sydXFyZGZxMXAwczNudWlpY3JrcHB5MiJ9.8WEXuNB2Dyby6iFDjijbJA',
        ),
        MarkerLayer(markers: allMarkers),
      ],
    );
  }
}
