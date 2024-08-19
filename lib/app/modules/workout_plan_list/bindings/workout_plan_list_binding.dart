import 'package:get/get.dart';

import '../controllers/workout_plan_list_controller.dart';

class WorkoutPlanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutPlanListController>(
      () => WorkoutPlanListController(),
    );
  }
}
