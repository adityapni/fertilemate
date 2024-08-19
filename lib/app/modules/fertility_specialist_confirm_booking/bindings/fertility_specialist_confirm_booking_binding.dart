import 'package:get/get.dart';

import '../controllers/fertility_specialist_confirm_booking_controller.dart';

class FertilitySpecialistConfirmBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilitySpecialistConfirmBookingController>(
      () => FertilitySpecialistConfirmBookingController(),
    );
  }
}
