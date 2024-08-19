import 'package:get/get.dart';

import '../controllers/sperm_test_package_nearby_clinics_detail_controller.dart';

class SpermTestPackageNearbyClinicsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpermTestPackageNearbyClinicsDetailController>(
      () => SpermTestPackageNearbyClinicsDetailController(),
    );
  }
}
