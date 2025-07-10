import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';

double? getLatitude(LatLng? point) {
  // write function get ltutude from ltlng
  if (point == null) {
    return null;
  }
  //print("latitude=");
//  print(point.latitude);
  return point.latitude;
}

List<String> replaceEmpty(List<String>? inputList) {
  if (inputList == null || inputList.isEmpty) {
    return []; // Return an empty list if the input is null or empty
  }
  return inputList.where((str) => str.trim().isNotEmpty).toList();
}

List<String> findExactMatch1(
  List<String>? list,
  List<String>? input,
) {
  //print('In extract function');
  // print('List: $list');
  // print('Input: $input');

  // Initialize a result list to store the matching items
  List<String> result = [];

  // If the list or input is null or empty, return null
  if (list == null || input == null || list.isEmpty || input.isEmpty) {
    return result;
  }

  // Iterate through each item in the input list
  for (var inputItem in input) {
    if (inputItem == null) continue;

    // Extract the name up to the parenthesis
    int parenIndex = inputItem.indexOf('(');
    String inputBaseName = parenIndex != -1
        ? inputItem.substring(0, parenIndex).trim()
        : inputItem;

    //  print('Input Base Name: $inputBaseName');

    // Check if there's a matching base name in the provided list
    for (var listItem in list) {
      if (listItem == null) continue;

      // Extract the name up to the parenthesis
      int parenIndexx = listItem.indexOf('(');
      String listBaseName = parenIndexx != -1
          ? listItem.substring(0, parenIndexx).trim()
          : listItem;

      // print('List Base Name: $listBaseName');

      // If the base names match, add the original list item to the result
      if (inputBaseName == listBaseName) {
        result.add(listItem);
      }
    }
  }

  //print('Result: $result');

  // Return null if no matches were found, otherwise return the result
  return result;
}

List<String> combineAndReturnUnique1(
  List<String>? list1,
  List<String>? list2,
) {
  List<String> combined = [];

  if (list1 != null && list1.isNotEmpty) {
    combined.addAll(list1);
  }

  if (list2 != null && list2.isNotEmpty) {
    combined.addAll(list2);
  }

  return combined.toSet().toList();
}

String? cakeFilterInputFunction(
  String? distnceSelection,
  List<String>? foodprovidertype,
  List<String>? menurestrictions,
  List<String>? cakeflavors,
  List<String>? priceyfactor,
  List<String>? ranking,
  List<String>? themes,
  List<String>? town,
  List<String>? fillings,
  List<String>? icecreamflavors,
  String? themeCategory,
  double? latitude,
  double? longitude,
  List<String>? mindeliveryfee,
) {
  /* print("disvenuet==>" + venueType.toString());
  print("dist==>" + distnceSelection.toString());
  print("disvenuet==>" + activityType.toString());
  print("disvenuet==>" + sportstype.toString());
  print("disvenuet==>" + priceyfactor.toString());
  print("disvenuet==>" + ranking.toString());
  print("disvenuet==>" + agerange.toString());
  print("disvenuet==>" + town.toString());
  print("disvenuet==>" + capacity.toString());
  print("disvenuet==>" + demographics.toString());
//  print("disvenueuut==>" + placeactivity);*/

// Constructing the debug string
  String debugInfo = "distnceSelection: $distnceSelection, " +
      "foodprovidertype: ${foodprovidertype?.toString() ?? 'null'}, " +
      "menurestrictions: ${menurestrictions?.toString() ?? 'null'}, " +
      "cakeflavors: ${cakeflavors?.toString() ?? 'null'}, " +
      "priceyfactor: ${priceyfactor?.toString() ?? 'null'}, " +
      "ranking: ${ranking?.toString() ?? 'null'}, " +
      "themes: ${themes?.toString() ?? 'null'}, " +
      "town: ${town?.toString() ?? 'null'}, " +
      "fillings: ${fillings?.toString() ?? 'null'}, " +
      "icecreamflavors: ${icecreamflavors?.toString() ?? 'null'}, " +
      "mindeliveryfee: ${mindeliveryfee?.toString() ?? 'null'}, " +
      "themeCategory: $themeCategory, " +
      "latitude: $latitude, " +
      "longitude: $longitude";

  // print(debugInfo);

  final defaultLocation = [longitude, latitude]; // Default location
  final defaultDistance = int.parse(distnceSelection ?? '25');
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
  if (themeCategory != null &&
      themeCategory.isNotEmpty &&
      themeCategory.toLowerCase() != 'text not found') {
    filters.add({
      'attribute': 'avltheme',
      'value': themeCategory,
      'serverDataType':
          'com.cbx.app.constant.basic.CLBXEnThemeCategory\$CBTVal\$',
    });
  }
  // Adding other filters based on the provided parameters

  if (foodprovidertype != null &&
      foodprovidertype.isNotEmpty &&
      !foodprovidertype.every((type) => type.trim().isEmpty)) {
    List<String> foodprovidertypeValues = [];

    for (var type in foodprovidertype) {
      foodprovidertypeValues.add(type);
    }
    filters.add(
        {'attribute': 'foodprovidertype', 'value': foodprovidertypeValues});
  }

  if (menurestrictions != null &&
      menurestrictions.isNotEmpty &&
      !menurestrictions.every((type) => type.trim().isEmpty)) {
    List<String> menurestrictionsValues = [];

    for (var type in menurestrictions) {
      menurestrictionsValues.add(type);
    }
    filters.add(
        {'attribute': 'menurestrictions', 'value': menurestrictionsValues});
  }

  if (cakeflavors != null &&
      cakeflavors.isNotEmpty &&
      !cakeflavors.every((type) => type.trim().isEmpty)) {
    List<String> cakeflavorsValues = [];

    for (var type in cakeflavors) {
      cakeflavorsValues.add(type);
    }
    filters.add({'attribute': 'cakeflavors', 'value': cakeflavorsValues});
  }

  if (priceyfactor != null &&
      priceyfactor.isNotEmpty &&
      !priceyfactor.every((type) => type.trim().isEmpty)) {
    List<String> priceyfactorValues = [];

    for (var type in priceyfactor) {
      priceyfactorValues.add(type);
    }
    filters.add({'attribute': 'priceyfactor', 'value': priceyfactorValues});
  }

  if (ranking != null &&
      ranking.isNotEmpty &&
      !ranking.every((type) => type.trim().isEmpty)) {
    List<String> rankingValues = [];

    for (var type in ranking) {
      rankingValues.add(type);
    }
    filters.add({'attribute': 'ranking', 'value': rankingValues});
  }

  if (town != null &&
      town.isNotEmpty &&
      !town.every((type) => type.trim().isEmpty)) {
    List<String> townValues = [];

    for (var type in town) {
      townValues.add(type);
    }
    filters.add({'attribute': 'town', 'value': townValues});
  }

  if (icecreamflavors != null &&
      icecreamflavors.isNotEmpty &&
      !icecreamflavors.every((type) => type.trim().isEmpty)) {
    List<String> icecreamflavorsValues = [];

    for (var type in icecreamflavors) {
      icecreamflavorsValues.add(type);
    }
    filters
        .add({'attribute': 'icecreamflavors', 'value': icecreamflavorsValues});
  }

  if (fillings != null &&
      fillings.isNotEmpty &&
      !fillings.every((type) => type.trim().isEmpty)) {
    List<String> fillingsValues = [];

    for (var type in fillings) {
      fillingsValues.add(type);
    }
    filters.add({'attribute': 'fillings', 'value': fillingsValues});
  }

  if (themes != null &&
      themes.isNotEmpty &&
      !themes.every((type) => type.trim().isEmpty)) {
    List<String> themesValues = [];

    for (var type in themes) {
      themesValues.add(type);
    }
    filters.add({'attribute': 'themes', 'value': themesValues});
  }

  if (mindeliveryfee != null &&
      mindeliveryfee.isNotEmpty &&
      !mindeliveryfee.every((type) => type.trim().isEmpty)) {
    List<String> mindeliveryfeesValues = [];

    for (var type in mindeliveryfee) {
      mindeliveryfeesValues.add(type);
    }
    filters
        .add({'attribute': 'mindeliveryfee', 'value': mindeliveryfeesValues});
  }

  print(jsonEncode(filters));

  return jsonEncode(filters);
}

