import 'package:get/get.dart';

import '../controllers/intimacy_management_love_language_sub_category_controller.dart';

class IntimacyManagementLoveLanguageSubCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementLoveLanguageSubCategoryController>(
      () => IntimacyManagementLoveLanguageSubCategoryController(),
    );
  }
}
