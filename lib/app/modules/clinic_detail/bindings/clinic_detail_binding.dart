import 'package:get/get.dart';

import '../controllers/clinic_detail_controller.dart';

class ClinicDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClinicDetailController>(
      () => ClinicDetailController(),
    );
  }
}
