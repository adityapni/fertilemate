import 'package:get/get.dart';

import '../controllers/expert_consultation_well_come_controller.dart';

class ExpertConsultationWellComeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpertConsultationWellComeController>(
      () => ExpertConsultationWellComeController(),
    );
  }
}
