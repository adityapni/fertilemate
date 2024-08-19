import 'package:get/get.dart';

import '../controllers/intimacy_management_love_language_sub_category_detail_controller.dart';

class IntimacyManagementLoveLanguageSubCategoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementLoveLanguageSubCategoryDetailController>(
      () => IntimacyManagementLoveLanguageSubCategoryDetailController(),
    );
  }
}
