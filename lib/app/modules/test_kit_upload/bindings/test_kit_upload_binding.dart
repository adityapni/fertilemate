import 'package:get/get.dart';

import '../controllers/test_kit_upload_controller.dart';

class TestKitUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestKitUploadController>(
      () => TestKitUploadController(),
    );
  }
}
