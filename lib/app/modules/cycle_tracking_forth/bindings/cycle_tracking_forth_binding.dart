import 'package:get/get.dart';

import '../controllers/cycle_tracking_forth_controller.dart';

class CycleTrackingForthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingForthController>(
      () => CycleTrackingForthController(),
    );
  }
}
