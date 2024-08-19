import 'package:get/get.dart';

import '../controllers/personal_trainer_find_controller.dart';

class PersonalTrainerFindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalTrainerFindController>(
      () => PersonalTrainerFindController(),
    );
  }
}
