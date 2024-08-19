import 'package:get/get.dart';

import '../controllers/fertility_education_webinars_controller.dart';

class FertilityEducationWebinarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationWebinarsController>(
      () => FertilityEducationWebinarsController(),
    );
  }
}
