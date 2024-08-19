import 'package:get/get.dart';

import '../controllers/supportive_community_controller.dart';

class SupportiveCommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportiveCommunityController>(
      () => SupportiveCommunityController(),
    );
  }
}
