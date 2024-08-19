import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HealthcareProviderChatController extends GetxController {
  //TODO: Implement HealthcareProviderChatController

  final count = 0.obs;

  TextEditingController textController = TextEditingController();
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

  void ClickOnStartCall() {
    Get.toNamed(Routes.TEL_DOC_SCEDULE_CALL) ;
  }
}
