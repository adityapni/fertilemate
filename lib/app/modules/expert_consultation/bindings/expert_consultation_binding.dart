import 'package:get/get.dart';

import '../controllers/expert_consultation_controller.dart';

class ExpertConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpertConsultationController>(
      () => ExpertConsultationController(),
    );
  }
}
