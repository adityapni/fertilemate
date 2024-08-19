import 'package:get/get.dart';

import '../controllers/sleep_management_dashboard_controller.dart';

class SleepManagementDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepManagementDashboardController>(
      () => SleepManagementDashboardController(),
    );
  }
}
