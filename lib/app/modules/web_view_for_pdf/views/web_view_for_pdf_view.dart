import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/web_view_for_pdf_controller.dart';

class WebViewForPdfView extends GetView<WebViewForPdfController> {
  const WebViewForPdfView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: WebViewWidget(
            controller: controller.webController,
          ),
        ),
      );
    });
  }
}
