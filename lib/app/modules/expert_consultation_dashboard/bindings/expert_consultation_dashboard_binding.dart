import 'package:get/get.dart';

import '../controllers/expert_consultation_dashboard_controller.dart';

class ExpertConsultationDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpertConsultationDashboardController>(
      () => ExpertConsultationDashboardController(),
    );
  }
}
