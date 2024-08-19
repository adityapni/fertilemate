import 'package:get/get.dart';

import '../controllers/fertility_education_blog_controller.dart';

class FertilityEducationBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationBlogController>(
      () => FertilityEducationBlogController(),
    );
  }
}
