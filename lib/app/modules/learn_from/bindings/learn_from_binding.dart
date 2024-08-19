import 'package:get/get.dart';

import '../controllers/learn_from_controller.dart';

class LearnFromBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnFromController>(
      () => LearnFromController(),
    );
  }
}