String? entertainerFilterInputFunction(
  String? distnceSelection,
  List<String>? priceyfactor,
  List<String>? ranking,
  List<String>? agerange,
  List<String>? town,
  List<String>? entserviceprovidercategory,
  String? entertainservicesectioncategory,
  double? latitude,
  double? longitude,
) {
// Constructing the debug string
  String debugInfo = "distnceSelection: $distnceSelection, " +
      "priceyfactor: ${priceyfactor?.toString() ?? 'null'}, " +
      "ranking: ${ranking?.toString() ?? 'null'}, " +
      "agerange: ${agerange?.toString() ?? 'null'}, " +
      "town: ${town?.toString() ?? 'null'}, " +
      "entserviceprovidercategory: ${entserviceprovidercategory?.toString() ?? 'null'}, " +
      "entertainservicesectioncategory: $entertainservicesectioncategory, " +
      "latitude: $latitude, " +
      "longitude: $longitude";

  print(debugInfo);

  final defaultLocation = [longitude, latitude]; // Default location
  final defaultDistance = int.parse(distnceSelection ?? '25');
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
  if (entertainservicesectioncategory != null &&
      entertainservicesectioncategory.isNotEmpty &&
      entertainservicesectioncategory.toLowerCase() != 'text not found') {
    filters.add({
      'attribute': 'entertainservicesectioncategory',
      'value': entertainservicesectioncategory,
      'serverDataType':
          'com.cbx.app.constant.service.CLBXEnEntertainSectionType\$CBTVal\$',
    });
  }
  // Adding other filters based on the provided parameters

  if (priceyfactor != null &&
      priceyfactor.isNotEmpty &&
      !priceyfactor.every((type) => type.trim().isEmpty)) {
    List<String> priceyfactorValues = [];

    for (var type in priceyfactor) {
      priceyfactorValues.add(type);
    }
    filters.add({'attribute': 'priceyfactor', 'value': priceyfactorValues});
  }

  if (ranking != null &&
      ranking.isNotEmpty &&
      !ranking.every((type) => type.trim().isEmpty)) {
    List<String> rankingValues = [];

    for (var type in ranking) {
      rankingValues.add(type);
    }
    filters.add({'attribute': 'ranking', 'value': rankingValues});
  }

  if (town != null &&
      town.isNotEmpty &&
      !town.every((type) => type.trim().isEmpty)) {
    List<String> townValues = [];

    for (var type in town) {
      townValues.add(type);
    }
    filters.add({'attribute': 'town', 'value': townValues});
  }

  if (entserviceprovidercategory != null &&
      entserviceprovidercategory.isNotEmpty &&
      !entserviceprovidercategory.every((type) => type.trim().isEmpty)) {
    List<String> entserviceprovidercategoryValues = [];

    for (var type in entserviceprovidercategory) {
      entserviceprovidercategoryValues.add(type);
    }
    filters.add({
      'attribute': 'entserviceprovidercategory',
      'value': entserviceprovidercategoryValues
    });
  }

  if (agerange != null &&
      agerange.isNotEmpty &&
      !agerange.every((type) => type.trim().isEmpty)) {
    List<String> agerangeValues = [];

    for (var type in agerange) {
      agerangeValues.add(type);
    }
    filters.add({'attribute': 'agerange', 'value': agerangeValues});
  }

  print(jsonEncode(filters));

  return jsonEncode(filters);
}

int checkJsonValueCount(dynamic jsonData) {
// Debugging: print the incoming JSON data
  print("Received JSON data: $jsonData");

  // Check if the JSON value is null
  if (jsonData == null) {
    // print("The JSON data is null (null). Returning false.");
    return 0;
  }

// Try to parse if it's a String
  if (jsonData is String) {
    try {
      jsonData = jsonDecode(jsonData);
    } catch (_) {
      return 0; // Return 0 if it's an invalid JSON string
    }
  }

  // Return field count if it's a Map
  if (jsonData is Map<String, dynamic>) {
    return jsonData.length;
  }

  // If it's a List, return its length (optional, or return 0)
  if (jsonData is List) {
    return jsonData.length;
  }

  return 0;
}

String? cakeSuggestionCursorInput(
  String query,
  String distanceSelection,
  double latitude,
  double longitude,
  String? filterValue,
) {
  // Ensure the distance is parsed correctly or set to default if null
  // print("Distance Selection: $distanceSelection");
//  print("Query: $query");
//  print("Filter Value: $filterValue");

  const String unit = 'Mile';
  int distance =
      int.tryParse(distanceSelection) ?? 25; // Default to 25 miles if invalid

  final Map<String, dynamic> jsonData = {
    'key': 'cakeTabContent',
    'params': {
      '_uiintState': [
        jsonEncode({
          'cakeTabContent__cakeSideFilterPanel': {
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
            'clientId': 'cakeGrid__cakeSideFilterPanel',
          },
          'cakeTabContent__cakeTopFilterPanel': {
            'query': query,
            'clientId': 'cakeTabContent__cakeTopFilterPanel',
          },
        }),
      ],
    },
    'component': {
      'clientId': 'cakeTabContent__cakeTopFilterPanel',
      'clientState': {
        'clientId': 'cakeTabContent__cakeTopFilterPanel',
        'filters': filterValue != null
            ? [
                {
                  'attribute': 'avltheme',
                  'value': filterValue,
                  'serverDataType':
                      'com.cbx.app.constant.basic.CLBXEnThemeCategory\$CBTVal\$',
                },
              ]
            : [],
        'query': query,
      },
    },
  };

  // Debug prints to inspect the final structure
  // print("Generated JSON Payload: ${jsonEncode(jsonData)}");

  return jsonEncode(jsonData);
}

double? getLongitude(LatLng? point) {
  // get longitude from point
// write function to get longitude from latlng
  if (point == null) {
    return null;
  }
  // print("longitude");
  //print(point.longitude);
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
  return output;
}

String? venueFilterInputFunction(
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
  double? latitude,
  double? longitude,
  List<String>? activitycategory,
) {
  /* print("disvenuet==>" + venueType.toString());
  print("dist==>" + distnceSelection.toString());
  print("disvenuet==>" + activityType.toString());
  print("disvenuet==>" + sportstype.toString());
  print("disvenuet==>" + priceyfactor.toString());
  print("disvenuet==>" + ranking.toString());
  print("disvenuet==>" + agerange.toString());
  print("disvenuet==>" + town.toString());
  print("disvenuet==>" + capacity.toString());
  print("disvenuet==>" + demographics.toString());
//  print("disvenueuut==>" + placeactivity);*/

// Constructing the debug string
  String debugInfo = "distnceSelection: $distnceSelection, " +
      "venueType: ${venueType?.toString() ?? 'null'}, " +
      "activityType: ${activityType?.toString() ?? 'null'}, " +
      "activitycategory: ${activitycategory?.toString() ?? 'null'}, " +
      "sportstype: ${sportstype?.toString() ?? 'null'}, " +
      "priceyfactor: ${priceyfactor?.toString() ?? 'null'}, " +
      "ranking: ${ranking?.toString() ?? 'null'}, " +
      "agerange: ${agerange?.toString() ?? 'null'}, " +
      "town: ${town?.toString() ?? 'null'}, " +
      "capacity: ${capacity?.toString() ?? 'null'}, " +
      "demographics: ${demographics?.toString() ?? 'null'}, " +
      "placeactivity: $placeactivity, " +
      "latitude: $latitude, " +
      "longitude: $longitude";

  //print(debugInfo);

  final defaultLocation = [longitude, latitude]; // Default location
  final defaultDistance = int.parse(distnceSelection ?? '25');
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
  if (placeactivity != null &&
      placeactivity.isNotEmpty &&
      placeactivity.toLowerCase() != 'text not found') {
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

    for (var type in venueType) {
      venueTypeValues.add(type);
    }
    filters.add({'attribute': 'venuetype', 'value': venueTypeValues});
  }

  if (activityType != null &&
      activityType.isNotEmpty &&
      !activityType.every((type) => type.trim().isEmpty)) {
    List<String> activityTypeValues = [];

    for (var type in activityType) {
      activityTypeValues.add(type);
    }
    filters.add({'attribute': 'activitytype', 'value': activityTypeValues});
  }

  if (activitycategory != null &&
      activitycategory.isNotEmpty &&
      !activitycategory.every((type) => type.trim().isEmpty)) {
    List<String> activitycategoryValues = [];

    for (var type in activitycategory) {
      activitycategoryValues.add(type);
    }
    filters.add(
        {'attribute': 'activitycategory', 'value': activitycategoryValues});
  }

  if (sportstype != null &&
      sportstype.isNotEmpty &&
      !sportstype.every((type) => type.trim().isEmpty)) {
    List<String> sportstypeValues = [];

    for (var type in sportstype) {
      sportstypeValues.add(type);
    }
    filters.add({'attribute': 'sportstype', 'value': sportstypeValues});
  }

  if (priceyfactor != null &&
      priceyfactor.isNotEmpty &&
      !priceyfactor.every((type) => type.trim().isEmpty)) {
    List<String> priceyfactorValues = [];

    for (var type in priceyfactor) {
      priceyfactorValues.add(type);
    }
    filters.add({'attribute': 'priceyfactor', 'value': priceyfactorValues});
  }

  if (ranking != null &&
      ranking.isNotEmpty &&
      !ranking.every((type) => type.trim().isEmpty)) {
    List<String> rankingValues = [];

    for (var type in ranking) {
      rankingValues.add(type);
    }
    filters.add({'attribute': 'ranking', 'value': rankingValues});
  }

  if (town != null &&
      town.isNotEmpty &&
      !town.every((type) => type.trim().isEmpty)) {
    List<String> townValues = [];

    for (var type in town) {
      townValues.add(type);
    }
    filters.add({'attribute': 'town', 'value': townValues});
  }

  if (demographics != null &&
      demographics.isNotEmpty &&
      !demographics.every((type) => type.trim().isEmpty)) {
    List<String> demographicsValues = [];

    for (var type in demographics) {
      demographicsValues.add(type);
    }
    filters.add({'attribute': 'demographics', 'value': demographicsValues});
  }

  if (capacity != null &&
      capacity.isNotEmpty &&
      !capacity.every((type) => type.trim().isEmpty)) {
    List<String> capacityValues = [];

    for (var type in capacity) {
      capacityValues.add(type);
    }
    filters.add({'attribute': 'capacity', 'value': capacityValues});
  }

  if (agerange != null &&
      agerange.isNotEmpty &&
      !agerange.every((type) => type.trim().isEmpty)) {
    List<String> agerangeValues = [];

    for (var type in agerange) {
      agerangeValues.add(type);
    }
    filters.add({'attribute': 'agerange', 'value': agerangeValues});
  }

  // print(jsonEncode(filters));

  return jsonEncode(filters);
}

