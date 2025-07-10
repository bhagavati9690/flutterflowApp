import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/compoents/common_comp/celebration_type_compoent/celebration_type_compoent_widget.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool showLocationSearchbox = true;

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

  List<String> tentTableChair = ['Table', 'Tent', 'Chair'];
  void addToTentTableChair(String item) => tentTableChair.add(item);
  void removeFromTentTableChair(String item) => tentTableChair.remove(item);
  void removeAtIndexFromTentTableChair(int index) =>
      tentTableChair.removeAt(index);
  void insertAtIndexInTentTableChair(int index, String item) =>
      tentTableChair.insert(index, item);
  void updateTentTableChairAtIndex(int index, Function(String) updateFn) =>
      tentTableChair[index] = updateFn(tentTableChair[index]);

  List<String> inflatables = ['Inflatables'];
  void addToInflatables(String item) => inflatables.add(item);
  void removeFromInflatables(String item) => inflatables.remove(item);
  void removeAtIndexFromInflatables(int index) => inflatables.removeAt(index);
  void insertAtIndexInInflatables(int index, String item) =>
      inflatables.insert(index, item);
  void updateInflatablesAtIndex(int index, Function(String) updateFn) =>
      inflatables[index] = updateFn(inflatables[index]);

  List<String> foodMachineConcession = ['Food Machine/Concession'];
  void addToFoodMachineConcession(String item) =>
      foodMachineConcession.add(item);
  void removeFromFoodMachineConcession(String item) =>
      foodMachineConcession.remove(item);
  void removeAtIndexFromFoodMachineConcession(int index) =>
      foodMachineConcession.removeAt(index);
  void insertAtIndexInFoodMachineConcession(int index, String item) =>
      foodMachineConcession.insert(index, item);
  void updateFoodMachineConcessionAtIndex(
          int index, Function(String) updateFn) =>
      foodMachineConcession[index] = updateFn(foodMachineConcession[index]);

  List<String> funGames = ['Fun-Games'];
  void addToFunGames(String item) => funGames.add(item);
  void removeFromFunGames(String item) => funGames.remove(item);
  void removeAtIndexFromFunGames(int index) => funGames.removeAt(index);
  void insertAtIndexInFunGames(int index, String item) =>
      funGames.insert(index, item);
  void updateFunGamesAtIndex(int index, Function(String) updateFn) =>
      funGames[index] = updateFn(funGames[index]);

  List<String> audioVisualElectrical = [
    'Audio-Visual-Office Item',
    'Electrical'
  ];
  void addToAudioVisualElectrical(String item) =>
      audioVisualElectrical.add(item);
  void removeFromAudioVisualElectrical(String item) =>
      audioVisualElectrical.remove(item);
  void removeAtIndexFromAudioVisualElectrical(int index) =>
      audioVisualElectrical.removeAt(index);
  void insertAtIndexInAudioVisualElectrical(int index, String item) =>
      audioVisualElectrical.insert(index, item);
  void updateAudioVisualElectricalAtIndex(
          int index, Function(String) updateFn) =>
      audioVisualElectrical[index] = updateFn(audioVisualElectrical[index]);

  List<String> decoration = ['Decoration'];
  void addToDecoration(String item) => decoration.add(item);
  void removeFromDecoration(String item) => decoration.remove(item);
  void removeAtIndexFromDecoration(int index) => decoration.removeAt(index);
  void insertAtIndexInDecoration(int index, String item) =>
      decoration.insert(index, item);
  void updateDecorationAtIndex(int index, Function(String) updateFn) =>
      decoration[index] = updateFn(decoration[index]);

  List<String> stageDanceFloor = ['Stage/Dance Floor'];
  void addToStageDanceFloor(String item) => stageDanceFloor.add(item);
  void removeFromStageDanceFloor(String item) => stageDanceFloor.remove(item);
  void removeAtIndexFromStageDanceFloor(int index) =>
      stageDanceFloor.removeAt(index);
  void insertAtIndexInStageDanceFloor(int index, String item) =>
      stageDanceFloor.insert(index, item);
  void updateStageDanceFloorAtIndex(int index, Function(String) updateFn) =>
      stageDanceFloor[index] = updateFn(stageDanceFloor[index]);

  List<String> servingCatering = ['Serving/Catering'];
  void addToServingCatering(String item) => servingCatering.add(item);
  void removeFromServingCatering(String item) => servingCatering.remove(item);
  void removeAtIndexFromServingCatering(int index) =>
      servingCatering.removeAt(index);
  void insertAtIndexInServingCatering(int index, String item) =>
      servingCatering.insert(index, item);
  void updateServingCateringAtIndex(int index, Function(String) updateFn) =>
      servingCatering[index] = updateFn(servingCatering[index]);

  List<String> photoBooth = ['Photo Booth'];
  void addToPhotoBooth(String item) => photoBooth.add(item);
  void removeFromPhotoBooth(String item) => photoBooth.remove(item);
  void removeAtIndexFromPhotoBooth(int index) => photoBooth.removeAt(index);
  void insertAtIndexInPhotoBooth(int index, String item) =>
      photoBooth.insert(index, item);
  void updatePhotoBoothAtIndex(int index, Function(String) updateFn) =>
      photoBooth[index] = updateFn(photoBooth[index]);

  List<String> magician = ['Magician'];
  void addToMagician(String item) => magician.add(item);
  void removeFromMagician(String item) => magician.remove(item);
  void removeAtIndexFromMagician(int index) => magician.removeAt(index);
  void insertAtIndexInMagician(int index, String item) =>
      magician.insert(index, item);
  void updateMagicianAtIndex(int index, Function(String) updateFn) =>
      magician[index] = updateFn(magician[index]);

  List<String> facePainterBallon = ['Face Painter', 'Balloon Twister'];
  void addToFacePainterBallon(String item) => facePainterBallon.add(item);
  void removeFromFacePainterBallon(String item) =>
      facePainterBallon.remove(item);
  void removeAtIndexFromFacePainterBallon(int index) =>
      facePainterBallon.removeAt(index);
  void insertAtIndexInFacePainterBallon(int index, String item) =>
      facePainterBallon.insert(index, item);
  void updateFacePainterBallonAtIndex(int index, Function(String) updateFn) =>
      facePainterBallon[index] = updateFn(facePainterBallon[index]);

  List<String> clownCharacters = ['Clown', 'Costumed Characters'];
  void addToClownCharacters(String item) => clownCharacters.add(item);
  void removeFromClownCharacters(String item) => clownCharacters.remove(item);
  void removeAtIndexFromClownCharacters(int index) =>
      clownCharacters.removeAt(index);
  void insertAtIndexInClownCharacters(int index, String item) =>
      clownCharacters.insert(index, item);
  void updateClownCharactersAtIndex(int index, Function(String) updateFn) =>
      clownCharacters[index] = updateFn(clownCharacters[index]);

  List<String> puppetShow = ['Puppet Show', 'Storytelling'];
  void addToPuppetShow(String item) => puppetShow.add(item);
  void removeFromPuppetShow(String item) => puppetShow.remove(item);
  void removeAtIndexFromPuppetShow(int index) => puppetShow.removeAt(index);
  void insertAtIndexInPuppetShow(int index, String item) =>
      puppetShow.insert(index, item);
  void updatePuppetShowAtIndex(int index, Function(String) updateFn) =>
      puppetShow[index] = updateFn(puppetShow[index]);

  List<String> decoratorFoodBar = [
    'Decorator',
    'Cleaning Service',
    'Bartender'
  ];
  void addToDecoratorFoodBar(String item) => decoratorFoodBar.add(item);
  void removeFromDecoratorFoodBar(String item) => decoratorFoodBar.remove(item);
  void removeAtIndexFromDecoratorFoodBar(int index) =>
      decoratorFoodBar.removeAt(index);
  void insertAtIndexInDecoratorFoodBar(int index, String item) =>
      decoratorFoodBar.insert(index, item);
  void updateDecoratorFoodBarAtIndex(int index, Function(String) updateFn) =>
      decoratorFoodBar[index] = updateFn(decoratorFoodBar[index]);

  List<String> mobileGamesSports = ['Mobile Games', 'Sports'];
  void addToMobileGamesSports(String item) => mobileGamesSports.add(item);
  void removeFromMobileGamesSports(String item) =>
      mobileGamesSports.remove(item);
  void removeAtIndexFromMobileGamesSports(int index) =>
      mobileGamesSports.removeAt(index);
  void insertAtIndexInMobileGamesSports(int index, String item) =>
      mobileGamesSports.insert(index, item);
  void updateMobileGamesSportsAtIndex(int index, Function(String) updateFn) =>
      mobileGamesSports[index] = updateFn(mobileGamesSports[index]);

  List<String> musicDance = ['Music', 'Dance'];
  void addToMusicDance(String item) => musicDance.add(item);
  void removeFromMusicDance(String item) => musicDance.remove(item);
  void removeAtIndexFromMusicDance(int index) => musicDance.removeAt(index);
  void insertAtIndexInMusicDance(int index, String item) =>
      musicDance.insert(index, item);
  void updateMusicDanceAtIndex(int index, Function(String) updateFn) =>
      musicDance[index] = updateFn(musicDance[index]);

  List<String> photography = ['Photography', 'Video'];
  void addToPhotography(String item) => photography.add(item);
  void removeFromPhotography(String item) => photography.remove(item);
  void removeAtIndexFromPhotography(int index) => photography.removeAt(index);
  void insertAtIndexInPhotography(int index, String item) =>
      photography.insert(index, item);
  void updatePhotographyAtIndex(int index, Function(String) updateFn) =>
      photography[index] = updateFn(photography[index]);

  List<String> wedding = ['Bridal Services', 'Photographer', 'Videographer'];
  void addToWedding(String item) => wedding.add(item);
  void removeFromWedding(String item) => wedding.remove(item);
  void removeAtIndexFromWedding(int index) => wedding.removeAt(index);
  void insertAtIndexInWedding(int index, String item) =>
      wedding.insert(index, item);
  void updateWeddingAtIndex(int index, Function(String) updateFn) =>
      wedding[index] = updateFn(wedding[index]);

  List<String> firstBirthdayCake = ['First Birthday', 'Animals'];
  void addToFirstBirthdayCake(String item) => firstBirthdayCake.add(item);
  void removeFromFirstBirthdayCake(String item) =>
      firstBirthdayCake.remove(item);
  void removeAtIndexFromFirstBirthdayCake(int index) =>
      firstBirthdayCake.removeAt(index);
  void insertAtIndexInFirstBirthdayCake(int index, String item) =>
      firstBirthdayCake.insert(index, item);
  void updateFirstBirthdayCakeAtIndex(int index, Function(String) updateFn) =>
      firstBirthdayCake[index] = updateFn(firstBirthdayCake[index]);

  List<String> boysBirthday = [
    'Cars Trains Planes Toys Constructions\n',
    'Dinosaur',
    'Disney',
    'Kids Characters Pbskids',
    'Kids Characters Movies',
    'Kids Others',
    'Nickeledeon',
    'Pirate',
    'Sports',
    'Adventure',
    'Video Games',
    'Magic Circus',
    'Personalized Photos',
    'Educational',
    'Superheroes'
  ];
  void addToBoysBirthday(String item) => boysBirthday.add(item);
  void removeFromBoysBirthday(String item) => boysBirthday.remove(item);
  void removeAtIndexFromBoysBirthday(int index) => boysBirthday.removeAt(index);
  void insertAtIndexInBoysBirthday(int index, String item) =>
      boysBirthday.insert(index, item);
  void updateBoysBirthdayAtIndex(int index, Function(String) updateFn) =>
      boysBirthday[index] = updateFn(boysBirthday[index]);

  List<String> girlBirthday = [
    'Disney',
    'Fairlytales Princess',
    'Fashion Dolls',
    'Kids Characters Pbskids',
    'Kids Characters Movies',
    'Kids Others',
    'Nickeledeon',
    'Music Media',
    'Magic Circus',
    'Personalized Photos',
    'Educational',
    'Arts'
  ];
  void addToGirlBirthday(String item) => girlBirthday.add(item);
  void removeFromGirlBirthday(String item) => girlBirthday.remove(item);
  void removeAtIndexFromGirlBirthday(int index) => girlBirthday.removeAt(index);
  void insertAtIndexInGirlBirthday(int index, String item) =>
      girlBirthday.insert(index, item);
  void updateGirlBirthdayAtIndex(int index, Function(String) updateFn) =>
      girlBirthday[index] = updateFn(girlBirthday[index]);

  List<String> adultBirthday = [
    'General Birthday',
    'Age Specific',
    'Beach Ocean',
    'Carnival',
    'Community Neighborhood',
    'Decades Styles',
    'Food',
    'Movies Entertainment',
    'Religious',
    'Scenery',
    'Scary',
    'Funny',
    'Mystery',
    'Social',
    'Outdoor',
    'General Party'
  ];
  void addToAdultBirthday(String item) => adultBirthday.add(item);
  void removeFromAdultBirthday(String item) => adultBirthday.remove(item);
  void removeAtIndexFromAdultBirthday(int index) =>
      adultBirthday.removeAt(index);
  void insertAtIndexInAdultBirthday(int index, String item) =>
      adultBirthday.insert(index, item);
  void updateAdultBirthdayAtIndex(int index, Function(String) updateFn) =>
      adultBirthday[index] = updateFn(adultBirthday[index]);

  List<String> babyShower = ['General Party', 'Baby Shower', 'Bridal Shower'];
  void addToBabyShower(String item) => babyShower.add(item);
  void removeFromBabyShower(String item) => babyShower.remove(item);
  void removeAtIndexFromBabyShower(int index) => babyShower.removeAt(index);
  void insertAtIndexInBabyShower(int index, String item) =>
      babyShower.insert(index, item);
  void updateBabyShowerAtIndex(int index, Function(String) updateFn) =>
      babyShower[index] = updateFn(babyShower[index]);

  List<String> graduation = ['School Events', 'General Party'];
  void addToGraduation(String item) => graduation.add(item);
  void removeFromGraduation(String item) => graduation.remove(item);
  void removeAtIndexFromGraduation(int index) => graduation.removeAt(index);
  void insertAtIndexInGraduation(int index, String item) =>
      graduation.insert(index, item);
  void updateGraduationAtIndex(int index, Function(String) updateFn) =>
      graduation[index] = updateFn(graduation[index]);

  List<String> holiday = ['Holidays', 'General Party'];
  void addToHoliday(String item) => holiday.add(item);
  void removeFromHoliday(String item) => holiday.remove(item);
  void removeAtIndexFromHoliday(int index) => holiday.removeAt(index);
  void insertAtIndexInHoliday(int index, String item) =>
      holiday.insert(index, item);
  void updateHolidayAtIndex(int index, Function(String) updateFn) =>
      holiday[index] = updateFn(holiday[index]);

  List<String> specialEvents = [
    'Outdoor',
    'Romantic',
    'International Ethnic',
    'School Events',
    'General Party'
  ];
  void addToSpecialEvents(String item) => specialEvents.add(item);
  void removeFromSpecialEvents(String item) => specialEvents.remove(item);
  void removeAtIndexFromSpecialEvents(int index) =>
      specialEvents.removeAt(index);
  void insertAtIndexInSpecialEvents(int index, String item) =>
      specialEvents.insert(index, item);
  void updateSpecialEventsAtIndex(int index, Function(String) updateFn) =>
      specialEvents[index] = updateFn(specialEvents[index]);

  List<String> weddingCake = ['Wedding'];
  void addToWeddingCake(String item) => weddingCake.add(item);
  void removeFromWeddingCake(String item) => weddingCake.remove(item);
  void removeAtIndexFromWeddingCake(int index) => weddingCake.removeAt(index);
  void insertAtIndexInWeddingCake(int index, String item) =>
      weddingCake.insert(index, item);
  void updateWeddingCakeAtIndex(int index, Function(String) updateFn) =>
      weddingCake[index] = updateFn(weddingCake[index]);

  ///  State fields for stateful widgets in this page.

  InstantTimer? SessionOut;
  // Stores action output result for [Custom Action - determinePosition] action in HomePage widget.
  LatLng? currentPosition;
  // Stores action output result for [Backend Call - API (getLocationFromLatLong)] action in HomePage widget.
  ApiCallResponse? apiResultLocation;
  // Stores action output result for [Backend Call - API (assignLocation)] action in HomePage widget.
  ApiCallResponse? assignLocation;
  // Stores action output result for [Backend Call - API (VisibleTab)] action in HomePage widget.
  ApiCallResponse? visibleTabResponse;
  // Stores action output result for [Backend Call - API (loginAccount)] action in HomePage widget.
  ApiCallResponse? apiResultHomeLoginAction;
  // Stores action output result for [Backend Call - API (MyInformation)] action in HomePage widget.
  ApiCallResponse? personInfo;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  UsersRecord? currentUserResponse;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  LocationReturnStruct? locationUpdateOutput;
  // Stores action output result for [Backend Call - API (assignLocation)] action in Container widget.
  ApiCallResponse? assignLocation1;
  // Stores action output result for [Backend Call - API (VisibleTab)] action in Container widget.
  ApiCallResponse? visibleTabResponse2;
  // State field(s) for VenueCarousel widget.
  CarouselSliderController? venueCarouselController;
  int venueCarouselCurrentIndex = 0;

  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel1;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel2;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel3;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel4;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel5;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel6;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel7;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel8;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel9;
  // State field(s) for RentalCarousel widget.
  CarouselSliderController? rentalCarouselController;
  int rentalCarouselCurrentIndex = 0;

  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel10;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel11;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel12;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel13;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel14;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel15;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel16;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel17;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel18;
  // State field(s) for EntertainerCarousel widget.
  CarouselSliderController? entertainerCarouselController;
  int entertainerCarouselCurrentIndex = 0;

  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel19;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel20;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel21;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel22;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel23;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel24;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel25;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel26;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel27;
  // State field(s) for CakeCarousel widget.
  CarouselSliderController? cakeCarouselController;
  int cakeCarouselCurrentIndex = 0;

  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel28;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel29;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel30;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel31;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel32;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel33;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel34;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel35;
  // Model for celebrationTypeCompoent component.
  late CelebrationTypeCompoentModel celebrationTypeCompoentModel36;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    celebrationTypeCompoentModel1 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel2 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel3 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel4 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel5 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel6 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel7 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel8 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel9 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel10 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel11 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel12 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel13 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel14 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel15 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel16 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel17 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel18 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel19 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel20 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel21 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel22 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel23 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel24 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel25 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel26 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel27 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel28 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel29 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel30 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel31 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel32 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel33 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel34 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel35 =
        createModel(context, () => CelebrationTypeCompoentModel());
    celebrationTypeCompoentModel36 =
        createModel(context, () => CelebrationTypeCompoentModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    SessionOut?.cancel();
    celebrationTypeCompoentModel1.dispose();
    celebrationTypeCompoentModel2.dispose();
    celebrationTypeCompoentModel3.dispose();
    celebrationTypeCompoentModel4.dispose();
    celebrationTypeCompoentModel5.dispose();
    celebrationTypeCompoentModel6.dispose();
    celebrationTypeCompoentModel7.dispose();
    celebrationTypeCompoentModel8.dispose();
    celebrationTypeCompoentModel9.dispose();
    celebrationTypeCompoentModel10.dispose();
    celebrationTypeCompoentModel11.dispose();
    celebrationTypeCompoentModel12.dispose();
    celebrationTypeCompoentModel13.dispose();
    celebrationTypeCompoentModel14.dispose();
    celebrationTypeCompoentModel15.dispose();
    celebrationTypeCompoentModel16.dispose();
    celebrationTypeCompoentModel17.dispose();
    celebrationTypeCompoentModel18.dispose();
    celebrationTypeCompoentModel19.dispose();
    celebrationTypeCompoentModel20.dispose();
    celebrationTypeCompoentModel21.dispose();
    celebrationTypeCompoentModel22.dispose();
    celebrationTypeCompoentModel23.dispose();
    celebrationTypeCompoentModel24.dispose();
    celebrationTypeCompoentModel25.dispose();
    celebrationTypeCompoentModel26.dispose();
    celebrationTypeCompoentModel27.dispose();
    celebrationTypeCompoentModel28.dispose();
    celebrationTypeCompoentModel29.dispose();
    celebrationTypeCompoentModel30.dispose();
    celebrationTypeCompoentModel31.dispose();
    celebrationTypeCompoentModel32.dispose();
    celebrationTypeCompoentModel33.dispose();
    celebrationTypeCompoentModel34.dispose();
    celebrationTypeCompoentModel35.dispose();
    celebrationTypeCompoentModel36.dispose();
    navBarModel.dispose();
  }
}
