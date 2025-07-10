import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/account_comp/guest_comp/guest_comp_widget.dart';
import '/compoents/account_comp/request_for_event_comp/request_for_event_comp_widget.dart';
import '/compoents/common_comp/description_comp/description_comp_widget.dart';
import '/compoents/common_comp/error_page_view_compoent/error_page_view_compoent_widget.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_events_widget.dart' show MyEventsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MyEventsModel extends FlutterFlowModel<MyEventsWidget> {
  ///  Local state fields for this page.

  DateTime? date;

  bool isRequestLoaded = false;

  dynamic requestData;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (nearestUpcoming Event)] action in myEvents widget.
  ApiCallResponse? apiResulNearestUpcoming;
  // Stores action output result for [Backend Call - API (guestList)] action in myEvents widget.
  ApiCallResponse? guestListOutput;
  // Stores action output result for [Backend Call - API (activeRequestItem)] action in myEvents widget.
  ApiCallResponse? activeRequestOutput;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (deleteEvents)] action in IconButton widget.
  ApiCallResponse? apiResultDeleteEvent;
  // Model for DescriptionComp component.
  late DescriptionCompModel descriptionCompModel;
  // Model for errorPageViewCompoent component.
  late ErrorPageViewCompoentModel errorPageViewCompoentModel1;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? guestTypeSelected;
  // Stores action output result for [Custom Action - getAllContacts] action in Button widget.
  List<ContactStruct>? allContacts;
  // Models for GuestComp dynamic component.
  late FlutterFlowDynamicModels<GuestCompModel> guestCompModels;
  // Model for errorPageViewCompoent component.
  late ErrorPageViewCompoentModel errorPageViewCompoentModel2;
  // Model for errorPageViewCompoent component.
  late ErrorPageViewCompoentModel errorPageViewCompoentModel3;
  // State field(s) for PackageExpandable widget.
  late ExpandableController packageExpandableExpandableController;

  // Models for requestForEventComp dynamic component.
  late FlutterFlowDynamicModels<RequestForEventCompModel>
      requestForEventCompModels1;
  // State field(s) for HallExpandable widget.
  late ExpandableController hallExpandableExpandableController;

  // Models for requestForEventComp dynamic component.
  late FlutterFlowDynamicModels<RequestForEventCompModel>
      requestForEventCompModels2;
  // State field(s) for RentalExpandable widget.
  late ExpandableController rentalExpandableExpandableController;

  // Models for requestForEventComp dynamic component.
  late FlutterFlowDynamicModels<RequestForEventCompModel>
      requestForEventCompModels3;
  // State field(s) for ServiceExpandable widget.
  late ExpandableController serviceExpandableExpandableController;

  // Models for requestForEventComp dynamic component.
  late FlutterFlowDynamicModels<RequestForEventCompModel>
      requestForEventCompModels4;
  // State field(s) for CakeExpandable widget.
  late ExpandableController cakeExpandableExpandableController;

  // Models for requestForEventComp dynamic component.
  late FlutterFlowDynamicModels<RequestForEventCompModel>
      requestForEventCompModels5;
  // State field(s) for FoodExpandable widget.
  late ExpandableController foodExpandableExpandableController;

  // Models for requestForEventComp dynamic component.
  late FlutterFlowDynamicModels<RequestForEventCompModel>
      requestForEventCompModels6;
  // State field(s) for ActivityExpandable widget.
  late ExpandableController activityExpandableExpandableController;

  // Models for requestForEventComp dynamic component.
  late FlutterFlowDynamicModels<RequestForEventCompModel>
      requestForEventCompModels7;
  // State field(s) for ProductExpandable widget.
  late ExpandableController productExpandableExpandableController;

  // Models for requestForEventComp dynamic component.
  late FlutterFlowDynamicModels<RequestForEventCompModel>
      requestForEventCompModels8;
  // Model for errorPageViewCompoent component.
  late ErrorPageViewCompoentModel errorPageViewCompoentModel4;
  // Model for errorPageViewCompoent component.
  late ErrorPageViewCompoentModel errorPageViewCompoentModel5;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    descriptionCompModel = createModel(context, () => DescriptionCompModel());
    errorPageViewCompoentModel1 =
        createModel(context, () => ErrorPageViewCompoentModel());
    guestCompModels = FlutterFlowDynamicModels(() => GuestCompModel());
    errorPageViewCompoentModel2 =
        createModel(context, () => ErrorPageViewCompoentModel());
    errorPageViewCompoentModel3 =
        createModel(context, () => ErrorPageViewCompoentModel());
    requestForEventCompModels1 =
        FlutterFlowDynamicModels(() => RequestForEventCompModel());
    requestForEventCompModels2 =
        FlutterFlowDynamicModels(() => RequestForEventCompModel());
    requestForEventCompModels3 =
        FlutterFlowDynamicModels(() => RequestForEventCompModel());
    requestForEventCompModels4 =
        FlutterFlowDynamicModels(() => RequestForEventCompModel());
    requestForEventCompModels5 =
        FlutterFlowDynamicModels(() => RequestForEventCompModel());
    requestForEventCompModels6 =
        FlutterFlowDynamicModels(() => RequestForEventCompModel());
    requestForEventCompModels7 =
        FlutterFlowDynamicModels(() => RequestForEventCompModel());
    requestForEventCompModels8 =
        FlutterFlowDynamicModels(() => RequestForEventCompModel());
    errorPageViewCompoentModel4 =
        createModel(context, () => ErrorPageViewCompoentModel());
    errorPageViewCompoentModel5 =
        createModel(context, () => ErrorPageViewCompoentModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    descriptionCompModel.dispose();
    errorPageViewCompoentModel1.dispose();
    guestCompModels.dispose();
    errorPageViewCompoentModel2.dispose();
    errorPageViewCompoentModel3.dispose();
    packageExpandableExpandableController.dispose();
    requestForEventCompModels1.dispose();
    hallExpandableExpandableController.dispose();
    requestForEventCompModels2.dispose();
    rentalExpandableExpandableController.dispose();
    requestForEventCompModels3.dispose();
    serviceExpandableExpandableController.dispose();
    requestForEventCompModels4.dispose();
    cakeExpandableExpandableController.dispose();
    requestForEventCompModels5.dispose();
    foodExpandableExpandableController.dispose();
    requestForEventCompModels6.dispose();
    activityExpandableExpandableController.dispose();
    requestForEventCompModels7.dispose();
    productExpandableExpandableController.dispose();
    requestForEventCompModels8.dispose();
    errorPageViewCompoentModel4.dispose();
    errorPageViewCompoentModel5.dispose();
    navBarModel.dispose();
  }
}
