import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Venues Group Code

class VenuesGroup {
  static String getBaseUrl({
    String? url,
    String? token = '',
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}/data';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static GetAllVenuesCall getAllVenuesCall = GetAllVenuesCall();
  static GetAllVenuesMapCall getAllVenuesMapCall = GetAllVenuesMapCall();
  static GetPartyPlaceTypeCall getPartyPlaceTypeCall = GetPartyPlaceTypeCall();
  static VenueDetailsCall venueDetailsCall = VenueDetailsCall();
  static VenueSuggestionCall venueSuggestionCall = VenueSuggestionCall();
  static VenuePackageCall venuePackageCall = VenuePackageCall();
  static VenueHallAndRoomsCall venueHallAndRoomsCall = VenueHallAndRoomsCall();
  static VenueSimilarCall venueSimilarCall = VenueSimilarCall();
  static VenuePackageDetailsOpsHoursCall venuePackageDetailsOpsHoursCall =
      VenuePackageDetailsOpsHoursCall();
  static VenuePackegeDetailsCall venuePackegeDetailsCall =
      VenuePackegeDetailsCall();
  static VenueSpaceDetailsCall venueSpaceDetailsCall = VenueSpaceDetailsCall();
  static SpaceAmenitiesCall spaceAmenitiesCall = SpaceAmenitiesCall();
  static VenueSpaceOpHoursCall venueSpaceOpHoursCall = VenueSpaceOpHoursCall();
  static VenueSpaceVariationDetailsCall venueSpaceVariationDetailsCall =
      VenueSpaceVariationDetailsCall();
  static VenueResourcePartnerCall venueResourcePartnerCall =
      VenueResourcePartnerCall();
  static VenueAnemitiesCall venueAnemitiesCall = VenueAnemitiesCall();
  static VenuePackageVariationCall venuePackageVariationCall =
      VenuePackageVariationCall();
  static VenueDocumentListCall venueDocumentListCall = VenueDocumentListCall();
  static SpaceConfigrationCall spaceConfigrationCall = SpaceConfigrationCall();
}

class GetAllVenuesCall {
  Future<ApiCallResponse> call({
    int? pageNumber = 1,
    int? limit = 20,
    int? startIndex = 0,
    String? filters =
        '[{\"attribute\":\"geometry\",\"filterType\":\"geoDistance\",\"value\":{\"location\":[-71.05685,42.358625],\"distance\":25,\"unit\":\"Mile\"}}]',
    String? searchText = '*',
    String? clientState = '',
    dynamic sortQueryJson,
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    final sortQuery = _serializeJson(sortQueryJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'getAllVenues',
      apiUrl:
          '${baseUrl}/venueGridCursor?columns=name,priceyFactor,address,overallRank,description,venueType,venueMoreFields.price,venueMoreFields.activityType,venueMoreFields.sportsType,venueMoreFields.resourcePhotos,logo,venueMoreFields.geometry&_dc=1714751638558&filters=${filters}&facets=%5B%7B%22attribute%22%3A%22venuetype%22%7D%2C%7B%22attribute%22%3A%22activitytype%22%7D%2C%7B%22attribute%22%3A%22sportstype%22%7D%2C%7B%22attribute%22%3A%22priceyfactor%22%7D%2C%7B%22attribute%22%3A%22ranking%22%7D%2C%7B%22attribute%22%3A%22agerange%22%7D%2C%7B%22attribute%22%3A%22town%22%7D%2C%7B%22attribute%22%3A%22capacity%22%7D%2C%7B%22attribute%22%3A%22demographics%22%7D%2C%7B%22attribute%22%3A%22activitycategory%22%7D%5D&query=${searchText}&a%3AclientState=${clientState}&page=${pageNumber}&start=${startIndex}&limit=${limit}&sort=${sortQuery}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
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
  List<String>? overallRank(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].overallRank''',
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
  List<String>? images(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venueMoreFields-_-resourcePhotos'][*]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? aggBuckets(dynamic response) => getJsonField(
        response,
        r'''$.aggregations[:].buckets[:]''',
        true,
      ) as List?;
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
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAllVenuesMap',
      apiUrl:
          '${baseUrl}/venueGridCursor?columns=name,address,venueType,venueMoreFields.activityCategory,venueMoreFields.price,venueMoreFields.activityType,venueMoreFields.sportsType,logo,venueMoreFields.geometry&_dc=1716185303329&start=${startIndex}&forceSelection=true&filters=${filters}&query=${searchText}&a%3AclientState=%7B%22clientId%22%3A%22venueMap__venueSearchResultGridForMap%22%2C%22cursor%22%3A%7B%7D%2C%22selection%22%3A%5B%5D%2C%22currentPage%22%3A${pageNumber}%2C%22staticFilteredBy%22%3A%5B%7B%22filters%22%3A${filters}%7D%5D%2C%22sorters%22%3A%5B%7B%22property%22%3A%22${sortOrderType}%22%2C%22direction%22%3A%22${sortOrder}%22%7D%5D%7D&page=${pageNumber}&limit=${limit}&sort=%5B%7B%22attribute%22%3A%22${sortOrderType}%22%2C%22sortOrder%22%3A%20%22${sortOrder}%22%20%7D%20%5D',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
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
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getPartyPlaceType',
      apiUrl:
          '${baseUrl}/uiEnumerationRestriction/CLBXEnPartyPlaceType\$?_dc=1715688515666&query=&uiContext=%7B%22key%22%3A%22venueTabContent%22%2C%22params%22%3A%7B%7D%2C%22component%22%3A%7B%22clientId%22%3A%22venueTabContent__venueTopFilterPanel%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22venueTabContent__venueTopFilterPanel%22%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
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
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueDetails',
      apiUrl:
          '${baseUrl}/venueDetailsCursor/rec/${venueId}?columns=resource.basicPartyInfo.mobileUser.person.communication.email,spacesCount,packageCount,resource.id,resource.basicPartyInfo.address.location,resource.basicPartyInfo.primaryContact.person.communication.phone,resource.basicPartyInfo.primaryContact.person.communication.email,resource.basicPartyInfo.primaryContact.person.fullName,cateringRates,cateringOption.name,resource.hasBookingCal,resource.bookingURL,resource.minBookingTimeframe.text,resource.resourceCosting.cancellationPolicy.text,resource.fullPaymentTimeframe.text,resource.basicPartyInfo.busPartyIdentifier.longDescription,resource.creditCardAccepted,resource.paymentModes,resource.tertiaryAgeRange,resource.secondaryAgeRange,resource.primaryAgeRange,resource.additionalInfo.secondaryPreferredGender.name,resource.additionalInfo.primaryPreferredGender.name,venueType.name,resource.serviceDemographics.name,activityCategories,resource.additionalInfo.maxCapacityForGroup,resourceThemes,availDays,accomodates,sportsTypes,partyPlaceTypes,ageRange,resource.resourceItemPriceRane,activityTypes,resource.basicPartyInfo.busPartyIdentifier.description,resource.basicPartyInfo.address.addressInShort,resource.basicPartyInfo.communication.website,resource.basicPartyInfo.communication.email,resource.basicPartyInfo.communication.phone,getVenueCategory,resource.additionalInfo.overallRank,resource.basicPartyInfo.busPartyIdentifier.name,resource.basicPartyInfo.address.geometry,resource.resourceItemPriceRange&_dc=1716311060210',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
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
  List<String>? shortAddress(dynamic response) => (getJsonField(
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
        r'''$.details[:]['resource-_-resourceItemPriceRange']''',
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
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-location']''',
      ));
  String? spaceCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].spacesCount''',
      ));
  String? packageCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].packageCount''',
      ));
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  String? mobileUserEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-mobileUser-_-person-_-communication-_-email']''',
      ));
}

class VenueSuggestionCall {
  Future<ApiCallResponse> call({
    String? searchVenueQuery = 'Boston',
    String? uiContext = '',
    String? distance = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueSuggestion',
      apiUrl:
          '${baseUrl}/uiCursorEnumRestriction/venueSuggestionsCursor?_dc=1716139060245&query=${searchVenueQuery}&uiContext=${uiContext}&distance=${distance}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
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
    String? query = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venuePackage',
      apiUrl:
          '${baseUrl}/venuePackageCursor?columns=venue_package.packageRates,venue_package.venuePackageSection.resItemSection.name,venue_package.resourcePackage.resourceItem.name,venue_package.resourcePackage.resourceItem.id,venue_package.resourcePackage.resourceItem.description,formatedPrice,venue_package.resourceItemDuartionFormatted,venue_package.resourcePackage.defaultInvitee,venue_package.resourcePackage.resourceItem.ageRange,venue_package.resourcePackage.packagePrimaryActivity.activityType.name,venue_package.resourcePackage.resourceItem.id,imageURL&_dc=1716898640894&a%3AclientState=${query}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
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
  List<String>? activityType(dynamic response) => (getJsonField(
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
  List<String>? resourceItemId(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-id']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenueHallAndRoomsCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueHallAndRooms',
      apiUrl:
          '${baseUrl}/venueSpaceCursor?columns=VenueSpace.resourceItem.id,VenueSpace.spaceRate,VenueSpace.spaceSection.resItemSection.name,VenueSpace.resourceItem.name,VenueSpace.resourceItem.description,formatedPrice,VenueSpace.resourceItemDuartionFormatted,VenueSpace.seatingCapacity,VenueSpace.standingCapacity,VenueSpace.theaterCapacity,VenueSpace.resourceItem.additionalInfo.minPersons,VenueSpace.resourceItem.additionalInfo.minDuration,VenueSpace.resourceItem.additionalInfo.maxDuration,VenueSpace.availDaysFormatted,imageURL&_dc=1717131958058&a%3AclientState=${query}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].imageURL''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['VenueSpace-_-resourceItem-_-name']''',
      ));
  String? threaterCapacity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['VenueSpace-_-theaterCapacity']''',
      ));
  String? minDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['VenueSpace-_-resourceItem-_-additionalInfo-_-minDuration']''',
      ));
  String? seatingCapacity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['VenueSpace-_-seatingCapacity']''',
      ));
  String? standingCapacity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['VenueSpace-_-standingCapacity']''',
      ));
  String? priceFormated(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['formatedPrice']''',
      ));
  String? maxDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['VenueSpace-_-resourceItem-_-additionalInfo-_-maxDuration']''',
      ));
  String? formatedDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['VenueSpace-_-resourceItemDuartionFormatted']''',
      ));
  String? rate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['VenueSpace-_-spaceRate']''',
      ));
  dynamic imageUrl(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['/assets/images/celebration/venue/defaul_hall_venue.jpg']''',
      );
  String? minPersons(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['VenueSpace-_-resourceItem-_-additionalInfo-_-minPersons']''',
      ));
  List<String>? spaceResourceId(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['VenueSpace-_-resourceItem-_-id']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenueSimilarCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueSimilar',
      apiUrl:
          '${baseUrl}/similarVenueCursor?columns=name,venueMoreFields.price,overallRank,logo&_dc=1742842088624&start=0&forceSelection=true&a%3AclientState=${clientState}&page=1&limit=10',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
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
  List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rank(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].overallRank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['venueMoreFields-_-price']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenuePackageDetailsOpsHoursCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venuePackageDetailsOpsHours',
      apiUrl:
          '${baseUrl}/resourceItemHoursAndTimeCheckBoxSlotCursor?columns=day,timeslot&_dc=1717488232593&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? days(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].day''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? timeslot(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].timeslot''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenuePackegeDetailsCall {
  Future<ApiCallResponse> call({
    String? clientQuery = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venuePackegeDetails',
      apiUrl:
          '${baseUrl}/venuePackageDetailsCursor?columns=venue_package.resourcePackage.resourceItem,venue_package.resourcePackage.resourceItem.id,venue_package.resourcePackage.resourceItem.imageURL,venue_package.resourcePackage.resourceItem.name,formatedPrice,venue_package.resourcePackage.resourceItem.description,venue_package.resourcePackage.resourceItem.resourceItemDuration,venue_package.resourcePackage.primaryPackageContext.name,venue_package.availDaysOnlyThreeFormatted,venue_package.resourcePackage.packagePrimaryActivity.activityType.name,venue_package.resourceItemDuartionFormatted,venue_package.resourcePackage.resourceItem.ageRange,venue_package.resourcePackage.defaultInvitee,venue_package.minDepositFormatted,venue_package.resourcePackage.resourceItem.additionalInfo.maxDuration,venue_package.resourcePackage.resourceItem.additionalInfo.serviceDemographics.name,venue_package.resourcePackage.resourceItem.additionalInfo.minDuration,venue_package.resourcePackage.resourceItem.additionalInfo.maxPersons,venue_package.findInclusionItems,venue_package.resourcePackage.resourceItem.includedAddOnNames,imageURL&a:clientState=${clientQuery}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? days(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].availDaysOnlyThreeFormatted''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? defaultInvitee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-defaultInvitee']''',
      ));
  String? duration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-resourceItemDuration']''',
      ));
  String? activityType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-packagePrimaryActivity-_-activityType-_-name']''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-name']''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-description']''',
      ));
  String? maxPersons(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-additionalInfo-_-maxPersons']''',
      ));
  String? maxDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-additionalInfo-_-maxDuration']''',
      ));
  String? includeAddOn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-includedAddOnNames']''',
      ));
  String? demographics(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-additionalInfo-_-serviceDemographics-_-name']''',
      ));
  String? formatedDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourceItemDuartionFormatted']''',
      ));
  String? ageRange(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-ageRange']''',
      ));
  String? suitableFor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-primaryPackageContext-_-name']''',
      ));
  String? favors(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-findInclusionItems']''',
      ));
  String? minimumDeposite(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-minDepositFormatted']''',
      ));
  String? minDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-additionalInfo-_-minDuration']''',
      ));
  String? availableDays(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-availDaysOnlyThreeFormatted']''',
      ));
  String? price(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].price''',
      ));
  String? resourcePackageitemId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem-_-id']''',
      ));
  dynamic resourcePackageDetails(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['venue_package-_-resourcePackage-_-resourceItem']''',
      );
  String? imageURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].imageURL''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].formatedPrice''',
      ));
}

class VenueSpaceDetailsCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueSpaceDetails',
      apiUrl:
          '${baseUrl}/venueSpaceDetailsCursor?columns=price,formatedPrice,imageURL,space.spaceRate,space.spaceSection.resItemSection.name,space.resourceItem.name,space.resourceItem.description,space.resourceItemDuartionFormatted,space.seatingCapacity,space.standingCapacity,space.theaterCapacity,space.resourceItem.additionalInfo.minPersons,space.resourceItem.additionalInfo.minDuration,space.resourceItem.additionalInfo.maxDuration,space.availDaysFormatted,space.resourceItem.imageURL,space.resourceItem.description,space.availDaysFormatted,space.minDepositFormatted,space.resourceItem.includedAddOnNames,space.kitchen.name,space.kitchen.name,space.alcohol.name,space.additionalInfo.permittedUse,space.additionalInfo.otherBookingRequirements,space.additionalInfo.flooring,space.additionalInfo.stageDimensions,space.additionalInfo.lighting,space.additionalInfo.swimmingPool,space.additionalInfo.smoking,space.additionalInfo.gymSportsCourt,space.additionalInfo.stoveOvenUse,space.additionalInfo.liveBandMusic,space.additionalInfo.personalHostCoordinator,space.additionalInfo.valetService,space.additionalInfo.janitorialService,space.additionalInfo.handicapAccess,space.additionalInfo.communityEventsOnly,space.additionalInfo.nonProfitEventsOnly,space.additionalInfo&a:clientState=${query}&_dc=1718164339350',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
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
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? availableDays(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-availDaysFormatted']''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-resourceItem-_-description']''',
      ));
  String? duration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-resourceItemDuartionFormatted']''',
      ));
  String? threaterCapacity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-theaterCapacity']''',
      ));
  String? seatingCapacity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-seatingCapacity']''',
      ));
  String? standingCapacity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-standingCapacity']''',
      ));
  String? imageURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].imageURL''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]  ['space-_-resourceItem-_-name']''',
      ));
  String? minDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-resourceItem-_-additionalInfo-_-minDuration']  ''',
      ));
  String? maxDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-resourceItem-_-additionalInfo-_-maxDuration'] ''',
      ));
  String? minDepositied(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:] ['space-_-minDepositFormatted']  ''',
      ));
  String? minPerson(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-resourceItem-_-additionalInfo-_-minPersons'] ''',
      ));
  String? rate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-spaceRate']''',
      ));
  String? resourseName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-spaceSection-_-resItemSection-_-name']''',
      ));
  String? handicapAcess(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-additionalInfo-_-handicapAccess']''',
      ));
  String? personalHostCoordinator(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-additionalInfo-_-personalHostCoordinator']''',
      ));
  String? stoveOvenUse(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:] ['space-_-additionalInfo-_-stoveOvenUse']''',
      ));
  String? communityEventsOnly(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]      ['space-_-additionalInfo-_-communityEventsOnly']''',
      ));
  String? flooring(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]   ['space-_-additionalInfo-_-flooring']''',
      ));
  String? smoking(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:] ['space-_-additionalInfo-_-smoking']''',
      ));
  String? valetService(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:] ['space-_-additionalInfo-_-valetService'] ''',
      ));
  String? includedAddOnNames(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-resourceItem-_-includedAddOnNames'] ''',
      ));
  String? liveBandMusic(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-additionalInfo-_-liveBandMusic'] ''',
      ));
  String? permittedUse(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-additionalInfo-_-permittedUse']''',
      ));
  String? kitchenName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:] ['space-_-kitchen-_-name']''',
      ));
  String? otherBookingRequirements(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-additionalInfo-_-otherBookingRequirements']  ''',
      ));
  String? gymSportsCourt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-additionalInfo-_-gymSportsCourt']  ''',
      ));
  String? janitorialService(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:] ['space-_-additionalInfo-_-janitorialService']  ''',
      ));
  String? alcohalName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-alcohol-_-name']''',
      ));
  String? nonProfitEventsOnly(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-additionalInfo-_-nonProfitEventsOnly']''',
      ));
  String? stageDimensions(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-additionalInfo-_-stageDimensions']''',
      ));
  String? swimmingPool(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]   ['space-_-additionalInfo-_-swimmingPool'] ''',
      ));
  String? lighting(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['space-_-additionalInfo-_-lighting']''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].formatedPrice''',
      ));
  String? price(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].price''',
      ));
  dynamic additionalInfo(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['space-_-additionalInfo']''',
      );
}

class SpaceAmenitiesCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SpaceAmenities',
      apiUrl:
          '${baseUrl}/resItemAmenitiesGridCursor?columns=name,description,amenitiesType&_dc=1718164339918&a%3AclientState=${query}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? amenitiesTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].amenitiesType_txt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? amenotiesType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].amenitiesType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenueSpaceOpHoursCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueSpaceOpHours',
      apiUrl:
          '${baseUrl}/venuePackageTimeSlotCursor?columns=availableTimeSlot,time&_dc=1718164352658&a%3AclientState=${query}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? time(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].time''',
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
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? day(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].availableTimeSlot''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenueSpaceVariationDetailsCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueSpaceVariationDetails',
      apiUrl:
          '${baseUrl}/variationTabCursor?columns=name,description,pricing,minDuration,maxDuration,resourceItem.additionalInfo.availAge.minAge,resourceItem.additionalInfo.availAge.maxAge,image.url&_dc=1718164363711&start=0&forceSelection=true&a%3AclientState=${query}&page=1&limit=20',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? pricing(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].pricing''',
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
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? minDuration(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].minDuration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
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
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? maxDuration(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].maxDuration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? minAge(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItem-_-additionalInfo-_-availAge-_-minAge']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? maxAge(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItem-_-additionalInfo-_-availAge-_-maxAge']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageURL(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['image-_-url']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].pricing''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenueResourcePartnerCall {
  Future<ApiCallResponse> call({
    dynamic queryJson,
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    final query = _serializeJson(queryJson);

    return ApiManager.instance.makeApiCall(
      callName: 'venueResourcePartner',
      apiUrl:
          '${baseUrl}/resourcePartnersCursor?columns=targetPartnerType.name,target.basicPartyInfo.busPartyIdentifier.name,target.basicPartyInfo.communication.phone,target.basicPartyInfo.communication.email,target.basicPartyInfo.communication.website,target.basicPartyInfo.address.addressInShort&_dc=1734372403297&start=0&forceSelection=true&a%3AclientState=${query}&page=1&limit=10',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
}

class VenueAnemitiesCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueAnemities',
      apiUrl:
          '${baseUrl}/spaceAmenitiesGridsCursor?columns=name&_dc=1734372402956&a%3AclientState=${query}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenuePackageVariationCall {
  Future<ApiCallResponse> call({
    dynamic queryJson,
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    final query = _serializeJson(queryJson);

    return ApiManager.instance.makeApiCall(
      callName: 'venuePackageVariation',
      apiUrl:
          '${baseUrl}/variationTabCursor?columns=name,description,pricing,minDuration,maxDuration,resourceItem.additionalInfo.availAge.minAge,resourceItem.additionalInfo.availAge.maxAge,image.url&_dc=1734088915160&start=0&forceSelection=true&a%3AclientState=${query}&page=1&limit=4',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? pricing(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].pricing''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? minDuration(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].minDuration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].description''',
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
  List<String>? maxDuration(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].maxDuration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenueDocumentListCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueDocumentList',
      apiUrl:
          '${baseUrl}/venueDocsLinksGridCursor?columns=document.name,document.url&_dc=1718164339918&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalcount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['document-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? url(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['document-_-url']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SpaceConfigrationCall {
  Future<ApiCallResponse> call({
    String? clientstate = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VenuesGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'spaceConfigration',
      apiUrl:
          '${baseUrl}/configurationSpaceTabCursor?columns=spaceConfigType.name,minCapacity,maxCapacity,maxTables,personsPerTable,picture.url&_dc=1751447512620&a%3AclientState=${clientstate}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? maxCapacity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].maxCapacity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? maxTables(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].maxTables''',
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
  List<String>? minCapacity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].minCapacity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? personsPerTable(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].personsPerTable''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Venues Group Code

/// Start LocationsApi Group Code

class LocationsApiGroup {
  static String getBaseUrl({
    String? accessToken =
        'pk.eyJ1IjoiamF5YW50YW0iLCJhIjoiY2sydXFyZGZxMXAwczNudWlpY3JrcHB5MiJ9.8WEXuNB2Dyby6iFDjijbJA',
  }) =>
      'https://api.mapbox.com';
  static Map<String, String> headers = {};
  static GetLocationFromLatLongCall getLocationFromLatLongCall =
      GetLocationFromLatLongCall();
  static LocationSuggestionCall locationSuggestionCall =
      LocationSuggestionCall();
  static RetriveSuggestionCall retriveSuggestionCall = RetriveSuggestionCall();
}

class GetLocationFromLatLongCall {
  Future<ApiCallResponse> call({
    double? longitude,
    double? latitude,
    String? accessToken =
        'pk.eyJ1IjoiamF5YW50YW0iLCJhIjoiY2sydXFyZGZxMXAwczNudWlpY3JrcHB5MiJ9.8WEXuNB2Dyby6iFDjijbJA',
  }) async {
    final baseUrl = LocationsApiGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getLocationFromLatLong',
      apiUrl:
          '${baseUrl}/search/geocode/v6/reverse?longitude=${longitude}&latitude=${latitude}types=address&access_token=${accessToken}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.country.country_code''',
      ));
  String? alternatePlaceName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.place.alternate.name''',
      ));
  String? region(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.region.region_code''',
      ));
  String? district(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.district.name''',
      ));
  String? place(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.place.name''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[0].properties.context.postcode.name''',
      ));
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.features[0].properties.place_formatted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  double? latitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.features[:].properties.coordinates.routable_points[:].latitude''',
      ));
  double? longitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.features[:].properties.coordinates.routable_points[:].longitude''',
      ));
}

class LocationSuggestionCall {
  Future<ApiCallResponse> call({
    String? sessionToken = '1234',
    String? searchLocation = 'boston',
    String? latlong = '-73.990593,40.740121',
    String? accessToken =
        'pk.eyJ1IjoiamF5YW50YW0iLCJhIjoiY2sydXFyZGZxMXAwczNudWlpY3JrcHB5MiJ9.8WEXuNB2Dyby6iFDjijbJA',
  }) async {
    final baseUrl = LocationsApiGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'locationSuggestion',
      apiUrl:
          '${baseUrl}/search/searchbox/v1/suggest?q=${searchLocation}&session_token=${sessionToken}&limit=10&proximity=-73.990593%2C40.740121&country=us&types=city%2Cpostcode%2Clocality%2Cneighborhood%2Cdistrict%2Cregion&access_token=${accessToken}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? suggestion(dynamic response) => getJsonField(
        response,
        r'''$.suggestions''',
        true,
      ) as List?;
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? placeFormatted(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].place_formatted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? mapboxId(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].mapbox_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? countryCode(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].context.country.country_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? region(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].context.region.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? district(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].context.district.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? place(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].place_formatted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? distance(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].distance''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class RetriveSuggestionCall {
  Future<ApiCallResponse> call({
    String? mapboxId = '',
    String? sessionToken = '1234',
    String? accessToken =
        'pk.eyJ1IjoiamF5YW50YW0iLCJhIjoiY2sydXFyZGZxMXAwczNudWlpY3JrcHB5MiJ9.8WEXuNB2Dyby6iFDjijbJA',
  }) async {
    final baseUrl = LocationsApiGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retriveSuggestion',
      apiUrl:
          '${baseUrl}/search/searchbox/v1/retrieve/${mapboxId}?session_token=${sessionToken}&access_token=${accessToken}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  double? latitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.features[:].properties.coordinates.latitude''',
      ));
  double? longitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.features[:].properties.coordinates.longitude''',
      ));
  String? countryCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[:].properties.context.country.country_code''',
      ));
  List<double>? latlong(dynamic response) => (getJsonField(
        response,
        r'''$.features[:].geometry.coordinates''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  String? stateCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[:].properties.context.region.region_code''',
      ));
  String? place(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.features[:].properties.context.district.name''',
      ));
}

/// End LocationsApi Group Code

/// Start AccountInfo Group Code

class AccountInfoGroup {
  static String getBaseUrl({
    String? token = '',
    String? url,
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static MyInformationCall myInformationCall = MyInformationCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static ResetPasswordCursorCall resetPasswordCursorCall =
      ResetPasswordCursorCall();
  static LoginAccountCall loginAccountCall = LoginAccountCall();
  static NearestUpcomingEventCall nearestUpcomingEventCall =
      NearestUpcomingEventCall();
  static GuestlistCall guestlistCall = GuestlistCall();
  static RequestShoppingCartDetailCall requestShoppingCartDetailCall =
      RequestShoppingCartDetailCall();
  static GuestInformationCall guestInformationCall = GuestInformationCall();
  static DeleteGuestCall deleteGuestCall = DeleteGuestCall();
  static SignUpCall signUpCall = SignUpCall();
  static SignUpGetFormCall signUpGetFormCall = SignUpGetFormCall();
  static CLBXEnPersonNameSuffixCall cLBXEnPersonNameSuffixCall =
      CLBXEnPersonNameSuffixCall();
  static CLBXEnFamilyMemberRelationCall cLBXEnFamilyMemberRelationCall =
      CLBXEnFamilyMemberRelationCall();
  static SaveMyInformationCall saveMyInformationCall = SaveMyInformationCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static SaveChangedPasswordCall saveChangedPasswordCall =
      SaveChangedPasswordCall();
  static SaveProfilePicCall saveProfilePicCall = SaveProfilePicCall();
  static ProfilePicCall profilePicCall = ProfilePicCall();
  static FamilyMemberListCall familyMemberListCall = FamilyMemberListCall();
  static FamilyMemberEditCall familyMemberEditCall = FamilyMemberEditCall();
  static MyFriendEditCall myFriendEditCall = MyFriendEditCall();
  static SaveFamilyMemberCall saveFamilyMemberCall = SaveFamilyMemberCall();
  static SaveFriendCall saveFriendCall = SaveFriendCall();
  static DeleteFamilyMemberCall deleteFamilyMemberCall =
      DeleteFamilyMemberCall();
  static MyInfoPopulateAddressCall myInfoPopulateAddressCall =
      MyInfoPopulateAddressCall();
  static MyfamilyPopulateAddressCall myfamilyPopulateAddressCall =
      MyfamilyPopulateAddressCall();
  static MyFriendPopulateAddressCall myFriendPopulateAddressCall =
      MyFriendPopulateAddressCall();
  static MyInfoAddressesSuggestionCall myInfoAddressesSuggestionCall =
      MyInfoAddressesSuggestionCall();
  static MyfamilyAddressesSuggestionCall myfamilyAddressesSuggestionCall =
      MyfamilyAddressesSuggestionCall();
  static MyfriendAddressesSuggestionCall myfriendAddressesSuggestionCall =
      MyfriendAddressesSuggestionCall();
  static FriendListCall friendListCall = FriendListCall();
  static FriendDeleteActionCall friendDeleteActionCall =
      FriendDeleteActionCall();
  static ExistingFamilyMemberCall existingFamilyMemberCall =
      ExistingFamilyMemberCall();
  static AssignLocationCall assignLocationCall = AssignLocationCall();
  static UpdateMobileDownLoadCursorCall updateMobileDownLoadCursorCall =
      UpdateMobileDownLoadCursorCall();
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    int? id = 1,
    String? data = 'client_json:eyJlbWFpbCI6IiJ9',
    String? email = '',
    String? link = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'forgotPassword',
      apiUrl: '${baseUrl}/ui/forgotPassword/signupForm/sendPasswordLink',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState':
            "{\"clientId\":\"forgotPassword__signupForm\",\"cursor\":{}}",
        'a:caller': "signupForm",
        '_id': id,
        '_data': data,
        'email': email,
        'link': link,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class MyInformationCall {
  Future<ApiCallResponse> call({
    String? cache = 'server',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'MyInformation',
      apiUrl:
          '${baseUrl}/data/profileCursor?_dc=1745227309408&format=js&label=Edit%20My%20Info&autoRefreshOnSaveTarget=myInfo__myProfileForm%2C%20&format=js&columns=person.firstName,person.suffixName,person.firstName,person.lastName,person.middleName,date,person.gender,communication.email,communication.altEmail,communication.phone,communication.altWorkPhone,communication.mobile,communication.fax,communication.website,twitterHandle,googlePlusHandle,addressToSearch,address.bldgNum,address.floorSection,address.street,address.localArea,address.cityTown,address.stateProvince,address.postalCode,person.specialNeeds,person.eduLevel,person.interests,person.comments,address.location,person.address.address,profilePic,status,person,person.fullName&cache=${cache}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-firstName']''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['communication-_-email']''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['communication-_-phone']''',
      ));
  String? mobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['communication-_-mobile']''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].date''',
      ));
  String? middleName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-middleName']''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-lastName']''',
      ));
  String? eduLevalId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-eduLevel']''',
      ));
  String? genderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-gender']''',
      ));
  String? addressToSearch(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].addressToSearch''',
      ));
  String? profilePic(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].profilePic''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? formId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-localArea']''',
      ));
  String? steet(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-street']''',
      ));
  String? bldgNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-bldgNum']''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-cityTown']''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-postalCode']''',
      ));
  String? floorSection(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-floorSection']''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-stateProvince']''',
      ));
  String? googlePlusHandle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['googlePlusHandle']''',
      ));
  String? website(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['communication-_-website']''',
      ));
  String? fax(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['communication-_-fax']''',
      ));
  String? altEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['communication-_-altEmail']''',
      ));
  String? intersts(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-interests']''',
      ));
  String? twitter(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['twitterHandle']''',
      ));
  String? comments(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-comments']''',
      ));
  String? suffix(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-suffixName']''',
      ));
  String? altWorkphone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['communication-_-altWorkPhone']''',
      ));
  String? specialNeeds(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-specialNeeds']''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-address-_-address']''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].status_txt''',
      ));
  String? genderName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.gender''',
      ));
  String? eduLevalName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.eduLevel''',
      ));
  String? suffixName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.suffixName''',
      ));
  String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-fullName']''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? password = '',
    String? reType = '',
    dynamic clientStateJson,
    String? data = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    final clientState = _serializeJson(clientStateJson);

    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl: '${baseUrl}/ui/resetPassword/resetPasswordForm/save',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'password': password,
        'reType': reType,
        'a:clientState': clientState,
        'a:caller': "resetPasswordForm",
        '_id': "0",
        '_data': data,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.title''',
      ));
  String? messageType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.type''',
      ));
  String? messageSucess(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class ResetPasswordCursorCall {
  Future<ApiCallResponse> call({
    String? key =
        'cHVyb2hpdGJoYWdhdmF0aTlAZ21haWwuY29tOjorMDUzMCAyMzoyOCAyMDI0LzA3LzEw',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resetPasswordCursor',
      apiUrl: '${baseUrl}/data/resetPasswordCursor?key=${key}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? data(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].toJson''',
      ));
}

class LoginAccountCall {
  Future<ApiCallResponse> call({
    String? id = '1',
    String? data =
        'client_json:eyJlbWFpbCI6IiIsInBhc3N3b3JkIjoiIiwicmVtZW1iZXJNZSI6ZmFsc2V9',
    String? email = '',
    String? password = '',
    bool? rememberMe = false,
    String? actionOnLogin = '',
    String? nextUI = '',
    String? recordKey = '-1',
    String? resourceId = '-1',
    String? resourceItemId = '-1',
    String? firstTab = '',
    String? type = '',
    String? resourceType = '0',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'loginAccount',
      apiUrl: '${baseUrl}/ui/login/loginForm/loginAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': "{\"clientId\":\"login__loginForm\",\"cursor\":{}}",
        'a:caller': "loginForm",
        'email': email,
        'password': password,
        'rememberMe': rememberMe,
        'ap:actionOnLogin': actionOnLogin,
        'ap:nextUI': nextUI,
        'ap:recordKey': recordKey,
        'ap:resourceId': resourceId,
        'ap:index': "-1",
        'ap:timeSlot': "-1",
        'ap:timeSlotId': "-1",
        'ap:resourceItemId': resourceItemId,
        'ap:firstTab': " ",
        'ap:to': "https://celebratix.com/ui/venueTabContent",
        'ap:type': type,
        'ap:dataActionType': "0",
        'ap:from': " https://celebratix.com/ui/venueTabContent",
        'ap:quantity': "-1",
        'ap:resourceType': resourceType,
        'ap:basic': false,
        'ap:variations': "-1",
        'ap:menuSection': false,
        '_id': id,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.type''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  int? eventId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.shoppingCart.eventId''',
      ));
  int? cartCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
  String? redirect(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  String? redirectURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params[:]''',
        true,
      ) as List?;
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class NearestUpcomingEventCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'nearestUpcoming Event',
      apiUrl:
          '${baseUrl}/data/nearestUpcomingEventCursor?columns=opsHour.timeFormatted,name,celebration.name,description,additionalInfo.celebrateePerson.fullName,additionalInfo.celebrateePerson.gender.name,additionalInfo.celebrateePerson.age,themeCategory.name,theme,additionalInfo.budget,idealDate,idealDate,eventStatus.name,additionalInfo.idealDateAlt1,additionalInfo.idealDateAlt2,kidsInvitee,adultInvitee,totalInvitee,totalCost,address.bldgNum,address.floorSection,address.street,address.localArea,address.cityTown,address.stateProvince,address.postalCode',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].name''',
      ));
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  String? idealDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].idealDate''',
      ));
  String? totalInvitee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalInvitee''',
      ));
  String? theme(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].theme''',
      ));
  String? kids(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].kidsInvitee''',
      ));
  String? adults(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].adultInvitee''',
      ));
  String? totalCost(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalCost''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-stateProvince']''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-localArea']''',
      ));
  String? floor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-floorSection']''',
      ));
  String? postalcode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-postalCode']''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-celebrateePerson-_-gender-_-name']''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-cityTown']''',
      ));
  String? ideatDate1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-idealDateAlt1']''',
      ));
  String? celebrationType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['celebration-_-name']''',
      ));
  String? fullnameCele(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-celebrateePerson-_-fullName']''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['description']''',
      ));
  String? themeCategory(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['themeCategory-_-name']''',
      ));
  String? budget(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-budget']''',
      ));
  String? age(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-celebrateePerson-_-age']''',
      ));
  String? idealDae2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-idealDateAlt2']''',
      ));
  String? bldgNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-bldgNum']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-street']''',
      ));
  String? eventStaus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['eventStatus-_-name']''',
      ));
  String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['opsHour-_-timeFormatted']''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
}

