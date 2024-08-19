import 'package:get/get.dart';

import '../controllers/personal_trainer_dashboard_controller.dart';

class PersonalTrainerDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalTrainerDashboardController>(
      () => PersonalTrainerDashboardController(),
    );
  }
}
