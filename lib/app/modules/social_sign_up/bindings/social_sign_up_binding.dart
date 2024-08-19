import 'package:get/get.dart';

import '../controllers/social_sign_up_controller.dart';

class SocialSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocialSignUpController>(
      () => SocialSignUpController(),
    );
  }
}