LatLng? getPositionFunction() {
  return LatLng(-71.0712, 42.2904);
}

List<String>? venueTypeList(
  List<String>? venue,
  List<int>? count,
) {
  // print(">> Venue: $venue");
//  print("Count: $count");

  List<String>? venueType = [];

  if (venue != null && count != null && venue.length == count.length) {
    for (int i = 0; i < venue.length; i++) {
      String pair = '${venue[i]} (${count[i]})';
      venueType.add(pair);
    }
  } else {
    print(
        "The venue and count lists are either null or their lengths do not match.");
  }
  //print("Generated venueType list: $venueType");
  return venueType;
}

MarkerInfoStruct? singlemapLoadInformation(dynamic jsonData) {
  // print("Processing single JSON data for marker information.");
  // print(jsonData);

  if (jsonData != null) {
    var geometry = jsonData['resource-_-basicPartyInfo-_-address-_-geometry'];
    if (geometry != null) {
      var coordinatesList = geometry['coordinates'];
      if (coordinatesList != null &&
          coordinatesList is List &&
          coordinatesList.length >= 2) {
        double lat = (coordinatesList[1] as num).toDouble();
        double lng = (coordinatesList[0] as num).toDouble();
        LatLng point = (LatLng(lat, lng));
        String name =
            jsonData['resource-_-basicPartyInfo-_-busPartyIdentifier-_-name'] ??
                '';
        String address =
            jsonData['resource-_-basicPartyInfo-_-address-_-location'] ?? '';

        MarkerInfoStruct markerInfo =
            MarkerInfoStruct(name: name, point: point, address: address);
        //  print("Extracted Marker Information: $markerInfo");
        return markerInfo;
      }
    }
  }

  //print("No marker information extracted.");
  return null;
}

DateTime? convertStringToDateForCalender(String dateString) {
  print(dateString);
  if (dateString.trim().isEmpty) {
    print('In NUll');
    print(DateTime.now());
    return DateTime.now(); // Return current date-time if input is empty
  }

  List<DateFormat> formats = [
    DateFormat("MM/dd/yyyy hh:mm:ss a"), // Full date-time with AM/PM
    DateFormat("MM/dd/yyyy"), // Only date
    DateFormat(
        "yyyy-MM-dd HH:mm:ss.SSS") // Full date-time in 24-hour format with milliseconds
  ];

  for (var format in formats) {
    try {
      print(format.parse(dateString));
      return format.parse(dateString);
    } catch (e) {
      print('In catch');
      // Ignore and try next format
    }
  }
  print(DateTime.now());
  return DateTime.now(); // Default to current date-time if parsing fails
}

List<String>? topFilterTypeSelectionConverter(
    List<String>? typeListWithCounts) {
  // print("input....ff........");
  // print(typeListWithCounts);
  //print("typeListWithCounts: ${venueListWithCounts ?? 'null'}");
  List<String>? venueNames = [];

  if (typeListWithCounts != null) {
    for (String venueWithCount in typeListWithCounts) {
      List<String> parts = venueWithCount.split('(');
      String venueName = parts[0].trim();
      venueNames.add(venueName);
    }
  }
  //print("venueNames: ${venueNames ?? 'null'}");
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

List<String>? priceTypeListStarToNumber(List<String>? priceList) {
  //print("input.44...........");
  List<String>? countList = [];

  if (priceList != null) {
    for (String price in priceList) {
      // Count the number of dollar signs in the string
      String count = (price.split('\$').length - 1).toString();
      countList.add('$count ${price.substring(price.indexOf('('))}');
      //countList.add(count);
    }
  }

  return countList;
}

String placeConversion(
  List<dynamic>? input,
  String? searchText,
) {
  // print('input=' + input);
  // print("searchText: ${searchText ?? 'null'}");

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
      // print('Found item: ${item['_id']}');
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
  // print(venuePrice);
  // print("venuePrice: ${venuePrice ?? 'null'}");
  // print(count);
//  print("count: ${count ?? 'null'}");

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
  //print(venuePriceType);
  return venuePriceType;
}

List<MarkerInfoStruct>? mapLoadInformationForVenue(List<dynamic>? jsonData) {
  List<MarkerInfoStruct> markerInfoList = [];
  // print("No kkkkkkkkkk");
  //print(jsonData);
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

          //  print("markerInfo: ${markerInfo ?? 'null'}");
          markerInfoList.add(markerInfo);
        }
      }
    }
  }

  if (markerInfoList.isNotEmpty) {
    // print("Extracted Marker Information:");
    markerInfoList.forEach((info) {
      //  print("Name: ${info.name}, Latitude: ${info.point}");
    });
  } else {
    //  print("No marker information extracted.");
  }

  return markerInfoList;
}

int pageNumberFunction(int? input) {
  //AllVenueModel().mm = (input + 1);
  // FFAppState().nn = input + 1;
  if (input == null) {
    return 0;
  }
  return input + 1;
}

String? venueSuggestionCursorInput(
  String query,
  String distanceSelection,
  double latitude,
  double longitude,
  String? filterValue,
) {
  // Ensure the distance is parsed correctly or set to default if null
  // print("Distance Selection: $distanceSelection");
//  print("Query: $query");
//  print("Filter Value: $filterValue");

  const String unit = 'Mile';
  int distance =
      int.tryParse(distanceSelection) ?? 25; // Default to 25 miles if invalid

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
        'filters': filterValue != null
            ? [
                {
                  'attribute': 'where',
                  'value': filterValue,
                  'serverDataType':
                      'com.cbx.app.constant.basic.CLBXEnPartyPlaceType\$CBTVal\$',
                },
              ]
            : [],
        'query': query,
      },
    },
  };

  // Debug prints to inspect the final structure
  // print("Generated JSON Payload: ${jsonEncode(jsonData)}");

  return jsonEncode(jsonData);
}

double? stringToIntegerConversion(String? input) {
  // print("input............");
  if (input == null) {
    return 0.0;
  }

  // Try parsing the input as a double
  double? doubleValue = double.tryParse(input);
  if (doubleValue != null) {
    return doubleValue;
  }

//  print("input.......ddd.....");
  // If parsing fails, return 0.0
  return 0.0;
}

String? validateAndFormatUrl(
  String? path,
  String? baseUrl,
) {
// Check for null or empty path
  //print(path);
  if (path == null || path.trim().isEmpty) {
    return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/celebratix-u9fafm/assets/jik10b48gjoc/image-not-found-1-scaled.png";
  }

  // Trim whitespace and encode spaces in the path
  path = Uri.encodeFull(path.trim());

  // Regular expression to match URLs
  final urlPattern = r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$';
  final urlRegExp = RegExp(urlPattern);

  // Check if the path matches the URL pattern
  if (urlRegExp.hasMatch(path)) {
    // print("Valid URL: $path");
    return path;
  }

  // If the path is not a full URL, prepend the base URL

  final formattedPath = '$baseUrl$path';
  //print('Formatted Path: $formattedPath');
  return formattedPath;
}

String? metersToMileFunction(int? input) {
  if (input == null) {
    return "1 mi";
  }
  // write method to convert meters to mile up to 2 decimal

  double miles = input / 1609.344;
  return miles.toStringAsFixed(2) + 'mi';
}

