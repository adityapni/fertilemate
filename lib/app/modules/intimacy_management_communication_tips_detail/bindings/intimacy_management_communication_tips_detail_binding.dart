import 'package:get/get.dart';

import '../controllers/intimacy_management_communication_tips_detail_controller.dart';

class IntimacyManagementCommunicationTipsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementCommunicationTipsDetailController>(
      () => IntimacyManagementCommunicationTipsDetailController(),
    );
  }
}
