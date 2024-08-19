import 'package:get/get.dart';

import '../controllers/quiz_assesment_controller.dart';

class QuizAssesmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizAssesmentController>(
      () => QuizAssesmentController(),
    );
  }
}
