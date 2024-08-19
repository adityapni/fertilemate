import 'package:get/get.dart';

import '../controllers/play_audio_stress_management_controller.dart';

class PlayAudioStressManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayAudioStressManagementController>(
      () => PlayAudioStressManagementController(),
    );
  }
}
