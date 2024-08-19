import 'package:get/get.dart';

import '../controllers/find_peace_controller.dart';

class FindPeaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindPeaceController>(
      () => FindPeaceController(),
    );
  }
}
