import 'package:get/get.dart';

import '../../../data/apis/api_models/love_sub_language_get_love_sub_language_model.dart';

class IntimacyManagementLoveLanguageSubCategoryDetailController
    extends GetxController {
  final arguments = Get.arguments;
  LoveSubLanguageGetLoveSubLanguageResult? result;
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
