import 'package:get/get.dart';

import '../controllers/book_order_controller.dart';

class BookOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookOrderController>(
      () => BookOrderController(),
    );
  }
}
