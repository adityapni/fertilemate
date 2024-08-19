import 'package:get/get.dart';

import '../controllers/find_peace_detail_controller.dart';

class FindPeaceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindPeaceDetailController>(
      () => FindPeaceDetailController(),
    );
  }
}
