import 'package:get/get.dart';

import '../controllers/tel_doc_chat_controller.dart';

class TelDocChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TelDocChatController>(
      () => TelDocChatController(),
    );
  }
}
