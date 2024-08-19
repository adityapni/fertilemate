import 'package:get/get.dart';

import '../controllers/trainer_net_manage_appointments_controller.dart';

class TrainerNetManageAppointmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainerNetManageAppointmentsController>(
      () => TrainerNetManageAppointmentsController(),
    );
  }
}
