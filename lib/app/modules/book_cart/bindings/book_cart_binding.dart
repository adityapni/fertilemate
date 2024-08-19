import 'package:get/get.dart';

import '../controllers/book_cart_controller.dart';

class BookCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookCartController>(
      () => BookCartController(),
    );
  }
}
