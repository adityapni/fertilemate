import 'package:get/get.dart';

import '../controllers/cycle_tracking_eighth_controller.dart';

class CycleTrackingEighthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingEighthController>(
      () => CycleTrackingEighthController(),
    );
  }
}
