import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_summary_your_meal_time_controller.dart';

class NutritionalGuidanceDetailSummaryYourMealTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailSummaryYourMealTimeController>(
      () => NutritionalGuidanceDetailSummaryYourMealTimeController(),
    );
  }
}
