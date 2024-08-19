import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_blog_detail_controller.dart';

class NutritionalGuidanceDetailBlogDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailBlogDetailController>(
      () => NutritionalGuidanceDetailBlogDetailController(),
    );
  }
}
