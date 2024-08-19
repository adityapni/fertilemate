import 'package:get/get.dart';

import '../controllers/sleep_management_notification_controller.dart';

class SleepManagementNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepManagementNotificationController>(
      () => SleepManagementNotificationController(),
    );
  }
}
