import 'package:get/get.dart';

import '../controllers/general_wellness_blood_test_controller.dart';

class GeneralWellnessBloodTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeneralWellnessBloodTestController>(
      () => GeneralWellnessBloodTestController(),
    );
  }
}
