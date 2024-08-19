import 'package:get/get.dart';

import '../controllers/sperm_test_package_controller.dart';

class SpermTestPackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpermTestPackageController>(
      () => SpermTestPackageController(),
    );
  }
}
