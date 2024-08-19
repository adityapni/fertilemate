import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/constants/string_constants.dart';

class ExpertConsultationWellComeController extends GetxController {
  final count = 0.obs;
  SharedPreferences? sharedPreferences;

  final expertConsultation = ''.obs;

  @override
  Future<void> onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    expertConsultation.value = sharedPreferences
            ?.getString(StringConstants.expertConsultation) ??
        '';
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

  clickOnNextNow() {
    Get.toNamed(Routes.EXPERT_CONSULTATION_DASHBOARD);
  }
}
