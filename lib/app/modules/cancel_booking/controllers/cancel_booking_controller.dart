import 'package:fertility_boost/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class CancelBookingController extends GetxController {
  //TODO: Implement CancelBookingController

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
