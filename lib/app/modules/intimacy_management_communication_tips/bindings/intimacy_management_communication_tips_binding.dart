import 'package:get/get.dart';

import '../controllers/intimacy_management_communication_tips_controller.dart';

class IntimacyManagementCommunicationTipsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementCommunicationTipsController>(
      () => IntimacyManagementCommunicationTipsController(),
    );
  }
}
