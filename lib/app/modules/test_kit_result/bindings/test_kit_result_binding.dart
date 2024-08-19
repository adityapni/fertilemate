import 'package:get/get.dart';

import '../controllers/test_kit_result_controller.dart';

class TestKitResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestKitResultController>(
      () => TestKitResultController(),
    );
  }
}
