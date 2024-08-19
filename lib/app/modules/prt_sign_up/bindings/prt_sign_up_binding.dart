import 'package:get/get.dart';

import '../controllers/prt_sign_up_controller.dart';

class PrtSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrtSignUpController>(
      () => PrtSignUpController(),
    );
  }
}
