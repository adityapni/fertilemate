import 'package:get/get.dart';

import '../controllers/fertility_home_test_kit_controller.dart';

class FertilityHomeTestKitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityHomeTestKitController>(
      () => FertilityHomeTestKitController(),
    );
  }
}
