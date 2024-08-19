import 'package:get/get.dart';

import '../controllers/prt_profile_controller.dart';

class PrtProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrtProfileController>(
      () => PrtProfileController(),
    );
  }
}
