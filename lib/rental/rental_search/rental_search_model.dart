import '/compoents/rental_comp/rental_search_comp/rental_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'rental_search_widget.dart' show RentalSearchWidget;
import 'package:flutter/material.dart';

class RentalSearchModel extends FlutterFlowModel<RentalSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RentalSearchComp component.
  late RentalSearchCompModel rentalSearchCompModel;

  @override
  void initState(BuildContext context) {
    rentalSearchCompModel = createModel(context, () => RentalSearchCompModel());
  }

  @override
  void dispose() {
    rentalSearchCompModel.dispose();
  }
}
