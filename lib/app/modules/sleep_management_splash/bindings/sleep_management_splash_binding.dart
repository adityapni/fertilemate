import 'package:get/get.dart';

import '../controllers/sleep_management_splash_controller.dart';

class SleepManagementSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepManagementSplashController>(
      () => SleepManagementSplashController(),
    );
  }
}
