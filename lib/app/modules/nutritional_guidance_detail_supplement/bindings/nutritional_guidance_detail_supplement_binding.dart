import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_supplement_controller.dart';

class NutritionalGuidanceDetailSupplementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailSupplementController>(
      () => NutritionalGuidanceDetailSupplementController(),
    );
  }
}
