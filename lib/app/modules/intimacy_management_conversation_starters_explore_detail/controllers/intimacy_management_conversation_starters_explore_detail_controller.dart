import 'package:get/get.dart';

import '../../../data/apis/api_models/get_intimacy_sub_category_model.dart';

class IntimacyManagementConversationStartersExploreDetailController
    extends GetxController {
  final arguments = Get.arguments;
  GetIntimacySubCategoryResult? result;
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
