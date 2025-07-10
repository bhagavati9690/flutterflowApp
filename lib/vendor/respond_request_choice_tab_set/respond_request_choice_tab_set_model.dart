import '/backend/api_requests/api_calls.dart';
import '/compoents/common_comp/timer_picker_comp/timer_picker_comp_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'respond_request_choice_tab_set_widget.dart'
    show RespondRequestChoiceTabSetWidget;
import 'package:flutter/material.dart';

class RespondRequestChoiceTabSetModel
    extends FlutterFlowModel<RespondRequestChoiceTabSetWidget> {
  ///  Local state fields for this page.

  String? ocKey;

  bool apiLoaded = false;

  String? paymentDate;

  String? suggestPaymentDate;

  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (vendorRespondCursor)] action in respondRequestChoiceTabSet widget.
  ApiCallResponse? vendorResponseCursro;
  // Stores action output result for [Backend Call - API (enVendorAdvancePaymentType)] action in respondRequestChoiceTabSet widget.
  ApiCallResponse? enVendorAdvPayType;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for acceptComments widget.
  FocusNode? acceptCommentsFocusNode;
  TextEditingController? acceptCommentsTextController;
  String? Function(BuildContext, String?)?
      acceptCommentsTextControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue1;
  // Stores action output result for [Backend Call - API (respondAcceptDaysWithinChanged)] action in CountController widget.
  ApiCallResponse? acceptPaymentDaysChanged;
  // State field(s) for acceptPaymentType widget.
  String? acceptPaymentTypeValue;
  FormFieldController<String>? acceptPaymentTypeValueController;
  // Stores action output result for [Backend Call - API (respondSubmitAction)] action in Button widget.
  ApiCallResponse? acceptSubmitAction;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Model for TimerPickerComp component.
  late TimerPickerCompModel timerPickerCompModel1;
  // Model for TimerPickerComp component.
  late TimerPickerCompModel timerPickerCompModel2;
  // State field(s) for suggestPriceTxtField widget.
  FocusNode? suggestPriceTxtFieldFocusNode;
  TextEditingController? suggestPriceTxtFieldTextController;
  String? Function(BuildContext, String?)?
      suggestPriceTxtFieldTextControllerValidator;
  // State field(s) for suggestComments widget.
  FocusNode? suggestCommentsFocusNode;
  TextEditingController? suggestCommentsTextController;
  String? Function(BuildContext, String?)?
      suggestCommentsTextControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // Stores action output result for [Backend Call - API (respondSuggestDaysWithinChanged)] action in CountController widget.
  ApiCallResponse? suggestDayPaymentChanged;
  // State field(s) for suggestPaymentType widget.
  String? suggestPaymentTypeValue;
  FormFieldController<String>? suggestPaymentTypeValueController;
  // Stores action output result for [Backend Call - API (respondSuggestSubmitAction)] action in Button widget.
  ApiCallResponse? suggestSubmitActionResponse;
  // State field(s) for rejectComments widget.
  FocusNode? rejectCommentsFocusNode;
  TextEditingController? rejectCommentsTextController;
  String? Function(BuildContext, String?)?
      rejectCommentsTextControllerValidator;
  // Stores action output result for [Backend Call - API (respondSubmitAction)] action in Button widget.
  ApiCallResponse? rejectSubmitAction;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    timerPickerCompModel1 = createModel(context, () => TimerPickerCompModel());
    timerPickerCompModel2 = createModel(context, () => TimerPickerCompModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    acceptCommentsFocusNode?.dispose();
    acceptCommentsTextController?.dispose();

    timerPickerCompModel1.dispose();
    timerPickerCompModel2.dispose();
    suggestPriceTxtFieldFocusNode?.dispose();
    suggestPriceTxtFieldTextController?.dispose();

    suggestCommentsFocusNode?.dispose();
    suggestCommentsTextController?.dispose();

    rejectCommentsFocusNode?.dispose();
    rejectCommentsTextController?.dispose();
  }

  /// Action blocks.
  Future acceptValidationBlock(BuildContext context) async {}
}
