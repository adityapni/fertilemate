import 'package:get/get.dart';

import '../controllers/progress_workout_detail_controller.dart';

class ProgressWorkoutDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgressWorkoutDetailController>(
      () => ProgressWorkoutDetailController(),
    );
  }
}
