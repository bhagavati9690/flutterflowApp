import '/compoents/cake_comp/cake_search_comp/cake_search_comp_widget.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/compoents/entertainer_comp/entertainer_search_comp/entertainer_search_comp_widget.dart';
import '/compoents/rental_comp/rental_search_comp/rental_search_comp_widget.dart';
import '/compoents/venue_comp/venue_search_comp/venue_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_search_widget.dart' show AllSearchWidget;
import 'package:flutter/material.dart';

class AllSearchModel extends FlutterFlowModel<AllSearchWidget> {
  ///  Local state fields for this page.

  String? selection;

  List<String> funActivity = [
    'Moives',
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

  List<String> artParty = [];
  void addToArtParty(String item) => artParty.add(item);
  void removeFromArtParty(String item) => artParty.remove(item);
  void removeAtIndexFromArtParty(int index) => artParty.removeAt(index);
  void insertAtIndexInArtParty(int index, String item) =>
      artParty.insert(index, item);
  void updateArtPartyAtIndex(int index, Function(String) updateFn) =>
      artParty[index] = updateFn(artParty[index]);

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
    'Educational-Genera',
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
    'Fratemal Association Hall',
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

  List<String> firstBirthday = ['One Year'];
  void addToFirstBirthday(String item) => firstBirthday.add(item);
  void removeFromFirstBirthday(String item) => firstBirthday.remove(item);
  void removeAtIndexFromFirstBirthday(int index) =>
      firstBirthday.removeAt(index);
  void insertAtIndexInFirstBirthday(int index, String item) =>
      firstBirthday.insert(index, item);
  void updateFirstBirthdayAtIndex(int index, Function(String) updateFn) =>
      firstBirthday[index] = updateFn(firstBirthday[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for venueSearchComp component.
  late VenueSearchCompModel venueSearchCompModel;
  // Model for RentalSearchComp component.
  late RentalSearchCompModel rentalSearchCompModel;
  // Model for EntertainerSearchComp component.
  late EntertainerSearchCompModel entertainerSearchCompModel;
  // Model for CakeSearchComp component.
  late CakeSearchCompModel cakeSearchCompModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    venueSearchCompModel = createModel(context, () => VenueSearchCompModel());
    rentalSearchCompModel = createModel(context, () => RentalSearchCompModel());
    entertainerSearchCompModel =
        createModel(context, () => EntertainerSearchCompModel());
    cakeSearchCompModel = createModel(context, () => CakeSearchCompModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    venueSearchCompModel.dispose();
    rentalSearchCompModel.dispose();
    entertainerSearchCompModel.dispose();
    cakeSearchCompModel.dispose();
    navBarModel.dispose();
  }
}
