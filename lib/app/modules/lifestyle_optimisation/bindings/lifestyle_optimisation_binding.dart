import 'package:get/get.dart';

import '../controllers/lifestyle_optimisation_controller.dart';

class LifestyleOptimisationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LifestyleOptimisationController>(
      () => LifestyleOptimisationController(),
    );
  }
}
