import 'package:get/get.dart';

import '../controllers/sleep_management_media_player_controller.dart';

class SleepManagementMediaPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepManagementMediaPlayerController>(
      () => SleepManagementMediaPlayerController(),
    );
  }
}
