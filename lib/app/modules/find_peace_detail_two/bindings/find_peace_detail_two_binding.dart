import 'package:get/get.dart';

import '../controllers/find_peace_detail_two_controller.dart';

class FindPeaceDetailTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindPeaceDetailTwoController>(
      () => FindPeaceDetailTwoController(),
    );
  }
}
