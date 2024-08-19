import 'package:get/get.dart';

import '../controllers/cycle_tracking_fifth_controller.dart';

class CycleTrackingFifthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingFifthController>(
      () => CycleTrackingFifthController(),
    );
  }
}
