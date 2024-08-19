import 'package:fertility_boost/app/modules/nav_bar/controllers/nav_bar_controller.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SpermTestPackageBookingIsConfirmedController extends GetxController {
  final count = 0.obs;

  String bookingId = '';

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

  clickOnViewBookingDetails() {
    selectedIndex.value = 0;
    Get.offNamed(Routes.NAV_BAR);
  }
}
