import 'package:get/get.dart';

import '../controllers/laboratory_and_clinic_map_controller.dart';

class LaboratoryAndClinicMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaboratoryAndClinicMapController>(
      () => LaboratoryAndClinicMapController(),
    );
  }
}
