import 'package:get/get.dart';

import '../controllers/nutritional_guidance_quiz_controller.dart';

class NutritionalGuidanceQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceQuizController>(
      () => NutritionalGuidanceQuizController(),
    );
  }
}
