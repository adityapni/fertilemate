import 'package:get/get.dart';

import '../controllers/fertility_specialist_controller.dart';

class FertilitySpecialistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilitySpecialistController>(
      () => FertilitySpecialistController(),
    );
  }
}
