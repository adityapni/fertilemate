import 'package:get/get.dart';

import '../controllers/health_assessment_sub_category_controller.dart';

class HealthAssessmentSubCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthAssessmentSubCategoryController>(
      () => HealthAssessmentSubCategoryController(),
    );
  }
}
