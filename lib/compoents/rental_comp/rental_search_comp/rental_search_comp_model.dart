import '/backend/api_requests/api_calls.dart';
import '/components/location_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'rental_search_comp_widget.dart' show RentalSearchCompWidget;
import 'package:flutter/material.dart';

class RentalSearchCompModel extends FlutterFlowModel<RentalSearchCompWidget> {
  ///  Local state fields for this component.

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

  List<String> tableTentChairs = ['Table', 'Tent', 'Chair'];
  void addToTableTentChairs(String item) => tableTentChairs.add(item);
  void removeFromTableTentChairs(String item) => tableTentChairs.remove(item);
  void removeAtIndexFromTableTentChairs(int index) =>
      tableTentChairs.removeAt(index);
  void insertAtIndexInTableTentChairs(int index, String item) =>
      tableTentChairs.insert(index, item);
  void updateTableTentChairsAtIndex(int index, Function(String) updateFn) =>
      tableTentChairs[index] = updateFn(tableTentChairs[index]);

  List<String> inflatables = ['Inflatables'];
  void addToInflatables(String item) => inflatables.add(item);
  void removeFromInflatables(String item) => inflatables.remove(item);
  void removeAtIndexFromInflatables(int index) => inflatables.removeAt(index);
  void insertAtIndexInInflatables(int index, String item) =>
      inflatables.insert(index, item);
  void updateInflatablesAtIndex(int index, Function(String) updateFn) =>
      inflatables[index] = updateFn(inflatables[index]);

  List<String> foodMachines = ['Food Machine/Concession'];
  void addToFoodMachines(String item) => foodMachines.add(item);
  void removeFromFoodMachines(String item) => foodMachines.remove(item);
  void removeAtIndexFromFoodMachines(int index) => foodMachines.removeAt(index);
  void insertAtIndexInFoodMachines(int index, String item) =>
      foodMachines.insert(index, item);
  void updateFoodMachinesAtIndex(int index, Function(String) updateFn) =>
      foodMachines[index] = updateFn(foodMachines[index]);

  List<String> audioVideoVisules = ['Electrical', 'Audio-Visual-Office Item'];
  void addToAudioVideoVisules(String item) => audioVideoVisules.add(item);
  void removeFromAudioVideoVisules(String item) =>
      audioVideoVisules.remove(item);
  void removeAtIndexFromAudioVideoVisules(int index) =>
      audioVideoVisules.removeAt(index);
  void insertAtIndexInAudioVideoVisules(int index, String item) =>
      audioVideoVisules.insert(index, item);
  void updateAudioVideoVisulesAtIndex(int index, Function(String) updateFn) =>
      audioVideoVisules[index] = updateFn(audioVideoVisules[index]);

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

  List<String> funGames = ['Fun-Games'];
  void addToFunGames(String item) => funGames.add(item);
  void removeFromFunGames(String item) => funGames.remove(item);
  void removeAtIndexFromFunGames(int index) => funGames.removeAt(index);
  void insertAtIndexInFunGames(int index, String item) =>
      funGames.insert(index, item);
  void updateFunGamesAtIndex(int index, Function(String) updateFn) =>
      funGames[index] = updateFn(funGames[index]);

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
