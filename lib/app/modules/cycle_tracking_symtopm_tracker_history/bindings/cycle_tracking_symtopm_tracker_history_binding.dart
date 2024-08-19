import 'package:get/get.dart';

import '../controllers/cycle_tracking_symtopm_tracker_history_controller.dart';

class CycleTrackingSymtopmTrackerHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingSymtopmTrackerHistoryController>(
      () => CycleTrackingSymtopmTrackerHistoryController(),
    );
  }
}
