import 'package:get/get.dart';

import '../controllers/fertility_education_ebooks_controller.dart';

class FertilityEducationEbooksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationEbooksController>(
      () => FertilityEducationEbooksController(),
    );
  }
}
