import 'package:get/get.dart';

import '../controllers/fertility_education_controller.dart';

class FertilityEducationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationController>(
      () => FertilityEducationController(),
    );
  }
}
