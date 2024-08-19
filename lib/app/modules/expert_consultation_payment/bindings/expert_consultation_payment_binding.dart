import 'package:get/get.dart';

import '../controllers/expert_consultation_payment_controller.dart';

class ExpertConsultationPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpertConsultationPaymentController>(
      () => ExpertConsultationPaymentController(),
    );
  }
}