class GuestlistCall {
  Future<ApiCallResponse> call({
    dynamic clientStateJson,
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    final clientState = _serializeJson(clientStateJson);

    return ApiManager.instance.makeApiCall(
      callName: 'guestlist',
      apiUrl:
          '${baseUrl}/data/guestGridCursor?columns=name,address,phone,guestType,relation,addressFormatted&_dc=1738062044390&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
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
  List<String>? phone(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].phone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? guesttype(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].guestType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? relation(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].relation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? addressFormatted(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addressFormatted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RequestShoppingCartDetailCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'requestShoppingCartDetail',
      apiUrl:
          '${baseUrl}/data/forInShoppingCartCursor?columns=shoppingCart.event.name,shoppingCart.totalCost,shoppingCartStatus,shoppingCart.eventDate,shoppingCart.event.celebration.name,submissionDate,id&_dc=1738156207588',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].id''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].shoppingCartStatus''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  String? totalCost(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['shoppingCart-_-totalCost']''',
      ));
  String? eventDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['shoppingCart-_-eventDate']''',
      ));
  String? celebrationName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['shoppingCart-_-event-_-celebration-_-name']''',
      ));
  String? eventName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['shoppingCart-_-event-_-name']''',
      ));
  List<String>? submissionDate(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['submissionDate']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GuestInformationCall {
  Future<ApiCallResponse> call({
    dynamic clientQueryJson,
    String? recordKey = '19',
    String? parentRecordKey = '10',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    final clientQuery = _serializeJson(clientQueryJson);

    return ApiManager.instance.makeApiCall(
      callName: 'guestInformation',
      apiUrl:
          '${baseUrl}/data/addEventGuestCursor?columns=guestTypeName,person.comments,memberRelationName,familyMemberId,person.firstName,person.lastName,person.middleName,person.age,person.gender,memberRelation,person.communication.email,person.communication.phone,person.communication.mobile,person.address.location,person.address.floorSection,person.address.bldgNum,person.address.street,person.address.localArea,person.address.cityTown,person.address.stateProvince,person.address.postalCode,person.specialNeeds,person.allergy,person.interests,person.dateOfBirth,person.eduLevel,eventGuest.rsvp,eventGuest.rsvpComments,eventGuest.security&_dc=1738672485173&format=js&label=New%20Guest&parentRecordKey=${parentRecordKey}&recordKey=${recordKey}&autoRefreshOnSaveTarget=nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid&&a:clientState=${clientQuery}&format=js',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? guestTypeName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].guestTypeName''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? memberRelation(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].memberRelation''',
      ));
  String? memberRelationName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].memberRelationName''',
      ));
  String? memberRelationtxt(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].memberRelation_txt''',
      ));
  String? eventGuestrsvp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['eventGuest-_-rsvp']''',
      ));
  String? allergy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-allergy']''',
      ));
  String? middleName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-middleName']''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-communication-_-phone']''',
      ));
  String? floorSection(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-address-_-floorSection']''',
      ));
  String? svpComments(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['eventGuest-_-rsvpComments']''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-communication-_-email']''',
      ));
  String? interests(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-interests']''',
      ));
  String? stateProvince(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-address-_-stateProvince']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-address-_-street']''',
      ));
  String? citytown(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-address-_-cityTown']''',
      ));
  String? bldgNum(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-address-_-bldgNum']''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-gender_txt']''',
      ));
  String? education(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-eduLevel_txt']''',
      ));
  String? keepIt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['eventGuest-_-security_txt']''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-lastName']''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-firstName']''',
      ));
  String? age(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-age']''',
      ));
  String? mobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-communication-_-mobile']''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-address-_-location']''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-dateOfBirth']''',
      ));
  String? rsvp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['eventGuest-_-rsvp_txt']''',
      ));
  String? comment(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-comments']''',
      ));
  String? specialNeed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['person-_-specialNeeds']''',
      ));
}

class DeleteGuestCall {
  Future<ApiCallResponse> call({
    dynamic clientStateJson,
    String? caller = 'upcomingEventGridCursorGrid',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    final clientState = _serializeJson(clientStateJson);

    return ApiManager.instance.makeApiCall(
      callName: 'deleteGuest',
      apiUrl:
          '${baseUrl}/ui/nearestUpcomingEventGuestsTab/upcomingEventGridCursorGrid/deleteGuestInfoAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': caller,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
}

class SignUpCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? mobile = '',
    String? password = '',
    String? retypePassword = '',
    bool? termsAccepted = true,
    String? caller = '',
    String? clientState = '',
    String? id = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'signUp',
      apiUrl: '${baseUrl}/ui/consumerSignUpUI/consumerSignUpForm/signUp',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:caller': caller,
        'a:clientState': clientState,
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'mobile': mobile,
        'password': password,
        'retypePassword': retypePassword,
        'termsAccepted': termsAccepted,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
  bool? actionsucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? sucessMsgType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].type''',
      ));
  String? sucessText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
  String? errorMsgType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.type''',
      ));
}

class SignUpGetFormCall {
  Future<ApiCallResponse> call({
    String? cache = 'server',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'signUpGetForm',
      apiUrl: '${baseUrl}/data/consumerCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'cache': cache,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
}

class CLBXEnPersonNameSuffixCall {
  Future<ApiCallResponse> call({
    String? context = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnPersonNameSuffix',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnPersonNameSuffix\$?_dc=1745231232213&query=&uiContext=${context}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
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
}

class CLBXEnFamilyMemberRelationCall {
  Future<ApiCallResponse> call({
    String? context = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnFamilyMemberRelation',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnFamilyMemberRelation\$?_dc=1745231232213&query=&uiContext=${context}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
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
}

class SaveMyInformationCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? id = '',
    String? comments = '',
    String? interests = '',
    String? eduLevel = '',
    String? specialNeeds = '',
    String? postalCode = '',
    String? stateProvince = '',
    String? cityTown = '',
    String? addressLocalArea = '',
    String? addressStreet = '',
    String? addressFloorSection = '',
    String? addressBldgNum = '',
    String? addressToSearch = '',
    String? googlePlusHandle = '',
    String? twitterHandle = '',
    String? facebookHandle = '',
    String? website = '',
    String? fax = '',
    String? mobile = '',
    String? altWorkPhone = '',
    String? phone = '',
    String? altEmail = '',
    String? email = '',
    String? gender = '',
    String? date = '',
    String? middleName = '',
    String? lastName = '',
    String? firstName = '',
    String? suffixName = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'saveMyInformation',
      apiUrl: '${baseUrl}/ui/myInfoEdit/profileFormEdit/saveAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:autoRefreshOnSaveTarget': "myInfo__myProfileForm",
        'a:clientState': clientState,
        'a:caller': "profileFormEdit",
        '_id': id,
        'person.suffixName': suffixName,
        'person.firstName': firstName,
        'person.lastName': lastName,
        'person.middleName': middleName,
        'date': date,
        'person.gender': gender,
        'communication.email': email,
        'communication.altEmail': altEmail,
        'communication.phone': phone,
        'communication.altWorkPhone': altWorkPhone,
        'communication.mobile': mobile,
        'communication.fax': fax,
        'communication.website': website,
        'facebookHandle': facebookHandle,
        'twitterHandle': twitterHandle,
        'googlePlusHandle': googlePlusHandle,
        'addressToSearch': addressToSearch,
        'address.bldgNum': addressBldgNum,
        'address.floorSection': addressFloorSection,
        'address.street': addressStreet,
        'address.localArea': addressLocalArea,
        'address.cityTown': cityTown,
        'address.stateProvince': stateProvince,
        'address.postalCode': postalCode,
        'person.specialNeeds': specialNeeds,
        'person.eduLevel': eduLevel,
        'person.interests': interests,
        'person.comments': comments,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? textmsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'changePassword',
      apiUrl:
          '${baseUrl}/data/passwordCursor?_dc=1745233901818&format=js&label=Change%20Password&&a:clientState=%7B%22clientId%22%3A%22myInfo__myProfileForm%22%2C%22cursor%22%3A%7B%7D%7D&format=js&cache=server',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? formId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
}

class SaveChangedPasswordCall {
  Future<ApiCallResponse> call({
    String? confirmPwd = '',
    String? newPwd = '',
    String? id = '',
    String? clientState = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'saveChangedPassword',
      apiUrl: '${baseUrl}/ui/changePassword/changePasswordForm/savePassword',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': "changePasswordForm",
        '_id': id,
        'newPwd': newPwd,
        'confirmPwd': confirmPwd,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class SaveProfilePicCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? id = '',
    FFUploadedFile? picUpload,
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'saveProfilePic',
      apiUrl: '${baseUrl}/ui/upload/changeProfilePic/profilePicEditForm/save',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:autoRefreshOnSaveTarget': " ",
        'a:clientState': clientState,
        'a:caller': "profilePicEditForm",
        '_id': id,
        'picUpload': picUpload,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
}

class ProfilePicCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'profilePic',
      apiUrl:
          '${baseUrl}/data/profilePicCursor?_dc=1745294055047&format=js&label=Upload&&a:clientState=%7B%22clientId%22%3A%22myInfo__myProfileForm%22%2C%22cursor%22%3A%7B%7D%7D&format=js&cache=server',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? formId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
}

class FamilyMemberListCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'familyMemberList',
      apiUrl:
          '${baseUrl}/data/familyGridCursor?columns=familyMember.fullName,familyMember.communication.email,familyMember.communication.mobile,familyMember.communication.phone,memberRelation.name,familyMember.gender.name,familyMember.communication.phoneCountryCode,familyMember.age,familyMember.address.location,familyMember.dateOfBirth,familyMember.eduLevel.name&_dc=1745929482837&start=0&forceSelection=true&a%3AclientState=%7B%22clientId%22%3A%22myFamily__myFamilyPageGrid%22%2C%22cursor%22%3A%7B%7D%2C%22selection%22%3A%5B%5D%2C%22currentPage%22%3A1%7D&page=1&limit=100',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['familyMember-_-communication-_-email']''',
      ));
  String? relationName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['memberRelation-_-name']''',
      ));
  String? mobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['familyMember-_-communication-_-mobile']''',
      ));
  String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['familyMember-_-fullName']''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['familyMember-_-communication-_-phone']''',
      ));
  List<String>? age(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['familyMember-_-age']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['familyMember-_-gender-_-name']''',
      ));
  List<String>? dob(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['familyMember-_-dateOfBirth']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? education(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['familyMember-_-eduLevel-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? location(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['familyMember-_-address-_-location']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FamilyMemberEditCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? recordKey = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'familyMemberEdit',
      apiUrl:
          '${baseUrl}/data/familyCursor?columns=firstName,suffixName,middleName,lastName,dateOfBirth,age,gender,interests,phoneCountryCode,memberRelation,specialNeeds,allergy,comments,eduLevel,email,mobile,phone,address,address.location,address.bldgNum,address.floorSection,address.street,address.localArea,address.cityTown,address.stateProvince,address.postalCode&_dc=1745930707949&format=js&label=Family%20Member&recordKey=${recordKey}&&a:clientState=${clientState}&format=js&cache=server',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? formId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  String? eduLeveltxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eduLevel_txt''',
      ));
  String? middleName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].middleName''',
      ));
  String? allergy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].allergy''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].email''',
      ));
  String? eduLevel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eduLevel''',
      ));
  String? memberRelationId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].memberRelation''',
      ));
  String? gendertxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].gender_txt''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].dateOfBirth''',
      ));
  String? age(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].age''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].lastName''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].firstName''',
      ));
  String? interest(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].interests''',
      ));
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.details[:].address''',
      );
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-postalCode']''',
      ));
  String? stateProvi(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-stateProvince']''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-location']''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-cityTown']''',
      ));
  String? mobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].mobile''',
      ));
  String? memberRelationTxt(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].memberRelation_txt''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].phone''',
      ));
  String? comments(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].comments''',
      ));
  String? genderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].gender''',
      ));
  String? floor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-floorSection']''',
      ));
  String? bldgNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-bldgNum']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-street']''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-localArea']''',
      ));
  String? specialNeeds(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].specialNeeds''',
      ));
}

class MyFriendEditCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? recordKey = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'myFriendEdit',
      apiUrl:
          '${baseUrl}/data/myFriendEditCursor?columns=firstName,middleName,lastName,dateOfBirth,age,gender,interests,phoneCountryCode,familyMemberId,specialNeeds,allergy,comments,eduLevel,email,mobile,phone,address,address.location,address.bldgNum,address.floorSection,address.street,address.localArea,address.cityTown,address.stateProvince,address.postalCode&_dc=1745930707949&format=js&label=Family%20Member&recordKey=${recordKey}&&a:clientState=${clientState}&format=js&cache=server',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? formId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  String? eduLeveltxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eduLevel_txt''',
      ));
  String? middleName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].middleName''',
      ));
  String? allergy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].allergy''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].email''',
      ));
  String? eduLevel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eduLevel''',
      ));
  String? gendertxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].gender_txt''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].dateOfBirth''',
      ));
  String? age(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].age''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].lastName''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].firstName''',
      ));
  String? interest(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].interests''',
      ));
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.details[:].address''',
      );
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-postalCode']''',
      ));
  String? stateProvi(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-stateProvince']''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-location']''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-cityTown']''',
      ));
  String? mobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].mobile''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].phone''',
      ));
  String? comments(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].comments''',
      ));
  String? genderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].gender''',
      ));
  String? floor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-floorSection']''',
      ));
  String? bldgNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-bldgNum']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-street']''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['address-_-localArea']''',
      ));
  String? specialNeeds(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].specialNeeds''',
      ));
  String? familymemberId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].familyMemberId''',
      ));
}

class SaveFamilyMemberCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? formid = '',
    String? comments = '',
    String? interests = '',
    String? eduLevel = '',
    String? dateOfBirth = '',
    String? specialNeeds = '',
    String? allergy = '',
    String? postalCode = '',
    String? stateProvince = '',
    String? cityTown = '',
    String? localArea = '',
    String? street = '',
    String? floorSection = '',
    String? bldgNum = '',
    String? location = '',
    String? phone = '',
    String? mobile = '',
    String? email = '',
    String? memberRelation = '',
    String? age = '',
    String? gender = '',
    String? middleName = '',
    String? lastName = '',
    String? firstName = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'saveFamilyMember',
      apiUrl: '${baseUrl}/ui/myFamilyForm/myFamilyForm/saveFamilyMember',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:nextUI': " ",
        'a:clientState': clientState,
        'a:caller': "myFamilyForm",
        '_id': formid,
        'firstName': firstName,
        'lastName': lastName,
        'middleName': middleName,
        'gender': gender,
        'age': age,
        'memberRelation': memberRelation,
        'email': email,
        'mobile': mobile,
        'phone': phone,
        'address.location': location,
        'address.bldgNum': bldgNum,
        'address.floorSection': floorSection,
        'address.street': street,
        'address.localArea': localArea,
        'address.cityTown': cityTown,
        'address.stateProvince': stateProvince,
        'address.postalCode': postalCode,
        'allergy': allergy,
        'specialNeeds': specialNeeds,
        'dateOfBirth': dateOfBirth,
        'eduLevel': eduLevel,
        'interests': interests,
        'comments': comments,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SaveFriendCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? formid = '',
    String? comments = '',
    String? interests = '',
    String? eduLevel = '',
    String? dateOfBirth = '',
    String? specialNeeds = '',
    String? allergy = '',
    String? postalCode = '',
    String? stateProvince = '',
    String? cityTown = '',
    String? localArea = '',
    String? street = '',
    String? floorSection = '',
    String? bldgNum = '',
    String? location = '',
    String? phone = '',
    String? mobile = '',
    String? email = '',
    String? familyMemberId = '',
    String? age = '',
    String? gender = '',
    String? middleName = '',
    String? lastName = '',
    String? firstName = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'saveFriend',
      apiUrl: '${baseUrl}/ui/myFriendForm/myFriendForm/saveFamilyMember',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': "myFriendForm",
        '_id': formid,
        'firstName': firstName,
        'lastName': lastName,
        'middleName': middleName,
        'gender': gender,
        'age': age,
        'familyMemberId': familyMemberId,
        'email': email,
        'mobile': mobile,
        'phone': phone,
        'address.location': location,
        'address.bldgNum': bldgNum,
        'address.floorSection': floorSection,
        'address.street': street,
        'address.localArea': localArea,
        'address.cityTown': cityTown,
        'address.stateProvince': stateProvince,
        'address.postalCode': postalCode,
        'allergy': allergy,
        'specialNeeds': specialNeeds,
        'dateOfBirth': dateOfBirth,
        'eduLevel': eduLevel,
        'interests': interests,
        'comments': comments,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? sucessText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class DeleteFamilyMemberCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteFamilyMember',
      apiUrl: '${baseUrl}/ui/myFamily/myFamilyPageGrid/deleteFamily',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': "myFamilyPageGrid",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MyInfoPopulateAddressCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? clientState = '',
    String? id = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'myInfoPopulateAddress',
      apiUrl: '${baseUrl}/ui/myInfoEdit/profileFormEdit/populateAddress',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'myInfoEdit__profileFormEdit:r0:addressToSearch': query,
        'myInfoEdit__profileFormEdit:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|addressToSearch",
        'a:refreshView': "refreshAddress",
        'a:clientState': clientState,
        'a:caller': "profileFormEdit",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-localArea']''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-stateProvince']''',
      ));
  String? floor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-floorSection']''',
      ));
  String? postal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-postalCode']''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-cityTown']''',
      ));
  String? bldgNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-bldgNum']''',
      ));
  String? strret(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-street']''',
      ));
}

class MyfamilyPopulateAddressCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? clientState = '',
    String? id = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'myfamilyPopulateAddress',
      apiUrl: '${baseUrl}/ui/myFamilyForm/myFamilyForm/populateAddress',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'myFamilyForm__myFamilyForm:r0:address.location': query,
        'myFamilyForm__myFamilyForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|address.location",
        'a:refreshView': "refreshAddress",
        'a:clientState': clientState,
        'a:caller': "myFamilyForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-localArea']''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-stateProvince']''',
      ));
  String? floor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-floorSection']''',
      ));
  String? postal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-postalCode']''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-cityTown']''',
      ));
  String? bldgNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-bldgNum']''',
      ));
  String? strret(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-street']''',
      ));
}

class MyFriendPopulateAddressCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? clientState = '',
    String? id = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'myFriendPopulateAddress',
      apiUrl: '${baseUrl}/ui/myFriendForm/myFriendForm/populateAddress',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'myFriendForm__myFriendForm:r0:address.location': query,
        'myFriendForm__myFriendForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|address.location",
        'a:refreshView': "refreshAddress",
        'a:clientState': clientState,
        'a:caller': "myFriendForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-localArea']''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-stateProvince']''',
      ));
  String? floor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-floorSection']''',
      ));
  String? postal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-postalCode']''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-cityTown']''',
      ));
  String? bldgNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-bldgNum']''',
      ));
  String? strret(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-street']''',
      ));
}

class MyInfoAddressesSuggestionCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uiContext = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'myInfoAddressesSuggestion',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/profileCursorAddressSuggestions?_dc=1746171231885&query=${query}&uiContext=${uiContext}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
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
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class MyfamilyAddressesSuggestionCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uiContext = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'myfamilyAddressesSuggestion',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/familyCursorAddressSuggestions?_dc=1746171231885&query=${query}&uiContext=${uiContext}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
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
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class MyfriendAddressesSuggestionCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uiContext = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'myfriendAddressesSuggestion',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/myFriendEditCursorAddressSuggestions?_dc=1746171231885&query=${query}&uiContext=${uiContext}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
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
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class FriendListCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'friendList',
      apiUrl:
          '${baseUrl}/data/friendGridCursor?columns=person.fullName,person.communication.email,person.communication.mobile,person.communication.phone,person.gender.name,person.age,familyMember.familyMember.firstName,person.address.location,person.dateOfBirth,person.eduLevel.name,person.interests&_dc=1746213917671&start=0&forceSelection=true&a%3AclientState=%7B%22clientId%22%3A%22myFriend__myFriendPageGrid%22%2C%22cursor%22%3A%7B%7D%2C%22selection%22%3A%5B%5D%2C%22currentPage%22%3A1%7D&page=1&limit=100',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
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
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? phone(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['person-_-communication-_-phone']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? age(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['person-_-age']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? email(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['person-_-communication-_-email']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['person-_-fullName']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? familyFirstName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['familyMember-_-familyMember-_-firstName']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? gender(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['person-_-gender-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? mobile(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['person-_-communication-_-mobile']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? location(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['person-_-address-_-location']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? intersts(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['person-_-interests']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? education(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['person-_-eduLevel-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dob(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['person-_-dateOfBirth']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FriendDeleteActionCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'friendDeleteAction',
      apiUrl: '${baseUrl}/ui/myFriend/myFriendPageGrid/deleteFriend',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': "myFriendPageGrid",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? errorText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
  String? sucessText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class ExistingFamilyMemberCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'existingFamilyMember',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/existingFamilyMemberListPicker?_dc=1746218709039&query=&uiContext=${uiContext}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class AssignLocationCall {
  Future<ApiCallResponse> call({
    String? country = 'us',
    String? stateProvince = 'MA',
    String? postalCode = '02109',
    String? cityTown = 'Boston',
    String? geometrytype = 'Point',
    double? geometrycoordinates0 = -71.05683,
    double? geometrycoordinates1 = 42.358624,
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    final ffApiRequestBody = '''
{
  "country": "${escapeStringForJson(country)}",
  "stateProvince": "${escapeStringForJson(stateProvince)}",
  "postalCode": "${escapeStringForJson(postalCode)}",
  "cityTown": "${escapeStringForJson(cityTown)}",
  "geometry": {
    "type": "Point",
    "coordinates": [
      ${geometrycoordinates0},
      ${geometrycoordinates1}
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'assignLocation',
      apiUrl: '${baseUrl}/data/application/currentLocation',
      callType: ApiCallType.PUT,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? todo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo''',
      ));
}

class UpdateMobileDownLoadCursorCall {
  Future<ApiCallResponse> call({
    bool? isAndroid,
    String? email = '',
    bool? isVenue,
    bool? isRental,
    bool? isEntertainer,
    bool? isCake,
    bool? isFood,
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountInfoGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'updateMobileDownLoadCursor',
      apiUrl: '${baseUrl}/data/UpdateMobileDownLoadCursor',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'isAndroid': isAndroid,
        'email': email,
        'isVenue': isVenue,
        'isRental': isRental,
        'isEntertainer': isEntertainer,
        'isCake': isCake,
        'isFood': isFood,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End AccountInfo Group Code

/// Start ShoppingCart Group Code

class ShoppingCartGroup {
  static String getBaseUrl({
    String? url,
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'authorization': '[header]',
  };
  static ShoppingCartEventEditCursorCall shoppingCartEventEditCursorCall =
      ShoppingCartEventEditCursorCall();
  static CLBXEnCelebrationTypeCall cLBXEnCelebrationTypeCall =
      CLBXEnCelebrationTypeCall();
  static UpcomingEventsOptsCall upcomingEventsOptsCall =
      UpcomingEventsOptsCall();
  static DynamicThemeCategoryCall dynamicThemeCategoryCall =
      DynamicThemeCategoryCall();
  static CLBXEnEventStatusCall cLBXEnEventStatusCall = CLBXEnEventStatusCall();
  static CLBXEnPersonGenderCall cLBXEnPersonGenderCall =
      CLBXEnPersonGenderCall();
  static EventFormNextActionCall eventFormNextActionCall =
      EventFormNextActionCall();
  static ExistingEventChangedCall existingEventChangedCall =
      ExistingEventChangedCall();
  static DateAndTimeTabCursorCall dateAndTimeTabCursorCall =
      DateAndTimeTabCursorCall();
  static VenueWizardCall venueWizardCall = VenueWizardCall();
  static EventAddressCall eventAddressCall = EventAddressCall();
  static DateNTimeTabOnDatechangeCall dateNTimeTabOnDatechangeCall =
      DateNTimeTabOnDatechangeCall();
  static DateNTimeTabStartTimeCall dateNTimeTabStartTimeCall =
      DateNTimeTabStartTimeCall();
  static VenuePackageRequestToBookCall venuePackageRequestToBookCall =
      VenuePackageRequestToBookCall();
  static VenueSpaceRequestToBookCall venueSpaceRequestToBookCall =
      VenueSpaceRequestToBookCall();
  static EventChangedCelebrationTypeCall eventChangedCelebrationTypeCall =
      EventChangedCelebrationTypeCall();
  static EventAddressSuggestionCall eventAddressSuggestionCall =
      EventAddressSuggestionCall();
  static CartPaymentCursorCall cartPaymentCursorCall = CartPaymentCursorCall();
}

class ShoppingCartEventEditCursorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'shoppingCartEventEditCursor',
      apiUrl:
          '${baseUrl}/data/shoppingCartEventEditCursor?columns=upComingEvent,event.name,event.celebration,event.consumer.person.communication.email,event.consumer.person.communication.phone,event.idealDate,opsHours.startTime,opsHours.endTime,inquireComments,event.kidsInvitee,noOfKids,event.adultInvitee,noOfAdults,event.totalInvitee,totalInvitees,event.additionalInfo.celebrateePerson.firstName,event.additionalInfo.celebrateePerson.lastName,event.additionalInfo.celebrateePerson.age,event.additionalInfo.celebrateePerson.gender,event.address.bldgNum,event.address.street,event.address.floorSection,event.address.cityTown,event.address.stateProvince,event.address.postalCode,hasTheme,event.themeCategory,event.theme,event.description,event.additionalInfo.idealDateAlt1,event.additionalInfo.idealDateAlt2,event.eventStatus',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? totalInvitees(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-totalInvitee']''',
      ));
  String? noOfKids(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-kidsInvitee']''',
      ));
  String? hasTheme(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].hasTheme''',
      ));
  String? noOfAdults(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-adultInvitee']''',
      ));
  String? eventName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-name']''',
      ));
  String? eventStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-eventStatus']''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-consumer-_-person-_-communication-_-email']''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-consumer-_-person-_-communication-_-phone']''',
      ));
  String? eventDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-idealDate']''',
      ));
  String? eventStartTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['opsHours-_-startTime']''',
      ));
  String? eventEndTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['opsHours-_-endTime']''',
      ));
  String? celebrateeFirstName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-additionalInfo-_-celebrateePerson-_-firstName']''',
      ));
  String? celebrateeLastName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-additionalInfo-_-celebrateePerson-_-lastName']''',
      ));
  String? celebrateeAge(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-additionalInfo-_-celebrateePerson-_-age']''',
      ));
  String? celebrateeGender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-additionalInfo-_-celebrateePerson-_-gender']''',
      ));
  String? eventTheme(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-theme']''',
      ));
  String? hasThemetxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['hasTheme']''',
      ));
  String? eventThemeCategory(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-themeCategory']''',
      ));
  String? eventDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-description']''',
      ));
  String? eventCelebrationType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-celebration']''',
      ));
  String? upComingEvent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].upComingEvent''',
      ));
  String? altDate1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-additionalInfo-_-idealDateAlt1']''',
      ));
  String? altDate2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-additionalInfo-_-idealDateAlt2']''',
      ));
  String? ocKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? bldgNum(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-address-_-bldgNum']''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-address-_-postalCode']''',
      ));
  String? cityTown(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-address-_-cityTown']''',
      ));
  String? floorSection(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-address-_-floorSection']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-address-_-street']''',
      ));
  String? stateProvince(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-address-_-stateProvince']''',
      ));
}

class CLBXEnCelebrationTypeCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? uiContext = '',
    String? query = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnCelebrationType',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnCelebrationType\$',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        '_dc': "1741316602843",
        'query': query,
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UpcomingEventsOptsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'upcomingEventsOpts',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/shoppingCartEventEditCursorUpcomingEventOpts?_dc=1737986237808&query=&uiContext=%7B%22key%22%3A%22eventInfoForShoppingCart%22%2C%22params%22%3A%7B%22format%22%3A%5B%22js%22%5D%2C%22resourceType%22%3A%5B%220%22%5D%2C%22from%22%3A%5B%22venue%22%5D%2C%22recordKey%22%3A%5B%22225661%22%5D%2C%22type%22%3A%5B%221%22%5D%7D%2C%22component%22%3A%7B%22clientId%22%3A%22eventInfoForShoppingCart__eventForm%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22eventInfoForShoppingCart__eventForm%22%2C%22cursor%22%3A%7B%22__recordKey%22%3A%22225661%22%2C%22__cachedId%22%3A%22oc_6%22%7D%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class DynamicThemeCategoryCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? uiContext = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DynamicThemeCategory',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/shoppingCartThemeCategoryListPicker',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        '_dc': "1741320920719",
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CLBXEnEventStatusCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnEventStatus',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnEventStatus\$?_dc=1738145309266&query=&uiContext=%7B%22key%22%3A%22eventInfoForShoppingCart%22%2C%22params%22%3A%7B%22format%22%3A%5B%22js%22%5D%2C%22resourceType%22%3A%5B%220%22%5D%2C%22from%22%3A%5B%22venue%22%5D%2C%22recordKey%22%3A%5B%22225661%22%5D%2C%22type%22%3A%5B%221%22%5D%7D%2C%22component%22%3A%7B%22clientId%22%3A%22eventInfoForShoppingCart__eventForm%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22eventInfoForShoppingCart__eventForm%22%2C%22cursor%22%3A%7B%22__recordKey%22%3A%22225661%22%2C%22__cachedId%22%3A%22oc_5%22%7D%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CLBXEnPersonGenderCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnPersonGender',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnPersonGender\$?_dc=1738154387802&query=&uiContext=%7B%22key%22%3A%22eventInfoForShoppingCart%22%2C%22params%22%3A%7B%22format%22%3A%5B%22js%22%5D%2C%22resourceType%22%3A%5B%220%22%5D%2C%22from%22%3A%5B%22venue%22%5D%2C%22recordKey%22%3A%5B%22225661%22%5D%2C%22type%22%3A%5B%221%22%5D%7D%2C%22component%22%3A%7B%22clientId%22%3A%22eventInfoForShoppingCart__eventForm%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22eventInfoForShoppingCart__eventForm%22%2C%22cursor%22%3A%7B%22__recordKey%22%3A%22225661%22%2C%22__cachedId%22%3A%22oc_9%22%7D%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
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
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class EventFormNextActionCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
    int? recordKey = 225661,
    String? from = 'venue',
    String? type = '',
    int? parentRecordKey = -1,
    bool? inWizard = false,
    int? bakeryId = -1,
    int? package = 225661,
    String? quantity = '',
    int? resourceType = 0,
    int? dataActionType = 0,
    String? variations = '',
    bool? menuSection = false,
    String? upComingEvent = '',
    String? eventname = '',
    String? eventcelebration = '',
    String? email = '',
    String? phone = '',
    String? eventidealDate = '',
    String? opsHoursstartTime = '',
    String? opsHoursendTime = '',
    String? inquireComments = '',
    int? noOfKids,
    int? noOfAdults,
    int? totalInvitees,
    String? celebrateeFirstName = '',
    String? celebrateeLastName = '',
    String? celebrateeAge = '',
    String? celebrateeGender = '',
    String? addressToSearch = '',
    String? eventaddressbldgNum = '',
    String? eventaddressstreet = '',
    String? eventaddressfloorSection = '',
    String? eventaddresscityTown = '',
    String? eventaddressstateProvince = '',
    String? eventaddresspostalCode = '',
    bool? hasTheme = false,
    String? eventthemeCategory = '',
    String? eventtheme = '',
    String? eventdescription = '',
    String? eventadditionalInfoidealDateAlt1 = '',
    String? eventadditionalInfoidealDateAlt2 = '',
    String? eventeventStatus = '',
    bool? apitem = false,
    String? next = '',
    String? data = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'eventFormNextAction',
      apiUrl: '${baseUrl}/ui/eventInfoForShoppingCart/eventForm/next',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:nextUI': next,
        'ap:basic': false,
        'ap:recordKey': recordKey,
        'ap:from': from,
        'ap:type': type,
        'ap:parentRecordKey': parentRecordKey,
        'ap:inWizard': inWizard,
        'ap:bakeryId': bakeryId,
        'ap:package': package,
        'ap:index': "-1",
        'ap:quantity': quantity,
        'ap:item': apitem,
        'ap:resourceType': resourceType,
        'ap:dataActionType': dataActionType,
        'ap:variations': variations,
        'ap:menuSection': menuSection,
        'a:clientState':
            "{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"cursor\":{\"__recordKey\":\"225661\"}}",
        'a:caller:': "eventForm",
        '_id': id,
        'upComingEvent': upComingEvent,
        'event.name': eventname,
        'event.celebration': eventcelebration,
        'event.consumer.person.communication.email': email,
        'event.consumer.person.communication.phone': phone,
        'event.idealDate': eventidealDate,
        'opsHours.startTime': opsHoursstartTime,
        'opsHours.endTime': opsHoursendTime,
        'inquireComments': inquireComments,
        'noOfKids': noOfKids,
        'noOfAdults': noOfAdults,
        'totalInvitees': totalInvitees,
        'event.additionalInfo.celebrateePerson.firstName': celebrateeFirstName,
        'event.additionalInfo.celebrateePerson.lastName': celebrateeLastName,
        'event.additionalInfo.celebrateePerson.age': celebrateeAge,
        'event.additionalInfo.celebrateePerson.gender': celebrateeGender,
        'addressToSearch': addressToSearch,
        'event.address.bldgNum': eventaddressbldgNum,
        'event.address.street': eventaddressstreet,
        'event.address.floorSection': eventaddressfloorSection,
        'event.address.cityTown': eventaddresscityTown,
        'event.address.stateProvince': eventaddressstateProvince,
        'event.address.postalCode': eventaddresspostalCode,
        'hasTheme': hasTheme,
        'event.themeCategory': eventthemeCategory,
        'event.theme': eventtheme,
        'event.description': eventdescription,
        'event.additionalInfo.idealDateAlt1': eventadditionalInfoidealDateAlt1,
        'event.additionalInfo.idealDateAlt2': eventadditionalInfoidealDateAlt2,
        'event.eventStatus': eventeventStatus,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorToastMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
}

class ExistingEventChangedCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
    int? recordKey = 225661,
    String? from = 'venue',
    String? type = '',
    int? parentRecordKey = -1,
    bool? inWizard = false,
    int? bakeryId = -1,
    int? package = 225661,
    String? quantity = '',
    int? resourceType = 0,
    int? dataActionType = 0,
    String? variations = '',
    bool? menuSection = false,
    String? upComingEvent = '',
    String? eventname = '',
    String? eventcelebration = '',
    String? email = '',
    String? phone = '',
    String? eventidealDate = '',
    String? opsHoursstartTime = '',
    String? opsHoursendTime = '',
    String? inquireComments = '',
    int? noOfKids,
    int? noOfAdults,
    int? totalInvitees,
    String? celebrateeFirstName = '',
    String? celebrateeLastName = '',
    String? celebrateeAge = '',
    String? celebrateeGender = '',
    String? addressToSearch = '',
    int? eventaddressbldgNum,
    String? eventaddressstreet = '',
    String? eventaddressfloorSection = '',
    String? eventaddresscityTown = '',
    String? eventaddressstateProvince = '',
    String? eventaddresspostalCode = '',
    bool? hasTheme = false,
    String? eventthemeCategory = '',
    String? eventtheme = '',
    String? eventdescription = '',
    String? eventadditionalInfoidealDateAlt1 = '',
    String? eventadditionalInfoidealDateAlt2 = '',
    String? eventeventStatus = '',
    bool? apitem = false,
    String? next = '',
    String? data = '',
    String? changedEventId = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'existingEventChanged',
      apiUrl:
          '${baseUrl}/ui/eventInfoForShoppingCart/eventForm/setExistingEvent',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:nextUI': next,
        'ap:basic': false,
        'ap:recordKey': recordKey,
        'ap:from': from,
        'ap:type': type,
        'ap:parentRecordKey': parentRecordKey,
        'ap:inWizard': inWizard,
        'ap:bakeryId': bakeryId,
        'ap:package': package,
        'ap:index': "-1",
        'ap:quantity': quantity,
        'ap:item': apitem,
        'ap:resourceType': resourceType,
        'ap:dataActionType': dataActionType,
        'ap:variations': variations,
        'ap:menuSection': menuSection,
        'a:clientState':
            "{\"clientId\":\"eventInfoForShoppingCart__eventForm\",\"cursor\":{\"__recordKey\":\"225661\"}}",
        'a:caller:': "eventForm",
        '_id': id,
        'upComingEvent': upComingEvent,
        'event.name': eventname,
        'event.celebration': eventcelebration,
        'event.consumer.person.communication.email': email,
        'event.consumer.person.communication.phone': phone,
        'event.idealDate': eventidealDate,
        'opsHours.startTime': opsHoursstartTime,
        'opsHours.endTime': opsHoursendTime,
        'inquireComments': inquireComments,
        'noOfKids': noOfKids,
        'noOfAdults': noOfAdults,
        'totalInvitees': totalInvitees,
        'event.additionalInfo.celebrateePerson.firstName': celebrateeFirstName,
        'event.additionalInfo.celebrateePerson.lastName': celebrateeLastName,
        'event.additionalInfo.celebrateePerson.age': celebrateeAge,
        'event.additionalInfo.celebrateePerson.gender': celebrateeGender,
        'addressToSearch': addressToSearch,
        'event.address.bldgNum': eventaddressbldgNum,
        'event.address.street': eventaddressstreet,
        'event.address.floorSection': eventaddressfloorSection,
        'event.address.cityTown': eventaddresscityTown,
        'event.address.stateProvince': eventaddressstateProvince,
        'event.address.postalCode': eventaddresspostalCode,
        'hasTheme': hasTheme,
        'event.themeCategory': eventthemeCategory,
        'event.theme': eventtheme,
        'event.description': eventdescription,
        'event.additionalInfo.idealDateAlt1': eventadditionalInfoidealDateAlt1,
        'event.additionalInfo.idealDateAlt2': eventadditionalInfoidealDateAlt2,
        'event.eventStatus': eventeventStatus,
        'eventInfoForShoppingCart__eventForm:r0:upComingEvent': changedEventId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DateAndTimeTabCursorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? dc = '',
    String? resourceItemType = '',
    String? addOns = 'noAddOns',
    String? previous = 'hidePrevious',
    String? firstTab = 'DateAndTimeId',
    String? timeSlot = '0',
    bool? hours = false,
    String? recordKey = '12407',
    String? timeSlotId = '-1',
    String? type = '0',
    String? id = '',
    String? cache = '',
    String? quantity = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'dateAndTimeTabCursor',
      apiUrl:
          '${baseUrl}/data/dateAndTimeTabCursor?columns=priceToDisplay,hideCondnForCakeTypeItems,name,depositTemplate.resourceItemId,depositTemplate.denominatorId,depositTemplate.denomName,priceTemplate.unitPrice,quantity,priceTemplate.updateQuantity,description,depositTemplate.onDate,depositTemplate.startTime,depositTemplate.startTimeSlot,depositTemplate.onDateLabel,day,hour,min,depositTemplate.endTime,nextDay,depositTemplate.endTimeSlot,customDataForCake.customText,customDataForCake.customColor,noOfKids,noOfAdults,totalInvitees,depositTemplate.discount,totalPrice,depositTemplate.totalPriceNote,depositTemplate.minDepositVal,priceTemplate.installationFee,depositTemplate.fullPaymentNote,depositTemplate.minCancelFeeText,depositTemplate.bookingNote,altdate1,altdate2,depositTemplate.isTimeSlotAvailable',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        '_dc': dc,
        'format': "js",
        'resourceItemType': resourceItemType,
        'addOns': addOns,
        'previous': previous,
        'firstTab': firstTab,
        'timeSlot': timeSlot,
        'hours': hours,
        'recordKey': recordKey,
        'timeSlotId': timeSlotId,
        'type': type,
        '_id': id,
        'a:clientState':
            "{\"clientId\":\"dateAndTimeTab__dateAndTimeForm\",\"cursor\":{\"basic\":\"false\"}}",
        'cache': cache,
        'quantity': quantity,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? noOfAdults(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].noOfAdults''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].description''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].name''',
      ));
  String? noOfKids(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].noOfKids''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? totalInvitees(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalInvitees''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? nextDay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].nextDay''',
      ));
  String? day(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].day''',
      ));
  String? hour(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].hour''',
      ));
  String? min(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].min''',
      ));
  String? onDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-onDate']''',
      ));
  String? isTimeSlotAvailable(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-isTimeSlotAvailable']''',
      ));
  String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-startTime']''',
      ));
  String? endTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-endTime']''',
      ));
  String? startTimeSlot(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-startTimeSlot']''',
      ));
  String? denomNae(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-denomName']''',
      ));
  String? customText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['customDataForCake-_-customText']''',
      ));
  String? customColor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['customDataForCake-_-customColor']''',
      ));
  String? resourceItemId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-resourceItemId']''',
      ));
  String? denominaorId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-denominatorId']''',
      ));
  String? altdate1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['altdate1']''',
      ));
  String? altdate2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['altdate2']''',
      ));
  String? installationFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['priceTemplate-_-installationFee']''',
      ));
  String? unitPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['priceTemplate-_-unitPrice']''',
      ));
  String? minDepositVal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-minDepositVal']''',
      ));
  String? hideCondnForCakeTypeItems(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].hideCondnForCakeTypeItems''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].priceToDisplay''',
      ));
}

class VenueWizardCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueWizard',
      apiUrl:
          '${baseUrl}/ui/dateAndTimeTab?_dc=1739437845949&format=js&resourceItemType=0&addOns=showAddOns&previous=hidePrevious&firstTab=DateAndTimeId&timeSlot=0&hours=false&recordKey=40378&timeSlotId=-1&type=1',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EventAddressCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? addressToSearch = '',
    String? clientState = '',
    String? id = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'EventAddress',
      apiUrl: '${baseUrl}/ui/eventInfoForShoppingCart/eventForm/showAddress',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'eventInfoForShoppingCart__eventForm:r0:addressToSearch':
            addressToSearch,
        'eventInfoForShoppingCart__eventForm:r0:_saveData': false,
        '_id': id,
        'a:submitView': "self|addressToSearch",
        'a:refreshView': "refreshAddress",
        'a:clientState': clientState,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['event-_-address-_-stateProvince']''',
      ));
  String? buildno(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['event-_-address-_-bldgNum']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['event-_-address-_-street']''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['event-_-address-_-cityTown']''',
      ));
  String? postalcode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['event-_-address-_-postalCode']''',
      ));
}

class DateNTimeTabOnDatechangeCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? self = '',
    String? recordKey = '',
    String? resourceItemType = '',
    String? type = '',
    String? onDate = '',
    String? oc = '',
    String? client = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DateNTimeTabOnDatechange',
      apiUrl:
          '${baseUrl}/ui/dateAndTimeTab/dateAndTimeForm/calcTotalPriceAction',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:self': self,
        'ap:recordKey': recordKey,
        'ap:resourceItemType': resourceItemType,
        'ap:type': type,
        'ap:parentRecordKey': recordKey,
        'ap:menuSection': "false",
        'ap:variations': "-1",
        'dateAndTimeTab__dateAndTimeForm:r0:depositTemplate.onDate': onDate,
        'dateAndTimeTab__dateAndTimeForm:r0:_saveData': "false",
        '_id': oc,
        'a:submitView': "self|depositTemplate.onDate",
        'a:refreshView': "onDateChange",
        'a:clientState': client,
        'a:caller': "dateAndTimeForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DateNTimeTabStartTimeCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? uiContext = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'dateNTimeTabStartTime',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/cartStartTimeRestriction',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        '_dc': "1739792061512",
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VenuePackageRequestToBookCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? clientState = '',
    String? caller = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venuePackageRequestToBook',
      apiUrl: '${baseUrl}/ui/viewVenueDetail/venuePackagesGrid/addToCart',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:parentRecordKey': parentRecordKey,
        'a:clientState': clientState,
        'a:caller': caller,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? goToName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].name''',
      ));
  String? goToURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  dynamic todo(dynamic response) => getJsonField(
        response,
        r'''$.todo''',
      );
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class VenueSpaceRequestToBookCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? clientState = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueSpaceRequestToBook',
      apiUrl: '${baseUrl}/ui/viewVenueDetail/venueSpacesGrid/addToCart',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:parentRecordKey': parentRecordKey,
        'a:clientState': clientState,
        'a:caller': "venueSpacesGrid",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? goToName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].name''',
      ));
  String? goToURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class EventChangedCelebrationTypeCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? celebrationTypeId = '',
    String? ocKey = '',
    String? clientState = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'EventChangedCelebrationType',
      apiUrl:
          '${baseUrl}/ui/eventInfoForShoppingCart/eventForm/changeThemeCategory',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'eventInfoForShoppingCart__eventForm:r0:event.celebration':
            celebrationTypeId,
        'eventInfoForShoppingCart__eventForm:r0:_saveData': "false",
        '_id': ocKey,
        'a:submitView': "self|event.celebration",
        'a:refreshView': "themeCategoryFiled",
        'a:clientState': clientState,
        'a:caller': "eventForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class EventAddressSuggestionCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? query = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'eventAddressSuggestion',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/shoppingCartEventCursorAddressSuggestions',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        '_dc': "1742372796161",
        'query': query,
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

class CartPaymentCursorCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? clientState = '',
    String? consumerMailIdFromCheckOutUI = '',
    String? columns = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cartPaymentCursor',
      apiUrl: '${baseUrl}/data/cartPaymentCursor',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'parentRecordKey': parentRecordKey,
        'format': "js",
        'a:clientState': clientState,
        '_dc': "1748510123868",
        'consumerMailIdFromCheckOutUI': consumerMailIdFromCheckOutUI,
        'columns': columns,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? clientKeyForPaymentIntent(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].clientKeyForPaymentIntent''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End ShoppingCart Group Code

/// Start DateAndTimeTab Group Code

class DateAndTimeTabGroup {
  static String getBaseUrl({
    String? url,
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'authorization': '[header]',
  };
  static OnHourChangedCall onHourChangedCall = OnHourChangedCall();
  static StartTimeChangedCall startTimeChangedCall = StartTimeChangedCall();
  static TimeSlotChangedCall timeSlotChangedCall = TimeSlotChangedCall();
  static SaveCall saveCall = SaveCall();
  static StartTimeForSlotsCall startTimeForSlotsCall = StartTimeForSlotsCall();
  static KidsChangedCall kidsChangedCall = KidsChangedCall();
  static AdultsChangedCall adultsChangedCall = AdultsChangedCall();
  static TotalInviteeChangedCall totalInviteeChangedCall =
      TotalInviteeChangedCall();
  static DateRestrictionCall dateRestrictionCall = DateRestrictionCall();
  static VariationOptionsCall variationOptionsCall = VariationOptionsCall();
  static SetDenominatorCall setDenominatorCall = SetDenominatorCall();
  static OnDayChangedRentalCall onDayChangedRentalCall =
      OnDayChangedRentalCall();
  static CLBXEnColorTypeCall cLBXEnColorTypeCall = CLBXEnColorTypeCall();
}

class OnHourChangedCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? recordKey = '',
    String? resourceItemType = '',
    String? type = '',
    String? quantity = '',
    String? hour = '',
    String? id = '',
    String? clientState = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'onHourChanged',
      apiUrl:
          '${baseUrl}/ui/dateAndTimeTab/dateAndTimeForm/calcTotalPriceAction',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:self': "hour",
        'ap:recordKey': recordKey,
        'ap:resourceItemType': resourceItemType,
        'ap:type': type,
        'ap:parentRecordKey': recordKey,
        'ap:quantity': quantity,
        'dateAndTimeTab__dateAndTimeForm:r0:hour': hour,
        'dateAndTimeTab__dateAndTimeForm:r0:_saveData': false,
        '_id': id,
        'a:submitView': "self|hour",
        'a:refreshView': "refreshTotalPrice",
        'a:clientState': clientState,
        'a:caller': "dateAndTimeForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? ocToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? totalInvitee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalInvitees''',
      ));
  String? endTimeInString(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['depositTemplate-_-endTime']''',
      ));
  String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['depositTemplate-_-startTime']''',
      ));
  String? minDepositVal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['depositTemplate-_-minDepositVal']''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceToDisplay''',
      ));
}

class StartTimeChangedCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? recordKey = '',
    String? resourceItemType = '',
    String? type = '',
    String? quantity = '',
    String? startTime = '',
    String? id = '',
    String? clientState = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'startTimeChanged',
      apiUrl:
          '${baseUrl}/ui/dateAndTimeTab/dateAndTimeForm/calcTotalPriceAction',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:self': "startTime",
        'ap:recordKey': recordKey,
        'ap:resourceItemType': resourceItemType,
        'ap:type': type,
        'ap:parentRecordKey': recordKey,
        'ap:quantity': quantity,
        'dateAndTimeTab__dateAndTimeForm:r0:depositTemplate.startTime':
            startTime,
        'dateAndTimeTab__dateAndTimeForm:r0:_saveData': false,
        '_id': id,
        'a:submitView': "self|depositTemplate.startTime",
        'a:refreshView': "startTimeChange",
        'a:clientState': clientState,
        'a:caller': "dateAndTimeForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? oc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? noOfAdults(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].noOfAdults''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? noOfKids(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].noOfKids''',
      ));
  String? nextDay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].nextDay''',
      ));
  String? totalInvitee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalInvitees''',
      ));
  String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['depositTemplate-_-startTime']''',
      ));
  String? endTimeInString(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['depositTemplate-_-endTime']''',
      ));
  String? durationInMins(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['depositTemplate-_-duration']''',
      ));
}

class TimeSlotChangedCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? recordKey = '',
    String? resourceItemType = '',
    String? type = '',
    String? quantity = '',
    String? startTimeSlot = '',
    String? id = '',
    String? clientState = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'timeSlotChanged',
      apiUrl:
          '${baseUrl}/ui/dateAndTimeTab/dateAndTimeForm/calcTotalPriceAction',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:self': "startTime",
        'ap:recordKey': recordKey,
        'ap:resourceItemType': resourceItemType,
        'ap:type': type,
        'ap:parentRecordKey': recordKey,
        'dateAndTimeTab__dateAndTimeForm:r0:depositTemplate.startTimeSlot':
            startTimeSlot,
        'dateAndTimeTab__dateAndTimeForm:r0:_saveData': false,
        '_id': id,
        'a:submitView': "self|depositTemplate.startTimeSlot",
        'a:refreshView': "refreshTotalPrice",
        'a:clientState': clientState,
        'a:caller': "dateAndTimeForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? oc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? noOfAdults(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].noOfAdults''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? noOfKids(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].noOfKids''',
      ));
  String? nextDay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].nextDay''',
      ));
  String? totalInvitee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalInvitees''',
      ));
  String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['depositTemplate-_-startTime']''',
      ));
  String? endTimeSlotInString(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['depositTemplate-_-endTimeSlot']''',
      ));
}

class SaveCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? recordKey = '',
    String? resourceItemType = '',
    String? type = '',
    String? package = '',
    String? basic = '',
    String? from = '',
    String? rental = '',
    String? quantity = '',
    String? variation = '',
    String? clientstate = '',
    String? id = '',
    String? denominatorId = '',
    String? quantityWithoutAp = '',
    String? onDate = '',
    String? startTime = '',
    String? startTimeSlot = '',
    String? hour = '',
    String? min = '',
    String? customText = '',
    String? customColor = '',
    String? noOfKids = '',
    String? noOfAdults = '',
    String? totalInvitees = '',
    bool? discount = false,
    String? altdate1 = '',
    String? altdate2 = '',
    String? item = '',
    String? endTimeSlot = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'save',
      apiUrl: '${baseUrl}/ui/dateAndTimeTab/dateAndTimeForm/next',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:recordKey': recordKey,
        'ap:resourceItemType': resourceItemType,
        'ap:type': type,
        'ap:package': package,
        'ap:basic': basic,
        'ap:from': from,
        'ap:rental': rental,
        'ap:quantity': quantity,
        'ap:menuSection': false,
        'ap:variations': variation,
        'a:clientState': clientstate,
        'a:caller': "dateAndTimeForm",
        '_id': id,
        'depositTemplate.denominatorId': denominatorId,
        'quantity': quantityWithoutAp,
        'depositTemplate.onDate': onDate,
        'depositTemplate.startTime': startTime,
        'depositTemplate.startTimeSlot': startTimeSlot,
        'hour': hour,
        'min': min,
        'customDataForCake.customText': customText,
        'customDataForCake.customColor': customColor,
        'noOfKids': noOfKids,
        'noOfAdults': noOfAdults,
        'totalInvitees': totalInvitees,
        'depositTemplate.discount': discount,
        'altdate1': altdate1,
        'altdate2': altdate2,
        'ap:item': item,
        'depositTemplate.endTimeSlot': endTimeSlot,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccessForRestriction(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List<String>? popUpMsgType(dynamic response) => (getJsonField(
        response,
        r'''$.todo.messages.toasts[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? popUpMsgText(dynamic response) => (getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? allItemRequests(dynamic response) => getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.itemRequests''',
        true,
      ) as List?;
  dynamic itemRequest(dynamic response) => getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.itemRequests[:].resourceItemRequest''',
      );
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  int? cartCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  int? cartCountForAnonymous(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.long_term.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
}

class StartTimeForSlotsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? uiContext = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'startTimeForSlots',
      apiUrl: '${baseUrl}/data/uiCursorEnumRestriction/cartTimeSlotRestriction',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        '_dc': "1739972532315",
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class KidsChangedCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? recordKey = '',
    String? resourceItemType = '',
    String? type = '',
    String? kids = '',
    String? id = '',
    String? clientState = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'KidsChanged',
      apiUrl:
          '${baseUrl}/ui/dateAndTimeTab/dateAndTimeForm/calcTotalPriceAction',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:self': "noOfKids",
        'ap:recordKey': recordKey,
        'ap:resourceItemType': resourceItemType,
        'ap:type': type,
        'ap:parentRecordKey': recordKey,
        'dateAndTimeTab__dateAndTimeForm:r0:noOfKids': kids,
        'dateAndTimeTab__dateAndTimeForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|noOfKids",
        'a:refreshView': "reFreshAdultsAndPrice",
        'a:clientState': clientState,
        'a:caller': "dateAndTimeForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? noOfAdults(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].noOfAdults''',
      ));
  String? ocKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? totalInvitee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalInvitees''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceToDisplay''',
      ));
}

class AdultsChangedCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? recordKey = '',
    String? resourceItemType = '',
    String? type = '',
    String? adults = '',
    String? clientState = '',
    String? ocKey = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'AdultsChanged',
      apiUrl:
          '${baseUrl}/ui/dateAndTimeTab/dateAndTimeForm/calcTotalPriceAction',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:self': "noOfAdults",
        'ap:recordKey': recordKey,
        'ap:resourceItemType': resourceItemType,
        'ap:type': type,
        'ap:parentRecordKey': recordKey,
        'dateAndTimeTab__dateAndTimeForm:r0:noOfAdults': adults,
        'dateAndTimeTab__dateAndTimeForm:r0:_saveData': "false",
        'a:submitView': "self|noOfAdults",
        'a:refreshView': "reFreshKidsAndPrice",
        'a:clientState': clientState,
        'a:caller': "dateAndTimeForm",
        '_id': ocKey,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? noOfKids(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].noOfKids''',
      ));
  String? totalInvitees(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalInvitees''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceToDisplay''',
      ));
}

class TotalInviteeChangedCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? recordKey = '',
    String? resourceItemType = '',
    String? type = '',
    String? totalInvitees = '',
    String? clientState = '',
    String? ocKey = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'TotalInviteeChanged',
      apiUrl:
          '${baseUrl}/ui/dateAndTimeTab/dateAndTimeForm/calcTotalPriceAction',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:self': "totalInvitees",
        'ap:recordKey': recordKey,
        'ap:resourceItemType': resourceItemType,
        'ap:type': type,
        'ap:parentRecordKey': recordKey,
        'dateAndTimeTab__dateAndTimeForm:r0:totalInvitees': totalInvitees,
        'dateAndTimeTab__dateAndTimeForm:r0:_saveData': "false",
        'a:submitView': "self|totalInvitees",
        'a:refreshView': "reFreshKidsAdultAndPrice",
        'a:clientState': clientState,
        'a:caller': "dateAndTimeForm",
        '_id': ocKey,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? noOfKids(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].noOfKids''',
      ));
  String? totalInvitees(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalInvitees''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceToDisplay''',
      ));
}

class DateRestrictionCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? uicontext = '',
    String? filters = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'dateRestriction',
      apiUrl: '${baseUrl}/data/uiCursorDateRestriction/cartDatesRestriction',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        '_dc': "1740310480229",
        'uiContext': uicontext,
        'filters': filters,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

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
  List<String>? isDayRestriction(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].isDayRestriction''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? tp(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].tp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VariationOptionsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? query = '',
    String? uiContext = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'variationOptions',
      apiUrl: '${baseUrl}/data/uiCursorEnumRestriction/variationListpicker',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        '_dc': "1740381337713",
        'query': query,
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SetDenominatorCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? resourceItemType = '',
    String? type = '',
    String? parentRecordKey = '',
    String? denominatorId = '',
    String? id = '',
    String? clientState = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'setDenominator',
      apiUrl: '${baseUrl}/ui/dateAndTimeTab/dateAndTimeForm/setDenominatorData',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:resourceItemType': resourceItemType,
        'ap:type': type,
        'ap:parentRecordKey': parentRecordKey,
        'dateAndTimeTab__dateAndTimeForm:r0:depositTemplate.denominatorId':
            denominatorId,
        'dateAndTimeTab__dateAndTimeForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|depositTemplate.denominatorId",
        'a:clientState': clientState,
        'a:caller': "dateAndTimeForm",
        'a:refreshView: ': "refreshBasicThing",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceToDisplay''',
      ));
}

class OnDayChangedRentalCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? resourceItemType = '',
    String? type = '',
    String? parentRecordKey = '',
    String? day = '',
    String? id = '',
    String? clientstate = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'onDayChangedRental',
      apiUrl:
          '${baseUrl}/ui/dateAndTimeTab/dateAndTimeForm/calcTotalPriceAction',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${header}',
        'cbxtoken': '${token}',
      },
      params: {
        'ap:self': "day",
        'ap:recordKey': recordKey,
        'ap:resourceItemType': resourceItemType,
        'ap:type': type,
        'ap:parentRecordKey': parentRecordKey,
        'contains_dateAndTimeTab__dateAndTimeTab__dateAndTimeForm:r0:day': day,
        'contains_dateAndTimeTab__dateAndTimeTab__dateAndTimeForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|day",
        'a:refreshView': "refreshTotalPrice",
        'a:clientState': clientstate,
        'a:caller': "dateAndTimeForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? nextDay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].nextDay''',
      ));
  String? totalInvitees(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalInvitees''',
      ));
  String? minDepositVal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['depositTemplate-_-minDepositVal']''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceToDisplay''',
      ));
}

class CLBXEnColorTypeCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uiContext = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = DateAndTimeTabGroup.getBaseUrl(
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnColorType',
      apiUrl: '${baseUrl}/data/uiEnumerationRestriction/CLBXEnColorType\$',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744684353926",
        'query': query,
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

/// End DateAndTimeTab Group Code

/// Start EventGuest Information Group Code

class EventGuestInformationGroup {
  static String getBaseUrl({
    String? url,
    String? token = '',
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static AddGuestCall addGuestCall = AddGuestCall();
  static CLBXEnPersonGenderGuestCall cLBXEnPersonGenderGuestCall =
      CLBXEnPersonGenderGuestCall();
  static AddGuestCursorCall addGuestCursorCall = AddGuestCursorCall();
  static EditGuestCursorCall editGuestCursorCall = EditGuestCursorCall();
  static EventGuestTypeCall eventGuestTypeCall = EventGuestTypeCall();
  static AddEventGuestCursorRelationOptsCall
      addEventGuestCursorRelationOptsCall =
      AddEventGuestCursorRelationOptsCall();
  static ExistingFamilyMemberListPickerCall existingFamilyMemberListPickerCall =
      ExistingFamilyMemberListPickerCall();
  static CLBXEnEduLevelCall cLBXEnEduLevelCall = CLBXEnEduLevelCall();
  static CLBXEnGuestRSVPCall cLBXEnGuestRSVPCall = CLBXEnGuestRSVPCall();
  static CLBXEnGuestSecurityCall cLBXEnGuestSecurityCall =
      CLBXEnGuestSecurityCall();
  static GuestTypeChangedCall guestTypeChangedCall = GuestTypeChangedCall();
  static AddressSuggestionGetCall addressSuggestionGetCall =
      AddressSuggestionGetCall();
  static PopulateAddressCall populateAddressCall = PopulateAddressCall();
  static GuestListCall guestListCall = GuestListCall();
}

class AddGuestCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? guestType = '',
    String? familyMemberId = '',
    String? personFirstName = '',
    String? personLastName = '',
    String? personMiddleName = '',
    String? personCommunicationEmail = '',
    String? memberRelation = '',
    String? personAge = '',
    String? personGender = '',
    String? personAddressLocalArea = '',
    String? personAddressStreet = '',
    String? personAddressFloorSection = '',
    String? personAddressBldgNum = '',
    String? personCommunicationMobile = '',
    String? personAddressLocation = '',
    bool? personSpecialNeeds,
    String? personAddressPostalCode = '',
    String? personAddressStateProvince = '',
    String? personAddressCityTown = '',
    String? eventGuestRsvp = '',
    String? personComments = '',
    String? personEduLevel = '',
    String? personDateOfBirth = '',
    String? personInterests = '',
    String? eventGuestRsvpComments = '',
    String? personCommunicationPhone = '',
    String? eventGuestsecurity = '',
    bool? personAllergy,
    String? id = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'AddGuest',
      apiUrl: '${baseUrl}/ui/addEventGuestUI/addEventGuestForm/save',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:autoRefreshOnSaveTarget':
            "nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid",
        'a:clientState': clientState,
        'a:caller': "addEventGuestForm",
        '_id': id,
        'guestType': guestType,
        'familyMemberId': familyMemberId,
        'person.firstName': personFirstName,
        'person.lastName': personLastName,
        'person.middleName': personMiddleName,
        'person.gender': personGender,
        'person.age': personAge,
        'memberRelation': memberRelation,
        'person.communication.email': personCommunicationEmail,
        'person.communication.phone': personCommunicationPhone,
        'person.communication.mobile': personCommunicationMobile,
        'person.address.location': personAddressLocation,
        'person.address.bldgNum': personAddressBldgNum,
        'person.address.floorSection': personAddressFloorSection,
        'person.address.street': personAddressStreet,
        'person.address.localArea': personAddressLocalArea,
        'person.address.cityTown': personAddressCityTown,
        'person.address.stateProvince': personAddressStateProvince,
        'person.address.postalCode': personAddressPostalCode,
        'person.specialNeeds': personSpecialNeeds,
        'person.allergy': personAllergy,
        'person.interests': personInterests,
        'person.dateOfBirth': personDateOfBirth,
        'person.eduLevel': personEduLevel,
        'person.comments': personComments,
        'eventGuest.rsvp': eventGuestRsvp,
        'eventGuest.rsvpComments': eventGuestRsvpComments,
        'eventGuest.security': eventGuestsecurity,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? messageSucess(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class CLBXEnPersonGenderGuestCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnPersonGenderGuest',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnPersonGender\$?_dc=1740651221521&query=&uiContext=${uiContext}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AddGuestCursorCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? clientState = '',
    String? cache = 'server',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'AddGuestCursor',
      apiUrl:
          '${baseUrl}/data/addEventGuestCursor?_dc=1740652742453&format=js&label=New%20Guest&parentRecordKey=${parentRecordKey}&autoRefreshOnSaveTarget=nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid&&a:clientState=${clientState}&format=js',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'cache': cache,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idForm(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
}

class EditGuestCursorCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? clientState = '',
    String? cache = 'server',
    String? recordKey = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'EditGuestCursor',
      apiUrl:
          '${baseUrl}/data/addEventGuestCursor?_dc=1740652742453&format=js&label=New%20Guest&parentRecordKey=${parentRecordKey}&recordKey=${recordKey}&autoRefreshOnSaveTarget=nearestUpcomingEventGuestsTab__upcomingEventGridCursorGrid&&a:clientState=${clientState}&format=js',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'cache': cache,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idForm(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.firstName''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.gender''',
      ));
  String? relation(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].memberRelationName''',
      ));
  String? guestType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].guestTypeName''',
      ));
  String? eduLeval(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.eduLevel''',
      ));
  bool? specialNeeds(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.details[:].person.specialNeeds''',
      ));
  bool? allergy(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.details[:].person.allergy''',
      ));
  String? guestSecurity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventGuest.security''',
      ));
  String? rsvpmsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventGuest.rsvp''',
      ));
  String? rsvpComments(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventGuest.rsvpComments''',
      ));
  String? persomComments(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.comments''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.lastName''',
      ));
  String? middleName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.middleName''',
      ));
  String? intersts(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.interests''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].person.dateOfBirth''',
      ));
  int? age(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.details[:].person.age''',
      ));
  dynamic communication(dynamic response) => getJsonField(
        response,
        r'''$.details[:].communication''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.details[:].address''',
      );
  dynamic person(dynamic response) => getJsonField(
        response,
        r'''$.details[:].person''',
      );
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address.country''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address.stateProvince''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address.postalCode''',
      ));
  String? cityTown(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address.cityTown''',
      ));
  String? strrect(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address.street''',
      ));
  String? bldgNum(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address.bldgNum''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address.localArea''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address.location''',
      ));
  String? mobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].communication.mobile''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].communication.email''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].communication.phone''',
      ));
  String? genderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].gender''',
      ));
  String? memberRelationId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].memberRelation''',
      ));
  String? guestTypeId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].guestType''',
      ));
  String? familymeberId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].familyMemberId''',
      ));
  String? guestRSVPId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].guestRSVP''',
      ));
  String? eventSecurityId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventSecurity''',
      ));
  String? eduLevelId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eduLevel''',
      ));
  String? floor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address.floorSection''',
      ));
}

class EventGuestTypeCall {
  Future<ApiCallResponse> call({
    String? ui = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'EventGuestType',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/EventGuestType\$?_dc=1740657007223&query=&uiContext=${ui}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AddEventGuestCursorRelationOptsCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addEventGuestCursorRelationOpts',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/addEventGuestCursorRelationOpts?_dc=1740657173011&query=&uiContext=${uiContext}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class ExistingFamilyMemberListPickerCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'existingFamilyMemberListPicker',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/existingFamilyMemberListPicker?_dc=1740657182605&uiContext=${uiContext}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CLBXEnEduLevelCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnEduLevel',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnEduLevel\$?_dc=1740657689139&query=&uiContext=${uiContext}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CLBXEnGuestRSVPCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnGuestRSVP',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnGuestRSVP\$?_dc=1740657815680&query=&uiContext=${uiContext}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CLBXEnGuestSecurityCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnGuestSecurity',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnGuestSecurity\$?_dc=1740657819302&query=&uiContext=${uiContext}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class GuestTypeChangedCall {
  Future<ApiCallResponse> call({
    String? guestTypeid = '0',
    String? id = 'oc_19',
    String? clientState =
        '{\"clientId\":\"addEventGuestUI__addEventGuestForm\",\"cursor\":{\"parentRecordKey\":\"9\",\"__cachedId\":\"oc_19\"}}',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'guestTypeChanged',
      apiUrl:
          '${baseUrl}/ui/addEventGuestUI/addEventGuestForm/guestTypeChanged',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'addEventGuestUI__addEventGuestForm:r0:guestType': guestTypeid,
        'addEventGuestUI__addEventGuestForm:r0:_saveData': " false",
        '_id': id,
        'a:submitView': "self|guestType",
        'a:refreshView': "whenGuestTypeChanged",
        'a:clientState': clientState,
        'a:caller': " addEventGuestForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class AddressSuggestionGetCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addressSuggestionGet',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/addEventGuestCursorAddressSuggestions?_dc=1740992502189&query=${query}&uiContext=${clientState}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalcount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PopulateAddressCall {
  Future<ApiCallResponse> call({
    String? location = '',
    String? id = '',
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'populateAddress',
      apiUrl: '${baseUrl}/ui/addEventGuestUI/addEventGuestForm/populateAddress',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'addEventGuestUI__addEventGuestForm:r0:person.address.location':
            location,
        'addEventGuestUI__addEventGuestForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|person.address.location",
        'a:refreshView': "refreshAddress",
        'a:clientState': clientState,
        'a:caller': "addEventGuestForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? dataOuter(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data''',
      );
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  List<String>? floor(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].data.details[:]['person-_-address-_-floorSection']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['person-_-address-_-stateProvince']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['person-_-address-_-street']''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['person-_-address-_-cityTown']''',
      ));
  String? bldgNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['person-_-address-_-bldgNum']''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['person-_-address-_-postalCode']''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['person-_-address-_-localArea']''',
      ));
}

class GuestListCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventGuestInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'guestList',
      apiUrl:
          '${baseUrl}/data/guestGridCursor?columns=name,address,phone,guestType,relation,addressFormatted&_dc=1738062044390&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? guestType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].guestType''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].name''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

/// End EventGuest Information Group Code

/// Start ShoppingCartSummaryUI Group Code

class ShoppingCartSummaryUIGroup {
  static String getBaseUrl({
    String? url,
    String? token = '',
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static SummaryVenueItemsCursorCall summaryVenueItemsCursorCall =
      SummaryVenueItemsCursorCall();
  static EventInfoCall eventInfoCall = EventInfoCall();
  static AllVenueItemsCall allVenueItemsCall = AllVenueItemsCall();
  static AllRentalItemsCall allRentalItemsCall = AllRentalItemsCall();
  static AllCakeItemsCall allCakeItemsCall = AllCakeItemsCall();
  static AllEntertainerItemsCall allEntertainerItemsCall =
      AllEntertainerItemsCall();
  static TaxBoxCursorCall taxBoxCursorCall = TaxBoxCursorCall();
  static DeleteVenueItemCall deleteVenueItemCall = DeleteVenueItemCall();
  static AddOnSingleCall addOnSingleCall = AddOnSingleCall();
  static IncludedSingleCall includedSingleCall = IncludedSingleCall();
  static IncludedGroupCall includedGroupCall = IncludedGroupCall();
  static AddonGroupCall addonGroupCall = AddonGroupCall();
  static AddOnDeleteCall addOnDeleteCall = AddOnDeleteCall();
  static VenueEditActionCall venueEditActionCall = VenueEditActionCall();
  static RentalEditActionCall rentalEditActionCall = RentalEditActionCall();
  static CakeEditActionCall cakeEditActionCall = CakeEditActionCall();
  static CustomCakeEditCall customCakeEditCall = CustomCakeEditCall();
  static NavigateToVendorCall navigateToVendorCall = NavigateToVendorCall();
  static ClearCartCall clearCartCall = ClearCartCall();
  static DeleteRentalItemCall deleteRentalItemCall = DeleteRentalItemCall();
  static RentalQuantityActionCall rentalQuantityActionCall =
      RentalQuantityActionCall();
  static DeleteEntertainerItemCall deleteEntertainerItemCall =
      DeleteEntertainerItemCall();
  static DeleteCakeItemCall deleteCakeItemCall = DeleteCakeItemCall();
  static AllCustomCakesCall allCustomCakesCall = AllCustomCakesCall();
  static CakeQuantityActionCall cakeQuantityActionCall =
      CakeQuantityActionCall();
  static CustomCakeQuantityActionCall customCakeQuantityActionCall =
      CustomCakeQuantityActionCall();
  static CustomCakeDeleteActionCall customCakeDeleteActionCall =
      CustomCakeDeleteActionCall();
  static AddOnQuantityActionsCall addOnQuantityActionsCall =
      AddOnQuantityActionsCall();
}

class SummaryVenueItemsCursorCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'summaryVenueItemsCursor',
      apiUrl: '${baseUrl}/data/summaryVenueItemCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EventInfoCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'eventInfo',
      apiUrl:
          '${baseUrl}/data/shoppingCartSummaryCursor?columns=totalCostDisplay,specialComments,themeCategory.name,theme,totalCost,altdate2,altdate1,celebrateeGender.name,celebrateeAge,celebratee,numOftotalInvitee,numOfAdults,numOfKids,time,idealDate,phone,email,name,celebrationType.name,eventAddress,eventDescription,eventName',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? eventName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventName''',
      ));
  String? eventAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventAddress''',
      ));
  String? consumerName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].name''',
      ));
  String? totalCost(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalCost''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].email''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? noOfAdults(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].numOfAdults''',
      ));
  String? idealDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].idealDate''',
      ));
  String? totalInvitees(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].numOftotalInvitee''',
      ));
  String? timeString(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].time''',
      ));
  String? noOfKids(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].numOfKids''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].phone''',
      ));
  String? celebrationType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['celebrationType-_-name']''',
      ));
  String? celebrateeGender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['celebrateeGender-_-name']''',
      ));
  String? celebrateeAge(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].celebrateeAge''',
      ));
  String? themeCategoryName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['themeCategory-_-name']''',
      ));
  String? theme(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].theme''',
      ));
  String? celebratee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].celebratee''',
      ));
  String? altdate1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].altdate1''',
      ));
  String? altdate2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].altdate2''',
      ));
  String? eventDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventDescription''',
      ));
  String? totalCostDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalCostDisplay''',
      ));
}

class AllVenueItemsCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'allVenueItems',
      apiUrl:
          '${baseUrl}/data/summaryVenueItemCursor?columns=rentalTimeNPaymentMsg.vendorHasStripeLabel,rentalTimeNPaymentMsg.vendorHasPriceWithoutStripeLabel,resourceItemRequest.vendorAddress,resourceItemRequest.adultInvitee,resourceItemRequest.kidsInvitee,resourceItemRequest.resourceType.name,resourceItemRequest.vendorName,resourceItemRequest.vendorAddress,resourceItemRequest.itemType,totalPrice,resourceItemName,resourceItemRequest.itemDescription,emptyColumn,resourceItemRequest.date,resourceItemRequest.itemTime,additionalInfo.endDate,emptyColumn,resourceItemRequest.Quantity,personServerd,resourceItemRequest.resourceItem.additionalInfo.maxPersons,resourceItemRequest.totalInvitee,Address,emptyColumn,resourceItemRequest.unitPriceStringFmt,emptyColumn,addOn,addonGroup,menuItemRequest.customTextColorWithLabel,menuItemRequest.customTextWithLabel,emptyColumn,defaultOptions.defaultOptionLabel,defaultOptions.flavours,defaultOptions.secFlavour,defaultOptions.terFlavour,defaultOptions.size,defaultOptions.themeCategory,defaultOptions.themeName,defaultOptions.fillings,defaultOptions.secFilling,defaultOptions.terFilling,defaultOptions.cakeIcing,defaultOptions.secCakeIcing,defaultOptions.layer,defaultOptions.color,defaultOptions.decorType,defaultOptions.borderType,defaultOptions.shape,emptyColumn,cakeCustomization,customizationOptions.flavours,customizationOptions.secFlavour,customizationOptions.terFlavour,customizationOptions.size,customizationOptions.themeCategory,customizationOptions.themeName,customizationOptions.fillings,customizationOptions.secFilling,customizationOptions.terFilling,customizationOptions.cakeIcing,customizationOptions.secCakeIcing,customizationOptions.layer,customizationOptions.color,customizationOptions.decorType,customizationOptions.borderType,customizationOptions.shape,vendorLogo,resourceItemRequest.itemImageURL',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? vendorLogo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].vendorLogo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? personServerd(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].personServerd''',
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
  List<String>? endDate(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].endDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? addOn(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addOn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? addonGroup(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addonGroup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resourceItemName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].resourceItemName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].Address''',
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
  List<String>? itemImageURL(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemRequest-_-itemImageURL']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AllRentalItemsCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'allRentalItems',
      apiUrl:
          '${baseUrl}/data/summaryRentalItemCursor?columns=rentalTimeNPaymentMsg.vendorHasStripeLabel,rentalTimeNPaymentMsg.vendorHasPriceWithoutStripeLabel,rentalTimeNPaymentMsg.rentalDateTimeLabel,additionalInfo.deliveryFee,deliveryType,resourceItemRequest.vendorAddress,resourceItemRequest.adultInvitee,resourceItemRequest.kidsInvitee,resourceItemRequest.resourceType.name,resourceItemRequest.vendorName,resourceItemRequest.vendorAddress,resourceItemRequest.itemType,totalPrice,resourceItemName,resourceItemRequest.itemDescription,emptyColumn,resourceItemRequest.date,resourceItemRequest.itemTime,additionalInfo.endDate,emptyColumn,resourceItemRequest.Quantity,personServerd,resourceItemRequest.resourceItem.additionalInfo.maxPersons,resourceItemRequest.totalInvitee,Address,emptyColumn,resourceItemRequest.unitPriceStringFmt,emptyColumn,addOn,addonGroup,menuItemRequest.customTextColorWithLabel,menuItemRequest.customTextWithLabel,emptyColumn,defaultOptions.defaultOptionLabel,defaultOptions.flavours,defaultOptions.secFlavour,defaultOptions.terFlavour,defaultOptions.size,defaultOptions.themeCategory,defaultOptions.themeName,defaultOptions.fillings,defaultOptions.secFilling,defaultOptions.terFilling,defaultOptions.cakeIcing,defaultOptions.secCakeIcing,defaultOptions.layer,defaultOptions.color,defaultOptions.decorType,defaultOptions.borderType,defaultOptions.shape,emptyColumn,cakeCustomization,customizationOptions.flavours,customizationOptions.secFlavour,customizationOptions.terFlavour,customizationOptions.size,customizationOptions.themeCategory,customizationOptions.themeName,customizationOptions.fillings,customizationOptions.secFilling,customizationOptions.terFilling,customizationOptions.cakeIcing,customizationOptions.secCakeIcing,customizationOptions.layer,customizationOptions.color,customizationOptions.decorType,customizationOptions.borderType,customizationOptions.shape,vendorLogo,resourceItemRequest.itemImageURL',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? vendorLogo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].vendorLogo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? personServerd(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].personServerd''',
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
  List<String>? endDate(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-endDate']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? addOn(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addOn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? addonGroup(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addonGroup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resourceItemName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].resourceItemName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].Address''',
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
  List<String>? itemImageURL(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemRequest-_-itemImageURL']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemRequest-_-date']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemRequest-_-Quantity']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? deliveryType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].deliveryType''',
      ));
  String? deliveryTypetxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].deliveryType_txt''',
      ));
  List<String>? deliveryFee(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-deliveryFee']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AllCakeItemsCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'allCakeItems',
      apiUrl:
          '${baseUrl}/data/summaryCakeItemCursor?columns=rentalTimeNPaymentMsg.vendorHasStripeLabel,rentalTimeNPaymentMsg.vendorHasPriceWithoutStripeLabel,resourceItemRequest.itemImageURL,additionalInfo.deliveryFee,deliveryType,resourceItemRequest.vendorAddress,resourceItemRequest.adultInvitee,resourceItemRequest.kidsInvitee,resourceItemRequest.resourceType.name,resourceItemRequest.vendorName,resourceItemRequest.vendorAddress,resourceItemRequest.itemType,totalPrice,resourceItemName,resourceItemRequest.itemDescription,emptyColumn,resourceItemRequest.date,resourceItemRequest.itemTime,additionalInfo.endDate,emptyColumn,resourceItemRequest.Quantity,personServerd,resourceItemRequest.resourceItem.additionalInfo.maxPersons,resourceItemRequest.totalInvitee,Address,emptyColumn,resourceItemRequest.unitPriceStringFmt,emptyColumn,addOn,addonGroup,menuItemRequest.customTextColorWithLabel,menuItemRequest.customTextWithLabel,emptyColumn,defaultOptions.defaultOptionLabel,defaultOptions.flavours,defaultOptions.secFlavour,defaultOptions.terFlavour,defaultOptions.size,defaultOptions.themeCategory,defaultOptions.themeName,defaultOptions.fillings,defaultOptions.secFilling,defaultOptions.terFilling,defaultOptions.cakeIcing,defaultOptions.secCakeIcing,defaultOptions.layer,defaultOptions.color,defaultOptions.decorType,defaultOptions.borderType,defaultOptions.shape,emptyColumn,cakeCustomization,customizationOptions.flavours,customizationOptions.secFlavour,customizationOptions.terFlavour,customizationOptions.size,customizationOptions.themeCategory,customizationOptions.themeName,customizationOptions.fillings,customizationOptions.secFilling,customizationOptions.terFilling,customizationOptions.cakeIcing,customizationOptions.secCakeIcing,customizationOptions.layer,customizationOptions.color,customizationOptions.decorType,customizationOptions.borderType,customizationOptions.shape,vendorLogo,resourceItemRequest.itemImageURL',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? vendorLogo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].vendorLogo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? personServerd(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].personServerd''',
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
  List<String>? endDate(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-endDate']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? addOn(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addOn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? addonGroup(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addonGroup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resourceItemName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].resourceItemName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].Address''',
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
  List<String>? itemImageURL(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemRequest-_-itemImageURL']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemRequest-_-date']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemRequest-_-Quantity']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? deliveryType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].deliveryType''',
      ));
  String? deliveryTypetxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].deliveryType_txt''',
      ));
  List<String>? deliveryFee(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-deliveryFee']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customDecorType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-decorType']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customLayer(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-layer']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customTerFilling(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-terFilling']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customThemeName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-themeName']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customShape(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-shape']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customSecIcing(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-secCakeIcing']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customIcing(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-cakeIcing']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customFilling(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-fillings']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customColor(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-color']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customSecFilling(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-secFilling']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customBorderType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-borderType']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customSize(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-size']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customSecFlavour(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-secFlavour']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customThemeCategory(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-themeCategory']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customTerFlavour(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-terFlavour']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customFlavour(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-flavours']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultDecorTYpe(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-decorType']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultOptionLabel(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-defaultOptionLabel']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultIciing(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-cakeIcing']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultSize(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-size']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultLayer(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-layer']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultSecIciing(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-secCakeIcing']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultSecFlavour(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-secFlavour']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultThemeCategory(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-themeCategory']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultBorderType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-borderType']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultShape(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-shape']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultThemeName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-themeName']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultTerFilling(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-terFilling']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultFilling(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-fillings']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultSecFilling(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-secFilling']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultFlavour(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-flavours']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultColor(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-color']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? defaultTerFlavour(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['defaultOptions-_-terFlavour']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customizationLabel(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].cakeCustomization''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? messageColor(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['menuItemRequest-_-customTextColorWithLabel']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? message(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['menuItemRequest-_-customTextWithLabel']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AllEntertainerItemsCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'allEntertainerItems',
      apiUrl:
          '${baseUrl}/data/summaryEntertainmentItemCursor?columns=rentalTimeNPaymentMsg.vendorHasStripeLabel,rentalTimeNPaymentMsg.vendorHasPriceWithoutStripeLabel,additionalInfo.deliveryFee,deliveryType,resourceItemRequest.vendorAddress,resourceItemRequest.adultInvitee,resourceItemRequest.kidsInvitee,resourceItemRequest.resourceType.name,resourceItemRequest.vendorName,resourceItemRequest.vendorAddress,resourceItemRequest.itemType,totalPrice,resourceItemName,resourceItemRequest.itemDescription,emptyColumn,resourceItemRequest.date,resourceItemRequest.itemTime,additionalInfo.endDate,emptyColumn,resourceItemRequest.Quantity,personServerd,resourceItemRequest.resourceItem.additionalInfo.maxPersons,resourceItemRequest.totalInvitee,Address,emptyColumn,resourceItemRequest.unitPriceStringFmt,emptyColumn,addOn,addonGroup,menuItemRequest.customTextColorWithLabel,menuItemRequest.customTextWithLabel,emptyColumn,defaultOptions.defaultOptionLabel,defaultOptions.flavours,defaultOptions.secFlavour,defaultOptions.terFlavour,defaultOptions.size,defaultOptions.themeCategory,defaultOptions.themeName,defaultOptions.fillings,defaultOptions.secFilling,defaultOptions.terFilling,defaultOptions.cakeIcing,defaultOptions.secCakeIcing,defaultOptions.layer,defaultOptions.color,defaultOptions.decorType,defaultOptions.borderType,defaultOptions.shape,emptyColumn,cakeCustomization,customizationOptions.flavours,customizationOptions.secFlavour,customizationOptions.terFlavour,customizationOptions.size,customizationOptions.themeCategory,customizationOptions.themeName,customizationOptions.fillings,customizationOptions.secFilling,customizationOptions.terFilling,customizationOptions.cakeIcing,customizationOptions.secCakeIcing,customizationOptions.layer,customizationOptions.color,customizationOptions.decorType,customizationOptions.borderType,customizationOptions.shape,vendorLogo,resourceItemRequest.itemImageURL',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? vendorLogo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].vendorLogo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? personServerd(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].personServerd''',
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
  List<String>? endDate(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-endDate']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? addOn(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addOn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? addonGroup(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addonGroup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resourceItemName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].resourceItemName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].Address''',
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
  List<String>? itemImageURL(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemRequest-_-itemImageURL']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemRequest-_-date']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? deliveryFee(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['additionalInfo-_-deliveryFee']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? deliveryTypetxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].deliveryType_txt''',
      ));
  String? deliveryType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].deliveryType''',
      ));
}

class TaxBoxCursorCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'taxBoxCursor',
      apiUrl:
          '${baseUrl}/data/cartSummeryTaxPriceCursor?columns=totalPrice,totalPriceLabel,eventFee,eventFeeLabel,feeAndTax,feeAndTaxLabel,cleaningFee,cleaningFeeLabel,insuranceFee,insuranceFeeLabel,installationFee,installationFeeLabel,deliveryFee,deliveryFeeLabel,eachItemPrice,subTotalPrice',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? feeAndTaxLabel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].feeAndTaxLabel''',
      ));
  String? feeAndTax(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].feeAndTax''',
      ));
  String? subTotalPriceLabel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].subTotalPrice''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? totalPriceLabel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPriceLabel''',
      ));
  String? eachItemPriceLabel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].eachItemPrice''',
      ));
  String? deliveryFeeLabel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].deliveryFeeLabel''',
      ));
  String? deliveryFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].deliveryFee''',
      ));
  String? insuranceFeeLabel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].insuranceFeeLabel''',
      ));
  String? insuranceFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].insuranceFee''',
      ));
  String? cleaningFeeLabel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].cleaningFeeLabel''',
      ));
  String? cleaningFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].cleaningFee''',
      ));
  String? installationFeeLabel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].installationFeeLabel''',
      ));
  String? installationFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].installationFee''',
      ));
  String? eventFeeLabel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventFeeLabel''',
      ));
  String? eventFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventFee''',
      ));
}

class DeleteVenueItemCall {
  Future<ApiCallResponse> call({
    String? selection = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteVenueItem',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/items_summaryVenueItemCursor/deleteAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:autoRefreshOnSaveTarget': "shoppingCartSummary",
        'a:caller': "items_summaryVenueItemCursor",
        'a:clientState': selection,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msgTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].title''',
      ));
  List<String>? msgText(dynamic response) => (getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? cartCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
}

class AddOnSingleCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? resourceType = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addOnSingle',
      apiUrl: '${baseUrl}/data/venueCartAddonCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1740580762200",
        'format': "js",
        'parentRecordKey': parentRecordKey,
        'resourceType': resourceType,
        'autoRefreshOnSaveTarget':
            "summaryCartAddonTabsUI__summaryCartAddonTabPanel",
        'columns':
            "imageURL,inclResItem,unitPrice,Quantity,totalPrice,inclResItemDescription",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? quantity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].Quantity''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? unitPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].unitPrice''',
      ));
  String? imageURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].imageURL''',
      ));
  String? inclResItem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].inclResItem''',
      ));
  String? inclResItemDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].inclResItemDescription''',
      ));
}

class IncludedSingleCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? resourceType = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'includedSingle',
      apiUrl: '${baseUrl}/data/venueCartIncludedAddonCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1740580762200",
        'format': "js",
        'parentRecordKey': parentRecordKey,
        'resourceType': resourceType,
        'autoRefreshOnSaveTarget':
            "summaryCartAddonTabsUI__summaryCartAddonTabPanel",
        'columns':
            "imageURL,inclResItem,unitPrice,Quantity,totalPrice,inclResItemDescription",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? quantity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].Quantity''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? unitPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].unitPrice''',
      ));
  String? imageURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].imageURL''',
      ));
  String? inclResItem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].inclResItem''',
      ));
  String? inclResItemDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].inclResItemDescription''',
      ));
}

class IncludedGroupCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? resourceType = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'includedGroup',
      apiUrl: '${baseUrl}/data/venueCartIncludedGroupAddonCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1740581125401",
        'parentRecordKey': parentRecordKey,
        'resourceType': resourceType,
        'autoRefreshOnSaveTarget':
            "summaryCartAddonTabsUI__summaryCartAddonTabPanel",
        'format': "js",
        'columns':
            "imageURL,inclResItem,unitPrice,Quantity,totalPrice,inclResItemDescription",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].Quantity''',
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
  List<String>? inclResItemDescription(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].inclResItemDescription''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? inclResItem(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].inclResItem''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? unitPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].unitPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageURL(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].imageURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AddonGroupCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? resourceType = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addonGroup',
      apiUrl: '${baseUrl}/data/venueCartAddonCursorForGroups',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1740581125401",
        'parentRecordKey': parentRecordKey,
        'resourceType': resourceType,
        'autoRefreshOnSaveTarget':
            "summaryCartAddonTabsUI__summaryCartAddonTabPanel",
        'format': "js",
        'columns':
            "imageURL,inclResItem,unitPrice,Quantity,totalPrice,inclResItemDescription",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].Quantity''',
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
  List<String>? inclResItemDescription(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].inclResItemDescription''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? inclResItem(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].inclResItem''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? unitPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].unitPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageURL(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].imageURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AddOnDeleteCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addOnDelete',
      apiUrl: '${baseUrl}/ui/cartAddonUI/items_addon_/deleteAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': "items_addon_",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VenueEditActionCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? caller = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'venueEditAction',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/items_summaryVenueItemCursor/editItemForMobile',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': caller,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? todoAction(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  String? todoURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
}

class RentalEditActionCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? caller = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalEditAction',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/items_summaryRentalItemCursor/editItemForMobile',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': caller,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? todoAction(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  String? todoURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class CakeEditActionCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? caller = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeEditAction',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/items_summaryCakeItemCursor/editItemForMobile',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': caller,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? todoAction(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  String? todoURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class CustomCakeEditCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? caller = 'customCakeSummaryUIGrid',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'customCakeEdit',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/customCakeSummaryUIGrid/editItem',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': caller,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? todoAction(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  String? todoURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class NavigateToVendorCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? caller = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'NavigateToVendor',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/items_summaryVenueItemCursor/callVendorPage',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': caller,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
}

class ClearCartCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'clearCart',
      apiUrl: '${baseUrl}/ui/shoppingCartSummary/eventSummary/clearAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class DeleteRentalItemCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteRentalItem',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/items_summaryRentalItemCursor/deleteAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:autoRefreshOnSaveTarget': "shoppingCartSummary",
        'a:caller': "items_summaryRentalItemCursor",
        'a:clientState': clientState,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].type''',
      ));
  List<String>? toastMsg(dynamic response) => (getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? cartCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
}

class RentalQuantityActionCall {
  Future<ApiCallResponse> call({
    String? quantity = '',
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalQuantityAction',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/items_summaryRentalItemCursor/quantityAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:quantity': quantity,
        'ap:autoRefreshOnSaveTarget': "shoppingCartSummary",
        'a:clientState': clientState,
        'a:caller': "items_summaryRentalItemCursor",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? cartCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
}

class DeleteEntertainerItemCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteEntertainerItem',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/items_summaryEntertainmentItemCursor/deleteAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:autoRefreshOnSaveTarget': "shoppingCartSummary",
        'a:clientState': clientState,
        'a:caller': "items_summaryEntertainmentItemCursor",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List<String>? toastMsg(dynamic response) => (getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? cartCountInt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
}

class DeleteCakeItemCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteCakeItem',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/items_summaryCakeItemCursor/deleteAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:autoRefreshOnSaveTarget': "shoppingCartSummary",
        'a:clientState': clientState,
        'a:caller': "items_summaryCakeItemCursor",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List<String>? toastMsg(dynamic response) => (getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? cartCOuntInt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
}

class AllCustomCakesCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'allCustomCakes',
      apiUrl: '${baseUrl}/data/summaryForCustomCakeCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "bakery,menuItemRequest.resourceItemRequest.vendorAddress,menuSection.resItemSection.name,customizationOptions.flavours,customizationOptions.secFlavour,customizationOptions.terFlavour,customizationOptions.fillings,customizationOptions.secFilling,customizationOptions.terFilling,customizationOptions.cakeIcing,customizationOptions.secCakeIcing,customizationOptions.layer,customizationOptions.shape,customizationOptions.color,customizationOptions.decorType,customizationOptions.borderType,customizationOptions.size,customizationOptions.themeCategory,customizationOptions.themeName,menuItemRequest.customTextColorWithLabel,menuItemRequest.customTextWithLabel,menuItemRequest.resourceItemRequest.date,requestAddInfo.altDate1WithLabel,requestAddInfo.altDate2WithLabel,requestAddInfo.locationWithLabel,menuItemRequest.resourceItemRequest.itemTime,menuItemRequest.resourceItemRequest.basePriceStringFmt,priceBox.deliveryFee,priceBox.localTax,priceBox.salesTax,priceBox.exciseTax,priceBox.insuranceFee,priceBox.cleaningFee,totalPrice,quantity,bakeryLogo",
        '_dc': "1742905456721",
        'a:clientState': clientState,
        'page': "1",
        'start': "0",
        'limit': "-1",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? decorType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-decorType']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['quantity']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? devlieryFee(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['priceBox-_-deliveryFee']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? layer(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-layer']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? basePrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['menuItemRequest-_-resourceItemRequest-_-basePriceStringFmt']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? terFilling(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-terFilling']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? themeName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-themeName']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? shape(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-shape']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? secCakeIcing(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-secCakeIcing']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['menuItemRequest-_-resourceItemRequest-_-date']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cakeIcing(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-cakeIcing']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fillings(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-fillings']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? color(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-color']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cakeMessageColor(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['menuItemRequest-_-customTextColorWithLabel']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['totalPrice']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? sectionName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['menuSection-_-resItemSection-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? secFilling(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-secFilling']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? borderType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-borderType']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? sieze(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-size']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customMessage(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['menuItemRequest-_-customTextWithLabel']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? secFlavour(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-secFlavour']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bakerylogo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['bakeryLogo']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? locationWithLabel(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['requestAddInfo-_-locationWithLabel']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? itemTime(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['menuItemRequest-_-resourceItemRequest-_-itemTime']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? altDate2WithLabel(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['requestAddInfo-_-altDate2WithLabel']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? themeCategory(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-themeCategory']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? altDate1WithLabel(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['requestAddInfo-_-altDate1WithLabel']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? terFlavour(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-terFlavour']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? flavours(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['customizationOptions-_-flavours']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bakeryName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['bakery']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? vendorAdress(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['menuItemRequest-_-resourceItemRequest-_-vendorAddress']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class CakeQuantityActionCall {
  Future<ApiCallResponse> call({
    String? quantity = '',
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeQuantityAction',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/items_summaryCakeItemCursor/quantityAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:quantity': quantity,
        'ap:autoRefreshOnSaveTarget': "shoppingCartSummary",
        'a:clientState': clientState,
        'a:caller': "items_summaryCakeItemCursor",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class CustomCakeQuantityActionCall {
  Future<ApiCallResponse> call({
    String? quantity = '',
    String? clientstate = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'customCakeQuantityAction',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/customCakeSummaryUIGrid/quantityAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:quantity': quantity,
        'ap:autoRefreshOnSaveTarget': "shoppingCartSummary",
        'a:clientState': clientstate,
        'a:caller': "customCakeSummaryUIGrid",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
}

class CustomCakeDeleteActionCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'customCakeDeleteAction',
      apiUrl:
          '${baseUrl}/ui/shoppingCartSummary/customCakeSummaryUIGrid/deleteAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:autoRefreshOnSaveTarget': "shoppingCartSummary",
        'a:clientState': clientState,
        'a:caller': "customCakeSummaryUIGrid",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  int? cartCountInt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
}

class AddOnQuantityActionsCall {
  Future<ApiCallResponse> call({
    String? clientStates = '',
    String? quantity = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ShoppingCartSummaryUIGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addOnQuantityActions',
      apiUrl: '${baseUrl}/ui/cartAddonUI/items_addon_/quantityAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:quantity': quantity,
        'a:clientState': clientStates,
        'a:caller': "items_addon_",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ShoppingCartSummaryUI Group Code

/// Start Event Information Group Code

class EventInformationGroup {
  static String getBaseUrl({
    String? url,
    String? token = '',
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static EventFormCursorCall eventFormCursorCall = EventFormCursorCall();
  static EventEditFormCursorCall eventEditFormCursorCall =
      EventEditFormCursorCall();
  static CelebrationTypeForEventCall celebrationTypeForEventCall =
      CelebrationTypeForEventCall();
  static CLBXEnPersonGenderForEventCall cLBXEnPersonGenderForEventCall =
      CLBXEnPersonGenderForEventCall();
  static ThemeCategoryListPickerCall themeCategoryListPickerCall =
      ThemeCategoryListPickerCall();
  static CLBXEnEventStatusForEventCall cLBXEnEventStatusForEventCall =
      CLBXEnEventStatusForEventCall();
  static SaveEventCall saveEventCall = SaveEventCall();
  static EventPoplateaddressCall eventPoplateaddressCall =
      EventPoplateaddressCall();
  static AdressSuggestionForEventCall adressSuggestionForEventCall =
      AdressSuggestionForEventCall();
  static DeleteEventsCall deleteEventsCall = DeleteEventsCall();
}

class EventFormCursorCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'eventFormCursor',
      apiUrl:
          '${baseUrl}/data/consumerEventEditCursor?_dc=1741257750683&format=js&label=Event&autoRefreshOnSaveTarget=nearestUpcomingEventInfoTab&&a:clientState=%7B%22clientId%22%3A%22nearestUpcomingEventInfoTab__noEventForm%22%2C%22cursor%22%3A%7B%22message%22%3A%22You%20don%27t%20have%20any%20upcoming%20event.%22%7D%7D&format=js',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? celebration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.celebration''',
      ));
  String? idealDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.idealDate''',
      ));
  String? idForm(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].opsHours.startTime''',
      ));
  String? endTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].opsHours.endTime''',
      ));
  String? celebrationTypeId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].celebrationTypeId''',
      ));
  int? budget(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.details[:].additionalInfo.budget''',
      ));
  String? genderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].genderId''',
      ));
}

class EventEditFormCursorCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? clientState =
        '{\"clientId\":\"nearestUpcomingEventInfoTab__nearestUpcomingEventDetails\",\"cursor\":{}}',
    String? lable = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'eventEditFormCursor',
      apiUrl:
          '${baseUrl}/data/consumerEventEditCursor?_dc=1741261895012&format=js&label=${lable}&recordKey=${recordKey}&&a:clientState=${clientState}&format=js',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? celebrationName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.celebration''',
      ));
  String? idealDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.idealDate''',
      ));
  String? idForm(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].opsHours.startTime''',
      ));
  String? endTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].opsHours.endTime''',
      ));
  String? eventName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.name''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.description''',
      ));
  String? eventTheme(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.theme''',
      ));
  String? eventStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.eventStatus''',
      ));
  int? kids(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.details[:].event.kidsInvitee''',
      ));
  int? adults(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.details[:].event.adultInvitee''',
      ));
  String? totalCost(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.totalCost''',
      ));
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.address.country''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.address.stateProvince''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.address.postalCode''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.address.cityTown''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.address.street''',
      ));
  String? bldgNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.address.bldgNum''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.address.localArea''',
      ));
  int? cage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.details[:].celebrateePerson.age''',
      ));
  String? clastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].celebrateePerson.lastName''',
      ));
  String? cMiddleName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].celebrateePerson.middleName''',
      ));
  String? cFirstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].celebrateePerson.firstName''',
      ));
  String? cgenderName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].celebrateePerson.gender''',
      ));
  int? budget(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.details[:].additionalInfo.budget''',
      ));
  String? idealDate1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].additionalInfo.idealDateAlt1''',
      ));
  String? idealDate2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].additionalInfo.idealDateAlt2''',
      ));
  String? themeCategoryName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.themeCategory''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].event.address.location''',
      ));
  int? totalInvitee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.details[:].event.totalInvitee''',
      ));
  String? themeCategoryId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].themeCategoryId''',
      ));
  String? genderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].genderId''',
      ));
  String? eventStatusId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventStatusId''',
      ));
  String? celebrationId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].celebrationTypeId''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

