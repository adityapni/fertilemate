import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_dashboard_detail_controller.dart';

class NutritionalGuidanceDetailDashboardDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailDashboardDetailController>(
      () => NutritionalGuidanceDetailDashboardDetailController(),
    );
  }
}
