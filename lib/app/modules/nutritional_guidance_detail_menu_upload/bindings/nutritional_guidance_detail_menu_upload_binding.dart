import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_menu_upload_controller.dart';

class NutritionalGuidanceDetailMenuUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailMenuUploadController>(
      () => NutritionalGuidanceDetailMenuUploadController(),
    );
  }
}