class CelebrationTypeForEventCall {
  Future<ApiCallResponse> call({
    String? context = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CelebrationTypeForEvent',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnCelebrationType\$?_dc=1741257765742&query=&uiContext=${context}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
}

class CLBXEnPersonGenderForEventCall {
  Future<ApiCallResponse> call({
    String? context = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnPersonGenderForEvent',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnPersonGender\$?_dc=1741257789003&query=&uiContext=${context}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? key(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].key''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
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
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class ThemeCategoryListPickerCall {
  Future<ApiCallResponse> call({
    String? context = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'ThemeCategoryListPicker',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/upcomingEventPageThemeCategoryListPicker?_dc=1741257825576&query=&uiContext=${context}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
}

class CLBXEnEventStatusForEventCall {
  Future<ApiCallResponse> call({
    String? context = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnEventStatusForEvent',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnEventStatus\$?_dc=1741257828320&query=&uiContext=${context}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? key(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].key''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
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
}

class SaveEventCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? id = '',
    String? eventName = '',
    String? eventCelebration = '',
    String? eventDescription = '',
    String? eventThemeCategory = '',
    String? eventTheme = '',
    String? eventEventStatus = '',
    String? eventIdealDate = '',
    String? opsHoursStartTime = '',
    String? opsHoursEndTime = '',
    String? additionalInfoIdealDateAlt1 = '',
    String? additionalInfoIdealDateAlt2 = '',
    String? celebrateePersonFirstName = '',
    String? celebrateePersonMiddleName = '',
    String? celebrateePersonLastName = '',
    String? celebrateePersonAge = '',
    String? celebrateePersonGender = '',
    String? eventKidsInvitee = '',
    String? eventAdultInvitee = '',
    String? addressToSearch = '',
    String? eventAddressBldgNum = '',
    String? eventAddressFloorSection = '',
    String? eventAddressStreet = '',
    String? eventAddressLocalArea = '',
    String? eventAddressCityTown = '',
    String? eventAddressStateProvince = '',
    String? eventAddressPostalCode = '',
    String? additionalInfoBudget = '',
    String? eventTotalCost = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'saveEvent',
      apiUrl: '${baseUrl}/ui/myEventForm/myEventForm/saveEvent',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:autoRefreshOnSaveTarget': "nearestUpcomingEventInfoTab",
        'a:clientState': clientState,
        'a:caller': "myEventForm",
        '_id': id,
        'event.name': eventName,
        'event.celebration': eventCelebration,
        'event.description': eventDescription,
        'event.themeCategory': eventThemeCategory,
        'event.theme': eventTheme,
        'event.eventStatus': eventEventStatus,
        'event.idealDate': eventIdealDate,
        'opsHours.startTime': opsHoursStartTime,
        'opsHours.endTime': opsHoursEndTime,
        'additionalInfo.idealDateAlt1': additionalInfoIdealDateAlt1,
        'additionalInfo.idealDateAlt2': additionalInfoIdealDateAlt2,
        'celebrateePerson.firstName': celebrateePersonFirstName,
        'celebrateePerson.middleName': celebrateePersonMiddleName,
        'celebrateePerson.lastName': celebrateePersonLastName,
        'celebrateePerson.age': celebrateePersonAge,
        'celebrateePerson.gender': celebrateePersonGender,
        'event.kidsInvitee': eventKidsInvitee,
        'event.adultInvitee': eventAdultInvitee,
        'addressToSearch': addressToSearch,
        'event.address.bldgNum': eventAddressBldgNum,
        'event.address.floorSection': eventAddressFloorSection,
        'event.address.street': eventAddressStreet,
        'event.address.localArea': eventAddressLocalArea,
        'event.address.cityTown': eventAddressCityTown,
        'event.address.stateProvince': eventAddressStateProvince,
        'event.address.postalCode': eventAddressPostalCode,
        'additionalInfo.budget': additionalInfoBudget,
        'event.totalCost': eventTotalCost,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actioSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
  String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.type''',
      ));
}

class EventPoplateaddressCall {
  Future<ApiCallResponse> call({
    String? querytext = '',
    String? clientState = '',
    String? id = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'eventPoplateaddress',
      apiUrl: '${baseUrl}/ui/myEventForm/myEventForm/populateAddress',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'myEventForm__myEventForm:r0:addressToSearch': querytext,
        'myEventForm__myEventForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|addressToSearch",
        'a:refreshView': "refreshAddress",
        'a:clientState': clientState,
        'a:caller': "myEventForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List<String>? blgNo(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].data.details[0]['event-_-address-_-bldgNum']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[0]['event-_-address-_-postalCode']''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[0]['event-_-address-_-cityTown']''',
      ));
  String? floor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[0]['event-_-address-_-floorSection']''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[0]['event-_-address-_-localArea']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[0]['event-_-address-_-street']''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[0]['event-_-address-_-stateProvince']''',
      ));
}

class AdressSuggestionForEventCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? context = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'adressSuggestionForEvent',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/eventCursorAddressSuggestions?_dc=1741261249117&query=${query}&uiContext=${context}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
}

class DeleteEventsCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? id = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EventInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteEvents',
      apiUrl:
          '${baseUrl}/ui/nearestUpcomingEventInfoTab/nearestUpcomingEventDetails/delete',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'a:clientState':
            "{\"clientId\":\"nearestUpcomingEventInfoTab__nearestUpcomingEventDetails\"}",
        'a:caller': "nearestUpcomingEventDetails",
        '_id': id,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

/// End Event Information Group Code

/// Start AddonGroup Group Code

class AddonGroupGroup {
  static String getBaseUrl({
    String? token = '',
    String? url,
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static AddOnGridCall addOnGridCall = AddOnGridCall();
  static QuantityActionCall quantityActionCall = QuantityActionCall();
  static AddOnNextCall addOnNextCall = AddOnNextCall();
  static AddOnGroupGridCall addOnGroupGridCall = AddOnGroupGridCall();
  static AddOnGroupCheckboxCursorCall addOnGroupCheckboxCursorCall =
      AddOnGroupCheckboxCursorCall();
  static CheckboxChangedCall checkboxChangedCall = CheckboxChangedCall();
  static AddOnGroupNextCall addOnGroupNextCall = AddOnGroupNextCall();
  static AddOnGroupNextCopyCopyCall addOnGroupNextCopyCopyCall =
      AddOnGroupNextCopyCopyCall();
  static AddOnGroupNextCopyCall addOnGroupNextCopyCall =
      AddOnGroupNextCopyCall();
  static RadioButtonCursorCall radioButtonCursorCall = RadioButtonCursorCall();
  static RadioButtonChangedCall radioButtonChangedCall =
      RadioButtonChangedCall();
}

class AddOnGridCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addOnGrid',
      apiUrl: '${baseUrl}/data/venueAddonGridCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "quantity,addOnData.inclResourceItem.imageURL,addOnData.inclResourceItem.name,addOnData.inclResourceItemDenominator.name,addOnData.inclResourceItem.description,unitPrice,addOnData.inclusionTypeWithLabel,currentResourceItemType.name",
        '_dc': "1741604281756",
        'a:clientState': clientState,
        'page': "1",
        'start': "0",
        'limit': "-1",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].quantity''',
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
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['addOnData-_-inclResourceItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? label(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['addOnData-_-inclusionTypeWithLabel']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? unitPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].unitPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? denomName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['addOnData-_-inclResourceItemDenominator-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageURL(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['addOnData-_-inclResourceItem-_-imageURL']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['addOnData-_-inclResourceItem-_-description']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? addOnType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['currentResourceItemType-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class QuantityActionCall {
  Future<ApiCallResponse> call({
    String? quantity = '',
    String? resourceItemType = '',
    String? parentRecordKey = '',
    String? clientState = '',
    String? caller = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'quantityAction',
      apiUrl:
          '${baseUrl}/ui/venueAddonsGridUI/venueAddonsUIGrid/quantityAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:quantity': quantity,
        'ap:resourceItemType': resourceItemType,
        'ap:parentRecordKey': parentRecordKey,
        'a:clientState': clientState,
        'a:caller': caller,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastsMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class AddOnNextCall {
  Future<ApiCallResponse> call({
    String? resourceItemType = '',
    String? resourceType = '',
    String? parentRecordKey = '',
    String? type = '',
    String? item = '',
    String? clientState = '',
    String? caller = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addOnNext',
      apiUrl: '${baseUrl}/ui/venueAddonsGridUI/venueAddonsUIGrid/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:resourceItemType': resourceItemType,
        'ap:resourceType': resourceType,
        'ap:parentRecordKey': parentRecordKey,
        'ap:type': type,
        'ap:item': item,
        'a:clientState': clientState,
        'a:caller': caller,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List<String>? paramValue(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  List<String>? paramName(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].params[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class AddOnGroupGridCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? resourceType = '',
    String? currentAddonGroupId = '',
    String? type = '',
    String? clientState = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addOnGroupGrid',
      apiUrl: '${baseUrl}/data/venueAddOnsGroupCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "totalPriceDisplay,addonId,checkBoxAddonId,totalPrice,currentGroup,addOnsList",
        '_dc': "1741691411486",
        'format': "js",
        'renderTo': "contains_venueAddOnsGroupCartUI",
        'parentRecordKey': parentRecordKey,
        'resourceType': resourceType,
        'currentAddonGroupId': currentAddonGroupId,
        'type': type,
        'a:clientState': clientState,
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? addOnsList(dynamic response) => getJsonField(
        response,
        r'''$.details[:].addOnsList''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  dynamic currentGroup(dynamic response) => getJsonField(
        response,
        r'''$.details[:].currentGroup''',
      );
  List<String>? addonId(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addonId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? groupName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].currentGroup.name''',
      ));
  int? maxNumInclItem(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.details[:].currentGroup.maxNumInclItem''',
      ));
  List<int>? inclResourceItemId(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addOnsList[:].inclResourceItemId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  String? checkBoxAddonId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].checkBoxAddonId''',
      ));
  String? totalPriceDisplay(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPriceDisplay''',
      ));
}

class AddOnGroupCheckboxCursorCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? currentAddonGroupId = '',
    String? query = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addOnGroupCheckboxCursor',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/venueGroupAddonListCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1739461206439",
        'query': query,
        'uiContext': uiContext,
        'currentAddonGroupId': currentAddonGroupId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? ic(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CheckboxChangedCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? aclientState = '',
    String? checkboxId = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'checkboxChanged',
      apiUrl:
          '${baseUrl}/ui/venueAddOnsGroupCartUI/venuePackageGroupAddonForm/calculatePrice',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': aclientState,
        '_id': id,
        'a:caller': "venuePackageGroupAddonForm",
        'a:refreshView': "refreshTotalPrice",
        'contains_venueAddOnsGroupCartUI__venueAddOnsGroupCartUI__venuePackageGroupAddonForm:r0:addonId':
            checkboxId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
}

class AddOnGroupNextCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? id = '',
    String? addonId = '',
    String? radiobuttonId = '',
    String? recordKey = '',
    String? type = '',
    String? parentRecordKey = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addOnGroupNext',
      apiUrl:
          '${baseUrl}/ui/venueAddOnsGroupCartUI/venuePackageGroupAddonForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        '_id': id,
        'a:caller': "venuePackageGroupAddonForm",
        'addonId': addonId,
        'checkBoxAddonId': radiobuttonId,
        'ap:recordKey': recordKey,
        'ap:type': type,
        'ap:parentRecordKey': parentRecordKey,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  dynamic todo(dynamic response) => getJsonField(
        response,
        r'''$.todo''',
      );
  List? todoact(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class AddOnGroupNextCopyCopyCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? id = '',
    String? addonId = '',
    String? radiobuttonId = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addOnGroupNext Copy Copy',
      apiUrl:
          '${baseUrl}/ui/venueAddOnsGroupCartUI/venuePackageGroupAddonForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        '_id': id,
        'a:caller': "venuePackageGroupAddonForm",
        'addonId': addonId,
        'checkBoxAddonId': radiobuttonId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  dynamic todo(dynamic response) => getJsonField(
        response,
        r'''$.todo''',
      );
  List? todoact(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class AddOnGroupNextCopyCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? id = '',
    String? addonId = '',
    String? radiobuttonId = '',
    String? recordKey = '-1',
    String? type = '-1',
    String? parentRecordKey = '-1',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addOnGroupNext Copy',
      apiUrl:
          '${baseUrl}/ui/venueAddOnsGroupCartUI/venuePackageGroupAddonForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        '_id': id,
        'a:caller': "venuePackageGroupAddonForm",
        'addonId': addonId,
        'checkBoxAddonId': radiobuttonId,
        'ap:parentRecordKey': parentRecordKey,
        'ap:recordKey': recordKey,
        'ap:type': type,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  dynamic todo(dynamic response) => getJsonField(
        response,
        r'''$.todo''',
      );
  List? todoact(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class RadioButtonCursorCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uiContext = '',
    String? currentAddonGroupId = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'radioButtonCursor',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/venueRadioBtnGroupAddonListCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1739461206439",
        'query': query,
        'uiContext': uiContext,
        'currentAddonGroupId': currentAddonGroupId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RadioButtonChangedCall {
  Future<ApiCallResponse> call({
    String? radioButtonId = '',
    String? clientState = '',
    String? id = '',
    String? token = '',
    String? url,
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AddonGroupGroup.getBaseUrl(
      token: token,
      url: url,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'radioButtonChanged',
      apiUrl:
          '${baseUrl}/ui/venueAddOnsGroupCartUI/venuePackageGroupAddonForm/radonBtnStylePrice',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contains_venueAddOnsGroupCartUI__venueAddOnsGroupCartUI__venuePackageGroupAddonForm:r0:checkBoxAddonId':
            radioButtonId,
        'a:submitView': "self|checkBoxAddonId",
        'a:refreshView': "refreshTotalPrice",
        'a:caller': "venuePackageGroupAddonForm",
        'a:clientState': clientState,
        '_id': id,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data''',
      );
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
}

/// End AddonGroup Group Code

/// Start checkoutUI Group Code

class CheckoutUIGroup {
  static String getBaseUrl({
    String? baseURL,
    String? token = '',
    String? header,
  }) {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${baseURL}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static MiniCartCursorCall miniCartCursorCall = MiniCartCursorCall();
  static SubmitRequestsCall submitRequestsCall = SubmitRequestsCall();
  static CheckoutItemCursorCall checkoutItemCursorCall =
      CheckoutItemCursorCall();
  static CheckoutGreetingCursorCall checkoutGreetingCursorCall =
      CheckoutGreetingCursorCall();
}

class MiniCartCursorCall {
  Future<ApiCallResponse> call({
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CheckoutUIGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'miniCartCursor',
      apiUrl: '${baseUrl}/data/checkoutMiniCart',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns': "itemType,itemName,quantity,totalPrice",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].quantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? itemType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].itemType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? itemName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].itemName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SubmitRequestsCall {
  Future<ApiCallResponse> call({
    String? emailCheckbox = '',
    String? email = '',
    String? phoneCheckbox = '',
    String? phone = '',
    String? clientState = '',
    String? ocKey = '',
    String? payOnlyMinDeposit = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CheckoutUIGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SubmitRequests',
      apiUrl:
          '${baseUrl}/ui/checkoutUI/checkoutUiLayoutAdjustment/submitAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contactInfo.email': emailCheckbox,
        'contactInfo.emailId': email,
        'contactInfo.altPhone': phoneCheckbox,
        'contactInfo.altPhoneNumber': phone,
        'a:caller': "checkoutUiLayoutAdjustment",
        'a:clientState': clientState,
        '_id': ocKey,
        'consumerSelectionForMinDeposit': payOnlyMinDeposit,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  String? value(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

class CheckoutItemCursorCall {
  Future<ApiCallResponse> call({
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CheckoutUIGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'checkoutItemCursor',
      apiUrl: '${baseUrl}/data/checkoutItemCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventInfo.email''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].eventInfo.phone''',
      ));
  String? hasMinDepositAvailable(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].hasMinDepositAvailable''',
      ));
}

class CheckoutGreetingCursorCall {
  Future<ApiCallResponse> call({
    String? hasRequests = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CheckoutUIGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'checkoutGreetingCursor',
      apiUrl: '${baseUrl}/data/checkoutGreetingCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'hasRequests': hasRequests,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].message''',
      ));
}

/// End checkoutUI Group Code

/// Start Account Request Item Information Group Code

class AccountRequestItemInformationGroup {
  static String getBaseUrl({
    String? url,
    String? token = '',
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static RequestAddOnCall requestAddOnCall = RequestAddOnCall();
  static RequestAddOnGroupsCall requestAddOnGroupsCall =
      RequestAddOnGroupsCall();
  static RequestAddonPresentCheckCall requestAddonPresentCheckCall =
      RequestAddonPresentCheckCall();
  static ActiveRequestItemCall activeRequestItemCall = ActiveRequestItemCall();
  static DeleteActiveRequestCall deleteActiveRequestCall =
      DeleteActiveRequestCall();
  static DeleteAddonCall deleteAddonCall = DeleteAddonCall();
  static RequestIncludedAddonCall requestIncludedAddonCall =
      RequestIncludedAddonCall();
  static RequestIncludedGroupsAddonCall requestIncludedGroupsAddonCall =
      RequestIncludedGroupsAddonCall();
}

class RequestAddOnCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountRequestItemInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'requestAddOn',
      apiUrl:
          '${baseUrl}/data/eventRequestsAddonCursor?columns=imageURL,inclResItem,unitPrice,unitPriceDisplay,totalPriceDisplay,Quantity,totalPrice,inclResItemDescription&_dc=1741866620471&format=js&parentRecordKey=${parentRecordKey}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].Quantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].inclResItemDescription''',
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
        r'''$.details[:].imageURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].inclResItem''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? unitPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].unitPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RequestAddOnGroupsCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountRequestItemInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'requestAddOnGroups',
      apiUrl:
          '${baseUrl}/data/eventRequestsAddonCursorForGroups?columns=imageURL,inclResItem,unitPrice,unitPriceDisplay,totalPriceDisplay,Quantity,totalPrice,inclResItemDescription&_dc=1741866620471&format=js&parentRecordKey=${parentRecordKey}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
}

class RequestAddonPresentCheckCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountRequestItemInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'requestAddonPresentCheck',
      apiUrl:
          '${baseUrl}/ui/nearestUpcomingEventRequestsTab/cartSubmittedUIactiveInrequestCursor/cartAddonAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': "cartSubmittedUIactiveInrequestCursor",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
}

class ActiveRequestItemCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountRequestItemInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'activeRequestItem',
      apiUrl:
          '${baseUrl}/data/activeInRequestCursor?columns=request.totalPriceDisplay,request,addon,included,id,request.status.name,request.resourceItemSection.itemCategory.resourceItemType.name,request.resourceItemSection.itemCategory.parent.basicPartyInfo.busPartyIdentifier.name,request.resourceItemSection.itemCategory.parent.basicPartyInfo.address.address,request.totalPrice,request.itemType,request.resItemReqName,request.resItemReqDescription,request.date,request.timeFrame,request.Quantity,request.dummyImages&_dc=1738156207600&a%3AclientState=%7B%22clientId%22%3A%22nearestUpcomingEventRequestsTab__cartSubmittedUIactiveInrequestCursor%22%2C%22cursor%22%3A%7B%7D%2C%22selection%22%3A%5B%5D%7D&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? ids(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? totalInvitee(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.totalInvitee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? endTime(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.endTime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? startTime(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.startTime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? unitPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.unitPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? adult(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.adultInvitee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? kids(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.kidsInvitee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.quantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? pannedDateandTime(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.plannedDateTime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? shoppingcartid(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.shoppingCartId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].request.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? request(dynamic response) => getJsonField(
        response,
        r'''$.details[:].request''',
        true,
      ) as List?;
  List<String>? addOn(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? included(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].included''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? packageName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['request-_-resItemReqName']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['request-_-resourceItemSection-_-itemCategory-_-parent-_-basicPartyInfo-_-busPartyIdentifier-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? time(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['request-_-timeFrame']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['request-_-date']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? itemtype(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['request-_-resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['request-_-resourceItemSection-_-itemCategory-_-parent-_-basicPartyInfo-_-address-_-address']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['request-_-resItemReqDescription']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteActiveRequestCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountRequestItemInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DeleteActiveRequest',
      apiUrl:
          '${baseUrl}/ui/nearestUpcomingEventRequestsTab/cartSubmittedUIactiveInRequestCursor/deleteAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': "cartSubmittedUIactiveInRequestCursor",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toasttext(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
  String? infotext(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
  int? cartCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
}

class DeleteAddonCall {
  Future<ApiCallResponse> call({
    String? aclientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountRequestItemInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DeleteAddon',
      apiUrl: '${baseUrl}/ui/eventRequestsAddonUI/items_addon_/deleteAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:caller': "items_addon_",
        'a:clientState:': aclientState,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actions(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
}

class RequestIncludedAddonCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountRequestItemInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'requestIncludedAddon',
      apiUrl:
          '${baseUrl}/data/eventRequestsIncludedAddonCursor?_dc=1742367259684&format=js&parentRecordKey=${parentRecordKey}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

class RequestIncludedGroupsAddonCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AccountRequestItemInformationGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'requestIncludedGroupsAddon',
      apiUrl:
          '${baseUrl}/data/eventRequestsIncludedGroupAddonCursor?columns=imageURL,inclResItem,Quantity,inclResItemDescription&_dc=1742367263856&parentRecordKey=${parentRecordKey}&format=js',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

/// End Account Request Item Information Group Code

/// Start Anonymous Group Code

class AnonymousGroup {
  static String getBaseUrl({
    String? baseURL,
    String? token = '',
    String? header,
  }) {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${baseURL}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static GuestActionCall guestActionCall = GuestActionCall();
  static AnonymousEventCursorCall anonymousEventCursorCall =
      AnonymousEventCursorCall();
  static AnonCLBXEnCelebrationTypeCall anonCLBXEnCelebrationTypeCall =
      AnonCLBXEnCelebrationTypeCall();
  static CelebrationTypeChangedCall celebrationTypeChangedCall =
      CelebrationTypeChangedCall();
  static AnonCLBXEnThemeCategoryCall anonCLBXEnThemeCategoryCall =
      AnonCLBXEnThemeCategoryCall();
  static AnonCLBXEnPersonGenderCall anonCLBXEnPersonGenderCall =
      AnonCLBXEnPersonGenderCall();
  static AnonymousInfoFormNextCall anonymousInfoFormNextCall =
      AnonymousInfoFormNextCall();
  static AnonEventAddressSuggestionCall anonEventAddressSuggestionCall =
      AnonEventAddressSuggestionCall();
  static AnonEventPopulationCall anonEventPopulationCall =
      AnonEventPopulationCall();
}

class GuestActionCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? firstTab = '',
    String? nextUI = '',
    String? apaddOns = '',
    String? apitemAddOns = '',
    String? resourceItemId = '',
    String? resourceType = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AnonymousGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'guestAction',
      apiUrl: '${baseUrl}/ui/anonymousLoginGuestUI/guestLogin/guestAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:dataActionType': "0",
        'ap:recordKey': recordKey,
        'ap:firstTab': firstTab,
        'ap:nextUI': nextUI,
        'ap:add_ons': apaddOns,
        'ap:itemAddOns': apitemAddOns,
        'ap:resourceItemId': resourceItemId,
        'ap:resourceType': resourceType,
        'a:caller': "guestLogin",
        '_id': "0",
        '_data':
            "client_data:rO0ABXNyADVjb20uY2J4LmFwcC5jdXJzb3JzLmFkbWluLkFub255bW91c0xvZ2luR3Vlc3RUZW1wbGF0ZUccvdCFuYSPAgAETAANYm90dG9tTWVzc2FnZXQAEkxqYXZhL2xhbmcvU3RyaW5nO0wADGVtcHR5TWVzc2FnZXEAfgABTAAGaGVhZGVycQB+AAFMAAdtZXNzYWdlcQB+AAF4cHQAMVRoZXJlIGFyZSBsb3Qgb2YgYmVuZWZpdHMgb2YgY3JlYXRpbmcgYW4gYWNjb3VudC50AH4vdWkvY29uc3VtZXJTaWduVXBVST9pbmNsaW5hdGlvbkl0ZW09LTEmYWRkX29ucz0wJmZpcnN0VGFiPWV2ZW50RGV0YWlsVGFiJm5leHRVST12ZW51ZUNhcnRXaXphcmQmcmVjb3JkS2V5PS0xJml0ZW1BZGRPbnM9ZmFsc2V0AAVHdWVzdHQAYVdhbnQgdG8gQ2hlY2tvdXQgd2l0aG91dCBsb2dnaW5nIGluPyA8YnI+IE5vIHByb2JsZW0sIFlvdSBjYW4gYWx3YXlzIGNyZWF0ZSB5b3VyIEFjY291bnQgTGF0ZXIuLi4=",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  String? paramsName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].name''',
      ));
  String? paramsValueURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
}

class AnonymousEventCursorCall {
  Future<ApiCallResponse> call({
    String? from = '',
    String? type = '',
    String? recordKey = '',
    String? resourceType = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AnonymousGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'anonymousEventCursor',
      apiUrl: '${baseUrl}/data/anonymousInfoCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1742293590880",
        'format': "js",
        'from': from,
        'type': type,
        'recordKey': recordKey,
        'resourceType': resourceType,
        'columns':
            "inquireComments,addtionalInfo.eventDescription,anonymousInfo.altdate2,anonymousInfo.altdate1,anonymousInfo.theme,anonymousInfo.themeCategory,address.localArea,address.postalCode,address.stateProvince,address.cityTown,address.floorSection,address.street,address.bldgNum,addressToSearch,anonymousInfo.celebrateeGender,anonymousInfo.celebrateeAge,anonymousInfo.celebratee,anonymousInfo.numOfAdults,anonymousInfo.numOfKids,anonymousInfo.totalInvitees,anonymousInfo.endTime,anonymousInfo.startTime,anonymousInfo.idealDate,anonymousInfo.phone,anonymousInfo.email,anonymousInfo.lastName,anonymousInfo.firstName,anonymousInfo.celebrationType,addtionalInfo.eventName",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? celebrationType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-celebrationType']''',
      ));
  String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-startTime']''',
      ));
  String? theme(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-theme']''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-phone']''',
      ));
  String? themeCategory(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-themeCategory']''',
      ));
  String? celebratee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-celebratee']''',
      ));
  String? numOfKids(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-numOfKids']''',
      ));
  String? numOfAdults(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-numOfAdults']''',
      ));
  String? endTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-endTime']''',
      ));
  String? idealDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-idealDate']''',
      ));
  String? altdate1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-altdate1']''',
      ));
  String? altdate2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-altdate2']''',
      ));
  String? eventName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['addtionalInfo-_-eventName']''',
      ));
  String? eventDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['addtionalInfo-_-eventDescription']''',
      ));
  String? celebrateeGender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-celebrateeGender']''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-email']''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-firstName']''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-lastName']''',
      ));
  String? ocKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? celebrateeAge(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-celebrateeAge']''',
      ));
  String? totalInvitees(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['anonymousInfo-_-totalInvitees']''',
      ));
}

class AnonCLBXEnCelebrationTypeCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AnonymousGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'anonCLBXEnCelebrationType',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnCelebrationType\$',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1742303081899",
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

class CelebrationTypeChangedCall {
  Future<ApiCallResponse> call({
    String? celebrationType = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AnonymousGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'celebrationTypeChanged',
      apiUrl:
          '${baseUrl}/ui/anonymousInfoForShoppingCart/anonymousInfoForm/changeThemeCategory',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'anonymousInfoForShoppingCart__anonymousInfoForm:r0:anonymousInfo.celebrationType':
            celebrationType,
        'anonymousInfoForShoppingCart__anonymousInfoForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|anonymousInfo.celebrationType",
        'a:refreshView': "themeFields",
        'a:clientState': clientState,
        'a:caller': "anonymousInfoForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AnonCLBXEnThemeCategoryCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AnonymousGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'anonCLBXEnThemeCategory',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/anonymousInfoThemeCategoryListPicker',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1742303976178",
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AnonCLBXEnPersonGenderCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AnonymousGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'anonCLBXEnPersonGender',
      apiUrl: '${baseUrl}/data/uiEnumerationRestriction/CLBXEnPersonGender\$',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1742306615361",
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AnonymousInfoFormNextCall {
  Future<ApiCallResponse> call({
    String? package = '',
    String? from = '',
    String? type = '',
    String? recordKey = '',
    String? clientState = '',
    String? id = '',
    String? eventName = '',
    String? celebrationType = '',
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? phone = '',
    String? idealDate = '',
    String? startTime = '',
    String? endTime = '',
    String? kids = '',
    String? adults = '',
    String? celebratee = '',
    String? celebrateeAge = '',
    String? celebrateeGender = '',
    String? themeCategory = '',
    String? theme = '',
    String? altDate1 = '',
    String? altDate2 = '',
    String? eventDescription = '',
    String? nextUI = '',
    String? totalInvitees = '',
    String? bldgNum = '',
    String? street = '',
    String? floor = '',
    String? city = '',
    String? localarea = '',
    String? state = '',
    String? postal = '',
    String? inquireComments = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AnonymousGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'anonymousInfoFormNext',
      apiUrl:
          '${baseUrl}/ui/anonymousInfoForShoppingCart/anonymousInfoForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:package': package,
        'ap:type': type,
        'ap:from': from,
        'ap:recordKey': recordKey,
        'ap:dataActionType': "0",
        'a:caller': "anonymousInfoForm",
        'a:clientState': clientState,
        '_id': id,
        'addtionalInfo.eventName': eventName,
        'anonymousInfo.celebrationType': celebrationType,
        'anonymousInfo.firstName': firstName,
        'anonymousInfo.lastName': lastName,
        'anonymousInfo.email': email,
        'anonymousInfo.phone': phone,
        'anonymousInfo.idealDate': idealDate,
        'anonymousInfo.startTime': startTime,
        'anonymousInfo.endTime': endTime,
        'anonymousInfo.numOfKids': kids,
        'anonymousInfo.numOfAdults': adults,
        'anonymousInfo.celebratee': celebratee,
        'anonymousInfo.celebrateeAge': celebrateeAge,
        'anonymousInfo.celebrateeGender': celebrateeGender,
        'anonymousInfo.themeCategory': themeCategory,
        'anonymousInfo.theme': theme,
        'anonymousInfo.altdate1': altDate1,
        'anonymousInfo.altdate2': altDate2,
        'addtionalInfo.eventDescription': eventDescription,
        'ap:nextUI': nextUI,
        'anonymousInfo.totalInvitees': totalInvitees,
        'address.bldgNum': bldgNum,
        'address.street': street,
        'address.floorSection': floor,
        'address.cityTown': city,
        'address.stateProvince': state,
        'address.postalCode': postal,
        'address.localArea': localarea,
        'inquireComments': inquireComments,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  String? paramsName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].name''',
      ));
  String? paramsValue(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
  String? toastMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class AnonEventAddressSuggestionCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? query = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AnonymousGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'anonEventAddressSuggestion',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/shoppingCartAnonymousEventCursorAddressSuggestions',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'uiContext': uiContext,
        'query': query,
        '_dc': "1742465388498",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AnonEventPopulationCall {
  Future<ApiCallResponse> call({
    String? addressToSearch = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = AnonymousGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'anonEventPopulation',
      apiUrl:
          '${baseUrl}/ui/anonymousInfoForShoppingCart/anonymousInfoForm/populateAddress',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'anonymousInfoForShoppingCart__anonymousInfoForm:r0:addressToSearch':
            addressToSearch,
        'anonymousInfoForShoppingCart__anonymousInfoForm:r0:_saveData': "false",
        'a:submitView': "self|addressToSearch",
        'a:refreshView': "refreshAddress",
        'a:clientState': clientState,
        'a:caller': "anonymousInfoForm",
        '_id': id,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-localArea']''',
      ));
  String? stateProvince(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-stateProvince']''',
      ));
  String? floorSection(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-floorSection']''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-postalCode']''',
      ));
  String? cityTown(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-cityTown']''',
      ));
  String? bldgNum(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-bldgNum']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['address-_-street']''',
      ));
}

/// End Anonymous Group Code

/// Start Rental Group Code

class RentalGroup {
  static String getBaseUrl({
    String? url,
    String? token = '',
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static GelAllRentalCall gelAllRentalCall = GelAllRentalCall();
  static RentalCategoryCall rentalCategoryCall = RentalCategoryCall();
  static RentalSuggestionCall rentalSuggestionCall = RentalSuggestionCall();
  static RentalDetailsCall rentalDetailsCall = RentalDetailsCall();
  static RentalItemCall rentalItemCall = RentalItemCall();
  static RentalItemsOfTypeCall rentalItemsOfTypeCall = RentalItemsOfTypeCall();
  static RentalItemCategoryCall rentalItemCategoryCall =
      RentalItemCategoryCall();
  static RentalPackageCall rentalPackageCall = RentalPackageCall();
  static RentalPaymentModeCall rentalPaymentModeCall = RentalPaymentModeCall();
  static RentaSimilarVendorCall rentaSimilarVendorCall =
      RentaSimilarVendorCall();
  static RentalDocumentCall rentalDocumentCall = RentalDocumentCall();
  static RentalCancellationPolicyCall rentalCancellationPolicyCall =
      RentalCancellationPolicyCall();
  static RentalItemDetailsCall rentalItemDetailsCall = RentalItemDetailsCall();
  static FoodSinglePageDetailCall foodSinglePageDetailCall =
      FoodSinglePageDetailCall();
  static RentalPackageVariationUpdateCall rentalPackageVariationUpdateCall =
      RentalPackageVariationUpdateCall();
  static RentalItemVariationUpdateCall rentalItemVariationUpdateCall =
      RentalItemVariationUpdateCall();
  static RentalItemQuantityUpdateCall rentalItemQuantityUpdateCall =
      RentalItemQuantityUpdateCall();
  static RentalPackageQuantityUpdateCall rentalPackageQuantityUpdateCall =
      RentalPackageQuantityUpdateCall();
}

class GelAllRentalCall {
  Future<ApiCallResponse> call({
    String? start = '0',
    String? filterQuery =
        '[{\"attribute\":\"geometry\",\"filterType\":\"geoDistance\",\"value\":{\"location\":[73.8502,18.5211],\"distance\":30000,\"unit\":\"Mile\"}}]',
    String? factes =
        '[{\"attribute\":\"rentalsectioncategory\"},{\"attribute\":\"themes\"},{\"attribute\":\"priceyfactor\"},{\"attribute\":\"ranking\"},{\"attribute\":\"agerange\"},{\"attribute\":\"town\"}]',
    String? clientstate = '',
    String? page = '1',
    String? limit = '20',
    dynamic sortQueryJson,
    String? query = '*',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    final sortQuery = _serializeJson(sortQueryJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'gelAllRental',
      apiUrl:
          '${baseUrl}/data/rentalGridCursor?columns=geometry,rentalSectionMainCategory,name,rentalMoreFields.emptyColumn,priceFactor,address,overallRank,description,rentalSectionList,price,rentalMoreFields.resourcePhotos,logo&_dc=1742452788177&start=${start}&forceSelection=true&filters=${filterQuery}&facets=${factes}&query=${query}&a%3AclientState=${clientstate}&page=${page}&limit=${limit}&sort=${sortQuery}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? aggregation(dynamic response) => getJsonField(
        response,
        r'''$.aggregations''',
        true,
      ) as List?;
  List<String>? overallrank(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].overallRank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? priceFactor(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].priceFactor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rentalSection(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].rentalSectionList''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? photosList(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['rentalMoreFields-_-resourcePhotos']''',
        true,
      ) as List?;
  List<String>? aggName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? buckets(dynamic response) => getJsonField(
        response,
        r'''$.aggregations[:].buckets''',
        true,
      ) as List?;
  List<String>? bucketsName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bucketsKey(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].buckets[:].key''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? ageRangeCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[0].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? ageRange(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[0].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? themsCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[1].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? theme(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[1].buckets[:].name''',
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
  List<String>? town(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[2].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? priceyFactorCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[3].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? priceyFactorName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[3].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? rentalSectionCategoryCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[4].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? rentalSectionCategoryName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[4].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? rankingCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[5].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? ranking(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[5].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? sectionMainCategory(dynamic response) => getJsonField(
        response,
        r'''$.details[:].rentalSectionMainCategory''',
        true,
      ) as List?;
  dynamic aggBuckets(dynamic response) => getJsonField(
        response,
        r'''$.aggregations[:].buckets[:]''',
      );
}

class RentalCategoryCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalCategory',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnRentalSectionType\$?_dc=1742474567978&query=&uiContext=%7B%22key%22%3A%22rentalTabContent%22%2C%22params%22%3A%7B%7D%2C%22component%22%3A%7B%22clientId%22%3A%22rentalTabContent__rentalTopFilterPanel%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22rentalTabContent__rentalTopFilterPanel%22%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RentalSuggestionCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uicontext = '',
    String? distance = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalSuggestion',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/rentalSuggestionsCursor?_dc=1742553840573&query=${query}&uiContext=${uicontext}&distance=${distance}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? count(dynamic response) => castToType<int>(getJsonField(
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RentalDetailsCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalDetails',
      apiUrl:
          '${baseUrl}/data/rentalDetailCursor/rec/${recordKey}?columns=rentalItemCount,packageItemCount,resource.basicPartyInfo.busPartyIdentifier.longDescription,resource.id,resource.minCancellationFee,resource.fullTimeframeNotes,resource.fullAmountTimeframe,resource.creditCardAccepted,resource.paymentModes,resource.resourceCosting.minDepositPolicy.name,resource.availableThemes,resource.additionalInfo.maxCapacityForGroup,resource.celebrationTypes,availDays,accomodates,resource.resourceItemPriceRange,resource.basicPartyInfo.busPartyIdentifier.description,minTimetoBook,resource.basicPartyInfo.address.location,resource.basicPartyInfo.communication.website,resource.basicPartyInfo.communication.email,resource.basicPartyInfo.communication.phone,resource.logo.url,rentalProviderType.name,resource.additionalInfo.overallRank,resource.basicPartyInfo.busPartyIdentifier.name,resource.basicPartyInfo.address.geometry&_dc=1742805933939',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  String? minTimeToBook(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].minTimetoBook''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? celebrationType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-celebrationTypes']''',
      ));
  String? creditCardAccpted(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-creditCardAccepted']''',
      ));
  String? logo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-logo-_-url']''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-communication-_-email']''',
      ));
  String? rank(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-additionalInfo-_-overallRank']''',
      ));
  String? mincancallationfees(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-minCancellationFee']''',
      ));
  String? maxCaapacityForGroup(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-additionalInfo-_-maxCapacityForGroup']''',
      ));
  String? website(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-communication-_-website']''',
      ));
  String? paymentModes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-paymentModes']''',
      ));
  String? rentalProviderName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['rentalProviderType-_-name']''',
      ));
  String? fullTimeFrameNotes(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-fullTimeframeNotes']''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-communication-_-phone']''',
      ));
  String? availableTheme(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-availableThemes']''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-name']''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-location']''',
      ));
  String? price(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-resourceItemPriceRange']''',
      ));
  String? minDepositePolicy(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-resourceCosting-_-minDepositPolicy-_-name']''',
      ));
  String? fullAmountTimeFrame(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-fullAmountTimeframe']''',
      ));
  String? accomodates(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['accomodates']''',
      ));
  dynamic geometry(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-geometry']''',
      );
  List<double>? coordinated(dynamic response) => (getJsonField(
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
  String? resourceId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-id']''',
      ));
  List<double>? latitude(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-geometry']['coordinates'][0]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? longitude(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-geometry']['coordinates'][1]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  String? availDays(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].availDays''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? longDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
      ));
  String? packageCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].packageItemCount''',
      ));
  String? rentalCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].rentalItemCount''',
      ));
}

class RentalItemCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalItem',
      apiUrl:
          '${baseUrl}/data/rentalItemsCursor?columns=rentalItem.name,rentalItem.resourceItem.name,personServed,price,addToCart,imageURL&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
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
  List<String>? personServed(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].personServed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resourceName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-resourceItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rentalItemNametype(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RentalItemsOfTypeCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? rentalTypeName = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalItemsOfType',
      apiUrl:
          '${baseUrl}/data/rentalItemsOfTypeCursor?columns=rentalItem.name,rentalItem.resourceItem.name,personServed,price,addToCart,imageURL&_dc=1742814472828&a%3AclientState=${clientState}&rentalTypeName=${rentalTypeName}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
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
  List<String>? personServed(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].personServed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resourceName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-resourceItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rentalItemNametype(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RentalItemCategoryCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalItemCategory',
      apiUrl:
          '${baseUrl}/data/rentalItemsTypeCursor?columns=value&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RentalPackageCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalPackage',
      apiUrl:
          '${baseUrl}/data/rentalPackageListCursor?columns=price,rentalPckg.resourcePackage.resourceItem.name,rentalPckg.resourcePackage.resourceItem.description,rentalPckg.resourcePackage.resourceItem.pricing,rentalPckg.resourcePackage.packagePrimaryActivity.activityType.name,rentalPckg.minAgeFormatted,rentalPckg.resourceItemDuartionFormatted,rentalPckg.weekDaysRateFormatted,rentalPckg.resourcePackage.resourceItem.resource.ageRange,rentalPckg.resourcePackage.defaultInvitee,rentalPckg.weekEndRateFormatted,imageURL&_dc=1742814472839&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? defaultInvitee(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalPckg-_-resourcePackage-_-defaultInvitee']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? durationFormatted(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalPckg-_-resourceItemDuartionFormatted']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? ageRange(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalPckg-_-resourcePackage-_-resourceItem-_-resource-_-ageRange']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalPckg-_-resourcePackage-_-resourceItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? weekendRateFormatted(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalPckg-_-weekEndRateFormatted']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? weekDayrateFormatted(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalPckg-_-weekDaysRateFormatted']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalPckg-_-resourcePackage-_-resourceItem-_-description']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? minAge(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalPckg-_-minAgeFormatted']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? activityType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalPckg-_-resourcePackage-_-packagePrimaryActivity-_-activityType-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RentalPaymentModeCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalPaymentMode',
      apiUrl:
          '${baseUrl}/data/resourcePaymentModesCursor?columns=paymentMode.name&_dc=1742814472853&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['paymentMode-_-name']''',
      ));
}

class RentaSimilarVendorCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentaSimilarVendor',
      apiUrl:
          '${baseUrl}/data/similarRentalCursor?columns=name,price,overallRank,logo&_dc=1742814472855&start=0&forceSelection=true&a%3AclientState=${clientState}&page=1&limit=20',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
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
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rank(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].overallRank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RentalDocumentCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalDocument',
      apiUrl:
          '${baseUrl}/data/venueDocsLinksGridCursor?columns=document.name,document.url&_dc=1718164339918&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RentalCancellationPolicyCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalCancellationPolicy',
      apiUrl:
          '${baseUrl}/data/cancellationPolicyDetailsCursor?columns=minDepositPolicy,fullRefundTimeFrame,cancellationNote,minCancelFeeText,depositNote,minDeposit,minRefundDeposit&_dc=1716898640948&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? minCancelFeeText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].minCancelFeeText''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? fullRefundTimeFrame(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].fullRefundTimeFrame''',
      ));
  String? minDepositePolicy(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].minDepositPolicy''',
      ));
}

class RentalItemDetailsCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? variation = '-1',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalItemDetails',
      apiUrl:
          '${baseUrl}/data/rentalItemExpanderCursor?_dc=1743515611617&format=js&cache=server&columns=priceToDisplay,imageUrl,name,rentalItem.rentalSection.resItemSection.name,description,rentalItemDenom,rentalItemDenomId,quantity,personServed,rentalItem.custpickupallowtext,rentalItem.resourceItem.additionalInfo.deliveryFee,rentalItem.resourceItem.additionalInfo.installationFee,rentalItem.weekDaysRateFormatted,rentalItem.weekEndRateFormatted,totalPrice,resourceItemDimension,resourceItemDimension.specificationDescription,resourceItemDimension.brand,resourceItemDimension.material,resourceItemDimension.powerReq,resourceItemDimension.capacityWithUnit,resourceItemDimension.weightWithUnit,resourceItemDimension.lengthWithUnit,resourceItemDimension.widthWithUnit,resourceItemDimension.depthWithUnit,resourceItemDimension.heightWithUnit&recordKey=${recordKey}&variationKey=${variation}&from=true',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? itemName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].name''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].description''',
      ));
  String? formId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? quantity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].quantity''',
      ));
  List? denomList(dynamic response) => getJsonField(
        response,
        r'''$.details[:].rentalItemDenom''',
        true,
      ) as List?;
  List<int>? denomIdList(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? denomNameList(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].resItemDenom.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? minDuration(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].resItemDenom.minDuration''',
      ));
  int? maxDuration(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].resItemDenom.maxDuration''',
      ));
  String? installationFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].resItemDenom.installationFee''',
      ));
  String? demografics(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].resItemDenom.serviceDemographics''',
      ));
  String? installRequirements(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].installRequirements''',
      ));
  String? deliveryRequirement(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].deliveryRequirements''',
      ));
  String? pickupRequirement(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].custpickupRequirements''',
      ));
  bool? pickupAllowed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].customerPickupAllowed''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  dynamic dimensionDetail(dynamic response) => getJsonField(
        response,
        r'''$.details[:].resourceItemDimension''',
      );
  String? denomIdSelected(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenomId''',
      ));
  String? pesonServerd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].personServed''',
      ));
  String? themeName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].resItemDenom.themeName''',
      ));
  String? theme(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].resItemDenom.resitemTheme''',
      ));
  List<String>? resourceDenomDescriptionList(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].rentalItemDenom[:].resItemDenom.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? powerReq(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-powerReq']''',
      ));
  String? depth(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-depthWithUnit']''',
      ));
  String? length(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-lengthWithUnit']''',
      ));
  String? width(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-widthWithUnit']''',
      ));
  String? capacity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-capacityWithUnit']''',
      ));
  String? weight(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-weightWithUnit']''',
      ));
  String? hight(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-heightWithUnit']''',
      ));
  String? sectionName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-rentalSection-_-resItemSection-_-name']''',
      ));
  String? specificationDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-specificationDescription']''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].imageUrl''',
      ));
  String? weekdayRate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-weekDaysRateFormatted']''',
      ));
  String? deliveryFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-resourceItem-_-additionalInfo-_-deliveryFee']''',
      ));
  String? weekendRate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-weekEndRateFormatted']''',
      ));
  String? material(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-material']''',
      ));
  String? dimsionBrand(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-brand']''',
      ));
  String? custPickUp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-custpickupallowtext']''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].priceToDisplay''',
      ));
}

class FoodSinglePageDetailCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? type = '1',
    String? resourceType = '2',
    String? quantity = '1',
    String? variationKey = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'foodSinglePageDetail',
      apiUrl:
          '${baseUrl}/data/foodSinglePageCartCursor?_dc=1743524037864&columns=priceToDisplay,wrapperTableId,imageUrl,itemName,description,unitPrice,actPrice,calorie,peronServerd,servedForCake,accomodates,resourceItemDenominatorId,quantity,totalPrice,minPerServed,resourceItemDenominatorList,consumer,cuisine,calorie,totalPriceNote,resourceType,minQuantity,totalPrice,incrementalQuantity&format=js&recordKey=${recordKey}&variationKey=${variationKey}&type=${type}&resourceType=${resourceType}&cache=server&quantity=${quantity}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? resouceItemdenomId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].resourceItemDenominatorId''',
      ));
  String? variationPresent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].variationisPresent''',
      ));
  String? quantity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].quantity''',
      ));
  String? minQuantity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].minQuantity''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].description''',
      ));
  String? resourceTypeId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].resourceType''',
      ));
  String? formId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? resourceTypeName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].resourceType_txt''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  List<String>? denomNameList(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].resourceItemDenominatorList[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? denomIdList(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].resourceItemDenominatorList[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  String? itemName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].itemName''',
      ));
  String? unitPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].unitPrice''',
      ));
  String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].imageUrl''',
      ));
  String? wrapperTableId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].wrapperTableId''',
      ));
  List? denomList(dynamic response) => getJsonField(
        response,
        r'''$.details[:].resourceItemDenominatorList''',
        true,
      ) as List?;
  String? personServed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].peronServerd''',
      ));
  String? servedForCake(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].servedForCake''',
      ));
  String? accomodates(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].accomodates''',
      ));
  String? incrementalQuantity(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].incrementalQuantity''',
      ));
  String? totalPriceNote(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPriceNote''',
      ));
  String? calorie(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].calorie''',
      ));
  String? minPersonServed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].minPerServed''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].priceToDisplay''',
      ));
}

class RentalPackageVariationUpdateCall {
  Future<ApiCallResponse> call({
    String? clientState =
        '{\"clientId\":\"foodSinglePageCartUI__foodSinglePageCartForm\",\"cursor\":{\"__cachedId\":\"oc_20\"}}',
    String? denominatorId = '70343',
    String? id = 'oc_20',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalPackageVariationUpdate',
      apiUrl:
          '${baseUrl}/ui/foodSinglePageCartUI/foodSinglePageCartForm/updateMenuItemDenomDataActions',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'foodSinglePageCartUI__foodSinglePageCartForm:r0:resourceItemDenominatorId':
            denominatorId,
        'foodSinglePageCartUI__foodSinglePageCartForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|resourceItemDenominatorId",
        'a:refreshView': "refreshDenomData",
        'a:clientState': clientState,
        'a:caller': "foodSinglePageCartForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? quantity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].quantity''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data''',
      );
  String? formId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].imageUrl''',
      ));
  String? itemName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].itemName''',
      ));
  String? unitPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].unitPrice''',
      ));
  String? minPersonServerd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].minPerServed''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].description''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceToDisplay''',
      ));
}

class RentalItemVariationUpdateCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? clientState = '',
    String? denomId = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalItemVariationUpdate',
      apiUrl:
          '${baseUrl}/ui/rentalItemOverview/rentalItemOverviewForm/setPriceDescriptionForVariation',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'rentalItemOverview__rentalItemOverviewForm:r0:rentalItemDenomId':
            denomId,
        'rentalItemOverview__rentalItemOverviewForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|rentalItemDenomId",
        'a:refreshView': "refreshDenomParams",
        'a:clientState': clientState,
        'a:caller': "rentalItemOverviewForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data''',
      );
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].name''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].description''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  dynamic detail(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details[:]''',
      );
}

class RentalItemQuantityUpdateCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? id = '',
    String? quantity = '',
    String? parentRecordKey = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalItemQuantityUpdate',
      apiUrl:
          '${baseUrl}/ui/rentalItemOverview/rentalItemOverviewForm/setQuantityActionForPriceTab',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:parentRecordKey': parentRecordKey,
        'rentalItemOverview__rentalItemOverviewForm:r0:quantity': quantity,
        'rentalItemOverview__rentalItemOverviewForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|quantity",
        'a:refreshView': "refreshDenomParams",
        'a:clientState': clientState,
        'a:caller': "rentalItemOverviewForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].name''',
      ));
  String? desciption(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].description''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  String? personServed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].personServed''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
}

class RentalPackageQuantityUpdateCall {
  Future<ApiCallResponse> call({
    String? quantity = '',
    String? id = '',
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalPackageQuantityUpdate',
      apiUrl:
          '${baseUrl}/ui/foodSinglePageCartUI/foodSinglePageCartForm/quantityAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'foodSinglePageCartUI__foodSinglePageCartForm:r0:quantity': quantity,
        'foodSinglePageCartUI__foodSinglePageCartForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|quantity",
        'a:refreshView': "refreshTotalPrice",
        'a:clientState': clientState,
        'a:caller': "foodSinglePageCartForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  String? formId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? minpersonServed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].minPerServed''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? unitPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].unitPrice''',
      ));
  String? priceToDisplay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceToDisplay''',
      ));
}

/// End Rental Group Code

/// Start ResourceLeval Group Code

class ResourceLevalGroup {
  static String getBaseUrl({
    String? url,
    String? token = '',
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static ResourcePhotoCall resourcePhotoCall = ResourcePhotoCall();
  static ResourceopHoursCall resourceopHoursCall = ResourceopHoursCall();
  static ResourcePaymentModeCall resourcePaymentModeCall =
      ResourcePaymentModeCall();
  static ResourceCreditCardsCall resourceCreditCardsCall =
      ResourceCreditCardsCall();
  static ResourceFAQCall resourceFAQCall = ResourceFAQCall();
  static ResourceAwardCall resourceAwardCall = ResourceAwardCall();
  static ResourceCoupenCall resourceCoupenCall = ResourceCoupenCall();
  static ResourceClientCall resourceClientCall = ResourceClientCall();
  static ResourceDeliveryCall resourceDeliveryCall = ResourceDeliveryCall();
  static ResourceCancellationPolicyCall resourceCancellationPolicyCall =
      ResourceCancellationPolicyCall();
  static ResourcereviewCall resourcereviewCall = ResourcereviewCall();
  static ResourceVideoCall resourceVideoCall = ResourceVideoCall();
}

class ResourcePhotoCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourcePhoto',
      apiUrl:
          '${baseUrl}/data/resourcePhotosCursor?&_dc=1742806593760&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].image''',
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

class ResourceopHoursCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourceopHours',
      apiUrl:
          '${baseUrl}/data/viewResourceOpHoursCursor?columns=opHoursContext,day,time&_dc=1742814472851&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? days(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].day''',
      ));
  String? opHoursContext(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].opHoursContext''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].time''',
      ));
}

class ResourcePaymentModeCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourcePaymentMode',
      apiUrl:
          '${baseUrl}/data/resourcePaymentModesCursor?columns=paymentMode.name&_dc=1742814472853&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['paymentMode-_-name']''',
      ));
}

class ResourceCreditCardsCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourceCreditCards',
      apiUrl:
          '${baseUrl}/data/resourceCreditCardsCursor?columns=cardType.name&_dc=1742814472854&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['cardType-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ResourceFAQCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourceFAQ',
      apiUrl:
          '${baseUrl}/data/resourceFaqCursor?columns=question,answer&_dc=1742890902815&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? question(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? answer(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].answer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ResourceAwardCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourceAward',
      apiUrl:
          '${baseUrl}/data/allResourceAwardCursor?columns=name,awardType.name,year,source,awardURL,image.url&_dc=1742890902800&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].name''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? year(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].year''',
      ));
}

class ResourceCoupenCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourceCoupen',
      apiUrl:
          '${baseUrl}/data/resourceCouponCursor?columns=name,coupounVaildDate,applicableType.name,discountWithType,media.url&_dc=1742890902800&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].name''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? coupenValidatedDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].coupounVaildDate''',
      ));
  String? discountithType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].discountWithType''',
      ));
}

class ResourceClientCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourceClient',
      apiUrl:
          '${baseUrl}/data/resourceClientGridCursor?columns=name,resourceClient.sinceYear,imageURL&_dc=1742890902799&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].name''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].imageURL''',
      ));
  String? sinceYear(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceClient-_-sinceYear']''',
      ));
}

class ResourceDeliveryCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourceDelivery',
      apiUrl:
          '${baseUrl}/data/resourceDeliveryGridCursor?columns=maxDistanceWithUnit,standarddistance,standardPlusdeliveryRate,deliveryHours.timeFormatted,colonSeparatedtowns,deliveryAreaDoc.document.url&_dc=1742890902798&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? rate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].standardPlusdeliveryRate''',
      ));
  String? standeredDistance(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].standarddistance''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? maxDistance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].maxDistanceWithUnit''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? deliveryHours(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['deliveryHours-_-timeFormatted']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? url(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['deliveryAreaDoc-_-document-_-url']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? availableTown(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].colonSeparatedtowns''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ResourceCancellationPolicyCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourceCancellationPolicy',
      apiUrl:
          '${baseUrl}/data/cancellationPolicyDetailsCursor?columns=minDepositPolicy,fullRefundTimeFrame,cancellationNote,minCancelFeeText,depositNote,minDeposit,minRefundDeposit&_dc=1716898640948&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? minCancelFeeText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].minCancelFeeText''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? fullRefundTimeFrame(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].fullRefundTimeFrame''',
      ));
  String? minDepositePolicy(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].minDepositPolicy''',
      ));
}

class ResourcereviewCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourcereview',
      apiUrl:
          '${baseUrl}/data/resourceReviewGridCursor?columns=socialMediaType,currentRating,reviewAndLike&_dc=1716898640941&a%3AclientState=${query}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totaalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? mediaType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].socialMediaType''',
      ));
  String? currentRating(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].currentRating''',
      ));
  String? reviewAndLike(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].reviewAndLike''',
      ));
}

class ResourceVideoCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = ResourceLevalGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'resourceVideo',
      apiUrl:
          '${baseUrl}/data/resourceOverviewVideoCursor?columns=video&_dc=1716664888582&a%3AclientState=${query}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  dynamic video(dynamic response) => getJsonField(
        response,
        r'''$.details[:].video''',
      );
  List<String>? url(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].video.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].video.type''',
      ));
}

/// End ResourceLeval Group Code

/// Start Entertainer Group Code

class EntertainerGroup {
  static String getBaseUrl({
    String? url,
    String? token = '',
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static GelAllEntertainerCall gelAllEntertainerCall = GelAllEntertainerCall();
  static EntertainerCategoryCall entertainerCategoryCall =
      EntertainerCategoryCall();
  static EntertainerSuggestionCall entertainerSuggestionCall =
      EntertainerSuggestionCall();
  static EntertainerDetailsCall entertainerDetailsCall =
      EntertainerDetailsCall();
  static EntertainerActivitiesCall entertainerActivitiesCall =
      EntertainerActivitiesCall();
  static EntertainerPackageCall entertainerPackageCall =
      EntertainerPackageCall();
  static EntertainerItemBySectionCall entertainerItemBySectionCall =
      EntertainerItemBySectionCall();
  static EntertainerItemSectionNameCall entertainerItemSectionNameCall =
      EntertainerItemSectionNameCall();
  static EntertainerTravalInfoCall entertainerTravalInfoCall =
      EntertainerTravalInfoCall();
  static EntertainerAddonCall entertainerAddonCall = EntertainerAddonCall();
  static EntertainerSimilarVendorCall entertainerSimilarVendorCall =
      EntertainerSimilarVendorCall();
  static EntertainerPackageDetailCall entertainerPackageDetailCall =
      EntertainerPackageDetailCall();
}

class GelAllEntertainerCall {
  Future<ApiCallResponse> call({
    String? start = '0',
    String? filterQuery =
        '[{\"attribute\":\"geometry\",\"filterType\":\"geoDistance\",\"value\":{\"location\":[73.8502,18.5211],\"distance\":30000,\"unit\":\"Mile\"}}]',
    String? factes =
        '[{\"attribute\":\"entserviceprovidercategory\"},{\"attribute\":\"ranking\"},{\"attribute\":\"priceyfactor\"},{\"attribute\":\"agerange\"},{\"attribute\":\"town\"}]',
    String? clientstate = '',
    String? page = '1',
    String? limit = '20',
    dynamic sortQueryJson,
    String? query = '*',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    final sortQuery = _serializeJson(sortQueryJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'gelAllEntertainer',
      apiUrl:
          '${baseUrl}/data/entertainmentGridCursor?columns=geometry,name,entertainMoreFields.emptyColumn,priceFactor,address,overallRank,description,entserviceprovidercategory,price,entertainMoreFields.maxDistance,entertainMoreFields.resourcePhotos,logo&_dc=1742452788177&start=${start}&forceSelection=true&filters=${filterQuery}&facets=${factes}&query=${query}&a%3AclientState=${clientstate}&page=${page}&limit=${limit}&sort=${sortQuery}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? aggregation(dynamic response) => getJsonField(
        response,
        r'''$.aggregations''',
        true,
      ) as List?;
  List<String>? overallrank(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].overallRank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? priceFactor(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].priceFactor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? photosList(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['entertainMoreFields-_-resourcePhotos']''',
        true,
      ) as List?;
  List<String>? aggName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? buckets(dynamic response) => getJsonField(
        response,
        r'''$.aggregations[:].buckets''',
        true,
      ) as List?;
  List<String>? bucketsName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bucketsKey(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].buckets[:].key''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? ageRangeCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[0].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? ageRange(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[0].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? entserviceprovidercategoryCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[1].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? entserviceprovidercategory(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[1].buckets[:].name''',
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
  List<String>? town(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[2].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? priceyFactorCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[3].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? priceyFactorName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[3].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? rankingCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[4].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? ranking(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[4].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? providerCategory(dynamic response) => getJsonField(
        response,
        r'''$.details[:].entserviceprovidercategory''',
        true,
      ) as List?;
  List<String>? maxDistance(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['entertainMoreFields-_-maxDistance']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? geometry(dynamic response) => getJsonField(
        response,
        r'''$.details[:].geometry''',
        true,
      ) as List?;
  List? coordinates(dynamic response) => getJsonField(
        response,
        r'''$.details[:].geometry.coordinates''',
        true,
      ) as List?;
  dynamic aggBuckets(dynamic response) => getJsonField(
        response,
        r'''$.aggregations[:].buckets[:]''',
      );
}

class EntertainerCategoryCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerCategory',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnEntertainSectionType\$?_dc=1743750752544&query=&uiContext=%7B%22key%22%3A%22entertainmentTabContent%22%2C%22params%22%3A%7B%7D%2C%22component%22%3A%7B%22clientId%22%3A%22entertainmentTabContent__entertainmentTopFilterPanel%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22entertainmentTabContent__entertainmentTopFilterPanel%22%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EntertainerSuggestionCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uicontext = '',
    String? distance = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerSuggestion',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/entertainmentSuggestionsCursor?_dc=1742553840573&query=${query}&uiContext=${uicontext}&distance=${distance}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? count(dynamic response) => castToType<int>(getJsonField(
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EntertainerDetailsCall {
  Future<ApiCallResponse> call({
    String? key = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerDetails',
      apiUrl:
          '${baseUrl}/data/entertainServiceDetailsCursor/rec/${key}?columns=itemCount,packageCount,resource.id,creditCardAccepted,paymentModes,ageRange,celebrationTypes,minTimeToBook,resource.resourceItemPriceRange,resource.basicPartyInfo.busPartyIdentifier.description,resource.basicPartyInfo.busPartyIdentifier.longDescription,resource.basicPartyInfo.address.location,resource.basicPartyInfo.communication.website,resource.basicPartyInfo.communication.email,resource.basicPartyInfo.communication.phone,resource.logo.url,entServiceProviderCategory.name,resource.additionalInfo.overallRank,resource.basicPartyInfo.busPartyIdentifier.name,resource.basicPartyInfo.address.geometry&_dc=1744005566838',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? ageRange(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].ageRange''',
      ));
  String? creditCardAccpted(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['creditCardAccepted']''',
      ));
  String? category(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['entServiceProviderCategory-_-name']''',
      ));
  String? logo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-logo-_-url']''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-communication-_-email']''',
      ));
  String? rank(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-additionalInfo-_-overallRank']''',
      ));
  String? celebrationTypes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['celebrationTypes']''',
      ));
  String? website(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-communication-_-website']''',
      ));
  String? paymentModes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['paymentModes']''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-communication-_-phone']''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-name']''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-location']''',
      ));
  dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['resource-_-resourceItemPriceRange']''',
      );
  dynamic geometry(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-geometry']''',
      );
  List<double>? coordinated(dynamic response) => (getJsonField(
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
  String? resourceId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-id']''',
      ));
  List<double>? latitude(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-geometry']['coordinates'][0]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? longitude(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-address-_-geometry']['coordinates'][1]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  String? minTImeTOBook(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].minTimeToBook''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? longDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
      ));
  String? packageCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].packageCount''',
      ));
  String? paymentMode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].paymentModes''',
      ));
  String? credictcardAccepted(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].creditCardAccepted''',
      ));
  String? celebrationType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].celebrationTypes''',
      ));
  String? itemCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].itemCount''',
      ));
}

class EntertainerActivitiesCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerActivities',
      apiUrl:
          '${baseUrl}/data/entertainmentActivityCursor?columns=serviceCategory.name&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['serviceCategory-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EntertainerPackageCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerPackage',
      apiUrl:
          '${baseUrl}/data/viewEntertainPackagePageGridCursor?columns=pricing,entPackage.resourcePackage.resourceItem.pricing,entPackage.resourcePackage.resourceItem.id,entPackage.resourcePackage.resourceItem.name,entPackage.resourcePackage.resourceItem.description,entPackage.resourcePackage.resourceItem.additionalInfo.minPersons,entPackage.resourcePackage.resourceItem.additionalInfo.maxPersons,entPackage.resourcePackage.resourceItem.additionalInfo.minDuration,entPackage.resourcePackage.resourceItem.additionalInfo.maxDuration,entPackage.weekEndRateFormatted,imageUrl&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['entPackage-_-resourcePackage-_-resourceItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].imageUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['entPackage-_-resourcePackage-_-resourceItem-_-description']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? minPersons(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['entPackage-_-resourcePackage-_-resourceItem-_-additionalInfo-_-minPersons']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? minDuration(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['entPackage-_-resourcePackage-_-resourceItem-_-additionalInfo-_-minDuration']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? maxPerson(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['entPackage-_-resourcePackage-_-resourceItem-_-additionalInfo-_-maxPersons']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? maxDuration(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['entPackage-_-resourcePackage-_-resourceItem-_-additionalInfo-_-maxDuration']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resourceItemId(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['entPackage-_-resourcePackage-_-resourceItem-_-id']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].pricing''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EntertainerItemBySectionCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? sectionName = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerItemBySection',
      apiUrl:
          '${baseUrl}/data/viewEntertainItemsBySectionPageGridCursor?columns=pricing,item.resourceItem.durationFormat,item.serviceSection.resItemSection.name,item.resourceItem.name,item.resourceItem.description,item.resourceItem.additionalInfo.minPersons,item.resourceItem.additionalInfo.maxPersons,item.resourceItem.additionalInfo.minDuration,item.resourceItem.additionalInfo.maxDuration,item.pricing,imageUrl,item.resourceItem.id&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1&sectionName=${sectionName}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? catogary(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['item-_-serviceSection-_-resItemSection-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['item-_-resourceItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].imageUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['item-_-resourceItem-_-description']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? minPersons(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['item-_-resourceItem-_-additionalInfo-_-minPersons']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? minDuration(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['item-_-resourceItem-_-additionalInfo-_-minDuration']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? maxPerson(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['item-_-resourceItem-_-additionalInfo-_-maxPersons']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? maxDuration(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['item-_-resourceItem-_-additionalInfo-_-maxDuration']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resourceItemId(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['item-_-resourceItem-_-id']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? durationFormatted(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['item-_-resourceItem-_-durationFormat']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].pricing''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EntertainerItemSectionNameCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerItemSectionName',
      apiUrl:
          '${baseUrl}/data/entertainItemsSectionNameCursor?columns=value&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EntertainerTravalInfoCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerTravalInfo',
      apiUrl:
          '${baseUrl}/data/entertainmentTravleInfoSectionCursor?columns=rangeOfStandardDistance,standardRate,rangeOfMaxDistance,deliveryFeePerUnit&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? maxDistanceRange(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].rangeOfMaxDistance''',
      ));
  String? deliveryFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].deliveryFeePerUnit''',
      ));
  String? standeredDistanceRange(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].rangeOfStandardDistance''',
      ));
  String? stanredRate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].standardRate''',
      ));
}

class EntertainerAddonCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerAddon',
      apiUrl:
          '${baseUrl}/data/entertainmentAddonsCursor?columns=name&_dc=1742814472839&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EntertainerSimilarVendorCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerSimilarVendor',
      apiUrl:
          '${baseUrl}/data/similarEntertainServicesCursor?columns=name,price,overallRank,logo&_dc=1742814472855&start=0&forceSelection=true&a%3AclientState=${clientState}&page=1&limit=20',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
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
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rank(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].overallRank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EntertainerPackageDetailCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? type = '0',
    String? resourceType = '1',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = EntertainerGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'entertainerPackageDetail',
      apiUrl:
          '${baseUrl}/data/foodSinglePageCartCursor?_dc=1743524037864&columns=wrapperTableId,imageUrl,itemName,description,unitPrice,actPrice,calorie,peronServerd,servedForCake,accomodates,resourceItemDenominatorId,quantity,totalPrice,minPerServed,resourceItemDenominatorList,consumer,cuisine,calorie,totalPriceNote,resourceType,minQuantity,totalPrice,incrementalQuantity&format=js&recordKey=${recordKey}&type=${type}&resourceType=${resourceType}&cache=server',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? resouceItemdenomId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].resourceItemDenominatorId''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].description''',
      ));
  String? resourceTypeId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].resourceType''',
      ));
  String? formId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? resourceTypeName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].resourceType_txt''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  List<String>? denomNameList(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].resourceItemDenominatorList[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? denomIdList(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].resourceItemDenominatorList[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  String? itemName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].itemName''',
      ));
  String? unitPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].unitPrice''',
      ));
  String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].imageUrl''',
      ));
  String? wrapperTableId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].wrapperTableId''',
      ));
  List? denomList(dynamic response) => getJsonField(
        response,
        r'''$.details[:].resourceItemDenominatorList''',
        true,
      ) as List?;
  String? minPersonServed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].minPerServed''',
      ));
  String? totalPriceNote(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPriceNote''',
      ));
  String? cuisinetxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].cuisine_txt''',
      ));
}

/// End Entertainer Group Code

/// Start Cake Group Code

class CakeGroup {
  static String getBaseUrl({
    String? url,
    String? token = '',
    String? header,
  }) {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${url}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static GelAllCakeCall gelAllCakeCall = GelAllCakeCall();
  static CakeThemesCall cakeThemesCall = CakeThemesCall();
  static CakeSuggestionCall cakeSuggestionCall = CakeSuggestionCall();
  static CakeDetailsCall cakeDetailsCall = CakeDetailsCall();
  static CakeFlavorsCall cakeFlavorsCall = CakeFlavorsCall();
  static CakeFillingCall cakeFillingCall = CakeFillingCall();
  static CakeShapesCall cakeShapesCall = CakeShapesCall();
  static CakeSizesCall cakeSizesCall = CakeSizesCall();
  static CakeColorsCall cakeColorsCall = CakeColorsCall();
  static CakeIcingCall cakeIcingCall = CakeIcingCall();
  static CakeItemCall cakeItemCall = CakeItemCall();
  static CakeItemSectionsCall cakeItemSectionsCall = CakeItemSectionsCall();
  static CakeItemOfSectionCall cakeItemOfSectionCall = CakeItemOfSectionCall();
  static BakeryMenuSectionsCall bakeryMenuSectionsCall =
      BakeryMenuSectionsCall();
  static CakeSimilarVendorCall cakeSimilarVendorCall = CakeSimilarVendorCall();
}

class GelAllCakeCall {
  Future<ApiCallResponse> call({
    String? start = '0',
    String? filterQuery =
        '[{\"attribute\":\"geometry\",\"filterType\":\"geoDistance\",\"value\":{\"location\":[73.8502,18.5211],\"distance\":30000,\"unit\":\"Mile\"}}]',
    String? factes =
        '[{\"attribute\":\"foodprovidertype\"},{\"attribute\":\"menurestrictions\"},{\"attribute\":\"cakeflavors\"},{\"attribute\":\"themes\"},{\"attribute\":\"fillings\"},{\"attribute\":\"icecreamflavors\"},{\"attribute\":\"priceyfactor\"},{\"attribute\":\"ranking\"},{\"attribute\":\"town\"},{\"attribute\":\"mindeliveryfee\"}]',
    String? clientstate = '',
    String? page = '1',
    String? limit = '20',
    dynamic sortQueryJson,
    String? query = '*',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    final sortQuery = _serializeJson(sortQueryJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'gelAllCake',
      apiUrl:
          '${baseUrl}/data/cakeGridCursor?columns=geometry,name,cakeMoreFields.emptyColumn,priceFactor,address,overallRank,description,menuSectionNameList,price,cakeMoreFields.resourcePhotos,logo&_dc=1742452788177&start=${start}&forceSelection=true&filters=${filterQuery}&facets=${factes}&query=${query}&a%3AclientState=${clientstate}&page=${page}&limit=${limit}&sort=${sortQuery}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? aggregation(dynamic response) => getJsonField(
        response,
        r'''$.aggregations''',
        true,
      ) as List?;
  List<String>? overallrank(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].overallRank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? priceFac(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].priceFactor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? photosList(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['cakeMoreFields-_-resourcePhotos']''',
        true,
      ) as List?;
  List<String>? aggName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? buckets(dynamic response) => getJsonField(
        response,
        r'''$.aggregations[:].buckets''',
        true,
      ) as List?;
  List<String>? bucketsName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bucketsKey(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[:].buckets[:].key''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? foodprovidertypeCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[0].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? foodprovidertype(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[0].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? themesCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[1].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? themes(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[1].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? icecreamflavorsCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[2].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? icecreamflavors(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[2].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? fillingsCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[3].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? fillingsName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[3].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? townCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[4].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? town(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[4].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? geometry(dynamic response) => getJsonField(
        response,
        r'''$.details[:].geometry''',
        true,
      ) as List?;
  List? coordinates(dynamic response) => getJsonField(
        response,
        r'''$.details[:].geometry.coordinates''',
        true,
      ) as List?;
  List<String>? menuSectionList(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].menuSectionNameList''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? menuRestrictionsCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[5].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? menuRestrictions(dynamic response) => (getJsonField(
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
        r'''$.aggregations[6].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? priceyfactorName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[6].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? cakeflavorsCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[7].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? cakeflavors(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[7].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? mindeliveryfeeCount(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[8].buckets[*].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? mindeliveryfee(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[8].buckets[:].name''',
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
  List<String>? rankingName(dynamic response) => (getJsonField(
        response,
        r'''$.aggregations[9].buckets[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  dynamic aggBuckets(dynamic response) => getJsonField(
        response,
        r'''$.aggregations[:].buckets[:]''',
      );
}

class CakeThemesCall {
  Future<ApiCallResponse> call({
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CakeThemes',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnThemeCategory\$?_dc=1744142443794&query=&uiContext=%7B%22key%22%3A%22cakeTabContent%22%2C%22params%22%3A%7B%7D%2C%22component%22%3A%7B%22clientId%22%3A%22cakeTabContent__cakeTopFilterPanel%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22cakeTabContent__cakeTopFilterPanel%22%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeSuggestionCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uicontext = '',
    String? distance = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CakeSuggestion',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/cakeSuggestionsCursor?_dc=1742553840573&query=${query}&uiContext=${uicontext}&distance=${distance}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  int? count(dynamic response) => castToType<int>(getJsonField(
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
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeDetailsCall {
  Future<ApiCallResponse> call({
    String? key = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CakeDetails',
      apiUrl:
          '${baseUrl}/data/cakeDetailsCursor/rec/${key}?columns=hideCustomizeCakeButton,foodProvider.resource.id,foodProvider.paymentModes,foodProvider.creditCardAccepted,foodProvider.resource.basicPartyInfo.address.location,readyMadeCakeCount,hideCustomizeCakeButton,foodProvider.resource.basicPartyInfo.busPartyIdentifier.longDescription,minTimeToBook,specialities,menuSectionCategories,themes,celebrationTypes,menuSectionNames,foodProvider.resource.resourceItemPriceRange,foodProvider.resource.basicPartyInfo.busPartyIdentifier.description,foodProvider.resource.basicPartyInfo.communication.website,foodProvider.resource.basicPartyInfo.communication.email,foodProvider.resource.basicPartyInfo.communication.phone,foodProvider.resource.logo.url,foodProvider.foodProviderType.name,foodProvider.resource.additionalInfo.overallRank,foodProvider.resource.basicPartyInfo.busPartyIdentifier.name,foodProvider.resource.basicPartyInfo.address.geometry&_dc=1744142928622',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? themes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].themes''',
      ));
  String? foodProviderType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-foodProviderType-_-name']''',
      ));
  String? logo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-logo-_-url']''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-communication-_-email']''',
      ));
  String? rank(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-additionalInfo-_-overallRank']''',
      ));
  String? celebrationTypes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['celebrationTypes']''',
      ));
  String? website(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-communication-_-website']''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-communication-_-phone']''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-busPartyIdentifier-_-name']''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-address-_-location']''',
      ));
  String? price(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-resourceItemPriceRange']''',
      ));
  dynamic geometry(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-address-_-geometry']''',
      );
  List<double>? coordinated(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-address-_-geometry']['coordinates']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-busPartyIdentifier-_-description']''',
      ));
  String? resourceId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-id']''',
      ));
  List<double>? latitude(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-address-_-geometry']['coordinates'][0]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? longitude(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-address-_-geometry']['coordinates'][1]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  String? minTImeTOBook(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].minTimeToBook''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? longDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-resource-_-basicPartyInfo-_-busPartyIdentifier-_-longDescription']''',
      ));
  String? menuSectionNames(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].menuSectionNames''',
      ));
  String? menuSectionCategories(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].menuSectionCategories''',
      ));
  String? specialities(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].specialities''',
      ));
  String? readymadeCakeCount(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].readyMadeCakeCount''',
      ));
  String? paymentModes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-paymentModes']''',
      ));
  String? credictCardAccpted(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['foodProvider-_-creditCardAccepted']''',
      ));
  String? hideCustomizeCakeButton(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].hideCustomizeCakeButton''',
      ));
}

class CakeFlavorsCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CakeFlavors',
      apiUrl:
          '${baseUrl}/data/cakeFlavorsCursor?columns=name&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeFillingCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CakeFilling',
      apiUrl:
          '${baseUrl}/data/cakeFillingsCursor?columns=name&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeShapesCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeShapes',
      apiUrl:
          '${baseUrl}/data/cakeShapesCursor?columns=name&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeSizesCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeSizes',
      apiUrl:
          '${baseUrl}/data/cakeSizesCursor?columns=name&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeColorsCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeColors',
      apiUrl:
          '${baseUrl}/data/cakeColorsCursor?columns=name&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeIcingCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeIcing',
      apiUrl:
          '${baseUrl}/data/cakeIcingsCursor?columns=name&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeItemCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CakeItem',
      apiUrl:
          '${baseUrl}/data/bakeryItemsCursor?columns=bakeryItem.menuItem.menuSection.resItemSection.name,bakeryItem.menuItem.resourceItem.name,personServed,calorie,price,addToCart,imageURL,rank&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? menuSectionName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['bakeryItem-_-menuItem-_-menuSection-_-resItemSection-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['bakeryItem-_-menuItem-_-resourceItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? personServed(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].personServed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].imageURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lable(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addToCart''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rank(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].rank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? calorie(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].calorie''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeItemSectionsCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CakeItemSections',
      apiUrl:
          '${baseUrl}/data/bakeryItemsTypeCursor?columns=value&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeItemOfSectionCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? sectionName = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CakeItemOfSection',
      apiUrl:
          '${baseUrl}/data/bakeryItemsByNameCursor?columns=bakeryItem.menuItem.menuSection.resItemSection.name,bakeryItem.menuItem.resourceItem.name,personServed,calorie,price,addToCart,imageURL,rank&_dc=1742814472828&a%3AclientState=${clientState}&page=1&start=0&limit=-1&bakeryItemTypeName=${sectionName}',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? detail(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? menuSectionName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['bakeryItem-_-menuItem-_-menuSection-_-resItemSection-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['bakeryItem-_-menuItem-_-resourceItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? personServed(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].personServed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].imageURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lable(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].addToCart''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rank(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].rank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? calorie(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].calorie''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BakeryMenuSectionsCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'bakeryMenuSections',
      apiUrl:
          '${baseUrl}/data/bakeryMenuSectionsGridCursor?columns=name&_dc=1742814472839&a%3AclientState=${clientState}&page=1&start=0&limit=-1',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeSimilarVendorCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? url,
    String? token = '',
    String? header,
  }) async {
    url ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CakeGroup.getBaseUrl(
      url: url,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CakeSimilarVendor',
      apiUrl:
          '${baseUrl}/data/similarBakeryCursor?columns=name,price,overallRank,logo&_dc=1742814472855&start=0&forceSelection=true&a%3AclientState=${clientState}&page=1&limit=20',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].name''',
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
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? logo(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rank(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].overallRank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Cake Group Code

/// Start RentalShoppingCart Group Code

class RentalShoppingCartGroup {
  static String getBaseUrl({
    String? baseURL,
    String? token = '',
    String? header,
  }) {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${baseURL}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static RentalFirstPageCursorCall rentalFirstPageCursorCall =
      RentalFirstPageCursorCall();
  static RentalFirstPageQuantityChangedCall rentalFirstPageQuantityChangedCall =
      RentalFirstPageQuantityChangedCall();
  static RentalFirstPageVariationCursorCall rentalFirstPageVariationCursorCall =
      RentalFirstPageVariationCursorCall();
  static RentalFirstPageVariationChangedCall
      rentalFirstPageVariationChangedCall =
      RentalFirstPageVariationChangedCall();
  static RentalFirstPageNextCall rentalFirstPageNextCall =
      RentalFirstPageNextCall();
  static DeliveryPageCursorCall deliveryPageCursorCall =
      DeliveryPageCursorCall();
  static DeliveryTypeChangedCall deliveryTypeChangedCall =
      DeliveryTypeChangedCall();
  static DeliveryAddressSuggesionCall deliveryAddressSuggesionCall =
      DeliveryAddressSuggesionCall();
  static DeliveryPopulateAddressCall deliveryPopulateAddressCall =
      DeliveryPopulateAddressCall();
  static DeliveryPageNextCall deliveryPageNextCall = DeliveryPageNextCall();
  static FoodSinglePageNextCall foodSinglePageNextCall =
      FoodSinglePageNextCall();
  static ReadyMakeCakeCustomCursorCall readyMakeCakeCustomCursorCall =
      ReadyMakeCakeCustomCursorCall();
  static RMCustomPageCheckboxChangedCall rMCustomPageCheckboxChangedCall =
      RMCustomPageCheckboxChangedCall();
  static RMCustomPageNextCall rMCustomPageNextCall = RMCustomPageNextCall();
}

class RentalFirstPageCursorCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? variationKey = '-1',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalFirstPageCursor',
      apiUrl: '${baseUrl}/data/rentalItemExpanderCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1742972984544",
        'format': "js",
        'recordKey': recordKey,
        'columns':
            "resourceItemDimension.heightWithUnit,resourceItemDimension.depthWithUnit,resourceItemDimension.widthWithUnit,resourceItemDimension.lengthWithUnit,resourceItemDimension.weightWithUnit,resourceItemDimension.capacityWithUnit,resourceItemDimension.powerReq,resourceItemDimension.material,resourceItemDimension.brand,resourceItemDimension.specificationDescription,totalPrice,rentalItem.weekEndRateFormatted,rentalItem.weekDaysRateFormatted,rentalItem.resourceItem.additionalInfo.installationFee,rentalItem.resourceItem.additionalInfo.deliveryFee,rentalItem.custpickupallowtext,personServed,quantity,rentalItemDenomId,description,rentalItem.rentalSection.resItemSection.name,name,imageUrl",
        'cache': "server",
        'variationKey': variationKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? itemName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].name''',
      ));
  String? quantity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].quantity''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].imageUrl''',
      ));
  String? rentalItemDenomId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].rentalItemDenomId''',
      ));
  List<String>? specificationDescription(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-specificationDescription']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? weekDaysRateFormatted(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-weekDaysRateFormatted']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? depthWithUnit(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-depthWithUnit']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? weekEndRateFormatted(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-weekEndRateFormatted']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? powerReq(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-powerReq']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? sectionName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-rentalSection-_-resItemSection-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? capacityWithUnit(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-capacityWithUnit']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? material(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-material']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lengthWithUnit(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-lengthWithUnit']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dimensionBrand(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-brand']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? weightWithUnit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-weightWithUnit']''',
      ));
  List<String>? installationFee(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['rentalItem-_-resourceItem-_-additionalInfo-_-installationFee']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? heightWithUnit(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemDimension-_-heightWithUnit']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].description''',
      ));
  String? personServed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].personServed''',
      ));
}

class RentalFirstPageQuantityChangedCall {
  Future<ApiCallResponse> call({
    String? quantity = '',
    String? parentRecordKey = '',
    String? clientStates = '',
    String? id = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalFirstPageQuantityChanged',
      apiUrl:
          '${baseUrl}/ui/rentalItemOverview/rentalItemOverviewForm/setQuantityActionForPriceTab',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:parentRecordKey': parentRecordKey,
        'rentalItemOverview__rentalItemOverviewForm:r0:quantity': quantity,
        'rentalItemOverview__rentalItemOverviewForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|quantity",
        'a:refreshView': "refreshDenomParams",
        'a:clientState': clientStates,
        'a:caller': "rentalItemOverviewForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
}

class RentalFirstPageVariationCursorCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalFirstPageVariationCursor',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/rentalItemVariationListPicker',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1743047732209",
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

class RentalFirstPageVariationChangedCall {
  Future<ApiCallResponse> call({
    String? denomId = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalFirstPageVariationChanged',
      apiUrl:
          '${baseUrl}/ui/rentalItemOverview/rentalItemOverviewForm/setPriceDescriptionForVariation',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'rentalItemOverview__rentalItemOverviewForm:r0:rentalItemDenomId':
            denomId,
        'rentalItemOverview__rentalItemOverviewForm:r0:_saveData': "false",
        '_id': id,
        'a:submitView': "self|rentalItemDenomId",
        'a:refreshView': "refreshDenomParams",
        'a:clientState': clientState,
        'a:caller': "rentalItemOverviewForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].name''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? personServed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].personServed''',
      ));
  String? specificationDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemDimension-_-specificationDescription']''',
      ));
  String? depthWithUnit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemDimension-_-depthWithUnit']''',
      ));
  String? powerReq(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemDimension-_-powerReq']''',
      ));
  String? capacityWithUnit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemDimension-_-capacityWithUnit']''',
      ));
  String? material(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemDimension-_-material']''',
      ));
  String? brand(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemDimension-_-brand']''',
      ));
  String? lengthWithUnit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemDimension-_-lengthWithUnit']''',
      ));
  String? widthWithUnit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemDimension-_-widthWithUnit']''',
      ));
  String? weightWithUnit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemDimension-_-weightWithUnit']''',
      ));
  String? heightWithUnit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemDimension-_-heightWithUnit']''',
      ));
}

class RentalFirstPageNextCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? clientState = '',
    String? quantity = '',
    String? parentRecordKey = '',
    String? rentalItemDenomId = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rentalFirstPageNext',
      apiUrl:
          '${baseUrl}/ui/rentalItemOverview/rentalItemOverviewForm/addToCart',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:parentRecordKey': parentRecordKey,
        'a:clientState': clientState,
        'a:caller': "rentalItemOverviewForm",
        '_id': id,
        'quantity': quantity,
        'rentalItemDenomId': rentalItemDenomId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
}

class DeliveryPageCursorCall {
  Future<ApiCallResponse> call({
    String? resourceType = '',
    String? type = '',
    String? recordKey = '',
    String? quantity = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DeliveryPageCursor',
      apiUrl: '${baseUrl}/data/shoppingCartDeliveryCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1743733903535",
        'format': "js",
        'renderTo': "contains_shoppingCartDeliveryUI",
        'resourceType': resourceType,
        'type': type,
        'recordKey': recordKey,
        'quantity': quantity,
        'columns':
            "itemTotalPriceDisplay,totalPrice,totalTravelFee,travelFeesperDistance,distance,standardPlusdeliveryRate,standarddistance,resourceItemRequestAddlInfo.whereAddress.postalCode,resourceItemRequestAddlInfo.whereAddress.stateProvince,resourceItemRequestAddlInfo.whereAddress.cityTown,resourceItemRequestAddlInfo.whereAddress.localArea,resourceItemRequestAddlInfo.whereAddress.street,resourceItemRequestAddlInfo.whereAddress.floorSection,resourceItemRequestAddlInfo.whereAddress.bldgNum,address,resourceItemRequestAddlInfo.deliveryType,itemTotalPrice,name",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].name''',
      ));
  String? itemTotalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].itemTotalPrice''',
      ));
  String? ocKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? standarddistance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].standarddistance''',
      ));
  String? standardPlusdeliveryRate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].standardPlusdeliveryRate''',
      ));
  String? distance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].distance''',
      ));
  String? travelFeesperDistance(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].travelFeesperDistance''',
      ));
  String? totalTravelFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalTravelFee''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address''',
      ));
  String? deliveryType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemRequestAddlInfo-_-deliveryType']''',
      ));
  String? itemTotalPriceDisplay(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].itemTotalPriceDisplay''',
      ));
}

class DeliveryTypeChangedCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? deliveryType = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DeliveryTypeChanged',
      apiUrl:
          '${baseUrl}/ui/shoppingCartDeliveryUI/shoppingCartDeliveryForm/selectAddr',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm:r0:resourceItemRequestAddlInfo.deliveryType':
            deliveryType,
        'contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|resourceItemRequestAddlInfo.deliveryType",
        'a:refreshView': "addressChanged",
        'a:clientState': clientState,
        'a:caller': "shoppingCartDeliveryForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? totalTravelFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalTravelFee''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].address''',
      ));
  String? distance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].distance''',
      ));
}

class DeliveryAddressSuggesionCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uicontext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DeliveryAddressSuggesion',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/deliveryCursorAddressSuggestions',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1743736504279",
        'query': query,
        'uiContext': uicontext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
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

class DeliveryPopulateAddressCall {
  Future<ApiCallResponse> call({
    String? address = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DeliveryPopulateAddress',
      apiUrl:
          '${baseUrl}/ui/shoppingCartDeliveryUI/shoppingCartDeliveryForm/populateAddress',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm:r0:address':
            address,
        'contains_shoppingCartDeliveryUI__shoppingCartDeliveryUI__shoppingCartDeliveryForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|address",
        'a:refreshView': "refreshAddress",
        'a:clientState': clientState,
        'a:caller': "shoppingCartDeliveryForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? totalTravelFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalTravelFee''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? distance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].distance''',
      ));
  String? bldgNum(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-bldgNum']''',
      ));
  String? floorSection(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-floorSection']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-street']''',
      ));
  String? cityTown(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-cityTown']''',
      ));
  String? stateProvince(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-stateProvince']''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-postalCode']''',
      ));
}

class DeliveryPageNextCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? quantity = '',
    String? resourceType = '',
    String? type = '',
    String? clientState = '',
    String? id = '',
    String? deliveryType = '',
    String? address = '',
    String? buildno = '',
    String? floor = '',
    String? street = '',
    String? city = '',
    String? state = '',
    String? postalCode = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DeliveryPageNext',
      apiUrl:
          '${baseUrl}/ui/shoppingCartDeliveryUI/shoppingCartDeliveryForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:quantity': quantity,
        'ap:resourceType': resourceType,
        'ap:recordKey': recordKey,
        'ap:type': type,
        'a:clientState': clientState,
        'a:caller': "shoppingCartDeliveryForm",
        '_id': id,
        'resourceItemRequestAddlInfo.deliveryType': deliveryType,
        'address': address,
        'resourceItemRequestAddlInfo.whereAddress.bldgNum': buildno,
        'resourceItemRequestAddlInfo.whereAddress.floorSection': floor,
        'resourceItemRequestAddlInfo.whereAddress.street': street,
        'resourceItemRequestAddlInfo.whereAddress.cityTown': city,
        'resourceItemRequestAddlInfo.whereAddress.stateProvince': state,
        'resourceItemRequestAddlInfo.whereAddress.postalCode': postalCode,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FoodSinglePageNextCall {
  Future<ApiCallResponse> call({
    String? quantity = '',
    String? resourceType = '',
    String? dataActionType = '0',
    String? recordKey = '',
    String? type = '',
    String? clientState = '',
    String? id = '',
    String? resourceItemDenominatorId = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'foodSinglePageNext',
      apiUrl: '${baseUrl}/ui/foodSinglePageCartUI/foodSinglePageCartForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:quantity': quantity,
        'ap:resourceType': resourceType,
        'ap:dataActionType': dataActionType,
        'ap:recordKey': recordKey,
        'ap:type': type,
        'a:clientState': clientState,
        'a:caller': "foodSinglePageCartForm",
        '_id': id,
        'resourceItemDenominatorId': resourceItemDenominatorId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? params(dynamic response) => getJsonField(
        response,
        r'''$.todo.act[:].params''',
        true,
      ) as List?;
  List<String>? paramName(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].params[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? paramValue(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ReadyMakeCakeCustomCursorCall {
  Future<ApiCallResponse> call({
    String? resourceType = '',
    String? type = '',
    String? recordKey = '',
    String? quantity = '',
    String? cakeCustomizationType = '',
    String? parentRecordKey = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'readyMakeCakeCustomCursor',
      apiUrl: '${baseUrl}/data/readymadeCakeItemPackageCustomizationCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744629701514",
        'format': "js",
        'renderTo': "contains_readymadeCakeItemAndPackageCustomizationUI",
        'resourceType': resourceType,
        'type': type,
        'recordKey': recordKey,
        'quantity': quantity,
        'cakeCustomizationType': cakeCustomizationType,
        'parentRecordKey': parentRecordKey,
        'a:clientState': clientState,
        'columns':
            "label,cakeWrapperTableTemplate.checkBoxData,cakeWrapperTableTemplate.checkBoxIds,cakeWrapperTableTemplate.totalPrice,cakeWrapperTableTemplate.price,denomName,cakeWrapperTableTemplate.name",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? unitPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['cakeWrapperTableTemplate-_-price']''',
      ));
  List<String>? checkBoxIds(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['cakeWrapperTableTemplate-_-checkBoxIds']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['cakeWrapperTableTemplate-_-totalPrice']''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['cakeWrapperTableTemplate-_-name']''',
      ));
  String? denomName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['cakeWrapperTableTemplate-_-denomName']''',
      ));
  List? checkBoxOption(dynamic response) => getJsonField(
        response,
        r'''$.details[:]['cakeWrapperTableTemplate-_-checkBoxData']''',
        true,
      ) as List?;
  String? label(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].label''',
      ));
}

class RMCustomPageCheckboxChangedCall {
  Future<ApiCallResponse> call({
    String? resourceType = '',
    String? recordKey = '',
    String? type = '',
    String? cakeCustomizationType = '',
    String? checkBoxIds = '',
    String? clientState = '',
    String? id = '',
    String? quantity = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rMCustomPageCheckboxChanged',
      apiUrl:
          '${baseUrl}/ui/readymadeCakeItemAndPackageCustomizationUI/readymadeCakeItemPackageFrom/setPrice',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:quantity': quantity,
        'ap:resourceType': resourceType,
        'ap:recordKey': recordKey,
        'ap:type': type,
        'ap:cakeCustomizationType': cakeCustomizationType,
        'contains_readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemPackageFrom:r0:cakeWrapperTableTemplate.checkBoxIds':
            checkBoxIds,
        'contains_readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemAndPackageCustomizationUI__readymadeCakeItemPackageFrom:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|cakeWrapperTableTemplate.checkBoxIds",
        'a:refreshView': "updatePrice",
        'a:clientState': clientState,
        'a:caller': "readymadeCakeItemPackageFrom",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['cakeWrapperTableTemplate-_-totalPrice']''',
      ));
  String? price(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['cakeWrapperTableTemplate-_-price']''',
      ));
}

class RMCustomPageNextCall {
  Future<ApiCallResponse> call({
    String? quantity = '',
    String? resourceType = '',
    String? recordKey = '',
    String? type = '',
    String? cakeCustomizationType = '',
    String? clientState = '',
    String? id = '',
    String? checkBoxIds = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = RentalShoppingCartGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'rMCustomPageNext',
      apiUrl:
          '${baseUrl}/ui/readymadeCakeItemAndPackageCustomizationUI/readymadeCakeItemPackageFrom/nextAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:quantity': quantity,
        'ap:resourceType': resourceType,
        'ap:recordKey': recordKey,
        'ap:type': type,
        'ap:cakeCustomizationType': cakeCustomizationType,
        'a:clientState': clientState,
        'a:caller': clientState,
        '_id': id,
        'cakeWrapperTableTemplate.checkBoxIds': checkBoxIds,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  String? errorToastMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
}

/// End RentalShoppingCart Group Code

/// Start customCake Group Code

class CustomCakeGroup {
  static String getBaseUrl({
    String? baseURL,
    String? token = '',
    String? header,
  }) {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${baseURL}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static MenuSectionAndVariationCusorCall menuSectionAndVariationCusorCall =
      MenuSectionAndVariationCusorCall();
  static MenuSectionsListPickerCursorCall menuSectionsListPickerCursorCall =
      MenuSectionsListPickerCursorCall();
  static CustomDateNtimeTabCursorCall customDateNtimeTabCursorCall =
      CustomDateNtimeTabCursorCall();
  static MenuSectionChangedCall menuSectionChangedCall =
      MenuSectionChangedCall();
  static MenuSectionDenomChangedToSetInSessionCall
      menuSectionDenomChangedToSetInSessionCall =
      MenuSectionDenomChangedToSetInSessionCall();
  static MenuSectionChangedToSetInSessionCopyCall
      menuSectionChangedToSetInSessionCopyCall =
      MenuSectionChangedToSetInSessionCopyCall();
  static StartTimeCursorCall startTimeCursorCall = StartTimeCursorCall();
  static StartTimeChangeCall startTimeChangeCall = StartTimeChangeCall();
  static CustomCakeNextCall customCakeNextCall = CustomCakeNextCall();
  static DateChangedCall dateChangedCall = DateChangedCall();
  static CakeFlavoursCall cakeFlavoursCall = CakeFlavoursCall();
  static FlavourCheckBoxSelectionCall flavourCheckBoxSelectionCall =
      FlavourCheckBoxSelectionCall();
  static FlavourNextCall flavourNextCall = FlavourNextCall();
  static FlavourListPickerCursorCall flavourListPickerCursorCall =
      FlavourListPickerCursorCall();
  static CakeFillingsCall cakeFillingsCall = CakeFillingsCall();
  static FillingListPickerCursorCall fillingListPickerCursorCall =
      FillingListPickerCursorCall();
  static FillingsCheckboxSelectionCall fillingsCheckboxSelectionCall =
      FillingsCheckboxSelectionCall();
  static FillingsNextCall fillingsNextCall = FillingsNextCall();
  static CakeIcingsCall cakeIcingsCall = CakeIcingsCall();
  static IcingListPickerCall icingListPickerCall = IcingListPickerCall();
  static IciingCheckboxSelectionCall iciingCheckboxSelectionCall =
      IciingCheckboxSelectionCall();
  static IcingNextCall icingNextCall = IcingNextCall();
  static CustomizeActionCall customizeActionCall = CustomizeActionCall();
  static CustomCakeDNTVariationListpickerCall
      customCakeDNTVariationListpickerCall =
      CustomCakeDNTVariationListpickerCall();
}

class MenuSectionAndVariationCusorCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '-1',
    String? bakeryId = '',
    String? index = '1',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'menuSectionAndVariationCusor',
      apiUrl: '${baseUrl}/data/menuSectionAndVariationCusor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'parentRecordKey': parentRecordKey,
        'bakeryId': bakeryId,
        'index': index,
        'columns': "selectedDenomId,bakeryMenuSectionId,denomPresent",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? selectedDenomId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].selectedDenomId''',
      ));
  String? bakeryMenuSectionId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].bakeryMenuSectionId''',
      ));
  String? denomPresent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].denomPresent''',
      ));
}

class MenuSectionsListPickerCursorCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'menuSectionsListPickerCursor',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/menuSectionsListPickerCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744100986986",
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CustomDateNtimeTabCursorCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? recordKey = '',
    String? index = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'customDateNtimeTabCursor',
      apiUrl: '${baseUrl}/data/customCakeItemDateAndTimeShoppingCartCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'parentRecordKey': parentRecordKey,
        'recordKey': recordKey,
        'index': index,
        'columns':
            "totalPriceDisplay,altdate2,altdate1,depositTemplate.bookingNote,depositTemplate.minCancelFeeText,depositTemplate.fullPaymentNote,totalPrice,depositTemplate.discount,depositTemplate.startTime,depositTemplate.onDate",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  List<String>? onDate(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-onDate']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['depositTemplate-_-startTime']''',
      ));
  String? altdate1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].altdate1''',
      ));
  String? altdate2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].altdate2''',
      ));
  String? totalPriceDisplay(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPriceDisplay''',
      ));
}

class MenuSectionChangedCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? recordKey = '',
    String? clientState = '',
    String? id = '',
    String? onDate = '',
    String? startTime = '',
    String? altDate1 = '',
    String? altDate2 = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'menuSectionChanged',
      apiUrl:
          '${baseUrl}/ui/cakeCustomItemDateAndTimeShoppingCartUI/dateAndTimeFormForCustomItem/getSelectedBakeryMenuSection',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:parentRecordKey': parentRecordKey,
        'ap:recordKey': recordKey,
        'a:clientState': clientState,
        'a:caller': "dropDownsUIForm",
        '_id': id,
        'depositTemplate.onDate': onDate,
        'depositTemplate.startTime': startTime,
        'depositTemplate.discount': "false",
        'altdate1': altDate1,
        'altdate2': altDate2,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
}

class MenuSectionDenomChangedToSetInSessionCall {
  Future<ApiCallResponse> call({
    String? selectedDenomId = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'menuSectionDenomChangedToSetInSession',
      apiUrl:
          '${baseUrl}/ui/cakeCustomItemDateAndTimeShoppingCartUI/dropDownsUIForm/getSelectedVariation',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm:r0:selectedDenomId':
            selectedDenomId,
        '_id': id,
        'a:clientState': clientState,
        'a:caller': "dropDownsUIForm",
        'cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm:r0:_saveData':
            "false",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
}

class MenuSectionChangedToSetInSessionCopyCall {
  Future<ApiCallResponse> call({
    String? bakeryMenuSectionId = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'menuSectionChangedToSetInSession Copy',
      apiUrl:
          '${baseUrl}/ui/cakeCustomItemDateAndTimeShoppingCartUI/dropDownsUIForm/setVisibleDenomId',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm:r0:bakeryMenuSectionId':
            bakeryMenuSectionId,
        '_id': id,
        'a:clientState': clientState,
        'a:caller': "dropDownsUIForm",
        'cakeCustomItemDateAndTimeShoppingCartUI__dropDownsUIForm:r0:_saveData':
            "false",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
}

class StartTimeCursorCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'startTimeCursor',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/startTimeRestrictionForCustomCakeItem',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744103856996",
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

class StartTimeChangeCall {
  Future<ApiCallResponse> call({
    String? startTime = '',
    String? clientState = '',
    String? id = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'startTimeChange',
      apiUrl:
          '${baseUrl}/ui/cakeCustomItemDateAndTimeShoppingCartUI/dateAndTimeFormForCustomItem/calcTotalPriceAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:self': "startTime",
        'cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem:r0:depositTemplate.startTime':
            startTime,
        'cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|depositTemplate.startTime",
        'a:refreshView': "startTimeChange",
        'a:clientState': clientState,
        'a:caller': "dateAndTimeFormForCustomItem",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data.details''',
        true,
      ) as List?;
}

class CustomCakeNextCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? id = '',
    String? onDate = '',
    String? startTime = '',
    String? altDate1 = '',
    String? altDate2 = '',
    String? index = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'customCakeNext',
      apiUrl:
          '${baseUrl}/ui/cakeCustomItemDateAndTimeShoppingCartUI/dateAndTimeFormForCustomItem/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:index': index,
        'a:clientState': clientState,
        'a:caller': "dateAndTimeFormForCustomItem",
        '_id': id,
        'depositTemplate.onDate': onDate,
        'depositTemplate.startTime': startTime,
        'altdate1': altDate1,
        'altdate2': altDate2,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? cartCountAnon(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.long_term.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
  int? cartCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.totalCount''',
      ));
}

class DateChangedCall {
  Future<ApiCallResponse> call({
    String? onDate = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'dateChanged',
      apiUrl:
          '${baseUrl}/ui/cakeCustomItemDateAndTimeShoppingCartUI/dateAndTimeFormForCustomItem/calcTotalPriceAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:self': "onDate",
        'cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem:r0:depositTemplate.onDate':
            onDate,
        'cakeCustomItemDateAndTimeShoppingCartUI__dateAndTimeFormForCustomItem:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|depositTemplate.onDate",
        'a:refreshView': "onDateChange",
        'a:clientState': clientState,
        'a:caller': "dateAndTimeFormForCustomItem",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
}

class CakeFlavoursCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeFlavours',
      apiUrl: '${baseUrl}/data/cakeCustomizationsCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744169715568",
        'format': "js",
        'renderTo': "contains_cakeFlavours",
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
        'index': index,
        'a:clientState': clientState,
        'columns': "totalPrice,priceOfMenuSectionOption,checkbox",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].priceOfMenuSectionOption''',
      ));
  List<String>? checkbox(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].checkbox''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FlavourCheckBoxSelectionCall {
  Future<ApiCallResponse> call({
    String? checkboxId = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'flavourCheckBoxSelection',
      apiUrl: '${baseUrl}/ui/cakeFlavours/cakeFlavoursUIForm/refreshPrice',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contains_cakeFlavours__cakeFlavours__cakeFlavoursUIForm:r0:checkbox':
            checkboxId,
        'contains_cakeFlavours__cakeFlavours__cakeFlavoursUIForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|checkbox",
        'a:refreshView': "priceRefresh",
        'a:clientState': clientState,
        'a:caller': "cakeFlavoursUIForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? selectionPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceOfMenuSectionOption''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? toastErrorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
}

class FlavourNextCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? id = '',
    String? checkbox = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'flavourNext',
      apiUrl: '${baseUrl}/ui/cakeFlavours/cakeFlavoursUIForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'ap:parentRecordKey': parentRecordKey,
        'ap:index': index,
        'a:clientState': clientState,
        'a:caller': "cakeFlavoursUIForm",
        '_id': id,
        'checkbox': checkbox,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? toastErrorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
}

class FlavourListPickerCursorCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? query = '',
    String? parentRecordKey = '',
    String? recordKey = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'flavourListPickerCursor',
      apiUrl: '${baseUrl}/data/uiCursorEnumRestriction/flavourListPickerCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1739461206439",
        'uiContext': uiContext,
        'query': query,
        'parentRecordKey': parentRecordKey,
        'recordKey': recordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeFillingsCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeFillings',
      apiUrl: '${baseUrl}/data/cakeFillingsCursorForCart',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'format': "js",
        'renderTo': "contains_cakeFillingsTab",
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
        'index': index,
        'a:clientState': clientState,
        'columns': "totalPrice,priceOfMenuSectionOption,checkbox",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].priceOfMenuSectionOption''',
      ));
  List<String>? checkbox(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].checkbox''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FillingListPickerCursorCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? parentRecordKey = '',
    String? recordKey = '',
    String? query = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'fillingListPickerCursor',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/fillingsListPickerCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'uiContext': uiContext,
        'parentRecordKey': parentRecordKey,
        'recordKey': recordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FillingsCheckboxSelectionCall {
  Future<ApiCallResponse> call({
    String? checkbox = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'fillingsCheckboxSelection',
      apiUrl:
          '${baseUrl}/ui/cakeFillingsTab/cakeFillingsUIForm/refreshFillingPrice',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contains_cakeFillingsTab__cakeFillingsTab__cakeFillingsUIForm:r0:checkbox':
            checkbox,
        'contains_cakeFillingsTab__cakeFillingsTab__cakeFillingsUIForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|checkbox",
        'a:refreshView': "refreshPrice",
        'a:clientState': clientState,
        'a:caller': "cakeFillingsUIForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceOfMenuSectionOption''',
      ));
  String? toastErrorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
}

class FillingsNextCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? id = '',
    String? clientState = '',
    String? checkboxes = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'fillingsNext',
      apiUrl: '${baseUrl}/ui/cakeFillingsTab/cakeFillingsUIForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'ap:parentRecordKey': parentRecordKey,
        'ap:index': index,
        'a:clientState': clientState,
        'a:caller': "cakeFillingsUIForm",
        '_id': id,
        'checkbox': checkboxes,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? toastErrorMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
}

class CakeIcingsCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientstate = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeIcings',
      apiUrl: '${baseUrl}/data/cakeIcingsCursorForCart',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744254948661",
        'format': "js",
        'renderTo': "contains_cakeIcingsTab",
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
        'index': index,
        'a:clientState': clientstate,
        'columns': "totalPrice,priceOfMenuSectionOption,checkbox",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  List<String>? checkbox(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].checkbox''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].priceOfMenuSectionOption''',
      ));
}

class IcingListPickerCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? parentRecordKey = '',
    String? recordKey = '',
    String? query = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'icingListPicker',
      apiUrl: '${baseUrl}/data/uiCursorEnumRestriction/icingListPickerCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'uiContext': uiContext,
        'parentRecordKey': parentRecordKey,
        'recordKey': recordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class IciingCheckboxSelectionCall {
  Future<ApiCallResponse> call({
    String? checkbox = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'iciingCheckboxSelection',
      apiUrl:
          '${baseUrl}/ui/cakeIcingsTab/cakeIcingsUIForm/refreshPricesInIcing',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contains_cakeIcingsTab__cakeIcingsTab__cakeIcingsUIForm:r0:checkbox':
            checkbox,
        'contains_cakeIcingsTab__cakeIcingsTab__cakeIcingsUIForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|checkbox",
        'a:refreshView': "refreshPriceInIcing",
        'a:clientState': clientState,
        'a:caller': "cakeIcingsUIForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceOfMenuSectionOption''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? erroMsgToast(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
}

class IcingNextCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? id = '',
    String? checkboxes = '',
    String? clientstate = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'icingNext',
      apiUrl: '${baseUrl}/ui/cakeIcingsTab/cakeIcingsUIForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'ap:parentRecordKey': parentRecordKey,
        'ap:index': index,
        'a:clientState': clientstate,
        'a:caller': "cakeIcingsUIForm",
        '_id': id,
        'checkbox': checkboxes,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? errorToastMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
}

class CustomizeActionCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'customizeAction',
      apiUrl: '${baseUrl}/ui/viewCakeDetail/menuSectionsGrid/customize',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:parentRecordKey': parentRecordKey,
        'a:clientState': clientState,
        'a:caller': "menuSectionsGrid",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].params[:].value''',
      ));
}

class CustomCakeDNTVariationListpickerCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'customCakeDNTVariationListpicker',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/variationsListPickerCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'uiContext': uiContext,
        '_dc': "1750050093604",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End customCake Group Code

/// Start customCakeTwo Group Code

class CustomCakeTwoGroup {
  static String getBaseUrl({
    String? baseURL,
    String? token = '',
    String? header,
  }) {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${baseURL}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static CakeShapeCursorCall cakeShapeCursorCall = CakeShapeCursorCall();
  static ShapeListpickerCall shapeListpickerCall = ShapeListpickerCall();
  static ShapesNextCall shapesNextCall = ShapesNextCall();
  static CakeColourCall cakeColourCall = CakeColourCall();
  static ColorListPickerCall colorListPickerCall = ColorListPickerCall();
  static ColorNextCall colorNextCall = ColorNextCall();
  static CakeLayersCall cakeLayersCall = CakeLayersCall();
  static LayerListPickerCall layerListPickerCall = LayerListPickerCall();
  static LayerChangedCall layerChangedCall = LayerChangedCall();
  static LayerNextCall layerNextCall = LayerNextCall();
  static CakeItemPriceAndDeliveryCursorForCustomItemCall
      cakeItemPriceAndDeliveryCursorForCustomItemCall =
      CakeItemPriceAndDeliveryCursorForCustomItemCall();
  static DeliveryPageQuantityChangedCall deliveryPageQuantityChangedCall =
      DeliveryPageQuantityChangedCall();
  static DeliveryTypeChangdCall deliveryTypeChangdCall =
      DeliveryTypeChangdCall();
  static CakeDeliveryCursorAddressSuggestionsCall
      cakeDeliveryCursorAddressSuggestionsCall =
      CakeDeliveryCursorAddressSuggestionsCall();
  static PopulateAddressInCustomCall populateAddressInCustomCall =
      PopulateAddressInCustomCall();
  static ColourOptionsAsPostCall colourOptionsAsPostCall =
      ColourOptionsAsPostCall();
  static DeliveryNextCall deliveryNextCall = DeliveryNextCall();
  static CakeDecorCall cakeDecorCall = CakeDecorCall();
  static DecorTypeListPickerCall decorTypeListPickerCall =
      DecorTypeListPickerCall();
  static DecorTypeChangedCall decorTypeChangedCall = DecorTypeChangedCall();
  static DecorTypeNextCall decorTypeNextCall = DecorTypeNextCall();
  static CakeBorderCall cakeBorderCall = CakeBorderCall();
  static BorderListPickerCall borderListPickerCall = BorderListPickerCall();
  static BorderChangedCall borderChangedCall = BorderChangedCall();
  static BorderNextCall borderNextCall = BorderNextCall();
}

class CakeShapeCursorCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeShapeCursor',
      apiUrl: '${baseUrl}/data/cakeShapesTypeCursorForCart2',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744264481095",
        'format': "js",
        'renderTo': "contains_cakeShapesTab",
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
        'index': index,
        'a:clientState': clientState,
        'columns': "shapes",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? shapes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].shapes''',
      ));
}

class ShapeListpickerCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? recordKey = '',
    String? parentRecordKey = '',
    String? query = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'shapeListpicker',
      apiUrl: '${baseUrl}/data/uiCursorEnumRestriction/shapeListPickerForCart2',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'uiContext': uiContext,
        'parentRecordKey': parentRecordKey,
        'recordKey': recordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ShapesNextCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? id = '',
    String? shapes = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'shapesNext',
      apiUrl: '${baseUrl}/ui/cakeShapesTab/cakeShapesUIForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'ap:parentRecordKey': parentRecordKey,
        'ap:index': index,
        'a:clientState': clientState,
        'a:caller': "cakeShapesUIForm",
        '_id': id,
        'shapes': shapes,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeColourCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeColour',
      apiUrl: '${baseUrl}/data/cakeColorTypeCursorForCart',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744271760644",
        'format': "js",
        'renderTo': "contains_cakeColorTab",
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
        'index': index,
        'a:clientState': clientState,
        'columns': "colors",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? colors(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].colors''',
      ));
}

class ColorListPickerCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? recordKey = '',
    String? parentRecordKey = '',
    String? query = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'colorListPicker',
      apiUrl: '${baseUrl}/data/uiCursorEnumRestriction/colorListPickerForCart',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'uiContext': uiContext,
        'parentRecordKey': parentRecordKey,
        'recordKey': recordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ColorNextCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? id = '',
    String? clientState = '',
    String? colors = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'colorNext',
      apiUrl: '${baseUrl}/ui/cakeColorTab/cakeColorUIForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'ap:parentRecordKey': parentRecordKey,
        'ap:index': index,
        'a:clientState': clientState,
        'a:caller': "cakeColorUIForm",
        '_id': id,
        'colors': colors,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeLayersCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeLayers',
      apiUrl: '${baseUrl}/data/cakeLayersCursorForCart',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744273169485",
        'format': "js",
        'renderTo': "contains_cakeLayersTab",
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
        'index': index,
        'a:clientState': clientState,
        'columns': "totalPrice,priceOfMenuSectionOption,layers",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].priceOfMenuSectionOption''',
      ));
  String? layers(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].layers''',
      ));
}

class LayerListPickerCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? recordKey = '',
    String? parentRecordKey = '',
    String? query = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'layerListPicker',
      apiUrl: '${baseUrl}/data/uiCursorEnumRestriction/layerListPickerForCart',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'uiContext': uiContext,
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  List<String>? id(dynamic response) => (getJsonField(
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

class LayerChangedCall {
  Future<ApiCallResponse> call({
    String? layers = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'layerChanged',
      apiUrl: '${baseUrl}/ui/cakeLayersTab/cakeLayersUIForm/refreshPricing',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contains_cakeLayersTab__cakeLayersTab__cakeLayersUIForm:r0:layers':
            layers,
        'contains_cakeLayersTab__cakeLayersTab__cakeLayersUIForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|layers",
        'a:refreshView': "refreshPrice",
        'a:clientState': clientState,
        'a:caller': "cakeLayersUIForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceOfMenuSectionOption''',
      ));
}

class LayerNextCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? id = '',
    String? layers = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'layerNext',
      apiUrl: '${baseUrl}/ui/cakeLayersTab/cakeLayersUIForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'ap:parentRecordKey': parentRecordKey,
        'ap:index': index,
        'a:clientState': clientState,
        'a:caller': "cakeLayersUIForm",
        '_id': id,
        'layers': layers,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeItemPriceAndDeliveryCursorForCustomItemCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeItemPriceAndDeliveryCursorForCustomItem',
      apiUrl: '${baseUrl}/data/cakeItemPriceAndDeliveryCursorForCustomItem',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744277444302",
        'format': "js",
        'renderTo': "contains_CustomcakeItemPriceAndDeliveryInfoUI",
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
        'index': index,
        'a:clientState': clientState,
        'columns':
            "totalPrice,deliveryFeePerUnit,travelFeesperDistance,distance,standardPlusdeliveryRate,standarddistance,resourceItemRequestAddlInfo.whereAddress.postalCode,resourceItemRequestAddlInfo.whereAddress.stateProvince,resourceItemRequestAddlInfo.whereAddress.cityTown,resourceItemRequestAddlInfo.whereAddress.localArea,resourceItemRequestAddlInfo.whereAddress.street,resourceItemRequestAddlInfo.whereAddress.floorSection,resourceItemRequestAddlInfo.whereAddress.bldgNum,address,resourceItemRequestAddlInfo.deliveryType,menuItemRequest.customTextColor,menuItemRequest.customText,unitPrice,quantity",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? quantity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].quantity''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? standarddistance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].standarddistance''',
      ));
  String? deliveryFeePerUnit(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].deliveryFeePerUnit''',
      ));
  String? unitPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].unitPrice''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].address''',
      ));
  String? distance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].distance''',
      ));
  String? customTextColor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['menuItemRequest-_-customTextColor']''',
      ));
  String? customText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['menuItemRequest-_-customText']''',
      ));
  String? travelFeesperDistance(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].travelFeesperDistance''',
      ));
  String? standardPlusdeliveryRate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].standardPlusdeliveryRate''',
      ));
  String? bldgNum(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-bldgNum']''',
      ));
  String? stateProvince(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-stateProvince']''',
      ));
  String? localArea(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-localArea']''',
      ));
  String? cityTown(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-cityTown']''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-postalCode']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-street']''',
      ));
  String? floorSection(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-floorSection']''',
      ));
  String? deliveryType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemRequestAddlInfo-_-deliveryType']''',
      ));
  String? deliveryTypetxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['resourceItemRequestAddlInfo-_-deliveryType_txt']''',
      ));
}

class DeliveryPageQuantityChangedCall {
  Future<ApiCallResponse> call({
    String? index = '',
    String? quantity = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deliveryPageQuantityChanged',
      apiUrl:
          '${baseUrl}/ui/CustomcakeItemPriceAndDeliveryInfoUI/CustomcakeItemPriceAndDeliveryInfoForm/quantityAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:index': index,
        'contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm:r0:quantity':
            quantity,
        'contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|quantity",
        'a:refreshView': "refreshTotalPrice",
        'a:clientState': clientState,
        'a:caller': "CustomcakeItemPriceAndDeliveryInfoForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
}

class DeliveryTypeChangdCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? deliveryType = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deliveryTypeChangd',
      apiUrl:
          '${baseUrl}/ui/CustomcakeItemPriceAndDeliveryInfoUI/CustomcakeItemPriceAndDeliveryInfoForm/selectAddr',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm:r0:resourceItemRequestAddlInfo.deliveryType':
            deliveryType,
        'contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|resourceItemRequestAddlInfo.deliveryType",
        'a:refreshView': "addressChanged",
        'a:clientState': clientState,
        'a:caller': "CustomcakeItemPriceAndDeliveryInfoForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? deliveryFeePerUnit(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].deliveryFeePerUnit''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].address''',
      ));
  String? distance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].distance''',
      ));
}

class CakeDeliveryCursorAddressSuggestionsCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uiContext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeDeliveryCursorAddressSuggestions',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/cakeDeliveryCursorAddressSuggestions',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744287761125",
        'query': query,
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

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
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

class PopulateAddressInCustomCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? address = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'populateAddressInCustom',
      apiUrl:
          '${baseUrl}/ui/CustomcakeItemPriceAndDeliveryInfoUI/CustomcakeItemPriceAndDeliveryInfoForm/populateAddress',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm:r0:address':
            address,
        'contains_CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoUI__CustomcakeItemPriceAndDeliveryInfoForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|address",
        'a:refreshView': "refreshAddress",
        'a:clientState': clientState,
        'a:caller': "CustomcakeItemPriceAndDeliveryInfoForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? deliveryFeePerUnit(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].deliveryFeePerUnit''',
      ));
  String? distance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].distance''',
      ));
  String? bldgNum(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-bldgNum']''',
      ));
  String? stateProvince(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-stateProvince']''',
      ));
  String? cityTown(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-cityTown']''',
      ));
  String? postalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-postalCode']''',
      ));
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-street']''',
      ));
  String? floorSection(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['resourceItemRequestAddlInfo-_-whereAddress-_-floorSection']''',
      ));
}

class ColourOptionsAsPostCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? uiContext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'colourOptionsAsPost',
      apiUrl:
          '${baseUrl}/getaspost/data/uiEnumerationRestriction/CLBXEnColorType',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'query': query,
        'uiContext': uiContext,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeliveryNextCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? denomId = '',
    String? clientState = '',
    String? id = '',
    String? customText = '',
    String? customTextColor = '',
    String? deliveryType = '',
    String? address = '',
    String? building = '',
    String? floor = '',
    String? street = '',
    String? area = '',
    String? city = '',
    String? state = '',
    String? postal = '',
    String? quantity = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deliveryNext',
      apiUrl:
          '${baseUrl}/ui/CustomcakeItemPriceAndDeliveryInfoUI/CustomcakeItemPriceAndDeliveryInfoForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:parentRecordKey': parentRecordKey,
        'ap:denomId': denomId,
        'a:clientState': clientState,
        'a:caller': "CustomcakeItemPriceAndDeliveryInfoForm",
        '_id': id,
        'quantity': quantity,
        'menuItemRequest.customText': customText,
        'menuItemRequest.customTextColor': customTextColor,
        'resourceItemRequestAddlInfo.deliveryType': deliveryType,
        'address': address,
        'resourceItemRequestAddlInfo.whereAddress.bldgNum': building,
        'resourceItemRequestAddlInfo.whereAddress.floorSection': floor,
        'resourceItemRequestAddlInfo.whereAddress.street': street,
        'resourceItemRequestAddlInfo.whereAddress.localArea': area,
        'resourceItemRequestAddlInfo.whereAddress.cityTown': city,
        'resourceItemRequestAddlInfo.whereAddress.stateProvince': state,
        'resourceItemRequestAddlInfo.whereAddress.postalCode': postal,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
}

class CakeDecorCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeDecor',
      apiUrl: '${baseUrl}/data/cakeDecorTypeCursorForCart',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744338267804",
        'format': "js",
        'renderTo': "contains_cakeDecorTypeTab",
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
        'index': index,
        'a:clientState': clientState,
        'columns': "totalPrice,priceOfMenuSectionOption,decorTypes",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].priceOfMenuSectionOption''',
      ));
  String? decorTypes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].decorTypes''',
      ));
}

class DecorTypeListPickerCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? parentRecordKey = '',
    String? recordKey = '',
    String? query = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'decorTypeListPicker',
      apiUrl: '${baseUrl}/data/uiCursorEnumRestriction/decorListPicker',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'uiContext': uiContext,
        'parentRecordKey': parentRecordKey,
        'recordKey': recordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DecorTypeChangedCall {
  Future<ApiCallResponse> call({
    String? decorTypes = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'decorTypeChanged',
      apiUrl: '${baseUrl}/ui/cakeDecorTypeTab/cakeDecorUIForm/refreshPricing',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contains_cakeDecorTypeTab__cakeDecorTypeTab__cakeDecorUIForm:r0:decorTypes':
            decorTypes,
        'contains_cakeDecorTypeTab__cakeDecorTypeTab__cakeDecorUIForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|decorTypes",
        'a:refreshView': "refreshPrice",
        'a:clientState': clientState,
        'a:caller': "cakeDecorUIForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceOfMenuSectionOption''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
}

class DecorTypeNextCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? clientState = '',
    String? id = '',
    String? decorTypes = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'decorTypeNext',
      apiUrl: '${baseUrl}/ui/cakeDecorTypeTab/cakeDecorUIForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'ap:index': index,
        'ap:parentRecordKey': parentRecordKey,
        'a:clientState': clientState,
        'a:caller': "cakeDecorUIForm",
        '_id': id,
        'decorTypes': decorTypes,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CakeBorderCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? parentRecordKey = '',
    String? index = '',
    String? aclientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cakeBorder',
      apiUrl: '${baseUrl}/data/cakeBorderTypeCursorForCart',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1744340289912",
        'format': "js",
        'renderTo': "contains_cakeBorderTypeTab",
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
        'index': index,
        'a:clientState': aclientState,
        'columns': "totalPrice,priceOfMenuSectionOption,borderTypes",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? borderTypes(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].borderTypes''',
      ));
  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].priceOfMenuSectionOption''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalPrice''',
      ));
}

class BorderListPickerCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? recordKey = '',
    String? parentRecordKey = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'borderListPicker',
      apiUrl: '${baseUrl}/data/uiCursorEnumRestriction/borderListPickerForCart',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'uiContext': uiContext,
        'recordKey': recordKey,
        'parentRecordKey': parentRecordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BorderChangedCall {
  Future<ApiCallResponse> call({
    String? borderTypes = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'borderChanged',
      apiUrl: '${baseUrl}/ui/cakeBorderTypeTab/cakeBorderUIForm/refreshPricing',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contains_cakeBorderTypeTab__cakeBorderTypeTab__cakeBorderUIForm:r0:borderTypes':
            borderTypes,
        'contains_cakeBorderTypeTab__cakeBorderTypeTab__cakeBorderUIForm:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|borderTypes",
        'a:refreshView': "refreshPrice",
        'a:clientState': clientState,
        'a:caller': "cakeBorderUIForm",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? priceOfMenuSectionOption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].priceOfMenuSectionOption''',
      ));
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:].totalPrice''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]._id''',
      ));
}

class BorderNextCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? index = '',
    String? clientState = '',
    String? id = '',
    String? borderTypes = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = CustomCakeTwoGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'borderNext',
      apiUrl: '${baseUrl}/ui/cakeBorderTypeTab/cakeBorderUIForm/next',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'ap:index': index,
        'a:clientState': clientState,
        'a:caller': "cakeBorderUIForm",
        '_id': id,
        'borderTypes': borderTypes,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  List<String>? action(dynamic response) => (getJsonField(
        response,
        r'''$.todo.act[:].action''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? act(dynamic response) => getJsonField(
        response,
        r'''$.todo.act''',
        true,
      ) as List?;
}

/// End customCakeTwo Group Code

/// Start vendor Group Code

class VendorGroup {
  static String getBaseUrl({
    String? baseURL,
    String? token = '',
    String? header,
  }) {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    return '${baseURL}';
  }

  static Map<String, String> headers = {
    'cbxtoken': '[token]',
    'authorization': '[header]',
  };
  static VendorAllEmployeesCall vendorAllEmployeesCall =
      VendorAllEmployeesCall();
  static VendorAllRequestCall vendorAllRequestCall = VendorAllRequestCall();
  static ClbxEnShoppingCartStatusCursorCall clbxEnShoppingCartStatusCursorCall =
      ClbxEnShoppingCartStatusCursorCall();
  static RequestPageSubmissionDateListPickerCall
      requestPageSubmissionDateListPickerCall =
      RequestPageSubmissionDateListPickerCall();
  static ConsumerDetailsReqForVendorCursorCall
      consumerDetailsReqForVendorCursorCall =
      ConsumerDetailsReqForVendorCursorCall();
  static RespondRequestListCursorCall respondRequestListCursorCall =
      RespondRequestListCursorCall();
  static VendorRespondCursorCall vendorRespondCursorCall =
      VendorRespondCursorCall();
  static EnVendorAdvancePaymentTypeCall enVendorAdvancePaymentTypeCall =
      EnVendorAdvancePaymentTypeCall();
  static RespondAcceptDaysWithinChangedCall respondAcceptDaysWithinChangedCall =
      RespondAcceptDaysWithinChangedCall();
  static RespondSuggestDaysWithinChangedCall
      respondSuggestDaysWithinChangedCall =
      RespondSuggestDaysWithinChangedCall();
  static RespondSubmitActionCall respondSubmitActionCall =
      RespondSubmitActionCall();
  static RespondSuggestSubmitActionCall respondSuggestSubmitActionCall =
      RespondSuggestSubmitActionCall();
  static VendorDashboardCursorCall vendorDashboardCursorCall =
      VendorDashboardCursorCall();
  static VendorAllOrdersCursorCall vendorAllOrdersCursorCall =
      VendorAllOrdersCursorCall();
  static VendorAllAddonInstanceListCall vendorAllAddonInstanceListCall =
      VendorAllAddonInstanceListCall();
  static VendorAllInstanceListCall vendorAllInstanceListCall =
      VendorAllInstanceListCall();
  static VendorAllProspectCursorCall vendorAllProspectCursorCall =
      VendorAllProspectCursorCall();
  static VendorAllCustomerCursorCall vendorAllCustomerCursorCall =
      VendorAllCustomerCursorCall();
  static DateSpanListpickerCall dateSpanListpickerCall =
      DateSpanListpickerCall();
  static VendorAllInquiryCursorCall vendorAllInquiryCursorCall =
      VendorAllInquiryCursorCall();
  static CLBXEnProspectInquiryStatusCall cLBXEnProspectInquiryStatusCall =
      CLBXEnProspectInquiryStatusCall();
  static EnquiryDateListpickerCall enquiryDateListpickerCall =
      EnquiryDateListpickerCall();
  static CloseInquiryActionCall closeInquiryActionCall =
      CloseInquiryActionCall();
  static VendorInquiryRespondCursorCall vendorInquiryRespondCursorCall =
      VendorInquiryRespondCursorCall();
  static VendorInquiryResponseCusrorCall vendorInquiryResponseCusrorCall =
      VendorInquiryResponseCusrorCall();
  static VendorInquiryResponseSubmitCall vendorInquiryResponseSubmitCall =
      VendorInquiryResponseSubmitCall();
  static VendorRequestConvertToOrderCall vendorRequestConvertToOrderCall =
      VendorRequestConvertToOrderCall();
}

class VendorAllEmployeesCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorAllEmployees',
      apiUrl: '${baseUrl}/data/vendorEmployeesGridCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'parentRecordKey': parentRecordKey,
        'columns':
            "person.fullName,person.communication.email,person.communication.phone,person.communication.mobile,active",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
}

class VendorAllRequestCall {
  Future<ApiCallResponse> call({
    int? start,
    String? clientState = '',
    int? page,
    int? limit,
    String? filters = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorAllRequest',
      apiUrl: '${baseUrl}/data/vendorRequestForShoppingCartCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "id,submissionDate,shoppingCart.consumerName,shoppingCart.consumerMailId,shoppingCart.consumerPhoneNumber,shoppingCart.event.celebration.name,shoppingCart.idealDate,shoppingCart.status.name,shoppingCart.totalCost,shoppingCart.event.name",
        '_dc': "1747729556569",
        'forceSelection': "true",
        'start': start,
        'a:clientState': clientState,
        'page': page,
        'limit': limit,
        'filters': filters,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['shoppingCart-_-status-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ClbxEnShoppingCartStatusCursorCall {
  Future<ApiCallResponse> call({
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'clbxEnShoppingCartStatusCursor',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnShoppingCartStatus\$?_dc=1747733860042&query=&uiContext=%7B%22key%22%3A%22vendorRequests%22%2C%22params%22%3A%7B%22format%22%3A%5B%22js%22%5D%7D%2C%22component%22%3A%7B%22clientId%22%3A%22vendorRequests__vendorShoppingCartTopFilterPanel%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22vendorRequests__vendorShoppingCartTopFilterPanel%22%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RequestPageSubmissionDateListPickerCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? parentRecordKey = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'RequestPageSubmissionDateListPicker',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/vendorsubmissionDateListPicker',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1747818288113",
        'uiContext': uiContext,
        'parentRecordKey': parentRecordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
}

class ConsumerDetailsReqForVendorCursorCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'consumerDetailsReqForVendorCursor',
      apiUrl: '${baseUrl}/data/consumerDetailsReqForVenueCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "event.name,celebrateeName,event.celebration.name,event.idealDate,event.time,event.kidsInvitee,event.adultInvitee,event.totalInvitee",
        '_dc': "1747825545884",
        'a:clientState': clientState,
        'page': "1",
        'start': "0",
        'limit': "-1",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? idealDate(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['event-_-idealDate']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? kidsInvitee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-kidsInvitee']''',
      ));
  String? celebrationName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-celebration-_-name']''',
      ));
  String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-time']''',
      ));
  String? totalInvitee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-totalInvitee']''',
      ));
  String? adultInvitee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-adultInvitee']''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['event-_-name']''',
      ));
}

class RespondRequestListCursorCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'respondRequestListCursor',
      apiUrl: '${baseUrl}/data/shoppingCartItemGridCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "vendorCartStatus,itemName,status,itemType,request.Quantity,request.date,request.timeFrame,request.unitPrice,request.totalPrice",
        '_dc': "1747825545888",
        'a:clientState': clientState,
        'page': "1",
        'start': "0",
        'limit': "-1",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? vendorCartStatus(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].vendorCartStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VendorRespondCursorCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? key = '',
    String? selection = 'clientState',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorRespondCursor',
      apiUrl: '${baseUrl}/data/vendorRespondCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        '_dc': "1747885850237",
        'format': "js",
        'renderTo': "contains_vendorRespondChoiceTabSetUI",
        'parentRecordKey': parentRecordKey,
        'key': key,
        'selection': selection,
        'a:clientState':
            "{\"clientId\":\"vendorRespondWizard__vendorRespondWizardTabPanel\",\"index\":0}",
        'columns':
            "rejectChoice.rejectComment,rejectChoice.rejectMessage,paymentType,suggestChoice.mail.consumerResponseDate,suggestChoice.days,suggestChoice.mail.timeText,suggestChoice.mail.dateText,suggestChoice.message,suggestChoice.totalPrice,suggestChoice.timeSlot,suggestChoice.depositTemplate.endTime,suggestChoice.depositTemplate.startTime,suggestChoice.altdate2,suggestChoice.altdate1,suggestChoice.depositTemplate.onDate,paymentType,acceptChoice.mail.consumerResponseDate,acceptChoice.days,acceptChoice.mail.timeText,acceptChoice.mail.dateText,acceptChoice.comments",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? ocKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
  String? paymentType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].paymentType''',
      ));
  String? paymentTypetxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].paymentType_txt''',
      ));
  String? acceptChoiceDays(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['acceptChoice-_-days']''',
      ));
  String? comments(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['acceptChoice-_-comments']''',
      ));
  String? acceptMailTimeTxt(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['acceptChoice-_-mail-_-timeText']''',
      ));
  String? acceptConsumerResponseDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['acceptChoice-_-mail-_-consumerResponseDate']''',
      ));
  String? acceptMailDateText(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['acceptChoice-_-mail-_-dateText']''',
      ));
  String? suggestTimeSlot(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-timeSlot']''',
      ));
  String? suggestMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-message']''',
      ));
  String? suggestAlt1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-altdate1']''',
      ));
  String? suggestStartTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-depositTemplate-_-startTime']''',
      ));
  String? suggestEndTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-depositTemplate-_-endTime']''',
      ));
  String? mailTimeText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-mail-_-timeText']''',
      ));
  String? suggestAlt2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-altdate2']''',
      ));
  String? suggestDays(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-days']''',
      ));
  String? suggestTotalPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-totalPrice']''',
      ));
  String? suggestedConsumerResponseDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-mail-_-consumerResponseDate']''',
      ));
  String? suggestedOnDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-depositTemplate-_-onDate']''',
      ));
  String? suggestDateText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['suggestChoice-_-mail-_-dateText']''',
      ));
  String? rejectMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['rejectChoice-_-rejectMessage']''',
      ));
  String? rejectComment(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]['rejectChoice-_-rejectComment']''',
      ));
}

class EnVendorAdvancePaymentTypeCall {
  Future<ApiCallResponse> call({
    String? uiContext = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'enVendorAdvancePaymentType',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnVendorAdvancePaymentType\$',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'uiContext': uiContext,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RespondAcceptDaysWithinChangedCall {
  Future<ApiCallResponse> call({
    String? days = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'respondAcceptDaysWithinChanged',
      apiUrl:
          '${baseUrl}/ui/vendorRespondChoiceTabSetUI/vendorChoiceTabsetFormTab/paymentDaysSave',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contains_vendorRespondChoiceTabSetUI__vendorRespondChoiceTabSetUI__vendorChoiceTabsetFormTab:r0:acceptChoice.days':
            days,
        'contains_vendorRespondChoiceTabSetUI__vendorRespondChoiceTabSetUI__vendorChoiceTabsetFormTab:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|acceptChoice.days",
        'a:refreshView': "refreshPaymentDate",
        'a:clientState': clientState,
        'a:caller': "vendorChoiceTabsetFormTab",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? consumerResponseDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['acceptChoice-_-mail-_-consumerResponseDate']''',
      ));
}

class RespondSuggestDaysWithinChangedCall {
  Future<ApiCallResponse> call({
    String? days = '',
    String? id = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'respondSuggestDaysWithinChanged',
      apiUrl:
          '${baseUrl}/ui/vendorRespondChoiceTabSetUI/vendorChoiceTabsetFormTab/paymentDaysSave',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'contains_vendorRespondChoiceTabSetUI__vendorRespondChoiceTabSetUI__vendorChoiceTabsetFormTab:r0:suggestChoice.days':
            days,
        'contains_vendorRespondChoiceTabSetUI__vendorRespondChoiceTabSetUI__vendorChoiceTabsetFormTab:r0:_saveData':
            "false",
        '_id': id,
        'a:submitView': "self|suggestChoice.days",
        'a:refreshView': "refreshPaymentDate",
        'a:clientState': clientState,
        'a:caller': "vendorChoiceTabsetFormTab",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? consumerResponseDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].data.details[:]['suggestChoice-_-mail-_-consumerResponseDate']''',
      ));
}

class RespondSubmitActionCall {
  Future<ApiCallResponse> call({
    String? choice = '',
    String? parentRecordKey = '',
    String? selections = '',
    String? clientState = '',
    String? id = '',
    String? acceptsComments = '',
    String? acceptsDay = '',
    String? paymentType = '',
    String? rejectComment = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'respondSubmitAction',
      apiUrl:
          '${baseUrl}/ui/vendorRespondChoiceTabSetUI/vendorChoiceTabsetFormTab/submitAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:choice': choice,
        'ap:parentRecordKey': parentRecordKey,
        'ap:selections': selections,
        'a:clientState': clientState,
        'a:caller': "vendorChoiceTabsetFormTab",
        '_id': id,
        'acceptChoice.comments': acceptsComments,
        'acceptChoice.days': acceptsDay,
        'paymentType': paymentType,
        'rejectChoice.rejectComment': rejectComment,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastMsgSent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class RespondSuggestSubmitActionCall {
  Future<ApiCallResponse> call({
    String? choice = '',
    String? parentRecordKey = '',
    String? selections = '',
    String? clientState = '',
    String? id = '',
    String? acceptsComments = '',
    String? acceptsDay = '',
    String? paymentType = '',
    String? rejectComment = '',
    String? onDate = '',
    String? startTime = '',
    String? endTime = '',
    String? suggestComments = '',
    String? suggestTotalPrice = '',
    String? suggestDays = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'respondSuggestSubmitAction',
      apiUrl:
          '${baseUrl}/ui/vendorRespondChoiceTabSetUI/vendorChoiceTabsetFormTab/submitAction',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:choice': choice,
        'ap:parentRecordKey': parentRecordKey,
        'ap:selections': selections,
        'a:clientState': clientState,
        'a:caller': "vendorChoiceTabsetFormTab",
        '_id': id,
        'paymentType': paymentType,
        'rejectChoice.rejectComment': rejectComment,
        'suggestChoice.depositTemplate.onDate': onDate,
        'suggestChoice.depositTemplate.startTime': startTime,
        'suggestChoice.depositTemplate.endTime': endTime,
        'suggestChoice.totalPrice': suggestTotalPrice,
        'suggestChoice.days': suggestDays,
        'suggestChoice.message': suggestComments,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastMsgSent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class VendorDashboardCursorCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorDashboardCursor',
      apiUrl: '${baseUrl}/data/vendorDashboardCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "requestsCount,ordersCount,customersCount,prospectsCount,inquiriesCount,totalRevenue",
        'filters': filters,
        'a:clientState': clientState,
        'page': "1",
        'start': "0",
        'limit': "-1",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? customersCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].customersCount''',
      ));
  String? ordersCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].ordersCount''',
      ));
  String? prospectsCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].prospectsCount''',
      ));
  String? requestsCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].requestsCount''',
      ));
  String? inquiriesCount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].inquiriesCount''',
      ));
  String? totalRevenue(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].totalRevenue''',
      ));
}

class VendorAllOrdersCursorCall {
  Future<ApiCallResponse> call({
    String? start = '',
    String? page = '',
    String? limit = '',
    String? clientState = '',
    String? filters = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorAllOrdersCursor',
      apiUrl: '${baseUrl}/data/venueVendorOrdersCusror',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "id,order.orderExtId,statusDate,order.fullName,order.emailId,order.eventName",
        'start': start,
        'page': page,
        'limit': limit,
        'a:clientState': clientState,
        'filters': filters,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

class VendorAllAddonInstanceListCall {
  Future<ApiCallResponse> call({
    String? page = '1',
    String? start = '0',
    String? limit = '-1',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorAllAddonInstanceList',
      apiUrl: '${baseUrl}/data/customerResourceItemInstAddOnsOrderCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "id,resourceAddOn.inclResourceItem.itemSection.itemCategory.parent.resourceType.name,resourceAddOn.inclResourceItem.itemSection.itemCategory.resourceItemType.name,resourceAddOn.inclResourceItem.name,quantity,totalPrice",
        'a:clientState': clientState,
        'page': page,
        'start': start,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].quantity''',
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
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VendorAllInstanceListCall {
  Future<ApiCallResponse> call({
    String? page = '1',
    String? start = '0',
    String? limit = '-1',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorAllInstanceList',
      apiUrl: '${baseUrl}/data/customerResourceItemInstOrderCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "id,resourceItemSection.itemCategory.parent.resourceType.name,resourceItemSection.itemCategory.resourceItemType.name,resourceItem.name,whenDateTime,quantity,totalPrice",
        'a:clientState': clientState,
        'page': page,
        'start': start,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].quantity''',
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
  List<String>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? whenDateTime(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].whenDateTime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? itemName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItem-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? itemType(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]['resourceItemSection-_-itemCategory-_-resourceItemType-_-name']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VendorAllProspectCursorCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? start = '',
    String? page = '',
    String? limit = '',
    String? parentRecordKey = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorAllProspectCursor',
      apiUrl: '${baseUrl}/data/vendorProspectCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "id,consumerName,cosnumerEmail,consumerPhoneNumber,consumerLastLogin,consumerType.name",
        'start': start,
        'page': page,
        'limit': limit,
        'parentRecordKey': parentRecordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
}

class VendorAllCustomerCursorCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? start = '',
    String? page = '',
    String? limit = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorAllCustomerCursor',
      apiUrl: '${baseUrl}/data/venueCustomersCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns':
            "consumerName,cosnumerEmail,consumerPhoneNumber,consumerShortAddr,totalPrice",
        'a:clientState': clientState,
        'start': start,
        'page': page,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? consumerPhoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].consumerPhoneNumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? consumerName(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].consumerName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cosnumerEmail(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].cosnumerEmail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DateSpanListpickerCall {
  Future<ApiCallResponse> call({
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'dateSpanListpicker',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnDateSpanType\$?_dc=1749108904606&query=&uiContext=%7B%22key%22%3A%22vendorDashboard%22%2C%22params%22%3A%7B%22format%22%3A%5B%22js%22%5D%2C%22parentRecordKey%22%3A%5B%22303%22%5D%7D%2C%22component%22%3A%7B%22clientId%22%3A%22vendorDashboard__dashboardFilterPanel%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22vendorDashboard__dashboardFilterPanel%22%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VendorAllInquiryCursorCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? start = '0',
    String? page = '1',
    String? limit = '-1',
    String? filters = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorAllInquiryCursor',
      apiUrl: '${baseUrl}/data/customerInquiriesCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'columns': "comments,status.name,lastModifiedOn",
        'a:clientState': clientState,
        'filters': filters,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? comments(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].comments''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lastModifiedOn(dynamic response) => (getJsonField(
        response,
        r'''$.details[:].lastModifiedOn''',
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

class CLBXEnProspectInquiryStatusCall {
  Future<ApiCallResponse> call({
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CLBXEnProspectInquiryStatus',
      apiUrl:
          '${baseUrl}/data/uiEnumerationRestriction/CLBXEnProspectInquiryStatus\$?_dc=1749221629217&query=&uiContext=%7B%22key%22%3A%22customerInquiries%22%2C%22params%22%3A%7B%22format%22%3A%5B%22js%22%5D%7D%2C%22component%22%3A%7B%22clientId%22%3A%22customerInquiries__inquiryFilterPanel%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22customerInquiries__inquiryFilterPanel%22%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
}

class EnquiryDateListpickerCall {
  Future<ApiCallResponse> call({
    String? parentRecordKey = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'enquiryDateListpicker',
      apiUrl:
          '${baseUrl}/data/uiCursorEnumRestriction/submissionDateListPickerCursor?_dc=1749221694039&query=&uiContext=%7B%22key%22%3A%22customerInquiries%22%2C%22params%22%3A%7B%22format%22%3A%5B%22js%22%5D%7D%2C%22component%22%3A%7B%22clientId%22%3A%22customerInquiries__inquiryFilterPanel%22%2C%22clientState%22%3A%7B%22clientId%22%3A%22customerInquiries__inquiryFilterPanel%22%7D%7D%7D',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'parentRecordKey': parentRecordKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.details[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
}

class CloseInquiryActionCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'closeInquiryAction',
      apiUrl:
          '${baseUrl}/ui/customerInquiries/customerInquiriesUIGrid/deleteFromGrid',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:caller': "customerInquiriesUIGrid",
        'a:clientState': clientState,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastTxt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class VendorInquiryRespondCursorCall {
  Future<ApiCallResponse> call({
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorInquiryRespondCursor',
      apiUrl:
          '${baseUrl}/data/viewInquiryInDetailsCursor?_dc=1749231561542&format=js&label=Details%20of%20inquiry&recordKey=5&target=customerInquiries__customerInquiriesUIGrid&&a:clientState=%7B%22clientId%22%3A%22customerInquiries__customerInquiriesUIGrid%22%2C%22cursor%22%3A%7B%22parentRecordKey%22%3A%221557%22%7D%2C%22selection%22%3A%5B%225%22%5D%7D&format=js',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VendorInquiryResponseCusrorCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? clientState = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorInquiryResponseCusror',
      apiUrl: '${baseUrl}/data/viewInquiryInDetailsCursor',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'recordKey': recordKey,
        'a:clientState': clientState,
        'target': "customerInquiries__customerInquiriesUIGrid",
        'format': "js",
        'columns': "replyToInquiry,comments,status,dateSubmitted",
        'cache': "server",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? dateSubmitted(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].dateSubmitted''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].status''',
      ));
  String? consumerInquiry(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].comments''',
      ));
  List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:]._id''',
      ));
}

class VendorInquiryResponseSubmitCall {
  Future<ApiCallResponse> call({
    String? clientState = '',
    String? id = '',
    String? replyToInquiry = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorInquiryResponseSubmit',
      apiUrl:
          '${baseUrl}/ui/viewInquiryInDetails/viewInquiryInDetailsUIGrid/submitTheReply',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'a:clientState': clientState,
        'a:caller': "viewInquiryInDetailsUIGrid",
        '_id': id,
        'replyToInquiry': replyToInquiry,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

class VendorRequestConvertToOrderCall {
  Future<ApiCallResponse> call({
    String? recordKey = '',
    String? clientState = '',
    String? resourceId = '',
    String? baseURL,
    String? token = '',
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;
    final baseUrl = VendorGroup.getBaseUrl(
      baseURL: baseURL,
      token: token,
      header: header,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'vendorRequestConvertToOrder',
      apiUrl:
          '${baseUrl}/ui/vendorRequests/vendorRequestsForInfoShoppingGrid/createOrder',
      callType: ApiCallType.POST,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'ap:recordKey': recordKey,
        'a:clientState': clientState,
        'a:caller': "vendorRequestsForInfoShoppingGrid",
        'resourceId': resourceId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  bool? actionSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  String? toastMsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
  String? successToastmsg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.toasts[:].text''',
      ));
}

/// End vendor Group Code

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
      isStreamingApi: false,
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
      isStreamingApi: false,
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

class GetAddressFromLatLongCall {
  static Future<ApiCallResponse> call({
    double? latitude = 40.733088,
    double? longitude = -73.988824,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAddressFromLatLong',
      apiUrl:
          'https://api.mapbox.com/search/geocode/v6/reverse?longitude=${longitude}&latitude=${latitude}types=address&access_token=pk.eyJ1IjoiamF5YW50YW0iLCJhIjoiY2sydXFyZGZxMXAwczNudWlpY3JrcHB5MiJ9.8WEXuNB2Dyby6iFDjijbJA',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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

class VenueDetailTestCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'venueDetailTest',
      apiUrl:
          'http://localhost:9000/data/venueDetailsCursor/rec/307?columns=resource.basicPartyInfo.primaryContact.person.communication.phone,resource.basicPartyInfo.primaryContact.person.communication.email,resource.basicPartyInfo.primaryContact.person.fullName,cateringRates,cateringOption.name,resource.hasBookingCal,resource.bookingURL,resource.minBookingTimeframe.text,resource.resourceCosting.cancellationPolicy.text,resource.fullPaymentTimeframe.text,resource.creditCardAccepted,resource.paymentModes,resource.tertiaryAgeRange,resource.secondaryAgeRange,resource.primaryAgeRange,resource.additionalInfo.secondaryPreferredGender.name,resource.additionalInfo.primaryPreferredGender.name,venueType.name,resource.serviceDemographics.name,activityCategories,resource.additionalInfo.maxCapacityForGroup,resourceThemes,availDays,accomodates,sportsTypes,partyPlaceTypes,ageRange,resource.resourceItemPriceRane,activityTypes,resource.basicPartyInfo.busPartyIdentifier.description,resource.basicPartyInfo.address.addressInShort,resource.basicPartyInfo.communication.website,resource.basicPartyInfo.communication.email,resource.basicPartyInfo.communication.phone,getVenueCategory,resource.additionalInfo.overallRank,resource.basicPartyInfo.busPartyIdentifier.name,resource.basicPartyInfo.address.geometry&_dc=1717149619600',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? details(dynamic response) => getJsonField(
        response,
        r'''$.details''',
        true,
      ) as List?;
}

class LoginActionCall {
  static Future<ApiCallResponse> call({
    String? id = '1',
    String? data =
        'client_json:eyJlbWFpbCI6IiIsInBhc3N3b3JkIjoiIiwicmVtZW1iZXJNZSI6ZmFsc2V9',
    String? email = '',
    String? password = '',
    bool? rememberMe = false,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'loginAction',
      apiUrl: 'http://localhost:9000/ui/login/loginForm/loginAction',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'a:clientState': "{\"clientId\":\"login__loginForm\",\"cursor\":{}}",
        'a:caller': "loginForm",
        '_id': id,
        '_data': data,
        'email': email,
        'password': password,
        'rememberMe': rememberMe,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? messageApi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.text''',
      ));
  static String? messageType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.todo.messages.mainMessage.type''',
      ));
  static bool? actionSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.actionSuccess''',
      ));
  static String? caller(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].caller''',
      ));
  static int? shoppingCartId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.shoppingCart.id''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.shoppingCart.status''',
      ));
  static dynamic resourceItemAddnlInfo(dynamic response) => getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.itemRequests[:].resourceItemAddnlInfo''',
      );
  static dynamic resourceItemRequest(dynamic response) => getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.itemRequests[:].resourceItemRequest''',
      );
  static List? itemRequests(dynamic response) => getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.itemRequests''',
        true,
      ) as List?;
  static String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.todo.act[:].action''',
      ));
  static String? cartEXTID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store.session.__storeObject_ShoppingCartStoreService.shoppingCart.shoppingCartExtId''',
      ));
  static dynamic store(dynamic response) => getJsonField(
        response,
        r'''$.store''',
      );
  static dynamic sessionData(dynamic response) => getJsonField(
        response,
        r'''$.store.session''',
      );
}

class VideoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'video',
      apiUrl:
          'https://s3.us-east-1.amazonaws.com/celebratix.corporate.resources/video/var1/index1-var1.mp4',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }
}

class VisibleTabCall {
  static Future<ApiCallResponse> call({
    String? state = '',
    String? token = '',
    String? baseURL,
    String? header,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;
    header ??= FFDevEnvironmentValues().AuthHeader;

    return ApiManager.instance.makeApiCall(
      callName: 'VisibleTab',
      apiUrl: '${baseURL}/data/VisibleTab',
      callType: ApiCallType.GET,
      headers: {
        'cbxtoken': '${token}',
        'authorization': '${header}',
      },
      params: {
        'state': state,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? rental(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].rental''',
      ));
  static String? entertainer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.details[:].entertainer''',
      ));
  static String? food(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].food''',
      ));
  static String? cake(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].cake''',
      ));
}

class StripeTrialGetSecretKeyCall {
  static Future<ApiCallResponse> call({
    String? baseURL,
  }) async {
    baseURL ??= FFDevEnvironmentValues().BaseUrl;

    return ApiManager.instance.makeApiCall(
      callName: 'StripeTrialGetSecretKey',
      apiUrl: '${baseURL}/data/trailStripePaymentIntent',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? secretKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.details[:].trim''',
      ));
}

class SampleCall {
  static Future<ApiCallResponse> call({
    String? query = '',
    dynamic uicontextJson,
  }) async {
    final uicontext = _serializeJson(uicontextJson);

    return ApiManager.instance.makeApiCall(
      callName: 'sample',
      apiUrl:
          'http://localhost:9000/data/uiCursorEnumRestriction/venueSuggestionsCursor?_dc=1751602626044&query=${query}&uiContext=${uicontext}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  if (item is DocumentReference) {
    return item.path;
  }
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
