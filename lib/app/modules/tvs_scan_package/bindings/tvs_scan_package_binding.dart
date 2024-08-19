import 'package:get/get.dart';

import '../controllers/tvs_scan_package_controller.dart';

class TvsScanPackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvsScanPackageController>(
      () => TvsScanPackageController(),
    );
  }
}
