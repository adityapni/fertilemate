import 'package:get/get.dart';

import '../controllers/fertility_education_discover_controller.dart';

class FertilityEducationDiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationDiscoverController>(
      () => FertilityEducationDiscoverController(),
    );
  }
}
