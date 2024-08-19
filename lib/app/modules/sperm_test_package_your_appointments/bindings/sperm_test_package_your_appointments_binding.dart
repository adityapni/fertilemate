import 'package:get/get.dart';

import '../controllers/sperm_test_package_your_appointments_controller.dart';

class SpermTestPackageYourAppointmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpermTestPackageYourAppointmentsController>(
      () => SpermTestPackageYourAppointmentsController(),
    );
  }
}
