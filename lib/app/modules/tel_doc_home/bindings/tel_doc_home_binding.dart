import 'package:get/get.dart';

import '../controllers/tel_doc_home_controller.dart';

class TelDocHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TelDocHomeController>(
      () => TelDocHomeController(),
    );
  }
}
