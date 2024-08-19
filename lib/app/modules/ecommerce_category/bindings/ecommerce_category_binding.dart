import 'package:get/get.dart';

import '../controllers/ecommerce_category_controller.dart';

class EcommerceCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EcommerceCategoryController>(
      () => EcommerceCategoryController(),
    );
  }
}
