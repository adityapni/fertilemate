import 'package:get/get.dart';

import '../controllers/nutritional_guidance_detail_blog_controller.dart';

class NutritionalGuidanceDetailBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalGuidanceDetailBlogController>(
      () => NutritionalGuidanceDetailBlogController(),
    );
  }
}
