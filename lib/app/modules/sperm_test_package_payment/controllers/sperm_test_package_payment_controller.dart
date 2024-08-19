import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:get/get.dart';

class SpermTestPackagePaymentController extends GetxController {
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

  clickOnEyeButton() {}

  clickOnPayNowButton() {
    CommonWidgets.showAlertDialogWithOk(title: 'Alert',content: 'Payment method '
        'integrate soon .',onPressedYes:(){
      Get.toNamed(Routes.SPERM_TEST_PACKAGE_BOOKING_IS_CONFIRMED);
    } );

  }

  clickOnRemoveIcon() {}

  clickOnAddIcon() {}
}
