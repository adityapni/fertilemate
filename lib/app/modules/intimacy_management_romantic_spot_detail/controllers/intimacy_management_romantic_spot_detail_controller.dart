import 'package:get/get.dart';

import '../../../data/apis/api_models/romantic_pot_get_romantic_spot_model.dart';

class IntimacyManagementRomanticSpotDetailController extends GetxController {
  final arguments = Get.arguments;
  RomanticSpotGetRomanticSpotResult? result;
  final count = 0.obs;
  @override
  void onInit() {
    result = arguments ?? '';
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
}
