import 'package:get/get.dart';

import '../controllers/progress_workout_controller.dart';

class ProgressWorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgressWorkoutController>(
      () => ProgressWorkoutController(),
    );
  }
}
