import 'package:get/get.dart';

import '../controllers/book_favorites_controller.dart';

class BookFavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookFavoritesController>(
      () => BookFavoritesController(),
    );
  }
}
