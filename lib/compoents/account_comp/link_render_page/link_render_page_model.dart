import '/compoents/account_comp/html_render_page/html_render_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'link_render_page_widget.dart' show LinkRenderPageWidget;
import 'package:flutter/material.dart';

class LinkRenderPageModel extends FlutterFlowModel<LinkRenderPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for htmlRenderPage component.
  late HtmlRenderPageModel htmlRenderPageModel;

  @override
  void initState(BuildContext context) {
    htmlRenderPageModel = createModel(context, () => HtmlRenderPageModel());
  }

  @override
  void dispose() {
    htmlRenderPageModel.dispose();
  }
}
