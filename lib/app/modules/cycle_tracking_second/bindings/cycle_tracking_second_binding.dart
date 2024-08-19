import 'package:get/get.dart';

import '../controllers/cycle_tracking_second_controller.dart';

class CycleTrackingSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingSecondController>(
      () => CycleTrackingSecondController(),
    );
  }
}
