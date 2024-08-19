import 'package:get/get.dart';

import '../controllers/prt_my_profile_controller.dart';

class PrtMyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrtMyProfileController>(
      () => PrtMyProfileController(),
    );
  }
}
