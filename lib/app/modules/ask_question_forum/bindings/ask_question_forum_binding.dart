import 'package:get/get.dart';

import '../controllers/ask_question_forum_controller.dart';

class AskQuestionForumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AskQuestionForumController>(
      () => AskQuestionForumController(),
    );
  }
}
