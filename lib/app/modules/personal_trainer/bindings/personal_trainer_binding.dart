import 'package:get/get.dart';

import '../controllers/personal_trainer_controller.dart';

class PersonalTrainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalTrainerController>(
      () => PersonalTrainerController(),
    );
  }
}
