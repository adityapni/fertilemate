import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class NutritionalGuidanceDetailMealPlanWeeksController extends GetxController {
  final count = 0.obs;

  var listOfData = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnButton() {
    Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_MEAL_PLAN_WEEK_DAY_DETAIL);
  }
}
