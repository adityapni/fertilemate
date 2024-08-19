import 'package:get/get.dart';

import '../controllers/personal_trainer_training_session_controller.dart';

class PersonalTrainerTrainingSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalTrainerTrainingSessionController>(
      () => PersonalTrainerTrainingSessionController(),
    );
  }
}
