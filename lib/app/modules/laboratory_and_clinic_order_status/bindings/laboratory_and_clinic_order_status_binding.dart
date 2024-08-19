import 'package:get/get.dart';

import '../controllers/laboratory_and_clinic_order_status_controller.dart';

class LaboratoryAndClinicOrderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaboratoryAndClinicOrderStatusController>(
      () => LaboratoryAndClinicOrderStatusController(),
    );
  }
}
