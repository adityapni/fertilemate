import 'package:get/get.dart';

import '../controllers/cycle_tracking_add_temperature_controller.dart';

class CycleTrackingAddTemperatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingAddTemperatureController>(
      () => CycleTrackingAddTemperatureController(),
    );
  }
}
