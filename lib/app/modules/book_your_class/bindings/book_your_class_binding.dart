import 'package:get/get.dart';

import '../controllers/book_your_class_controller.dart';

class BookYourClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookYourClassController>(
      () => BookYourClassController(),
    );
  }
}
