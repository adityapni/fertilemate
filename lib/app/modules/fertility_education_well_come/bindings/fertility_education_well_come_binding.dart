import 'package:get/get.dart';

import '../controllers/fertility_education_well_come_controller.dart';

class FertilityEducationWellComeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationWellComeController>(
      () => FertilityEducationWellComeController(),
    );
  }
}
