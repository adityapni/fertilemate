import 'package:get/get.dart';

import '../controllers/intimacy_management_insights_controller.dart';

class IntimacyManagementInsightsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementInsightsController>(
      () => IntimacyManagementInsightsController(),
    );
  }
}