String? cleanAndEncodeBase64(String? jsonString) {
  print(jsonString);
  if (jsonString == null) {
    return null;
  }

// Remove backslashes
  String cleanedString = jsonString.replaceAll(r'\', '');

  // Convert back to JSON string
  //String jsonStringWithoutBackslashes = jsonEncode(jsonString);
  print(cleanedString);
  // Encode the JSON string to Base64
  String base64Encoded = base64Encode(utf8.encode(cleanedString));

  print(base64Encoded);
  return 'client_json:' + base64Encoded;
}

dynamic clienstateQueryforResetPassword(String? key) {
  Map<String, dynamic> jsonData = {
    "clientId": "resetPassword__resetPasswordForm",
    "cursor": {
      "key": key ??
          "" // Ensure key is not null by providing a default empty string
    }
  };

  String jsonData1 = json.encode(jsonData);
  Map<String, dynamic> decodedJsonData = json.decode(jsonData1);

  return decodedJsonData;
}

String? priceFormat(String? incomingString) {
  // write function thattake one String then  remove 'Price:'from incoming String if String is empty or null then return Price On ReQuest
  if (incomingString == null || incomingString.isEmpty) {
    return 'Price On Request';
  } else {
    return incomingString.replaceAll('Price:', '');
  }
}

List<String>? priceTypeListNumberToStar(List<String>? priceList) {
  print(priceList);
  if (priceList == null) {
    return null;
  }

  List<String> resultList = [];
  for (String price in priceList) {
    // Split the input into the number and the rest of the string
    List<String> parts = price.split(' '); // Split by space
    int count = int.parse(parts[0]); // Parse the first part as an integer
    String rest = parts.sublist(1).join(' '); // Get the rest of the string

    // Generate the dollar signs based on the count
    String dollarSigns = '\$' * count;
    resultList.add(
        '$dollarSigns $rest'); // Combine the dollar signs and the rest of the string
  }

  print(resultList);
  return resultList;
}

bool checkJsonValue(dynamic jsonData) {
// Debugging: print the incoming JSON data
  // print("Received JSON data: $jsonData");

  // Check if the JSON value is null
  if (jsonData == null) {
    //   print("The JSON data is null (null). Returning false.");
    return false;
  }

  if (jsonData == 'null') {
    //print("The JSON data is null (null). Returning false.");
    return false;
  }

  // Check if the JSON data is an empty map (empty object)
  if (jsonData is Map && jsonData.isEmpty) {
    // print("The JSON data is an empty map (empty object). Returning false.");
    return false;
  }

  // Check if the JSON data is an empty list
  if (jsonData is List && jsonData.isEmpty) {
    //  print("The JSON data is an empty list. Returning false.");
    return false;
  }

  // Check if the JSON data is an empty string
  if (jsonData is String && jsonData.trim().isEmpty) {
    // print("The JSON data is an empty string. Returning false.");
    return false;
  }

  // If it's neither null nor empty, return true
  // print("The JSON data is valid and non-empty. Returning true.");
  return true;
}

bool? isHtmlDataValid(String? htmlContent) {
  // Check if the content is null or empty
  if (htmlContent == null || htmlContent.isEmpty) {
    return false;
  }

  // Check if the content only contains whitespace characters
  if (htmlContent.trim().isEmpty) {
    return false;
  }

  return true; // Content is valid
}

bool checkListOfDynamic(List<dynamic>? dataList) {
  // Check if the list is null or empty
  if (dataList == null || dataList.isEmpty) {
    return false;
  }

  // Iterate through each item in the list (which should be a Map)
  for (var item in dataList) {
    // Check if the item is null or not a valid Map
    if (item == null || item is! Map<String, dynamic>) {
      return false;
    }

    // Track whether any valid field (other than _id) is found
    bool hasValidField = false;

    // Check each key-value pair in the object (item)
    for (var key in item.keys) {
      var value = item[key];

      // Skip validation for _id field
      if (key == "_id") {
        continue;
      }

      // If the value is non-null and non-empty (excluding _id), set hasValidField to true
      if (value != null && value is String && value.trim().isNotEmpty) {
        hasValidField = true;
        break; // We found a valid field, no need to check further
      }
    }

    // If no valid field (other than _id) was found, return false
    if (!hasValidField) {
      return false;
    }
  }

  // If at least one valid field (other than _id) was found, return true
  return true;
}

List<String> rankTypeList(
  List<String>? rank,
  List<int>? rankCount,
) {
/*  List<String>? rankTypeList = [];
  if (rank != null && rankCount != null && rank.length == rankCount.length) {
    for (int i = 0; i < rank.length; i++) {
      int number = int.tryParse(rank[i]) ?? 0;

      // Create a string containing the number of dollar signs corresponding to the parsed integer
      String result = '\★' * number;

      String pair = '${result} (${rankCount[i]})';
      rankTypeList.add(pair);
    }
  }
  print(rankTypeList);
  return rankTypeList;*/

  List<String> resultList = [];

  if (rank != null && rankCount != null && rank.length == rankCount.length) {
    for (int i = 0; i < rank.length; i++) {
      int number = int.tryParse(rank[i]) ?? 0;
      number = number.clamp(0, 5); // Cap stars to max 5

      String stars = '★' * number;
      resultList.add('$stars (${rankCount[i]})');
    }
  }

  //print(resultList);
  return resultList;
}

String getTimeFromDateNTime(DateTime date) {
  // final timeString = date.toLocal().toString().split(' ')[1].substring(0, 5);
  // return timeString;

  int hour = date.hour;
  int minute = date.minute;

  // Determine AM or PM
  String period = hour >= 12 ? "PM" : "AM";

  // Convert hour to 12-hour format
  hour = hour % 12;
  hour = hour == 0 ? 12 : hour; // Handle midnight case

  // Format minutes with leading zero if necessary
  String minuteStr = minute < 10 ? "0$minute" : "$minute";
  String hourStr = hour < 10 ? "0$hour" : "$hour";

  // Return formatted time
  return "$hourStr:$minuteStr $period";
}

List<String>? findExactMatch(
  List<String>? list,
  List<String>? input,
) {
  //print('In extract function');
  //print('List: $list');
  // print('Input: $input');

  // If the list or input is null or empty, return null
  if (list == null || input == null || list.isEmpty || input.isEmpty) {
    return null;
  }

  // Initialize a result list to store the matching items
  List<String> result = [];

  // Iterate through each item in the input list
  for (var inputItem in input) {
    if (inputItem == null) continue;

    // Extract the name up to the parenthesis
    int parenIndex = inputItem.indexOf('(');
    String inputBaseName = parenIndex != -1
        ? inputItem.substring(0, parenIndex).trim()
        : inputItem;

    //print('Input Base Namehh: $inputBaseName');

    // Check if there's a matching base name in the provided list
    for (var listItem in list) {
      if (listItem == null) continue;

      // Extract the name up to the parenthesis
      int parenIndexx = listItem.indexOf('(');
      String listBaseName = parenIndexx != -1
          ? listItem.substring(0, parenIndexx).trim()
          : listItem;

      // print('List Base Name: $listBaseName');

      // If the base names match, add the original list item to the result
      if (inputBaseName == listBaseName) {
        result.add(listItem);
      }
    }
  }

  // print('Result: $result');

  // Return null if no matches were found, otherwise return the result
  return result.isEmpty ? null : result;
}

DateTime getDayAftertomorrow() {
  return DateTime.now().add(const Duration(days: 2));
}

List<String>? combineAndReturnUnique(
  List<String>? list1,
  List<String>? list2,
) {
  // If both lists are null or empty, return null
  if ((list1 == null || list1.isEmpty) && (list2 == null || list2.isEmpty)) {
    return null;
  }

  // Create a list to store the combined strings
  List<String> combined = [];

  // Add non-null, non-empty list1 if available
  if (list1 != null && list1.isNotEmpty) {
    combined.addAll(list1); // Use addAll to add the elements of list1
  }

  // Add non-null, non-empty list2 if available
  if (list2 != null && list2.isNotEmpty) {
    combined.addAll(list2); // Use addAll to add the elements of list2
  }

  // Remove duplicates using a Set
  combined = combined.toSet().toList();

  // Return the combined list if it's not empty, else return null
  return combined.isEmpty ? null : combined;
}

int? stringToInt(String? input) {
  if (input == null) {
    return 0;
  }

  int? intValue = int.tryParse(input);
  if (intValue != null) {
    return intValue;
  }

  return 0;
}

DateTime? convertStringToDate(String date) {
  if (date.isEmpty) {
    return null; // Return null if the date string is empty
  }
  List<String> dateParts = date.split('/');

  // Convert the parts into integers
  int day = int.parse(dateParts[1]);
  int month = int.parse(dateParts[0]);
  int year = int.parse(dateParts[2]);

  // Return the DateTime object
  return DateTime(year, month, day);
}

String? formatDate(String? date) {
  if (date == null || date.isEmpty) {
    return null;
  }

  try {
    // Parse the input date
    DateTime parsedDate = DateFormat('M/d/yyyy').parse(date);

    // Format the date into the desired output
    String formattedDate = DateFormat('EEEE, MMMM d (yyyy)').format(parsedDate);

    return formattedDate;
  } catch (e) {
    // Handle invalid date format gracefully
    return null;
  }
}

bool stringToBool(String? input) {
  if (input == null) {
    return false;
  }
  if (input.toLowerCase() == 'true') {
    return true;
  } else {
    return false;
  }
}

DateTime getTimeFromString(String input) {
  List<String> timeParts = input.split(":");

  int hour = int.tryParse(timeParts[0]) ?? 0;
  int minute = int.tryParse(timeParts[1]) ?? 0;

  DateTime now = DateTime.now();
  DateTime dateTime = DateTime(now.year, now.month, now.day, hour, minute);
  return dateTime;
}

String dateToString(DateTime? date) {
  if (date == null) {
    return "";
  }

  // Write a function to convert Only Date of DateTime variable into string of MM/DD/YY
  return DateFormat('MM/dd/yyyy').format(date);
}

List<String> getHoursFromStartNEndTimeInSec(
  int startTime,
  int endTime,
  String ampm,
) {
  // Complete the custom function which return list of hours in string, where we get startTime and endTime in seconds, take only hours into consideration
  List<String> hoursList = [];
  List<String> hoursList2 = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11"
  ];

  if (startTime == null || endTime == null) {
    return hoursList2;
  }
  //print("startTime: " + startTime.toString());
  //print("endTime: " + endTime.toString());

  int startHour = startTime ~/ 3600;
  int endHour = endTime ~/ 3600;
  //print("startHour: " + startHour.toString());
  //print("endHour: " + endHour.toString());
  //print("ampm: " + ampm);

  for (int i = startHour; i <= endHour; i++) {
    if (ampm == 'AM' && i < 12) {
      hoursList.add('${i.toString()}');
    } else if (ampm == 'PM' && i >= 12) {
      int h = i - 12;
      hoursList.add('${h.toString()}');
    }
  }
  //print("hoursList: " + hoursList.toString());
  return hoursList;
}

