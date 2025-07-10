import '/backend/schema/structs/index.dart';
import '/compoents/account_comp/login_comp_with_guest/login_comp_with_guest_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'anonymous_login_guest_u_i_model.dart';
export 'anonymous_login_guest_u_i_model.dart';

/// This is pop ui that appears which has login options on left hand side and
/// guest ui login on right side
class AnonymousLoginGuestUIWidget extends StatefulWidget {
  const AnonymousLoginGuestUIWidget({
    super.key,
    this.params,
    this.recordKey,
    this.type,
    this.packageId,
    this.spaceId,
    this.denominatorId,
    this.resourceItemId,
    this.resourceItemType,
    this.quantity,
    bool? customCake,
  }) : this.customCake = customCake ?? false;

  final List<NameIdSearchableStruct>? params;
  final String? recordKey;
  final String? type;
  final String? packageId;
  final String? spaceId;
  final bool? denominatorId;
  final String? resourceItemId;
  final String? resourceItemType;
  final String? quantity;
  final bool customCake;

  static String routeName = 'anonymousLoginGuestUI';
  static String routePath = 'anonymousLoginGuestUI';

  @override
  State<AnonymousLoginGuestUIWidget> createState() =>
      _AnonymousLoginGuestUIWidgetState();
}

class _AnonymousLoginGuestUIWidgetState
    extends State<AnonymousLoginGuestUIWidget> {
  late AnonymousLoginGuestUIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnonymousLoginGuestUIModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: wrapWithModel(
          model: _model.loginCompWithGuestModel,
          updateCallback: () => safeSetState(() {}),
          child: LoginCompWithGuestWidget(
            actionOnLogin: 'AddToCart',
            nextUI: widget.params
                ?.where((e) => e.id == 'nextUI')
                .toList()
                .firstOrNull
                ?.name,
            recordKey: widget.params
                ?.where((e) => e.id == 'recordKey')
                .toList()
                .firstOrNull
                ?.name,
            resourceIds: widget.params
                ?.where((e) => e.id == 'parentRecordKey')
                .toList()
                .firstOrNull
                ?.name,
            resourceItemId: widget.params
                ?.where((e) => e.id == 'recordKey')
                .toList()
                .firstOrNull
                ?.name,
            firstTab: widget.params
                ?.where((e) => e.id == 'firstTab')
                .toList()
                .firstOrNull
                ?.name,
            type: widget.params
                ?.where((e) => e.id == 'type')
                .toList()
                .firstOrNull
                ?.name,
            resourceType: widget.params
                ?.where((e) => e.id == 'resourceType')
                .toList()
                .firstOrNull
                ?.name,
            dtRecordKey: widget.recordKey,
            dtType: widget.type,
            dtPackageId: widget.packageId,
            dtSpaceId: widget.spaceId,
            dtDenominatorId: widget.denominatorId,
            dtResourceItemIds: widget.resourceItemId,
            dtResourceItemType: widget.resourceItemType,
            dtQuantity: widget.quantity,
            customCake: widget.customCake,
          ),
        ),
      ),
    );
  }
}
