import 'package:get/get.dart';

import '../controllers/web_view_for_payment_controller.dart';

class WebViewForPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewForPaymentController>(
      () => WebViewForPaymentController(),
    );
  }
}
