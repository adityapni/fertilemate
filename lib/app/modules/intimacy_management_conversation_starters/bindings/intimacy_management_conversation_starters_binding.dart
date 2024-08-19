import 'package:get/get.dart';

import '../controllers/intimacy_management_conversation_starters_controller.dart';

class IntimacyManagementConversationStartersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementConversationStartersController>(
      () => IntimacyManagementConversationStartersController(),
    );
  }
}
