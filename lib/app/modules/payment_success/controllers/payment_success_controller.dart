import 'package:fertility_boost/app/modules/nav_bar/controllers/nav_bar_controller.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PaymentSuccessController extends GetxController {

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

  clickOnBackToHomeButton() {
    selectedIndex.value = 0;
    Get.back();
    // Get.offAllNamed(Routes.NAV_BAR);
  }
}
