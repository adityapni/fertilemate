import 'package:get/get.dart';

import '../controllers/laboratory_and_clinic_success_controller.dart';

class LaboratoryAndClinicSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaboratoryAndClinicSuccessController>(
      () => LaboratoryAndClinicSuccessController(),
    );
  }
}
