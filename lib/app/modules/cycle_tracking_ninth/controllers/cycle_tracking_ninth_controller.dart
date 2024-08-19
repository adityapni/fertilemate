import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/time_picker_view.dart';
import '../../../routes/app_pages.dart';

class CycleTrackingNinthController extends GetxController {

  final count = 0.obs;

  final inAsyncCall = false.obs;

  final selectedTime = '00 : 00 PM'.obs;
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
    Get.toNamed(Routes.CYCLE_TRACKING_TENTH);
  }

  clickOnTime() async {
    TimeOfDay? picked = await TimePickerView().timePickerView(color: Theme.of(Get.context!).primaryColor);
    if(picked!=null)
    {
      selectedTime.value = picked.format(Get.context!);
    }
  }
}
