import '/compoents/account_comp/guest_account_compoent/guest_account_compoent_widget.dart';
import '/compoents/account_comp/user_my_account_comp/user_my_account_comp_widget.dart';
import '/compoents/account_comp/vendor_my_account_comp/vendor_my_account_comp_widget.dart';
import '/compoents/common_comp/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_account_model.dart';
export 'my_account_model.dart';

class MyAccountWidget extends StatefulWidget {
  const MyAccountWidget({super.key});

  static String routeName = 'myAccount';
  static String routePath = 'myAccount';

  @override
  State<MyAccountWidget> createState() => _MyAccountWidgetState();
}

class _MyAccountWidgetState extends State<MyAccountWidget> {
  late MyAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyAccountModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FFAppState().userType == 'vendor'
              ? FFAppConstants.vendorPrimaryColor
              : FFAppConstants.consumerPrimaryColor,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).clbxBlack,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.goNamed(HomePageWidget.routeName);
                },
              ),
            ].divide(SizedBox(width: 5.0)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                if (!FFAppState().IsLoggedInUser)
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: wrapWithModel(
                      model: _model.guestAccountCompoentModel,
                      updateCallback: () => safeSetState(() {}),
                      child: GuestAccountCompoentWidget(),
                    ),
                  ),
                if (FFAppState().IsLoggedInUser &&
                    (FFAppState().userType != 'vendor'))
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: wrapWithModel(
                      model: _model.userMyAccountCompModel,
                      updateCallback: () => safeSetState(() {}),
                      child: UserMyAccountCompWidget(),
                    ),
                  ),
                if (FFAppState().IsLoggedInUser &&
                    (FFAppState().userType == 'vendor'))
                  wrapWithModel(
                    model: _model.vendorMyAccountCompModel,
                    updateCallback: () => safeSetState(() {}),
                    child: VendorMyAccountCompWidget(),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarWidget(
                      activePage: 'Account',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
