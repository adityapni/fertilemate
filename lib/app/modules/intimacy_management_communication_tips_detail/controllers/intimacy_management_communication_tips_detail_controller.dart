import 'package:fertility_boost/app/data/apis/api_models/sleep_management_intimacy_management_get_intimacy_management_categories_blogs_model.dart';
import 'package:get/get.dart';

class IntimacyManagementCommunicationTipsDetailController
    extends GetxController {
  final arguments = Get.arguments;
  Result? result;
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
