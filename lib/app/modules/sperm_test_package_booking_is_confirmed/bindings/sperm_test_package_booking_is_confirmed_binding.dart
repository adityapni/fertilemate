import 'package:get/get.dart';

import '../controllers/sperm_test_package_booking_is_confirmed_controller.dart';

class SpermTestPackageBookingIsConfirmedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpermTestPackageBookingIsConfirmedController>(
      () => SpermTestPackageBookingIsConfirmedController(),
    );
  }
}
