import 'package:get/get.dart';

import '../controllers/tel_doc_set_availability_controller.dart';

class TelDocSetAvailabilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TelDocSetAvailabilityController>(
      () => TelDocSetAvailabilityController(),
    );
  }
}
