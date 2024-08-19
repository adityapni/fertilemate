import 'package:get/get.dart';

import '../controllers/cycle_tracking_ninth_controller.dart';

class CycleTrackingNinthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingNinthController>(
      () => CycleTrackingNinthController(),
    );
  }
}
