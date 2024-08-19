import 'package:get/get.dart';

import '../controllers/trainer_net_home_controller.dart';

class TrainerNetHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainerNetHomeController>(
      () => TrainerNetHomeController(),
    );
  }
}
