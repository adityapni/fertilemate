import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/pdf_ebook_controller.dart';

class PdfEbookView extends GetView<PdfEbookController> {
  const PdfEbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(),
      body: controller.webViewController != null
          ? WebViewWidget(controller: controller.webViewController!)
          : SizedBox(),
    );
  }
}
