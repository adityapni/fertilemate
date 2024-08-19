import 'package:get/get.dart';

import '../controllers/intimacy_management_romantic_spot_detail_controller.dart';

class IntimacyManagementRomanticSpotDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementRomanticSpotDetailController>(
      () => IntimacyManagementRomanticSpotDetailController(),
    );
  }
}
