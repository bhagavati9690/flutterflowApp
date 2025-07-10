import '/backend/api_requests/api_calls.dart';
import '/components/location_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'venue_search_comp_widget.dart' show VenueSearchCompWidget;
import 'package:flutter/material.dart';

class VenueSearchCompModel extends FlutterFlowModel<VenueSearchCompWidget> {
  ///  Local state fields for this component.

  String? selection;

  List<String> princessFavorite = [
    'Art-Craft',
    'Dance',
    'Painting',
    'Music',
    'Farms',
    'Zoo',
    'Cooking',
    'Shows-Plays',
    'Magic'
  ];
  void addToPrincessFavorite(String item) => princessFavorite.add(item);
  void removeFromPrincessFavorite(String item) => princessFavorite.remove(item);
  void removeAtIndexFromPrincessFavorite(int index) =>
      princessFavorite.removeAt(index);
  void insertAtIndexInPrincessFavorite(int index, String item) =>
      princessFavorite.insert(index, item);
  void updatePrincessFavoriteAtIndex(int index, Function(String) updateFn) =>
      princessFavorite[index] = updateFn(princessFavorite[index]);

  List<String> firstBirthday = ['One Year'];
  void addToFirstBirthday(String item) => firstBirthday.add(item);
  void removeFromFirstBirthday(String item) => firstBirthday.remove(item);
  void removeAtIndexFromFirstBirthday(int index) =>
      firstBirthday.removeAt(index);
  void insertAtIndexInFirstBirthday(int index, String item) =>
      firstBirthday.insert(index, item);
  void updateFirstBirthdayAtIndex(int index, Function(String) updateFn) =>
      firstBirthday[index] = updateFn(firstBirthday[index]);

  List<String> funActivity = [
    'Movies',
    'Amusement Park/Rides',
    'Bumper Cars/Go-karts',
    'Play Spaces/Jump Slides',
    'Indoor Fun Games',
    'Laser Games',
    'Outdoor Fun-Tour',
    'Video Games',
    'Adventure'
  ];
  void addToFunActivity(String item) => funActivity.add(item);
  void removeFromFunActivity(String item) => funActivity.remove(item);
  void removeAtIndexFromFunActivity(int index) => funActivity.removeAt(index);
  void insertAtIndexInFunActivity(int index, String item) =>
      funActivity.insert(index, item);
  void updateFunActivityAtIndex(int index, Function(String) updateFn) =>
      funActivity[index] = updateFn(funActivity[index]);

  List<String> coporateParty = [
    'Bowling',
    'Outdoor Games/Paintball',
    'Rock Climbing',
    'Boating',
    'Golf'
  ];
  void addToCoporateParty(String item) => coporateParty.add(item);
  void removeFromCoporateParty(String item) => coporateParty.remove(item);
  void removeAtIndexFromCoporateParty(int index) =>
      coporateParty.removeAt(index);
  void insertAtIndexInCoporateParty(int index, String item) =>
      coporateParty.insert(index, item);
  void updateCoporatePartyAtIndex(int index, Function(String) updateFn) =>
      coporateParty[index] = updateFn(coporateParty[index]);

  List<String> sports = [
    'Family/Kids Sports',
    'Boat/Yacht',
    'Sports/Health',
    'Country Club/Golf Club'
  ];
  void addToSports(String item) => sports.add(item);
  void removeFromSports(String item) => sports.remove(item);
  void removeAtIndexFromSports(int index) => sports.removeAt(index);
  void insertAtIndexInSports(int index, String item) =>
      sports.insert(index, item);
  void updateSportsAtIndex(int index, Function(String) updateFn) =>
      sports[index] = updateFn(sports[index]);

  List<String> artParty = [
    'Cooking',
    'Art-Craft',
    'Painting',
    'Shows-Plays',
    'Magic'
  ];
  void addToArtParty(String item) => artParty.add(item);
  void removeFromArtParty(String item) => artParty.remove(item);
  void removeAtIndexFromArtParty(int index) => artParty.removeAt(index);
  void insertAtIndexInArtParty(int index, String item) =>
      artParty.insert(index, item);
  void updateArtPartyAtIndex(int index, Function(String) updateFn) =>
      artParty[index] = updateFn(artParty[index]);

  List<String> adultCelebration = ['21 Years and Above'];
  void addToAdultCelebration(String item) => adultCelebration.add(item);
  void removeFromAdultCelebration(String item) => adultCelebration.remove(item);
  void removeAtIndexFromAdultCelebration(int index) =>
      adultCelebration.removeAt(index);
  void insertAtIndexInAdultCelebration(int index, String item) =>
      adultCelebration.insert(index, item);
  void updateAdultCelebrationAtIndex(int index, Function(String) updateFn) =>
      adultCelebration[index] = updateFn(adultCelebration[index]);

  List<String> education = [
    'Educational - General',
    'Educational Science-Technology'
  ];
  void addToEducation(String item) => education.add(item);
  void removeFromEducation(String item) => education.remove(item);
  void removeAtIndexFromEducation(int index) => education.removeAt(index);
  void insertAtIndexInEducation(int index, String item) =>
      education.insert(index, item);
  void updateEducationAtIndex(int index, Function(String) updateFn) =>
      education[index] = updateFn(education[index]);

  List<String> banquetHall = [
    'Banquet/Reception Hall',
    'Church/Temple',
    'Non-Profit Org/Club',
    'Country Club/Golf Club',
    'Estate/Mansion/Castle',
    'Fraternal Association Hall',
    'Wedding Chapel',
    'Resort/Spa/Retreat',
    'Auditorium',
    'Museum',
    'Hotel',
    'Gallery',
    'Conference Hall',
    'Restaurant'
  ];
  void addToBanquetHall(String item) => banquetHall.add(item);
  void removeFromBanquetHall(String item) => banquetHall.remove(item);
  void removeAtIndexFromBanquetHall(int index) => banquetHall.removeAt(index);
  void insertAtIndexInBanquetHall(int index, String item) =>
      banquetHall.insert(index, item);
  void updateBanquetHallAtIndex(int index, Function(String) updateFn) =>
      banquetHall[index] = updateFn(banquetHall[index]);

  bool showSuggestion = false;

  ///  State fields for stateful widgets in this component.

  // Model for locationSearchComp component.
  late LocationSearchCompModel locationSearchCompModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? distanceSelection;
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for PartyPlace widget.
  String? partyPlaceValue;
  FormFieldController<String>? partyPlaceValueController;

  @override
  void initState(BuildContext context) {
    locationSearchCompModel =
        createModel(context, () => LocationSearchCompModel());
  }

  @override
  void dispose() {
    locationSearchCompModel.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
