import 'package:get/get.dart';

import '../controllers/expert_consultation_discover_controller.dart';

class ExpertConsultationDiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpertConsultationDiscoverController>(
      () => ExpertConsultationDiscoverController(),
    );
  }
}
