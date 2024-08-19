import 'package:get/get.dart';

import '../controllers/sperm_test_package_payment_controller.dart';

class SpermTestPackagePaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpermTestPackagePaymentController>(
      () => SpermTestPackagePaymentController(),
    );
  }
}
