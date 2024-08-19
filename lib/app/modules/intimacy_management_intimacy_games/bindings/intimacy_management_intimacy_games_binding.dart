import 'package:get/get.dart';

import '../controllers/intimacy_management_intimacy_games_controller.dart';

class IntimacyManagementIntimacyGamesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementIntimacyGamesController>(
      () => IntimacyManagementIntimacyGamesController(),
    );
  }
}
