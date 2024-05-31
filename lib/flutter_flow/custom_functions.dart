import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

double? getLatitude(LatLng? point) {
  // write function get ltutude from ltlng
  if (point == null) {
    return null;
  }
  print(point.latitude);
  return point.latitude;
}

double? getLongitude(LatLng? point) {
  // get longitude from point
// write function to get longitude from latlng
  if (point == null) {
    return null;
  }
  print(point.longitude);
  return point.longitude;
}

String? distanceSelectionConverter(String input) {
  String? output;

  if (input != null) {
    if (input.contains('Mile')) {
      output = input.replaceAll('Mile', '').trim();
    } else if (input.contains('No')) {
      output = '30000';
    }
  }

  // Add null check and set default value if output is null
  if (output == null) {
    output = '25';
  }
  print(output);
  return output;
}

String? filterInputFunctionc(
  String? distnceSelection,
  List<String>? venueType,
  List<String>? activityType,
  List<String>? sportstype,
  List<String>? priceyfactor,
  List<String>? ranking,
  List<String>? agerange,
  List<String>? town,
  List<String>? capacity,
  List<String>? demographics,
  String? placeactivity,
) {
  print("disvenuet==>" + venueType.toString());
  print("dist==>" + distnceSelection.toString());
  print("disvenuet==>" + activityType.toString());
  print("disvenuet==>" + sportstype.toString());
  print("disvenuet==>" + priceyfactor.toString());
  print("disvenuet==>" + ranking.toString());
  print("disvenuet==>" + agerange.toString());
  print("disvenuet==>" + town.toString());
  print("disvenuet==>" + capacity.toString());
  print("disvenuet==>" + demographics.toString());
//  print("disvenueuut==>" + placeactivity);

  final defaultLocation = [-71.0712, 42.2904]; // Default location
  final defaultDistance = int.parse(distnceSelection ?? '30000');
  final defaultUnit = 'Mile'; // Constant unit

  final defaultFilter = {
    'attribute': 'geometry',
    'filterType': 'geoDistance',
    'value': {
      'location': defaultLocation,
      'distance': defaultDistance,
      'unit': defaultUnit,
    }
  };

  List<Map<String, dynamic>> filters = [defaultFilter];

  // Adding 'where' filter manually based on provided example
  if (placeactivity != null && placeactivity.isNotEmpty) {
    filters.add({
      'attribute': 'where',
      'value': placeactivity,
      'serverDataType':
          'com.cbx.app.constant.basic.CLBXEnPartyPlaceType\$CBTVal\$',
    });
  }
  // Adding other filters based on the provided parameters

  if (venueType != null &&
      venueType.isNotEmpty &&
      !venueType.every((type) => type.trim().isEmpty)) {
    List<String> venueTypeValues = [];
    print('In if');
    for (var type in venueType) {
      venueTypeValues.add(type);
    }
    filters.add({'attribute': 'venuetype', 'value': venueTypeValues});
  }

  if (activityType != null &&
      activityType.isNotEmpty &&
      !activityType.every((type) => type.trim().isEmpty)) {
    List<String> activityTypeValues = [];
    print('In if');
    for (var type in activityType) {
      activityTypeValues.add(type);
    }
    filters.add({'attribute': 'activitytype', 'value': activityTypeValues});
  }

  if (sportstype != null &&
      sportstype.isNotEmpty &&
      !sportstype.every((type) => type.trim().isEmpty)) {
    List<String> sportstypeValues = [];
    print('In if');
    for (var type in sportstype) {
      sportstypeValues.add(type);
    }
    filters.add({'attribute': 'sportstype', 'value': sportstypeValues});
  }

  if (priceyfactor != null &&
      priceyfactor.isNotEmpty &&
      !priceyfactor.every((type) => type.trim().isEmpty)) {
    List<String> priceyfactorValues = [];
    print('In if');
    for (var type in priceyfactor) {
      priceyfactorValues.add(type);
    }
    filters.add({'attribute': 'priceyfactor', 'value': priceyfactorValues});
  }

  if (ranking != null &&
      ranking.isNotEmpty &&
      !ranking.every((type) => type.trim().isEmpty)) {
    List<String> rankingValues = [];
    print('In if');
    for (var type in ranking) {
      rankingValues.add(type);
    }
    filters.add({'attribute': 'ranking', 'value': rankingValues});
  }

  if (town != null &&
      town.isNotEmpty &&
      !town.every((type) => type.trim().isEmpty)) {
    List<String> townValues = [];
    print('In if');
    for (var type in town) {
      townValues.add(type);
    }
    filters.add({'attribute': 'town', 'value': townValues});
  }

  if (demographics != null &&
      demographics.isNotEmpty &&
      !demographics.every((type) => type.trim().isEmpty)) {
    List<String> demographicsValues = [];
    print('In if');
    for (var type in demographics) {
      demographicsValues.add(type);
    }
    filters.add({'attribute': 'demographics', 'value': demographicsValues});
  }

  if (capacity != null &&
      capacity.isNotEmpty &&
      !capacity.every((type) => type.trim().isEmpty)) {
    List<String> capacityValues = [];
    print('In if');
    for (var type in capacity) {
      capacityValues.add(type);
    }
    filters.add({'attribute': 'capacity', 'value': capacityValues});
  }

  if (agerange != null &&
      agerange.isNotEmpty &&
      !agerange.every((type) => type.trim().isEmpty)) {
    List<String> agerangeValues = [];
    print('In if');
    for (var type in agerange) {
      agerangeValues.add(type);
    }
    filters.add({'attribute': 'agerange', 'value': agerangeValues});
  }

  print(filters.toString());
  print(jsonEncode(filters));
  return jsonEncode(filters);
}

