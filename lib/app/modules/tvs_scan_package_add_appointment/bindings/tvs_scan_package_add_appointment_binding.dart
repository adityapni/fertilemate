import 'package:get/get.dart';

import '../controllers/tvs_scan_package_add_appointment_controller.dart';

class TvsScanPackageAddAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvsScanPackageAddAppointmentController>(
      () => TvsScanPackageAddAppointmentController(),
    );
  }
}
