import 'package:get/get.dart';

import '../controllers/ask_questions_controller.dart';

class AskQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AskQuestionsController>(
      () => AskQuestionsController(),
    );
  }
}
