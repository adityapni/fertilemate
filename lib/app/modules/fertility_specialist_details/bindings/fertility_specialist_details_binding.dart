import 'package:get/get.dart';

import '../controllers/fertility_specialist_details_controller.dart';

class FertilitySpecialistDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilitySpecialistDetailsController>(
      () => FertilitySpecialistDetailsController(),
    );
  }
}
