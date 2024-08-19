import 'package:get/get.dart';

import '../controllers/expert_consultation_coach_profile_controller.dart';

class ExpertConsultationCoachProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpertConsultationCoachProfileController>(
      () => ExpertConsultationCoachProfileController(),
    );
  }
}
