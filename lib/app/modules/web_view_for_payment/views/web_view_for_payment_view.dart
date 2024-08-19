import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/web_view_for_payment_controller.dart';

class WebViewForPaymentView extends GetView<WebViewForPaymentController> {
  const WebViewForPaymentView({super.key});

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
