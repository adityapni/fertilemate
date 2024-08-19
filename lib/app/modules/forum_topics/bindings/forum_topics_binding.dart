import 'package:get/get.dart';

import '../controllers/forum_topics_controller.dart';

class ForumTopicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForumTopicsController>(
      () => ForumTopicsController(),
    );
  }
}
