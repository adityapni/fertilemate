import 'package:get/get.dart';

import '../controllers/intimacy_management_controller.dart';

class IntimacyManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementController>(
      () => IntimacyManagementController(),
    );
  }
}
