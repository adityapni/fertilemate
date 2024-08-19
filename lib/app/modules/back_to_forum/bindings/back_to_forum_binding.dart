import 'package:get/get.dart';

import '../controllers/back_to_forum_controller.dart';

class BackToForumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BackToForumController>(
      () => BackToForumController(),
    );
  }
}
