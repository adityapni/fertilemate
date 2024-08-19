import 'package:get/get.dart';

import '../controllers/tvs_scan_package_detail_controller.dart';

class TvsScanPackageDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvsScanPackageDetailController>(
      () => TvsScanPackageDetailController(),
    );
  }
}
