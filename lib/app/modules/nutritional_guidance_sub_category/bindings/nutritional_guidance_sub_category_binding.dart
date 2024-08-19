import 'package:get/get.dart';

import '../controllers/nutritional_guidance_sub_category_controller.dart';

class NutritionalGuidanceSubCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceSubCategoryController>(
      () => NutritionalGuidanceSubCategoryController(),
    );
  }
}
