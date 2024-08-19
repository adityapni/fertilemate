import 'package:get/get.dart';

import '../controllers/sleep_management_discover_controller.dart';

class SleepManagementDiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepManagementDiscoverController>(
      () => SleepManagementDiscoverController(),
    );
  }
}