DateTime getTimeFromTimePickerComp(
  int hourInt,
  int minInt,
  String ampm,
) {
  // Create a DateTime object using the current date and provided time
  DateTime now = DateTime.now();
  if (ampm == 'PM') hourInt = hourInt + 12;
  DateTime resultDateTime =
      DateTime(now.year, now.month, now.day, hourInt, minInt);
  // print("now: hourInt : " +
  //     hourInt.toString() +
  //     " hourMinInt: " +
  //     minInt.toString() +
  //     "ampm : " +
  //     ampm);
  return resultDateTime;
}

List<MarkerInfoStruct>? mapLoadInformationForRentalFun(
    List<dynamic>? jsonData) {
  List<MarkerInfoStruct> markerInfoList = [];
  // print("No kkkkkkkkkk");
  //print(jsonData);
  if (jsonData != null) {
    for (var data in jsonData) {
      var geometry = data['geometry'];
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
          String price = data['price'] ?? '';

          MarkerInfoStruct markerInfo = MarkerInfoStruct(
            name: name,
            point: point,
            address: address,
            price: price,
          );

          //  print("markerInfo: ${markerInfo ?? 'null'}");
          markerInfoList.add(markerInfo);
        }
      }
    }
  }

  if (markerInfoList.isNotEmpty) {
    // print("Extracted Marker Information:");
    markerInfoList.forEach((info) {
      //  print("Name: ${info.name}, Latitude: ${info.point}");
    });
  } else {
    //  print("No marker information extracted.");
  }

  return markerInfoList;
}

String getHourFromDateTime(DateTime input) {
  //  custom function to fetch only hour from dateTime object and while returning return in string
  return DateFormat('H').format(input);
}

String getMinutesFromDateTime(DateTime input) {
  // Complete custom function which return only Minutes from dateTime object and while returning return in string fromat
  int minutes = input.minute;
  return minutes.toString();
}

String getAMOrPM(String hr) {
  int i = int.parse(hr);
  //print("ampm i" + i.toString());
  if (i < 12)
    return 'AM';
  else
    return 'PM';
}

int getTimeinSecs(DateTime input) {
  // Consider only hours and minutes and return the time in seconds
  int hours = input.hour;
  int minutes = input.minute;
  return (hours * 3600) + (minutes * 60);
}

String? getJsonFromExtJs(String? input) {
  if (input == null) {
    return null;
  }
  RegExp regExp = RegExp(r"var myData = ({[\s\S]*?});", multiLine: true);

  Match? match = regExp.firstMatch(input);

  if (match != null) {
    String myDataString = match.group(1)!;
    try {
      var jsonObject = jsonDecode(myDataString);
      String decodedString = utf8.decode(base64Decode(jsonObject['obj']));
      myDataString = decodedString;
      print("decodedString: " + decodedString);
    } catch (e) {
      print(e);
    }
    print("myDataString: " + myDataString);
    return myDataString;
  } else {
    return null;
  }
}

List<String>? getAMFromList(List<String>? entireList) {
  //print(entireList);
  List<String>? amList = [];

  if (entireList != null) {
    for (String currentTime in entireList.sublist(1)) {
      List<String> parts = currentTime.split(' ');
      String ampm = parts[1].trim();
      if (ampm == 'AM') {
        amList.add(currentTime);
      }
    }
  }
  //print("amList: ${amList ?? 'null'}");
  return amList;
}

List<String>? getPMFormList(List<String>? entireList) {
  //print(entireList);
  List<String>? amList = [];

  if (entireList != null) {
    for (String currentTime in entireList.sublist(1)) {
      List<String> parts = currentTime.split(' ');
      String ampm = parts[1].trim();
      if (ampm == 'PM') {
        amList.add(currentTime);
      }
    }
  }
  //print("amList: ${amList ?? 'null'}");
  return amList;
}

DateTime getTimeFromStringWithAMPM(String? date) {
  // Write a function which accetps string as input and return  DateTime object as output, the string given is of format '05:30 PM'.
  if (date == null) {
    return DateTime.now();
  }

  final DateFormat format = DateFormat('hh:mm a');
  return format.parse(date);
}

String convertTimeIntoSecondInString(DateTime? time) {
  // Complete the function, which should only consider Hours and mins from input obj of type DateTime and convert into seconds like 5 pm is '61200'.
  if (time == null) {
    return '';
  }

  int seconds = time.hour * 3600 + time.minute * 60;
  return seconds.toString();
}

List<PlaceTypeSelectedListStruct>? convertIntoLables(
  List<String> labels,
  List<String> options,
) {
  // complete the code such that there lables and options are correctly mapped together in the return type
  if (labels.length != options.length) {
    return null;
  }

  List<PlaceTypeSelectedListStruct> result = [];
  for (int i = 0; i < labels.length; i++) {
    result.add(PlaceTypeSelectedListStruct(
      id: labels[i],
      name: options[i],
    ));
  }

  return result;
}

String? getTimeWithAMPMFromSecondsString(String? input) {
  // Complete the function which accepts string as input which has number of seconds like '57600' and return '04:00 PM' as string
  if (input == null) {
    return null;
  }

  int seconds = int.tryParse(input) ?? 0;
  int hours = (seconds ~/ 3600) % 24;
  int minutes = (seconds ~/ 60) % 60;

  String period = hours < 12 ? 'AM' : 'PM';
  if (hours == 0) {
    hours = 12;
  } else if (hours > 12) {
    hours -= 12;
  }

  String formattedTime =
      DateFormat('hh:mm').format(DateTime(0, 1, 1, hours, minutes));
  return '$formattedTime $period';
}

List<int>? getDisabledDays(List<NameIdSearchableStruct>? input) {
  // Complete the function, which accepts list of NameIdSearchableStruct, which has id and name as String variables.  I want to return a list of integer which is stored in name variable only if the id has value of 'days'
  if (input == null) {
    return null;
  }

  List<int> disabledDays = [];
  for (var item in input) {
    if (item.id == 'days') {
      try {
        if (int.parse(item.name) < 7) {
          disabledDays.add(int.parse(item.name));
        }
      } catch (e) {
        // Handle parsing error if needed
      }
    }
  }

  return disabledDays;
}

List<String>? getFiltersForCalendars() {
  // Complete the function which returns array of date in String format of MM:dd:yyyy, array should have 2 values first should be startDate of current month, second values should be endDate of currentMonth
  final now = DateTime.now();
  final startDate = DateTime(now.year, now.month, 1);
  final endDate = DateTime(now.year, now.month + 1, 0);

  final formatter = DateFormat('MM/dd/yyyy');
  final startDateString = formatter.format(startDate);
  final endDateString = formatter.format(endDate);

  return [startDateString, endDateString];
}

List<NameIdSearchableStruct>? mapDisabledDays(dynamic apiResponse) {
  List<NameIdSearchableStruct> nameIdList = [];

  // Loop through the "details" array in the API response
  for (var item in apiResponse['details']) {
    nameIdList.add(NameIdSearchableStruct(
      name: item['value'], // 'tp' field from the API response
      id: item['tp'], // '_id' field from the API response
    ));
  }

  return nameIdList;
}

