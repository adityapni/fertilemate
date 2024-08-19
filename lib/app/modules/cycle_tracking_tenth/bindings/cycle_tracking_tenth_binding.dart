import 'package:get/get.dart';

import '../controllers/cycle_tracking_tenth_controller.dart';

class CycleTrackingTenthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingTenthController>(
      () => CycleTrackingTenthController(),
    );
  }
}
