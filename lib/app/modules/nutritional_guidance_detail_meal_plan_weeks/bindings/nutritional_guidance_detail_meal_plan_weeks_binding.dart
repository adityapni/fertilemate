import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_meal_plan_weeks_controller.dart';

class NutritionalGuidanceDetailMealPlanWeeksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailMealPlanWeeksController>(
      () => NutritionalGuidanceDetailMealPlanWeeksController(),
    );
  }
}
