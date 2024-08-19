import 'package:get/get.dart';

import '../controllers/trainer_net_notification_controller.dart';

class TrainerNetNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainerNetNotificationController>(
      () => TrainerNetNotificationController(),
    );
  }
}
