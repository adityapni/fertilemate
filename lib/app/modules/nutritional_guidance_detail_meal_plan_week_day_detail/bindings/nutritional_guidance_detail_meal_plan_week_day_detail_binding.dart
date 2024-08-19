import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_meal_plan_week_day_detail_controller.dart';

class NutritionalGuidanceDetailMealPlanWeekDayDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailMealPlanWeekDayDetailController>(
      () => NutritionalGuidanceDetailMealPlanWeekDayDetailController(),
    );
  }
}
