import 'package:get/get.dart';

import '../controllers/web_view_for_pdf_controller.dart';

class WebViewForPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewForPdfController>(
      () => WebViewForPdfController(),
    );
  }
}
