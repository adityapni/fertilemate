import 'package:get/get.dart';

import '../controllers/fertility_specialist_booking_date_controller.dart';

class FertilitySpecialistBookingDateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilitySpecialistBookingDateController>(
      () => FertilitySpecialistBookingDateController(),
    );
  }
}
