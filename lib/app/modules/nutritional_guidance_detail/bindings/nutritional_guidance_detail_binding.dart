import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_controller.dart';

class NutritionalGuidanceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailController>(
      () => NutritionalGuidanceDetailController(),
    );
  }
}
