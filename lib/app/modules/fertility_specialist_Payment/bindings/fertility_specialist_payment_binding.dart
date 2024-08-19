import 'package:get/get.dart';

import '../controllers/fertility_specialist_payment_controller.dart';

class FertilitySpecialistPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilitySpecialistPaymentController>(
      () => FertilitySpecialistPaymentController(),
    );
  }
}
