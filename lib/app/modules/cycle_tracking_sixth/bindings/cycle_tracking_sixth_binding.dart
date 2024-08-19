import 'package:get/get.dart';

import '../controllers/cycle_tracking_sixth_controller.dart';

class CycleTrackingSixthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingSixthController>(
      () => CycleTrackingSixthController(),
    );
  }
}
