import '/backend/api_requests/api_calls.dart';
import '/components/location_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'entertainer_search_comp_widget.dart' show EntertainerSearchCompWidget;
import 'package:flutter/material.dart';

class EntertainerSearchCompModel
    extends FlutterFlowModel<EntertainerSearchCompWidget> {
  ///  Local state fields for this component.

  List<String> magician = ['Magician'];
  void addToMagician(String item) => magician.add(item);
  void removeFromMagician(String item) => magician.remove(item);
  void removeAtIndexFromMagician(int index) => magician.removeAt(index);
  void insertAtIndexInMagician(int index, String item) =>
      magician.insert(index, item);
  void updateMagicianAtIndex(int index, Function(String) updateFn) =>
      magician[index] = updateFn(magician[index]);

  List<String> facePainterBalloonTwister = ['Face Painter', 'Balloon Twister'];
  void addToFacePainterBalloonTwister(String item) =>
      facePainterBalloonTwister.add(item);
  void removeFromFacePainterBalloonTwister(String item) =>
      facePainterBalloonTwister.remove(item);
  void removeAtIndexFromFacePainterBalloonTwister(int index) =>
      facePainterBalloonTwister.removeAt(index);
  void insertAtIndexInFacePainterBalloonTwister(int index, String item) =>
      facePainterBalloonTwister.insert(index, item);
  void updateFacePainterBalloonTwisterAtIndex(
          int index, Function(String) updateFn) =>
      facePainterBalloonTwister[index] =
          updateFn(facePainterBalloonTwister[index]);

  List<String> clownCharacters = ['Clown', 'Costumed Characters'];
  void addToClownCharacters(String item) => clownCharacters.add(item);
  void removeFromClownCharacters(String item) => clownCharacters.remove(item);
  void removeAtIndexFromClownCharacters(int index) =>
      clownCharacters.removeAt(index);
  void insertAtIndexInClownCharacters(int index, String item) =>
      clownCharacters.insert(index, item);
  void updateClownCharactersAtIndex(int index, Function(String) updateFn) =>
      clownCharacters[index] = updateFn(clownCharacters[index]);

  List<String> puppetShowStorytelling = ['Puppet Show', 'Storytelling'];
  void addToPuppetShowStorytelling(String item) =>
      puppetShowStorytelling.add(item);
  void removeFromPuppetShowStorytelling(String item) =>
      puppetShowStorytelling.remove(item);
  void removeAtIndexFromPuppetShowStorytelling(int index) =>
      puppetShowStorytelling.removeAt(index);
  void insertAtIndexInPuppetShowStorytelling(int index, String item) =>
      puppetShowStorytelling.insert(index, item);
  void updatePuppetShowStorytellingAtIndex(
          int index, Function(String) updateFn) =>
      puppetShowStorytelling[index] = updateFn(puppetShowStorytelling[index]);

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

  List<String> musicdance = ['Music', 'Dance'];
  void addToMusicdance(String item) => musicdance.add(item);
  void removeFromMusicdance(String item) => musicdance.remove(item);
  void removeAtIndexFromMusicdance(int index) => musicdance.removeAt(index);
  void insertAtIndexInMusicdance(int index, String item) =>
      musicdance.insert(index, item);
  void updateMusicdanceAtIndex(int index, Function(String) updateFn) =>
      musicdance[index] = updateFn(musicdance[index]);

  List<String> photographyVideo = ['Photography', 'Video'];
  void addToPhotographyVideo(String item) => photographyVideo.add(item);
  void removeFromPhotographyVideo(String item) => photographyVideo.remove(item);
  void removeAtIndexFromPhotographyVideo(int index) =>
      photographyVideo.removeAt(index);
  void insertAtIndexInPhotographyVideo(int index, String item) =>
      photographyVideo.insert(index, item);
  void updatePhotographyVideoAtIndex(int index, Function(String) updateFn) =>
      photographyVideo[index] = updateFn(photographyVideo[index]);

  List<String> wedding = ['Bridal Services', 'Photographer', 'Videographer'];
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
