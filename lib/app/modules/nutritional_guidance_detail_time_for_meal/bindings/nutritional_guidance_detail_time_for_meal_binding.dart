import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_time_for_meal_controller.dart';

class NutritionalGuidanceDetailTimeForMealBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailTimeForMealController>(
      () => NutritionalGuidanceDetailTimeForMealController(),
    );
  }
}
