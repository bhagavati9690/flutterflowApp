import '/compoents/common_comp/description_bottom_sheet_web_view/description_bottom_sheet_web_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future openDescriptionWidget(
  BuildContext context, {
  required String? input,
}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    enableDrag: false,
    context: context,
    builder: (context) {
      return WebViewAware(
        child: Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: DescriptionBottomSheetWebViewWidget(
            input: input!,
          ),
        ),
      );
    },
  );
}
