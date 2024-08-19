import 'package:get/get.dart';

import '../controllers/stress_management_controller.dart';

class StressManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StressManagementController>(
      () => StressManagementController(),
    );
  }
}
