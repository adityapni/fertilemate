import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';

class ConfirmBookingController extends GetxController {
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

  clickOnContinueButton() {
    Get.toNamed(Routes.NAV_BAR);
  }
}
