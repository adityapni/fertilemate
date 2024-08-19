import 'package:get/get.dart';

import '../controllers/tel_doc_profile_controller.dart';

class TelDocProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TelDocProfileController>(
      () => TelDocProfileController(),
    );
  }
}
