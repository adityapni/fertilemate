import 'package:get/get.dart';

import '../controllers/cycle_tracking_calendar_detail_controller.dart';

class CycleTrackingCalendarDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingCalendarDetailController>(
      () => CycleTrackingCalendarDetailController(),
    );
  }
}
