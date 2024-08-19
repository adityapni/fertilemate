import 'package:get/get.dart';

import '../controllers/cycle_tracking_controller.dart';

class CycleTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingController>(
      () => CycleTrackingController(),
    );
  }
}
