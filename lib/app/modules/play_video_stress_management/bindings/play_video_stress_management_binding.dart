import 'package:get/get.dart';

import '../controllers/play_video_stress_management_controller.dart';

class PlayVideoStressManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayVideoStressManagementController>(
      () => PlayVideoStressManagementController(),
    );
  }
}
