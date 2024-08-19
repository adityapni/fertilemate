import 'package:get/get.dart';

import '../controllers/learn_from_detail_controller.dart';

class LearnFromDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnFromDetailController>(
      () => LearnFromDetailController(),
    );
  }
}
