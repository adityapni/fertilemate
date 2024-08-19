import 'package:get/get.dart';

import '../controllers/get_expert_controller.dart';

class GetExpertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetExpertController>(
      () => GetExpertController(),
    );
  }
}
