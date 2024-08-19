import 'package:get/get.dart';

import '../controllers/blood_report_controller.dart';

class BloodReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BloodReportController>(
      () => BloodReportController(),
    );
  }
}
