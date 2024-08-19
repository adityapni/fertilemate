import 'package:get/get.dart';

import '../controllers/prediabetes_quiz_assesment_controller.dart';

class PrediabetesQuizAssesmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrediabetesQuizAssesmentController>(
      () => PrediabetesQuizAssesmentController(),
    );
  }
}