String? entertainerSuggestionCursorInput(
  String query,
  String distanceSelection,
  double latitude,
  double longitude,
  String? filterValue,
) {
  // Ensure the distance is parsed correctly or set to default if null
  // print("Distance Selection: $distanceSelection");
//  print("Query: $query");
//  print("Filter Value: $filterValue");

  const String unit = 'Mile';
  int distance =
      int.tryParse(distanceSelection) ?? 25; // Default to 25 miles if invalid

  final Map<String, dynamic> jsonData = {
    'key': 'entertainmentTabContent',
    'params': {
      '_uiintState': [
        jsonEncode({
          'entertainmentGrid__entertainmentSideFilterPanel': {
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
            'clientId': 'entertainmentGrid__entertainmentSideFilterPanel',
          },
          'entertainmentTabContent__entertainmentTopFilterPanel': {
            'query': query,
            'clientId': 'entertainmentTabContent__entertainmentTopFilterPanel',
          },
        }),
      ],
    },
    'component': {
      'clientId': 'entertainmentTabContent__entertainmentTopFilterPanel',
      'clientState': {
        'clientId': 'entertainmentTabContent__entertainmentTopFilterPanel',
        'filters': filterValue != null
            ? [
                {
                  'attribute': 'entertainservicesectioncategory',
                  'value': filterValue,
                  'serverDataType':
                      'com.cbx.app.constant.service.CLBXEnEntertainSectionType\$CBTVal\$',
                },
              ]
            : [],
        'query': query,
      },
    },
  };

  // Debug prints to inspect the final structure
  // print("Generated JSON Payload: ${jsonEncode(jsonData)}");

  return jsonEncode(jsonData);
}

List<NameIdSearchableStruct>? mapNameIdSearchable(dynamic response) {
  List<NameIdSearchableStruct> nameIdList = [];

  // Loop through the "details" array in the API response
  for (var item in response['details']) {
    nameIdList.add(NameIdSearchableStruct(
      name: item['name'], // 'tp' field from the API response
      id: item['_id'], // '_id' field from the API response
    ));
  }

  return nameIdList;
}

VenueEditParamsTemplateStruct extractRecordKeyNTabFromURL(String? input) {
  if (input == null || input.isEmpty) {
    return VenueEditParamsTemplateStruct(
        resourceItemId: '', recordKey: '', type: '', firstTab: '');
  }

  final uri = Uri.parse(input);
  final resourceItemId = uri.queryParameters['resourceItemId'] ??
      uri.queryParameters['variationKey'] ??
      '';
  final recordKey = uri.queryParameters['recordKey'] ?? '';
  final type = uri.queryParameters['type'] ?? uri.queryParameters['item'] ?? '';
  final firstTab = uri.queryParameters['firstTab'] ??
      uri.queryParameters['tabName'] ??
      uri.queryParameters['quantity'] ??
      '';

  return VenueEditParamsTemplateStruct(
      resourceItemId: resourceItemId,
      recordKey: recordKey,
      type: type,
      firstTab: firstTab);
}

String intToString(int? input) {
  // Complete a function which converts integer to \string
  return input?.toString() ?? '';
}

List<NameIdSearchableStruct> mapParams(dynamic response) {
  List<NameIdSearchableStruct> nameIdList = [];

  // Loop through the "params" array in the API response
  for (var item in response['params']) {
    nameIdList.add(NameIdSearchableStruct(
      name: item['value'],
      id: item['name'],
    ));
  }

  return nameIdList;
}

String? viewByConverter2(String? input) {
  // print(input);
  // write function like from input string if contines  reired string return tht specific Stringg
  if (input == null) return 'Relevance';

  if (input.contains('relevance')) {
    return 'Relevance';
  }
  if (input.contains('ranking')) {
    return 'Ranking';
  }
  if (input.contains('priceyfactor')) {
    return 'Price';
  }
  if (input.contains('venuetype')) {
    return 'VenueType';
  }
  if (input.contains('geometry')) {
    return 'Distance';
  }
  return 'relevance';
}

NameIdSearchableStruct extractPathNRecordKey(String? input) {
  if (input == null || input.isEmpty) {
    return NameIdSearchableStruct(id: '', name: '');
  }
  final RegExp regExp = RegExp(r'/ui/([^?]+)\?recordKey=(\d+)');
  final match = regExp.firstMatch(input);

  if (match != null) {
    final wordAfterUI = match.group(1); // This will capture 'viewVenueDetail'
    final recordKey = match.group(2); // This will capture '2424'
    return NameIdSearchableStruct(id: wordAfterUI, name: recordKey);
  } else {
    return NameIdSearchableStruct(id: '', name: '');
  }
}

List<dynamic> getSortingAttributes(
  String? dynamicAttribute,
  String? dynamicSortOrder,
) {
  List<Map<String, String>> sortingList = [];

  if (dynamicAttribute != null && dynamicSortOrder != null) {
    sortingList
        .add({"attribute": dynamicAttribute, "sortOrder": dynamicSortOrder});
  }

  // Check if "relevance" attribute already exists in the list
  //bool containsRelevance = sortingList.any((item) => item['attribute'] == 'relevance');

  // If "relevance" is not in the list, add "geometry" attribute with "ASC" sort order
  //if (!containsRelevance) {
  //   sortingList.add({"attribute": "geometry", "sortOrder": "ASC"});
  //}

  if (!sortingList.any((item) => item["attribute"] == "geometry")) {
    sortingList.add({"attribute": "geometry", "sortOrder": "desc"});
  }

  //print(sortingList);

  return sortingList.toSet().toList();
}

List<NameIdSearchableStruct> mapParamsForAddons(dynamic response) {
  List<NameIdSearchableStruct> nameIdList = [];

  if (response == null || response.isEmpty) {
    return nameIdList;
  }
  try {
    // Access the actions array from the response
    var actions = response['todo']['act'];

    // Iterate over the actions to find the 'setTabParams' action
    for (var action in actions) {
      if (action['action'] == 'setTabParams') {
        // Extract the params field if action is 'setTabParams'
        var params = action['params'];

        for (var item in params) {
          nameIdList.add(NameIdSearchableStruct(
            name: item['value'],
            id: item['name'],
          ));
        }
        return params;
      }
    }

    return nameIdList;
  } catch (e) {
    return nameIdList;
  }
}

List<String> replaceEmptyWithAll(List<String>? inputList) {
  if (inputList == null || inputList.isEmpty) {
    return []; // Return an empty list if the input is null or empty
  }
  return inputList.map((str) => str.isEmpty ? 'All' : str).toList();
}

String? rentalFilterInputFunction(
  String? distnceSelection,
  List<String>? priceyfactor,
  List<String>? ranking,
  List<String>? agerange,
  List<String>? town,
  List<String>? rentalsectioncategory,
  List<String>? themes,
  String? rentalsectionmaincategory,
  double? latitude,
  double? longitude,
) {
// Constructing the debug string
  String debugInfo = "distnceSelection: $distnceSelection, " +
      "priceyfactor: ${priceyfactor?.toString() ?? 'null'}, " +
      "ranking: ${ranking?.toString() ?? 'null'}, " +
      "agerange: ${agerange?.toString() ?? 'null'}, " +
      "town: ${town?.toString() ?? 'null'}, " +
      "rentalsectioncategory: ${rentalsectioncategory?.toString() ?? 'null'}, " +
      "themes: ${themes?.toString() ?? 'null'}, " +
      "rentalsectionmaincategory: $rentalsectionmaincategory, " +
      "latitude: $latitude, " +
      "longitude: $longitude";

  print(debugInfo);

  final defaultLocation = [longitude, latitude]; // Default location
  final defaultDistance = int.parse(distnceSelection ?? '25');
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
  if (rentalsectionmaincategory != null &&
      rentalsectionmaincategory.isNotEmpty &&
      rentalsectionmaincategory.toLowerCase() != 'text not found') {
    filters.add({
      'attribute': 'rentalsectionmaincategory',
      'value': rentalsectionmaincategory,
      'serverDataType':
          'com.cbx.app.constant.rental.CLBXEnRentalSectionType\$CBTVal\$',
    });
  }
  // Adding other filters based on the provided parameters

  if (priceyfactor != null &&
      priceyfactor.isNotEmpty &&
      !priceyfactor.every((type) => type.trim().isEmpty)) {
    List<String> priceyfactorValues = [];

    for (var type in priceyfactor) {
      priceyfactorValues.add(type);
    }
    filters.add({'attribute': 'priceyfactor', 'value': priceyfactorValues});
  }

  if (ranking != null &&
      ranking.isNotEmpty &&
      !ranking.every((type) => type.trim().isEmpty)) {
    List<String> rankingValues = [];

    for (var type in ranking) {
      rankingValues.add(type);
    }
    filters.add({'attribute': 'ranking', 'value': rankingValues});
  }

  if (town != null &&
      town.isNotEmpty &&
      !town.every((type) => type.trim().isEmpty)) {
    List<String> townValues = [];

    for (var type in town) {
      townValues.add(type);
    }
    filters.add({'attribute': 'town', 'value': townValues});
  }

  if (themes != null &&
      themes.isNotEmpty &&
      !themes.every((type) => type.trim().isEmpty)) {
    List<String> themesValues = [];

    for (var type in themes) {
      themesValues.add(type);
    }
    filters.add({'attribute': 'themes', 'value': themesValues});
  }

  if (rentalsectioncategory != null &&
      rentalsectioncategory.isNotEmpty &&
      !rentalsectioncategory.every((type) => type.trim().isEmpty)) {
    List<String> rentalsectioncategoryValues = [];

    for (var type in rentalsectioncategory) {
      rentalsectioncategoryValues.add(type);
    }
    filters.add({
      'attribute': 'rentalsectioncategory',
      'value': rentalsectioncategoryValues
    });
  }

  if (agerange != null &&
      agerange.isNotEmpty &&
      !agerange.every((type) => type.trim().isEmpty)) {
    List<String> agerangeValues = [];

    for (var type in agerange) {
      agerangeValues.add(type);
    }
    filters.add({'attribute': 'agerange', 'value': agerangeValues});
  }

  print(jsonEncode(filters));

  return jsonEncode(filters);
}

