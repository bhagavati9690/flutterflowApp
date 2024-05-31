import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Venues Group Code

class VenuesGroup {
  static String getBaseUrl() => 'http://localhost:9000/data';
  static Map<String, String> headers = {};
  static GetAllVenuesCall getAllVenuesCall = GetAllVenuesCall();
  static GetAllVenuesMapCall getAllVenuesMapCall = GetAllVenuesMapCall();
  static GetPartyPlaceTypeCall getPartyPlaceTypeCall = GetPartyPlaceTypeCall();
  static VenueDetailsCall venueDetailsCall = VenueDetailsCall();
  static VenuePhotoCall venuePhotoCall = VenuePhotoCall();
  static VenueSuggestionCall venueSuggestionCall = VenueSuggestionCall();
  static VenuePackageCall venuePackageCall = VenuePackageCall();
}

class GetAllVenuesCall {
  Future<ApiCallResponse> call({
    String? sortOrderType = 'relevance',
    String? sortOrder = 'desc',
    int? pageNumber = 1,
    int? limit = 20,
    int? startIndex = 0,
    String? filters =
        '[{\"attribute\":\"geometry\",\"filterType\":\"geoDistance\",\"value\":{\"location\":[-71.0712,42.2904],\"distance\":25,\"unit\":\"Mile\"}}]',
    String? searchText = '*',
  }) async {
    final baseUrl = VenuesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllVenues',
      apiUrl:
          '$baseUrl/venueGridCursor?columns=name,priceyFactor,address,overallRank,description,venueType,venueMoreFields.price,venueMoreFields.activityType,venueMoreFields.sportsType,logo&_dc=1714751638558&filters=$filters&facets=%5B%7B%22attribute%22%3A%22venuetype%22%7D%2C%7B%22attribute%22%3A%22activitytype%22%7D%2C%7B%22attribute%22%3A%22sportstype%22%7D%2C%7B%22attribute%22%3A%22priceyfactor%22%7D%2C%7B%22attribute%22%3A%22ranking%22%7D%2C%7B%22attribute%22%3A%22agerange%22%7D%2C%7B%22attribute%22%3A%22town%22%7D%2C%7B%22attribute%22%3A%22capacity%22%7D%2C%7B%22attribute%22%3A%22demographics%22%7D%2C%7B%22attribute%22%3A%22activitycategory%22%7D%5D&query=$searchText&a%3AclientState=%7B%22clientId%22%3A%22venueGrid__venueSearchResultGrid%22%2C%22cursor%22%3A%7B%7D%2C%22selection%22%3A%5B%5D%2C%22currentPage%22%3A1%2C%22sorters%22%3A%5B%7B%22property%22%3A%22relevance%22%2C%22direction%22%3A%22desc%22%7D%5D%7D&page=$pageNumber&start=$startIndex&limit=$limit&sort=%5B%7B%22attribute%22%3A%22$sortOrderType%22%2C%22sortOrder%22%3A%20%22$sortOrder%22%20%7D%20%5D',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? searchCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? aggregation(dynamic response) => getJsonField(
        response,
        r'''$.aggregations''',
        true,
      ) as List?;
  List<String>? venueTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[6].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? venueTypeCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[6].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? activitytype(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[4].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? activitytypeCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[4].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? agerange(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[1].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? agerangeCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[1].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? town(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[2].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? townCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[2].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? activitycategory(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[3].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? activitycategoryCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[3].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? priceyfactor(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[5].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? priceyfactorCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[5].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? demographics(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[7].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? demographicsCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[7].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? sportstype(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[8].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? sportstypeCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[8].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? ranking(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[9].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? rankingCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[9].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? capacity(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[0].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? capacityCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[0].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetAllVenuesMapCall {
  Future<ApiCallResponse> call({
    String? sortOrderType = 'relevance',
    String? sortOrder = 'desc',
    int? pageNumber = 1,
    int? limit = 20,
    int? startIndex = 0,
    String? filters =
        '[{\"attribute\":\"geometry\",\"filterType\":\"geoDistance\",\"value\":{\"location\":[-71.0712,42.2904],\"distance\":25,\"unit\":\"Mile\"}}]',
    String? searchText = '*',
  }) async {
    final baseUrl = VenuesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllVenuesMap',
      apiUrl:
          '$baseUrl/venueGridCursor?columns=name,address,venueType,venueMoreFields.activityCategory,venueMoreFields.price,venueMoreFields.activityType,venueMoreFields.sportsType,logo,venueMoreFields.geometry&_dc=1716185303329&start=$startIndex&forceSelection=true&filters=$filters&query=$searchText&a%3AclientState=%7B%22clientId%22%3A%22venueMap__venueSearchResultGridForMap%22%2C%22cursor%22%3A%7B%7D%2C%22selection%22%3A%5B%5D%2C%22currentPage%22%3A$pageNumber%2C%22staticFilteredBy%22%3A%5B%7B%22filters%22%3A$filters%7D%5D%2C%22sorters%22%3A%5B%7B%22property%22%3A%22$sortOrderType%22%2C%22direction%22%3A%22$sortOrder%22%7D%5D%7D&page=$pageNumber&limit=$limit&sort=%5B%7B%22attribute%22%3A%22$sortOrderType%22%2C%22sortOrder%22%3A%20%22$sortOrder%22%20%7D%20%5D',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? searchCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class GetPartyPlaceTypeCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VenuesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getPartyPlaceType',
      apiUrl:
          '$baseUrl/uiEnumerationRestriction/CLBXEnPartyPlaceType\$?_dc=1715688515666&query=&uiContext=%7B%22key%22%3A%22venueTabContent%22%2C%22params%22%3A%7B%7D%2C%22component%22%3A%7B%22clientId%22%3A%22venueTabContent__venueTopFilterPanel%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22venueTabContent__venueTopFilterPanel%22%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? names(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? ids(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

class VenueDetailsCall {
  Future<ApiCallResponse> call({
    int? venueId,
  }) async {
    final baseUrl = VenuesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'venueDetails',
      apiUrl:
          '$baseUrl/venueDetailsCursor/rec/$venueId?columns=resource.id,resource.basicPartyInfo.primaryContact.person.communication.phone,resource.basicPartyInfo.primaryContact.person.communication.email,resource.basicPartyInfo.primaryContact.person.fullName,cateringRates,cateringOption.name,resource.hasBookingCal,resource.bookingURL,resource.minBookingTimeframe.text,resource.resourceCosting.cancellationPolicy.text,resource.fullPaymentTimeframe.text,resource.basicPartyInfo.busPartyIdentifier.longDescription,resource.creditCardAccepted,resource.paymentModes,resource.tertiaryAgeRange,resource.secondaryAgeRange,resource.primaryAgeRange,resource.additionalInfo.secondaryPreferredGender.name,resource.additionalInfo.primaryPreferredGender.name,venueType.name,resource.serviceDemographics.name,activityCategories,resource.additionalInfo.maxCapacityForGroup,resourceThemes,availDays,accomodates,sportsTypes,partyPlaceTypes,ageRange,resource.resourceItemPriceRane,activityTypes,resource.basicPartyInfo.busPartyIdentifier.description,resource.basicPartyInfo.address.addressInShort,resource.basicPartyInfo.communication.website,resource.basicPartyInfo.communication.email,resource.basicPartyInfo.communication.phone,getVenueCategory,resource.additionalInfo.overallRank,resource.basicPartyInfo.busPartyIdentifier.name,resource.basicPartyInfo.address.geometry&_dc=1716311060210',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? activityCategories(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].activityCategories''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? categories(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].getVenueCategory''',
      ));
  String? activityType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].activityTypes''',
      ));
  String? accomodates(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].accomodates''',
      ));
  String? availableDay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].availDays''',
      ));
  String? partyPlace(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].partyPlaceTypes''',
      ));
  String? ageRange(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].ageRange''',
      ));
  String? resourceId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-id']''',
      ));
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-addressInShort']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-communication-_-email']''',
      ));
  String? venueType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venueType-_-name']''',
      ));
  String? phoneNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-communication-_-phone']''',
      ));
  String? price(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-resourceItemPriceRane']''',
      ));
  List<double>? coordinates(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-geometry']['coordinates']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-description']''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-serviceDemographics-_-name']''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-name']''',
      ));
  String? forAges(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-primaryAgeRange']''',
      ));
  String? website(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-communication-_-website']''',
      ));
  String? paymentMode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-paymentModes']''',
      ));
  String? cardAccepted(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-creditCardAccepted']''',
      ));
  String? rank(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-additionalInfo-_-overallRank']''',
      ));
  String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-primaryContact-_-person-_-fullName']''',
      ));
  String? longDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
      ));
}

