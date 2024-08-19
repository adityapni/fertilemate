import 'package:get/get.dart';

import '../controllers/sleep_management_favorite_sleep_sound_tracks_controller.dart';

class SleepManagementFavoriteSleepSoundTracksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepManagementFavoriteSleepSoundTracksController>(
      () => SleepManagementFavoriteSleepSoundTracksController(),
    );
  }
}
