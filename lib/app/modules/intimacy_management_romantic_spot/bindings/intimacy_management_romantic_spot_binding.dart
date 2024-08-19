import 'package:get/get.dart';

import '../controllers/intimacy_management_romantic_spot_controller.dart';

class IntimacyManagementRomanticSpotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementRomanticSpotController>(
      () => IntimacyManagementRomanticSpotController(),
    );
  }
}