LatLng? getPositionFunction() {
  return LatLng(-71.0712, 42.2904);
}

List<String>? venueTypeList(
  List<String>? venue,
  List<int>? count,
) {
  print(venue);
  print(count);

  List<String>? venueType = [];

  if (venue != null && count != null && venue.length == count.length) {
    for (int i = 0; i < venue.length; i++) {
      String pair = '${venue[i]} (${count[i]})';
      venueType.add(pair);
    }
  }
  print(venueType);
  return venueType;
}

List<String>? venuTypeSelectionConverter(List<String>? venueListWithCounts) {
  print(venueListWithCounts);
  List<String>? venueNames = [];

  if (venueListWithCounts != null) {
    for (String venueWithCount in venueListWithCounts) {
      List<String> parts = venueWithCount.split('(');
      String venueName = parts[0].trim();
      venueNames.add(venueName);
    }
  }
  print(venueNames);
  return venueNames;
}

String? viewByConverter(String? input) {
  // write function like from input string if contines  reired string return tht specific Stringg
  if (input == null) return 'relevance';

  if (input.contains('Relevance')) {
    return 'relevance';
  }
  if (input.contains('Ranking')) {
    return 'ranking';
  }
  if (input.contains('Price')) {
    return 'priceyfactor';
  }
  if (input.contains('VenueType')) {
    return 'venuetype';
  }
  if (input.contains('Distance')) {
    return 'geometry';
  }
  return 'relevance';
}

List<String>? priceTypeListReverse(List<String>? priceList) {
  List<String>? countList = [];

  if (priceList != null) {
    for (String price in priceList) {
      // Count the number of dollar signs in the string
      String count = (price.split('\$').length - 1).toString();
      countList.add(count);
    }
  }

  return countList;
}

String placeConversion(
  List<dynamic>? input,
  String? searchText,
) {
  print(input);
  print(searchText);

// Check if input and inputString are not null
  if (input == null) {
    return 'Input or inputString is null';
  }
  if (searchText == null) {
    return 'Search text is null';
  }

  // Iterate over the input list to find the matching text
  for (dynamic item in input) {
    if (item['text'] == searchText) {
      print('Found item: ${item['_id']}');
      return item['_id'].toString();
    }
  }

  // Return a message if no matching text is found
  return 'Text not found';
}

