import 'package:get/get.dart';

import '../controllers/health_recorde_controller.dart';

class HealthRecordeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthRecordeController>(
      () => HealthRecordeController(),
    );
  }
}
