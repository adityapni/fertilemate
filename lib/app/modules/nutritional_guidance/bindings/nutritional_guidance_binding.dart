import 'package:get/get.dart';

import '../controllers/nutritional_guidance_controller.dart';

class NutritionalGuidanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceController>(
      () => NutritionalGuidanceController(),
    );
  }
}
