import 'package:get/get.dart';

import '../controllers/cycle_tracking_add_symtopm_tracker_controller.dart';

class CycleTrackingAddSymtopmTrackerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingAddSymtopmTrackerController>(
      () => CycleTrackingAddSymtopmTrackerController(),
    );
  }
}
