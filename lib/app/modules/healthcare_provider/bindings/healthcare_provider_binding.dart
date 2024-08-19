import 'package:get/get.dart';

import '../controllers/healthcare_provider_controller.dart';

class HealthcareProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthcareProviderController>(
      () => HealthcareProviderController(),
    );
  }
}
