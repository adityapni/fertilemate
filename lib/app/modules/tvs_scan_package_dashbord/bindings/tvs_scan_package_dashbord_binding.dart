import 'package:get/get.dart';

import '../controllers/tvs_scan_package_dashbord_controller.dart';

class TvsScanPackageDashbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvsScanPackageDashbordController>(
      () => TvsScanPackageDashbordController(),
    );
  }
}
