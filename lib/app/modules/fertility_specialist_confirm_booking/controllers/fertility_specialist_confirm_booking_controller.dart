import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FertilitySpecialistConfirmBookingController extends GetxController {

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

  clickOnDoneButton() {
    Get.toNamed(Routes.NAV_BAR);
  }
}
