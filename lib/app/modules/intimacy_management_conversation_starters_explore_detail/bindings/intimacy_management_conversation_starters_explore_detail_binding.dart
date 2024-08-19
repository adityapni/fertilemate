import 'package:get/get.dart';

import '../controllers/intimacy_management_conversation_starters_explore_detail_controller.dart';

class IntimacyManagementConversationStartersExploreDetailBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementConversationStartersExploreDetailController>(
      () => IntimacyManagementConversationStartersExploreDetailController(),
    );
  }
}
