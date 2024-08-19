import 'package:get/get.dart';

import '../controllers/workout_plans_controller.dart';

class WorkoutPlansBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutPlansController>(
      () => WorkoutPlansController(),
    );
  }
}
