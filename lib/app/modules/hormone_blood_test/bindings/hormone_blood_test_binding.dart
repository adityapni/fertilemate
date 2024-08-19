import 'package:get/get.dart';

import '../controllers/hormone_blood_test_controller.dart';

class HormoneBloodTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HormoneBloodTestController>(
      () => HormoneBloodTestController(),
    );
  }
}
