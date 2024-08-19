import 'package:get/get.dart';

import '../controllers/cycle_tracking_cervical_mucus_egg_controller.dart';

class CycleTrackingCervicalMucusEggBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingCervicalMucusEggController>(
      () => CycleTrackingCervicalMucusEggController(),
    );
  }
}
