import 'package:get/get.dart';

import '../controllers/expert_consultation_success_controller.dart';

class ExpertConsultationSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpertConsultationSuccessController>(
      () => ExpertConsultationSuccessController(),
    );
  }
}
