import 'package:get/get.dart';

import '../controllers/book_well_come_controller.dart';

class BookWellComeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookWellComeController>(
      () => BookWellComeController(),
    );
  }
}
