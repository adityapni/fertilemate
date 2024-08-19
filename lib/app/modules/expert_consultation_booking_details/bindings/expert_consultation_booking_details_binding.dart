import 'package:get/get.dart';

import '../controllers/expert_consultation_booking_details_controller.dart';

class ExpertConsultationBookingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpertConsultationBookingDetailsController>(
      () => ExpertConsultationBookingDetailsController(),
    );
  }
}
