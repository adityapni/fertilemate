import 'package:get/get.dart';

import '../controllers/personal_trainer_chat_controller.dart';

class PersonalTrainerChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalTrainerChatController>(
      () => PersonalTrainerChatController(),
    );
  }
}
