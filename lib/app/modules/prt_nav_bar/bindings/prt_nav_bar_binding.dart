import 'package:get/get.dart';

import '../controllers/prt_nav_bar_controller.dart';

class PrtNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrtNavBarController>(
      () => PrtNavBarController(),
    );
  }
}