String? rentalSuggestionCursorInput(
  String query,
  String distanceSelection,
  double latitude,
  double longitude,
  String? filterValue,
) {
  // Ensure the distance is parsed correctly or set to default if null
  // print("Distance Selection: $distanceSelection");
//  print("Query: $query");
//  print("Filter Value: $filterValue");

  const String unit = 'Mile';
  int distance =
      int.tryParse(distanceSelection) ?? 25; // Default to 25 miles if invalid

  final Map<String, dynamic> jsonData = {
    'key': 'rentalTabContent',
    'params': {
      '_uiintState': [
        jsonEncode({
          'rentalGrid__rentalSideFilterPanel': {
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
            'clientId': 'rentalGrid__rentalSideFilterPanel',
          },
          'rentalTabContent__rentalTopFilterPanel': {
            'query': query,
            'clientId': 'rentalTabContent__rentalTopFilterPanel',
          },
        }),
      ],
    },
    'component': {
      'clientId': 'rentalTabContent__rentalTopFilterPanel',
      'clientState': {
        'clientId': 'rentalTabContent__rentalTopFilterPanel',
        'filters': filterValue != null
            ? [
                {
                  'attribute': 'rentalsectionmaincategory',
                  'value': filterValue,
                  'serverDataType':
                      'com.cbx.app.constant.rental.CLBXEnRentalSectionType\$CBTVal\$',
                },
              ]
            : [],
        'query': query,
      },
    },
  };

  // Debug prints to inspect the final structure
  // print("Generated JSON Payload: ${jsonEncode(jsonData)}");

  return jsonEncode(jsonData);
}

VenueEditParamsTemplateStruct mapParamsForAddonsInTemplate(dynamic response) {
  var template = VenueEditParamsTemplateStruct(
      firstTab: '', recordKey: '', resourceItemId: '', type: '');
  if (response == null || response.isEmpty) {
    return template;
  }
  try {
    // Access the actions array from the response
    var actions = response['todo']['act'];

    // Iterate over the actions to find the 'setTabParams' action
    for (var action in actions) {
      if (action['action'] == 'setTabParams') {
        // Extract the params field if action is 'setTabParams'
        var params = action['params'];

        for (var item in params) {
          if (item['name'] == 'resourceItemType')
            template.resourceItemId = item['value'];
          else if (item['name'] == 'parentRecordKey')
            template.recordKey = item['value'];
          else if (item['name'] == 'item')
            template.firstTab = item['value'];
          else if (item['name'] == 'type') template.type = item['value'];
        }
        return template;
      }
    }

    return template;
  } catch (e) {
    return template;
  }
}

String stringListToString(
  List<String> input,
  dynamic json,
) {
  List<String> keys = [];

  // Check if the json contains the 'details' key and it's a list
  if (json != null && json['details'] is List) {
    for (var item in json['details']) {
      // Check if the 'text' is in the provided list of texts
      if (input.contains(item['text'])) {
        keys.add(item['key']);
      }
    }
  }

  // Join the keys into a single string separated by ";"
  return keys.join(';');
}

List<String> initialCheckBoxes(
  dynamic response,
  List<String> addons,
) {
  List<String> filteredTexts = [];
  if (response != null && response['details'] is List) {
    for (var item in response['details']) {
      // Check if the 'text' is in the provided list of texts
      print(addons);
      if (addons.contains(item['key'])) {
        filteredTexts.add(item['text']);
      }
    }
  }
  print(filteredTexts);
  return filteredTexts;
}

List<ContactStruct> mapCheckboxes(
  dynamic data,
  List<String> initalCheckboxes,
) {
  List<ContactStruct> nameIdList = [];

  for (var item in data['details']) {
    var boolea = false;
    if (initalCheckboxes.contains(item['key'])) {
      boolea = true;
      ;
    }
    nameIdList.add(ContactStruct(
        displayName: item['text'], firstName: item['key'], selection: boolea));
  }
  return nameIdList;
}

String getSelectedCheckboxes(List<ContactStruct> list) {
  var ret = '';
  for (var i in list) {
    if (i.selection) {
      if (ret.isEmpty) {
        ret = i.firstName;
      } else {
        ret = ret + ';' + i.firstName;
      }
    }
  }
  return ret;
}

VenueEditParamsTemplateStruct extractParamsFromCustomCake(String? input) {
  if (input == null || input.isEmpty) {
    return VenueEditParamsTemplateStruct(
        resourceItemId: '', recordKey: '', type: '', firstTab: '');
  }

  final uri = Uri.parse(input);
  final resourceItemId = uri.queryParameters['bakeryId'] ??
      uri.queryParameters['variationKey'] ??
      '';
  final recordKey = uri.queryParameters['index'] ?? '';
  final type = uri.queryParameters['type'] ?? uri.queryParameters['item'] ?? '';
  final firstTab = uri.queryParameters['firstTab'] ??
      uri.queryParameters['tabName'] ??
      uri.queryParameters['quantity'] ??
      '';

  return VenueEditParamsTemplateStruct(
      resourceItemId: resourceItemId,
      recordKey: recordKey,
      type: type,
      firstTab: firstTab);
}

List<ContactStruct> mapCheckboxes2(
  dynamic data,
  List<String> intialCheckboxes,
) {
  List<ContactStruct> nameIdList = [];

  var details = data['details'];
  for (var detail in details) {
    var checkboxData = detail['cakeWrapperTableTemplate-_-checkBoxData'];
    for (var item in checkboxData) {
      bool boolea = false;
      if (intialCheckboxes.contains(item['id'].toString())) {
        boolea = true;
      }
      print('item: $item');
      print('item["name"] runtimeType: ${item["name"]?.runtimeType}');

      nameIdList.add(ContactStruct(
        displayName: item['name'].toString(),
        firstName: item['id'].toString(),
        selection: boolea,
      ));
    }
  }
  return nameIdList;
}

List<String> prioritizeSelected(
  List<String>? selectedList,
  List<String>? allList,
) {
  if ((selectedList == null || selectedList.isEmpty) &&
      (allList == null || allList.isEmpty)) {
    return [];
  }

  final selected = selectedList ?? [];
  final all = allList ?? [];

  final selectedSet = selected.toSet();
  final unselected = all.where((item) => !selectedSet.contains(item)).toList();

  return [...selected, ...unselected];
}

List<DocumentReference> generateListOfUsers(
  DocumentReference arg1,
  DocumentReference arg2,
) {
  return [arg1, arg2];
}

List<String> generateListOfNames(
  String arg1,
  String arg2,
) {
  return [arg1, arg2];
}

bool getIsAppDownloaded(List<dynamic> params) {
  for (final param in params) {
    if (param['name'] == 'isAppDownloaded') {
      return param['value'] == 'true';
    }
    if (param['name'] == 'url' && param['value'] is String) {
      final uri = Uri.tryParse(param['value']);
      if (uri != null && uri.queryParameters.containsKey('isAppDownloaded')) {
        return uri.queryParameters['isAppDownloaded'] == 'true';
      }
    }
  }
  // Default fallback
  return false;
}

AllResourceTypeStruct getAllResourceType(List<dynamic> params) {
  var ret = AllResourceTypeStruct(
      isVenue: false,
      isRental: false,
      isEntertainer: false,
      isCake: false,
      isFood: false);
  for (final param in params) {
    final name = param['name'];
    final value = param['value'];

    if (name == 'isVenue' && value == 'true') {
      ret.isVenue = true;
    }
    if (name == 'isRental' && value == 'true') {
      ret.isRental = true;
    }
    if (name == 'isEntertainer' && value == 'true') {
      ret.isEntertainer = true;
    }
    if (name == 'isCake' && value == 'true') {
      ret.isCake = true;
    }
    if (name == 'isFood' && value == 'true') {
      ret.isFood = true;
    }
    if (name == 'resourceId') {
      final parsedId = int.tryParse(value);
      if (parsedId != null) {
        ret.resourceId = parsedId;
      }
    }
  }
  return ret;
}

