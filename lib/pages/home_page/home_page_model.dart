import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? venueSearchText;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - determinePosition] action in HomePage widget.
  LatLng? currentPosition;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for VenueSearchTextWiget widget.
  FocusNode? venueSearchTextWigetFocusNode;
  TextEditingController? venueSearchTextWigetTextController;
  String? Function(BuildContext, String?)?
      venueSearchTextWigetTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    venueSearchTextWigetFocusNode?.dispose();
    venueSearchTextWigetTextController?.dispose();
  }
}
