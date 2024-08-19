import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_dashboard_controller.dart';

class NutritionalGuidanceDetailDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailDashboardController>(
      () => NutritionalGuidanceDetailDashboardController(),
    );
  }
}
