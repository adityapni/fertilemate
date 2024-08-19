import 'package:get/get.dart';

import '../controllers/health_assessment_controller.dart';

class HealthAssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthAssessmentController>(
      () => HealthAssessmentController(),
    );
  }
}
