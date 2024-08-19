import 'package:get/get.dart';

import '../controllers/prt_login_controller.dart';

class PrtLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrtLoginController>(
      () => PrtLoginController(),
    );
  }
}
