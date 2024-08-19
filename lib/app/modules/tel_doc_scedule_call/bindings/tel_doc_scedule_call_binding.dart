import 'package:get/get.dart';

import '../controllers/tel_doc_scedule_call_controller.dart';

class TelDocSceduleCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TelDocSceduleCallController>(
      () => TelDocSceduleCallController(),
    );
  }
}