List<String>? priceTypeList(
  List<String>? venuePrice,
  List<int>? count,
) {
  print(venuePrice);
  print(count);

  List<String>? venuePriceType = [];

  if (venuePrice != null &&
      count != null &&
      venuePrice.length == count.length) {
    for (int i = 0; i < venuePrice.length; i++) {
      int number = int.tryParse(venuePrice[i]) ?? 0;

      // Create a string containing the number of dollar signs corresponding to the parsed integer
      String result = '\$' * number;

      String pair = '${result} (${count[i]})';
      venuePriceType.add(pair);
    }
  }
  print(venuePriceType);
  return venuePriceType;
}

List<MarkerInfoStruct>? mapLoadInformation(List<dynamic>? jsonData) {
  List<MarkerInfoStruct> markerInfoList = [];
  print("No kkkkkkkkkk");
  print(jsonData);
  if (jsonData != null) {
    for (var data in jsonData) {
      var geometry = data['venueMoreFields-_-geometry'];
      if (geometry != null) {
        var coordinatesList = geometry['coordinates'];
        if (coordinatesList != null &&
            coordinatesList is List &&
            coordinatesList.length >= 2) {
          double lat = (coordinatesList[1] as num).toDouble();
          double lng = (coordinatesList[0] as num).toDouble();
          LatLng point = (LatLng(lat, lng));
          String name = data['name'] ?? '';
          String address = data['address'] ?? '';
          String price = data['venueMoreFields-_-price'] ?? '';
          String activityType = data['venueMoreFields-_-activityType'] ?? '';
          String activityCategory =
              data['venueMoreFields-_-activityCategory'] ?? '';
          String venueType = data['venueType'] ?? '';

          MarkerInfoStruct markerInfo = MarkerInfoStruct(
            name: name,
            point: point,
            address: address,
            price: price,
            activityType: activityType,
            activityCategory: activityCategory,
            venueType: venueType,
          );
          print(markerInfo);
          markerInfoList.add(markerInfo);
        }
      }
    }
  }

  if (markerInfoList.isNotEmpty) {
    print("Extracted Marker Information:");
    markerInfoList.forEach((info) {
      print("Name: ${info.name}, Latitude: ${info.point}");
    });
  } else {
    print("No marker information extracted.");
  }

  return markerInfoList;
}

int pageNumberFunction(int input) {
  //AllVenueModel().mm = (input + 1);
  // FFAppState().nn = input + 1;

  return input + 1;
}

String? suggestionCursorInput(
  String query,
  String distnceSelection,
  double latitude,
  double longitude,
  String filterValue,
) {
  print("distance==>" + distnceSelection);
  print("query==>" + query);

  print("filterValue==>" + filterValue);
  const String unit = 'Mile';
  int distance = int.parse(distnceSelection ?? '25');

  final Map<String, dynamic> jsonData = {
    'key': 'venueTabContent',
    'params': {
      '_uiintState': [
        jsonEncode({
          'venueGrid__venueSideFilterPanel': {
            'filters': [
              {
                'attribute': 'geometry',
                'filterType': 'geoDistance',
                'value': {
                  'location': [longitude, latitude],
                  'distance': distance,
                  'unit': unit,
                },
              },
            ],
            'clientId': 'venueGrid__venueSideFilterPanel',
          },
          'venueTabContent__venueTopFilterPanel': {
            'query': query,
            'clientId': 'venueTabContent__venueTopFilterPanel',
          },
        }),
      ],
    },
    'component': {
      'clientId': 'venueTabContent__venueTopFilterPanel',
      'clientState': {
        'clientId': 'venueTabContent__venueTopFilterPanel',
        'filters': [
          {
            'attribute': 'where',
            'value': filterValue,
            'serverDataType':
                'com.cbx.app.constant.basic.CLBXEnPartyPlaceType\$CBTVal\$',
          },
        ],
        'query': query,
      },
    },
  };
  print(jsonData.toString());
  print(jsonEncode(jsonData));
  return jsonEncode(jsonData);
}

int? stringToIntegerConversion(String? input) {
  // take a string and convert in integer
  if (input == null) {
    return 0;
  }
  return int.tryParse(input);
}
