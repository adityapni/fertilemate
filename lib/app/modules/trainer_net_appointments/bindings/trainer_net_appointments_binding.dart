import 'package:get/get.dart';

import '../controllers/trainer_net_appointments_controller.dart';

class TrainerNetAppointmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainerNetAppointmentsController>(
      () => TrainerNetAppointmentsController(),
    );
  }
}
