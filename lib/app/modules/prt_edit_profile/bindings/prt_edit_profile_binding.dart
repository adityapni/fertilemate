import 'package:get/get.dart';

import '../controllers/prt_edit_profile_controller.dart';

class PrtEditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrtEditProfileController>(
      () => PrtEditProfileController(),
    );
  }
}
