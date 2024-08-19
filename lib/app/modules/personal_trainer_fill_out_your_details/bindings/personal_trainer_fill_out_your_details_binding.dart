import 'package:get/get.dart';

import '../controllers/personal_trainer_fill_out_your_details_controller.dart';

class PersonalTrainerFillOutYourDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalTrainerFillOutYourDetailsController>(
      () => PersonalTrainerFillOutYourDetailsController(),
    );
  }
}
