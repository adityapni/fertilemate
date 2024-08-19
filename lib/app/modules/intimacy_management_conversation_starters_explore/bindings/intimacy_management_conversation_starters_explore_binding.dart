import 'package:get/get.dart';

import '../controllers/intimacy_management_conversation_starters_explore_controller.dart';

class IntimacyManagementConversationStartersExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementConversationStartersExploreController>(
      () => IntimacyManagementConversationStartersExploreController(),
    );
  }
}
