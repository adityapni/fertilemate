import 'package:get/get.dart';

import '../controllers/intimacy_management_calendar_controller.dart';

class IntimacyManagementCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementCalendarController>(
      () => IntimacyManagementCalendarController(),
    );
  }
}
