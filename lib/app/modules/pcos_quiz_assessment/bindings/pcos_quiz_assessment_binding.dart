import 'package:get/get.dart';

import '../controllers/pcos_quiz_assessment_controller.dart';

class PcosQuizAssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PcosQuizAssessmentController>(
      () => PcosQuizAssessmentController(),
    );
  }
}
