import 'package:get/get.dart';

import '../controllers/fertility_education_now_playing_controller.dart';

class FertilityEducationNowPlayingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationNowPlayingController>(
      () => FertilityEducationNowPlayingController(),
    );
  }
}
