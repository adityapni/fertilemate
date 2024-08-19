import 'package:get/get.dart';

import '../controllers/forum_topics_list_controller.dart';

class ForumTopicsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForumTopicsListController>(
      () => ForumTopicsListController(),
    );
  }
}
