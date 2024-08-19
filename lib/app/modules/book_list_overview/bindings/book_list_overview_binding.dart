import 'package:get/get.dart';

import '../controllers/book_list_overview_controller.dart';

class BookListOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookListOverviewController>(
      () => BookListOverviewController(),
    );
  }
}
