import 'package:get/get.dart';

import '../controllers/menopause_quiz_assesment_controller.dart';

class MenopauseQuizAssesmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenopauseQuizAssesmentController>(
      () => MenopauseQuizAssesmentController(),
    );
  }
}