ChatRecord? matchExactForFireBase(
  List<ChatRecord> list,
  DocumentReference ref1,
  DocumentReference ref2,
) {
  final targetSet = {ref1.path, ref2.path};

  for (final chat in list) {
    final userRefs = chat.userIds;

    if (userRefs == null || userRefs.length != 2) continue;

    final userRefPaths = userRefs.map((ref) => ref.path).toSet();

    if (userRefPaths.length == 2 && userRefPaths.containsAll(targetSet)) {
      return chat;
    }
  }
  return null;
}

String dateStringFormat(String dateTimeStr) {
  try {
    // Parse the original date-time string to DateTime
    final inputFormat = DateFormat('MM/dd/yyyy hh.mm a');
    final dateTime = inputFormat.parse(dateTimeStr);

    // Format to just the date
    final outputFormat = DateFormat('MM/dd/yyyy');
    return outputFormat.format(dateTime);
  } catch (e) {
    return '';
  }
}

String vendorRequestInputFilter(
  String? submissionDate,
  String? status,
  String? name,
  String? email,
  String? inquirySubmissionDate,
  String? inquiryStatus,
) {
  if (status != null &&
      name != null &&
      submissionDate != null &&
      inquirySubmissionDate != null &&
      inquiryStatus != null &&
      email != null) {
    return '';
  }

  List<Map<String, dynamic>> filters = [];
  if (status != null && status.isNotEmpty && status.toLowerCase() != '') {
    filters.add({
      'attribute': 'shoppingCartStatus',
      'value': status,
      'serverDataType':
          'com.cbx.app.constant.transaction.CLBXEnShoppingCartStatus\$CBTVal\$',
    });
  }
  if (name != null && name.isNotEmpty && name.toLowerCase() != '') {
    filters.add({
      'attribute': 'consumerName',
      'value': name,
    });
  }
  if (email != null && email.isNotEmpty && email.toLowerCase() != '') {
    filters.add({
      'attribute': 'email',
      'value': email,
    });
  }
  if (submissionDate != null &&
      submissionDate.isNotEmpty &&
      submissionDate.toLowerCase() != '') {
    filters.add({
      'attribute': 'shoppingCartSubmissionDate',
      'value': submissionDate,
    });
  }
  if (inquirySubmissionDate != null &&
      inquirySubmissionDate.isNotEmpty &&
      inquirySubmissionDate.toLowerCase() != '') {
    filters.add({
      'attribute': 'submissionDate',
      'value': inquirySubmissionDate,
    });
  }
  if (inquiryStatus != null &&
      inquiryStatus.isNotEmpty &&
      inquiryStatus.toLowerCase() != '') {
    filters.add({
      'attribute': 'shoppingCartStatus',
      'value': inquiryStatus,
      'serverDataType':
          'com.cbx.app.constant.transaction.CLBXEnProspectInquiryStatus\$CBTVal\$',
    });
  }
  return jsonEncode(filters);
}

List<ContactStruct> mapRequestsCheckbox(dynamic data) {
  List<ContactStruct> nameIdList = [];
  var details = data['details'];
  for (var detail in details) {
    nameIdList.add(ContactStruct(
      displayName: detail['itemName'].toString(),
      firstName: detail['status'].toString(),
      lastName: detail['itemType'].toString(),
      middleName: detail['_id'].toString(),
      address: AddressStruct(
        address: detail['request-_-Quantity'].toString(),
        street: detail['request-_-unitPrice'].toString(),
        state: detail['request-_-totalPrice'].toString(),
        city: detail['request-_-timeFrame'].toString(),
        country: detail['request-_-date'].toString(),
      ),
      selection: false,
    ));
  }
  return nameIdList;
}

String getSelectedForRequests(List<ContactStruct> list) {
  var ret = 'List(';
  for (var i in list) {
    if (i.selection) {
      if (ret == 'List(') {
        ret = ret + i.middleName;
      } else {
        ret = ret + ', ' + i.middleName;
      }
    }
  }
  ret = ret + ')';
  return ret;
}

List<NameIdSearchableStruct> mapEnums(dynamic input) {
  List<NameIdSearchableStruct> nameIdList = [];

  // Loop through the "details" array in the API response
  for (var item in input['details']) {
    nameIdList.add(NameIdSearchableStruct(
      name: item['text'], // 'tp' field from the API response
      id: item['_id'], // '_id' field from the API response
    ));
  }

  return nameIdList;
}

String truncateWithEllipsis(String input) {
  if (input.length > 100) {
    return input.substring(0, 97) + '...';
  }
  return input;
}

String jsonToString(dynamic input) {
  final value = input;
  if (value is String && value.length > 100) {
    return value.substring(0, 97) + '...';
  } else if (value is String) {
    return value; // Already short, return as-is
  } else {
    return '';
  }
}

DateTime convertSecondsToTime(int seconds) {
  final now = DateTime.now();
  final todayAtMidnight = DateTime(now.year, now.month, now.day);
  return todayAtMidnight.add(Duration(seconds: seconds));
}

String? extractStringFromUrl(
  String? url,
  String? input,
) {
  if (url == null || url.isEmpty || input == null || input.isEmpty) {
    return null;
  }
  final uri = Uri.parse(url);
  final ans = uri.queryParameters[input];
  return ans;
}

List<String> emptyList() {
  List<String> result = [];
  return result;
}

NameIdSearchableStruct truncateHtmlPreservingTags(
  String inputHtml,
  int maxChars,
) {
  // int maxChars = 100;
  final tagPattern = RegExp(r'<[^>]+>');
  final tagStack = <String>[];
  final buffer = StringBuffer();

  int visibleCharCount = 0;
  int currentIndex = 0;

  while (currentIndex < inputHtml.length && visibleCharCount < maxChars) {
    final tagMatch = tagPattern.matchAsPrefix(inputHtml, currentIndex);

    if (tagMatch != null) {
      final tag = tagMatch.group(0)!;
      buffer.write(tag);

      final isClosing = tag.startsWith('</');
      final isSelfClosing =
          tag.endsWith('/>') || tag.startsWith('<br') || tag.startsWith('<img');

      if (!isClosing && !isSelfClosing) {
        // Extract tag name like <span ...>
        final tagNameMatch = RegExp(r'<(\w+)').firstMatch(tag);
        if (tagNameMatch != null) {
          tagStack.add(tagNameMatch.group(1)!);
        }
      } else if (isClosing) {
        final tagNameMatch = RegExp(r'</(\w+)>').firstMatch(tag);
        if (tagNameMatch != null) {
          final closingTag = tagNameMatch.group(1)!;
          if (tagStack.isNotEmpty && tagStack.last == closingTag) {
            tagStack.removeLast();
          }
        }
      }

      currentIndex = tagMatch.end;
    } else {
      final char = inputHtml[currentIndex];
      buffer.write(char);
      if (!RegExp(r'\s').hasMatch(char)) {
        visibleCharCount++;
      }
      currentIndex++;
    }
  }
  String ind;
  if (visibleCharCount == maxChars) {
    ind = '1';
  } else {
    ind = '2';
  }

  // Close any open tags
  while (tagStack.isNotEmpty) {
    final tag = tagStack.removeLast();
    buffer.write('</$tag>');
  }

  // if (visibleCharCount >= maxChars) {
  //   buffer.write('...');
  // }

  return NameIdSearchableStruct(id: ind, name: buffer.toString());
}

String removePriceLabel(
  String input,
  bool haveDollarSign,
) {
// Check if input contains a colon, indicating a label
  if (input.contains(':')) {
    // Split the input on the first colon
    final parts = input.split(':');
    if (parts.length > 1) {
      // Get the part after the colon and remove dollar signs and trim spaces
      if (haveDollarSign) {
        return parts[1].trim();
      }
      return parts[1].replaceAll('\$', '').trim();
    }
  }

  // If no colon is present, return input as-is
  return input;
}

String convertDescriptionToMarkdown(dynamic html) {
  if (html == null || html.toString().trim().isEmpty) return '';

  // Replace <li> items with - and new line
  String markdown = html
      .toString()
      .replaceAll(RegExp(r'<ul>|</ul>', caseSensitive: false), '')
      .replaceAll(RegExp(r'<li>', caseSensitive: false), '- ')
      .replaceAll(RegExp(r'</li>', caseSensitive: false), '\n')
      .replaceAll(RegExp(r'<[^>]+>'), '') // remove any remaining tags
      .trim();

  return markdown;
}

String? convertDescriptionStringToMarkDown(String? html) {
  if (html == null || html.trim().isEmpty) return '';

  // Replace <li> items with - and new line
  String markdown = html
      .replaceAll(RegExp(r'<ul>|</ul>', caseSensitive: false), '')
      .replaceAll(RegExp(r'<li>', caseSensitive: false), '- ')
      .replaceAll(RegExp(r'</li>', caseSensitive: false), '\n')
      .replaceAll(RegExp(r'<[^>]+>'), '') // remove any remaining tags
      .trim();

  return markdown;
}
