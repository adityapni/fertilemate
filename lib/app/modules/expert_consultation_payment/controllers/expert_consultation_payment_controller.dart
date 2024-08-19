import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ExpertConsultationPaymentController extends GetxController {
  //TODO: Implement ExpertConsultationPaymentController

  final count = 0.obs;
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

  clickOnProceedToPaymentButton() {
    Get.toNamed(Routes.EXPERT_CONSULTATION_SUCCESS);
  }

  clickOnRemoveIcon() {}

  clickOnAddIcon() {}
}
