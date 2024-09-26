import '../controllers/health_report_controller.dart';
import 'package:get/get.dart';

class HealthReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthReportController>(
        () => HealthReportController(),
    );
  }
}