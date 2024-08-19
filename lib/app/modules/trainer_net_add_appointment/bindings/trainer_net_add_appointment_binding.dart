import 'package:get/get.dart';

import '../controllers/trainer_net_add_appointment_controller.dart';

class TrainerNetAddAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainerNetAddAppointmentController>(
      () => TrainerNetAddAppointmentController(),
    );
  }
}
