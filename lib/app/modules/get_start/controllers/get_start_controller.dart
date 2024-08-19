import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class GetStartController extends GetxController {
  //TODO: Implement GetStartController

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

  clickOnUserButton() {
    Get.toNamed(Routes.LOGIN);
  }

  clickOnPartnerButton() {
    Get.toNamed(Routes.PRT_NAV_BAR);


  }
}