class VenuePhotoCall {
  Future<ApiCallResponse> call({
    dynamic queryJson,
  }) async {
    final baseUrl = VenuesGroup.getBaseUrl();

    final query = _serializeJson(queryJson);

    return ApiManager.instance.makeApiCall(
      callName: 'venuePhoto',
      apiUrl:
          '$baseUrl/resourcePhotosCursor?&_dc=1716664888582&a%3AclientState=$query&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? thumbline(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].thumbnail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenueSuggestionCall {
  Future<ApiCallResponse> call({
    String? searchVenueQuery = 'Boston',
    String? uiContext =
        '{\"key\":\"venueTabContent\",\"params\":{\"_uiintState\":[\"{\\\"venueGrid__venueSideFilterPanel\\\":{\\\"filters\\\":[{\\\"attribute\\\":\\\"geometry\\\",\\\"filterType\\\":\\\"geoDistance\\\",\\\"value\\\":{\\\"location\\\":[-71.0638,42.4597],\\\"distance\\\":25,\\\"unit\\\":\\\"Mile\\\"}}],\\\"clientId\\\":\\\"venueGrid__venueSideFilterPanel\\\"},\\\"venueTabContent__venueTopFilterPanel\\\":{\\\"filters\\\":[{\\\"attribute\\\":\\\"where\\\",\\\"value\\\":\\\"9\\\",\\\"serverDataType\\\":\\\"com.cbx.app.constant.basic.CLBXEnPartyPlaceType\$CBTVal\$\\\"}],\\\"query\\\":\\\"boston\\\",\\\"clientId\\\":\\\"venueTabContent__venueTopFilterPanel\\\"}}\"]},\"component\":{\"clientId\":\"venueTabContent__venueTopFilterPanel\",\"clientState\":{\"clientId\":\"venueTabContent__venueTopFilterPanel\",\"filters\":[{\"attribute\":\"where\",\"value\":\"9\",\"serverDataType\":\"com.cbx.app.constant.basic.CLBXEnPartyPlaceType\$CBTVal\$\"}],\"query\":\"bostom\"}}}',
  }) async {
    final baseUrl = VenuesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'venueSuggestion',
      apiUrl:
          '$baseUrl/uiCursorEnumRestriction/venueSuggestionsCursor?_dc=1716139060245&query=$searchVenueQuery&uiContext=$uiContext',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? key(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].key''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenuePackageCall {
  Future<ApiCallResponse> call({
    dynamic queryJson,
  }) async {
    final baseUrl = VenuesGroup.getBaseUrl();

    final query = _serializeJson(queryJson);

    return ApiManager.instance.makeApiCall(
      callName: 'venuePackage',
      apiUrl:
          '$baseUrl/venuePackageCursor?columns=venue_package.packageRates,venue_package.venuePackageSection.resItemSection.name,venue_package.resourcePackage.resourceItem.name,venue_package.resourcePackage.resourceItem.description,formatedPrice,venue_package.resourceItemDuartionFormatted,venue_package.resourcePackage.defaultInvitee,venue_package.resourcePackage.resourceItem.ageRange,venue_package.resourcePackage.packagePrimaryActivity.activityType.name,imageURL&_dc=1716898640894&a%3AclientState=$query&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? priceWithUnit(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].formatedPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].imageURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? duration(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourceItemDuartionFormatted']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? ctivityType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-packagePrimaryActivity-_-activityType-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-description']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rate(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venue_package-_-packageRates']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resourceSection(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venue_package-_-venuePackageSection-_-resItemSection-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultInvitee(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-defaultInvitee']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? ageRange(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-ageRange']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Venues Group Code

class AllVenuesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'allVenues',
      apiUrl:
          'http://192.168.1.4:9000/data/venueGridCursor?columns=name,priceyFactor,address,overallRank,description,venueType,venueMoreFields.price,venueMoreFields.activityType,venueMoreFields.sportsType,logo&_dc=1711687947734&start=0&forceSelection=true&filters=%5B%7B%22attribute%22%3A%22geometry%22%2C%22filterType%22%3A%22geoDistance%22%2C%22value%22%3A%7B%22location%22%3A%5B-71.0712%2C42.2904%5D%2C%22distance%22%3A25%2C%22unit%22%3A%22Mile%22%7D%7D%5D&facets=%5B%7B%22attribute%22%3A%22venuetype%22%7D%2C%7B%22attribute%22%3A%22activitytype%22%7D%2C%7B%22attribute%22%3A%22sportstype%22%7D%2C%7B%22attribute%22%3A%22priceyfactor%22%7D%2C%7B%22attribute%22%3A%22ranking%22%7D%2C%7B%22attribute%22%3A%22agerange%22%7D%2C%7B%22attribute%22%3A%22town%22%7D%2C%7B%22attribute%22%3A%22capacity%22%7D%2C%7B%22attribute%22%3A%22demographics%22%7D%2C%7B%22attribute%22%3A%22activitycategory%22%7D%5D&a%3AclientState=%7B%22clientId%22%3A%22venueGrid__venueSearchResultGrid%22%2C%22cursor%22%3A%7B%7D%2C%22selection%22%3A%5B%5D%2C%22currentPage%22%3A1%2C%22sorters%22%3A%5B%7B%22property%22%3A%22relevance%22%2C%22direction%22%3A%22desc%22%7D%5D%7D&page=1&limit=20&sort=%5B%7B%22attribute%22%3A%22relevance%22%2C%22sortOrder%22%3A%20%22desc%22%20%7D%20%5D',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVenuesWithQueryCall {
  static Future<ApiCallResponse> call({
    String? columns =
        'name,priceyFactor,address,overallRank,description,venueType,venueMoreFields.price,venueMoreFields.activityType,venueMoreFields.sportsType,logo',
    String? dc = '1713431195048',
    int? start = 0,
    String? forceSelection = 'true',
    String? filters =
        '[{\"attribute\":\"geometry\",\"filterType\":\"geoDistance\",\"value\":{\"location\":[-71.0712,42.2904],\"distance\":25,\"unit\":\"Mile\"}}]',
    String? facts =
        '[{\"attribute\":\"venuetype\"},{\"attribute\":\"activitytype\"},{\"attribute\":\"sportstype\"},{\"attribute\":\"priceyfactor\"},{\"attribute\":\"ranking\"},{\"attribute\":\"agerange\"},{\"attribute\":\"town\"},{\"attribute\":\"capacity\"},{\"attribute\":\"demographics\"},{\"attribute\":\"activitycategory\"}]',
    String? venueQuery = '*',
    String? clientState =
        '{\"clientId\":\"venueGrid__venueSearchResultGrid\",\"cursor\":{},\"selection\":[],\"currentPage\":1,\"sorters\":[{\"property\":\"relevance\",\"direction\":\"desc\"}]}',
    int? page = 1,
    int? limit = 20,
    String? sort = '[{\"attribute\":\"relevance\",\"sortOrder\": \"desc\" } ]',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetVenuesWithQuery',
      apiUrl: 'http://localhost:9000/data/venueGridCursor',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'columns': columns,
        '_dc': dc,
        'start': start,
        'forceSelection': forceSelection,
        'filters': filters,
        'facts': facts,
        'query': venueQuery,
        'a:clientState': clientState,
        'page': page,
        'limit': limit,
        'sort': sort,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? searchCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  static List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  static List? aggg(dynamic response) => getJsonField(
        response,
        r'''$.aggregations''',
        true,
      ) as List?;
}

class GetVenuesCall {
  static Future<ApiCallResponse> call({
    String? columns =
        'name,priceyFactor,address,overallRank,description,venueType,venueMoreFields.price,venueMoreFields.activityType,venueMoreFields.sportsType,logo',
    String? dc = '1713431195048',
    int? start = 0,
    String? forceSelection = 'true',
    String? filters =
        '[{\"attribute\":\"geometry\",\"filterType\":\"geoDistance\",\"value\":{\"location\":[-71.0712,42.2904],\"distance\":25,\"unit\":\"Mile\"}}]',
    String? facts =
        '[{\"attribute\":\"venuetype\"},{\"attribute\":\"activitytype\"},{\"attribute\":\"sportstype\"},{\"attribute\":\"priceyfactor\"},{\"attribute\":\"ranking\"},{\"attribute\":\"agerange\"},{\"attribute\":\"town\"},{\"attribute\":\"capacity\"},{\"attribute\":\"demographics\"},{\"attribute\":\"activitycategory\"}]',
    String? clientState =
        '{\"clientId\":\"venueGrid__venueSearchResultGrid\",\"cursor\":{},\"selection\":[],\"currentPage\":1,\"sorters\":[{\"property\":\"relevance\",\"direction\":\"desc\"}]}',
    int? page = 1,
    int? limit = 20,
    String? sort = '[{\"attribute\":\"relevance\",\"sortOrder\": \"desc\" } ]',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetVenues',
      apiUrl: 'http://localhost:9000/data/venueGridCursor',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'columns': columns,
        '_dc': dc,
        'start': start,
        'forceSelection': forceSelection,
        'filters': filters,
        'facts': facts,
        'a:clientState': clientState,
        'page': page,
        'limit': limit,
        'sort': sort,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? searchCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  static List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  static List? aggg(dynamic response) => getJsonField(
        response,
        r'''$.aggregations''',
        true,
      ) as List?;
}

class GetLocationCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLocation',
      apiUrl: 'https://www.celebratix.com/data/application/currentLocation',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currentLocation.country''',
      ));
  static String? postalcode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.currentLocation.postalCode''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currentLocation.cityTown''',
      ));
  static List<double>? coordinates(dynamic response) => (getJsonField(
        response,
        r'''$.currentLocation.geometry.coordinates''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class LoclGetloctionCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'loclGetloction',
      apiUrl: 'http://localhost:9000/data/application/currentLocation',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currentLocation.country''',
      ));
  static String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currentLocation.stateProvince''',
      ));
  static String? postalcode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.currentLocation.postalCode''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currentLocation.cityTown''',
      ));
}

class TestCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "country": "ru",
  "stateProvince": "KK",
  "postalCode": "655017",
  "cityTown": "Абакан",
  "geometry": {
    "type": "Point",
    "coordinates": [
      91.44012225,
      53.7209641
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'test',
      apiUrl: 'http://localhost:9000/data/application/currentLocation',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAddressFromLatLongCall {
  static Future<ApiCallResponse> call({
    double? latitude = 40.733088,
    double? longitude = -73.988824,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAddressFromLatLong',
      apiUrl:
          'https://api.mapbox.com/search/geocode/v6/reverse?longitude=$longitude&latitude=${latitude}types=address&access_token=pk.eyJ1IjoiamF5YW50YW0iLCJhIjoiY2sydXFyZGZxMXAwczNudWlpY3JrcHB5MiJ9.8WEXuNB2Dyby6iFDjijbJA',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.features[:].properties.place_formatted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? result(dynamic response) => getJsonField(
        response,
        r'''$.features''',
        true,
      ) as List?;
  static String? postalcode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.postcode.name''',
      ));
  static String? place(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.place.name''',
      ));
  static String? district(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.district.name''',
      ));
  static String? region(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.region.region_code''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.country.country_code''',
      ));
  static String? alternatePlaceName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.place.alternate.name''',
      ));
}

class FCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'f',
      apiUrl:
          'https://api.mapbox.com/search/geocode/v6/reverse?longitude=72.8774&latitude=19.0760types=address&access_token=pk.eyJ1IjoiamF5YW50YW0iLCJhIjoiY2sydXFyZGZxMXAwczNudWlpY3JrcHB5MiJ9.8WEXuNB2Dyby6iFDjijbJA',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
