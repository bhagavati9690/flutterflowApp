import '/backend/api_requests/api_calls.dart';
import '/components/location_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cake_search_comp_widget.dart' show CakeSearchCompWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CakeSearchCompModel extends FlutterFlowModel<CakeSearchCompWidget> {
  ///  Local state fields for this component.

  List<String> firstBirthday = ['First Birthday', 'Animals'];
  void addToFirstBirthday(String item) => firstBirthday.add(item);
  void removeFromFirstBirthday(String item) => firstBirthday.remove(item);
  void removeAtIndexFromFirstBirthday(int index) =>
      firstBirthday.removeAt(index);
  void insertAtIndexInFirstBirthday(int index, String item) =>
      firstBirthday.insert(index, item);
  void updateFirstBirthdayAtIndex(int index, Function(String) updateFn) =>
      firstBirthday[index] = updateFn(firstBirthday[index]);

  List<String> girlBirthday = [
    'Cars Trains Planes Toys Constructions',
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
  void addToGirlBirthday(String item) => girlBirthday.add(item);
  void removeFromGirlBirthday(String item) => girlBirthday.remove(item);
  void removeAtIndexFromGirlBirthday(int index) => girlBirthday.removeAt(index);
  void insertAtIndexInGirlBirthday(int index, String item) =>
      girlBirthday.insert(index, item);
  void updateGirlBirthdayAtIndex(int index, Function(String) updateFn) =>
      girlBirthday[index] = updateFn(girlBirthday[index]);

  List<String> boysBirthday = [
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
  void addToBoysBirthday(String item) => boysBirthday.add(item);
  void removeFromBoysBirthday(String item) => boysBirthday.remove(item);
  void removeAtIndexFromBoysBirthday(int index) => boysBirthday.removeAt(index);
  void insertAtIndexInBoysBirthday(int index, String item) =>
      boysBirthday.insert(index, item);
  void updateBoysBirthdayAtIndex(int index, Function(String) updateFn) =>
      boysBirthday[index] = updateFn(boysBirthday[index]);

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

  List<String> babyBridalShower = [
    'General Party',
    'Baby Shower',
    'Bridal Shower'
  ];
  void addToBabyBridalShower(String item) => babyBridalShower.add(item);
  void removeFromBabyBridalShower(String item) => babyBridalShower.remove(item);
  void removeAtIndexFromBabyBridalShower(int index) =>
      babyBridalShower.removeAt(index);
  void insertAtIndexInBabyBridalShower(int index, String item) =>
      babyBridalShower.insert(index, item);
  void updateBabyBridalShowerAtIndex(int index, Function(String) updateFn) =>
      babyBridalShower[index] = updateFn(babyBridalShower[index]);

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

  List<String> wedding = ['Wedding'];
  void addToWedding(String item) => wedding.add(item);
  void removeFromWedding(String item) => wedding.remove(item);
  void removeAtIndexFromWedding(int index) => wedding.removeAt(index);
  void insertAtIndexInWedding(int index, String item) =>
      wedding.insert(index, item);
  void updateWeddingAtIndex(int index, Function(String) updateFn) =>
      wedding[index] = updateFn(wedding[index]);

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
  // State field(s) for Catagory widget.
  String? catagoryValue;
  FormFieldController<String>? catagoryValueController;

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
