import 'package:get/get.dart';

import '../controllers/prt_reset_password_controller.dart';

class PrtResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrtResetPasswordController>(
      () => PrtResetPasswordController(),
    );
  }
}
