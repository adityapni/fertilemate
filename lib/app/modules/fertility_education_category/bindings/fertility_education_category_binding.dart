import 'package:get/get.dart';

import '../controllers/fertility_education_category_controller.dart';

class FertilityEducationCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationCategoryController>(
      () => FertilityEducationCategoryController(),
    );
  }
}
