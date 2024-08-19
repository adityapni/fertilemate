import 'package:get/get.dart';

import '../controllers/laboratory_and_clinic_home_controller.dart';

class LaboratoryAndClinicHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaboratoryAndClinicHomeController>(
      () => LaboratoryAndClinicHomeController(),
    );
  }
}
