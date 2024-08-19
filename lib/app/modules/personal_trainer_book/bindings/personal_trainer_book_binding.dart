import 'package:get/get.dart';

import '../controllers/personal_trainer_book_controller.dart';

class PersonalTrainerBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalTrainerBookController>(
      () => PersonalTrainerBookController(),
    );
  }
}
