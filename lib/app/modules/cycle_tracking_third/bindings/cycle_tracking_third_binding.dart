import 'package:get/get.dart';

import '../controllers/cycle_tracking_third_controller.dart';

class CycleTrackingThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingThirdController>(
      () => CycleTrackingThirdController(),
    );
  }
}
