import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FertilitySpecialistPaymentController extends GetxController {
  final count = 0.obs;

  final hideCvv = false.obs;

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

  clickOnSubmitPaymentButton() {
    Get.toNamed(Routes.FERTILITY_SPECIALIST_CONFIRM_BOOKING);
  }

  clickOnEyeButton() {}
}
