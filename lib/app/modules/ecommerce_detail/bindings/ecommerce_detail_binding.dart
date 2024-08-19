import 'package:get/get.dart';

import '../controllers/ecommerce_detail_controller.dart';

class EcommerceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EcommerceDetailController>(
      () => EcommerceDetailController(),
    );
  }
}
