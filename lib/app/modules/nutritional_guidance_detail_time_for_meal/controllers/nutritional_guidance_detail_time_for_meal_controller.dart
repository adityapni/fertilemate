import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class NutritionalGuidanceDetailTimeForMealController extends GetxController {
  final count = 0.obs;

  List listOfData = [
    {'title': 'Breakfast', 'dis': '08.00 a.m.'},
    {'title': 'Lunch', 'dis': '01.00 p.m.'},
    {'title': 'Dinner', 'dis': '08.00 p.m.'},
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

  clickOnSummaryButton() {
    Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_SUMMARY_YOUR_MEAL_TIME);
  }

  clickOnEditButton() {}

  clickOnSetReminderButton() {
  }
}
