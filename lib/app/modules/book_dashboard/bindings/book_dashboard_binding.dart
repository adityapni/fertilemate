import 'package:get/get.dart';

import '../controllers/book_dashboard_controller.dart';

class BookDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookDashboardController>(
      () => BookDashboardController(),
    );
  }
}
