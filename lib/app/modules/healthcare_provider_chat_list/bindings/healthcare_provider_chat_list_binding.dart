import 'package:get/get.dart';

import '../controllers/healthcare_provider_chat_list_controller.dart';

class HealthcareProviderChatListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthcareProviderChatListController>(
      () => HealthcareProviderChatListController(),
    );
  }
}
