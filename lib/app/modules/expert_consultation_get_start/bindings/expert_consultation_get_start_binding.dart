import 'package:get/get.dart';

import '../controllers/expert_consultation_get_start_controller.dart';

class ExpertConsultationGetStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpertConsultationGetStartController>(
      () => ExpertConsultationGetStartController(),
    );
  }
}
