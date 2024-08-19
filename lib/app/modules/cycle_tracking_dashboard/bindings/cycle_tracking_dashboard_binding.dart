

import 'package:fertility_boost/app/modules/cycle_tracking_dashboard/controllers/cycle_tracking_dashboard_controller.dart';
import 'package:get/get.dart';

class CycleTrackingDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingDashboardController>(() => CycleTrackingDashboardController());
  }

}