import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class BookCartController extends GetxController {
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

  clickOnRemoveIcon({required int index}) {}

  clickOnAddIcon({required int index}) {}

  clickOnCheckOutButton() {
    Get.toNamed(Routes.BOOK_ORDER);
  }
}
