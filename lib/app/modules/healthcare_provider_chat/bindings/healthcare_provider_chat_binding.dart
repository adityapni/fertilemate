import 'package:get/get.dart';

import '../controllers/healthcare_provider_chat_controller.dart';

class HealthcareProviderChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthcareProviderChatController>(
      () => HealthcareProviderChatController(),
    );
  }
}
