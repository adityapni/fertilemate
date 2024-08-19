import 'package:get/get.dart';

import '../controllers/pdf_ebook_controller.dart';

class PdfEbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfEbookController>(
      () => PdfEbookController(),
    );
  }
}
