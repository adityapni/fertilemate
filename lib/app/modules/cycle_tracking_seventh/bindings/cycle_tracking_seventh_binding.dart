import 'package:get/get.dart';

import '../controllers/cycle_tracking_seventh_controller.dart';

class CycleTrackingSeventhBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingSeventhController>(
      () => CycleTrackingSeventhController(),
    );
  }
}
