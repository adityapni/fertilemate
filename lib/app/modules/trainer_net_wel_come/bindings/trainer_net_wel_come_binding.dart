import 'package:get/get.dart';

import '../controllers/trainer_net_wel_come_controller.dart';

class TrainerNetWelComeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainerNetWelComeController>(
      () => TrainerNetWelComeController(),
    );
  }
}
