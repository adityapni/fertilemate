import 'package:get/get.dart';

import '../controllers/sperm_test_package_nearby_clinics_controller.dart';

class SpermTestPackageNearbyClinicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpermTestPackageNearbyClinicsController>(
      () => SpermTestPackageNearbyClinicsController(),
    );
  }
}
