import 'package:get/get.dart';

import '../controllers/waiting_for_approval_controller.dart';

class WaitingForApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingForApprovalController>(
      () => WaitingForApprovalController(),
    );
  }
}
