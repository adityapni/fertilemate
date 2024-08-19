import 'package:get/get.dart';

import '../controllers/cycle_tracking_add_cycle_data_controller.dart';

class CycleTrackingAddCycleDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingAddCycleDataController>(
      () => CycleTrackingAddCycleDataController(),
    );
  }
}
