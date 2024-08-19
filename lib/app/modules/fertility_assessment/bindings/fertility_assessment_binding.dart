import 'package:get/get.dart';

import '../controllers/fertility_assessment_controller.dart';

class FertilityAssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityAssessmentController>(
      () => FertilityAssessmentController(),
    );
  }
}
