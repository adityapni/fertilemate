import 'package:get/get.dart';

import '../controllers/intimacy_games_controller.dart';

class IntimacyGamesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyGamesController>(
      () => IntimacyGamesController(),
    );
  }
}
