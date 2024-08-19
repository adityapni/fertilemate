import 'package:get/get.dart';

import '../controllers/fertility_education_ebook_read_image_slider_controller.dart';

class FertilityEducationEbookReadImageSliderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationEbookReadImageSliderController>(
      () => FertilityEducationEbookReadImageSliderController(),
    );
  }
}
