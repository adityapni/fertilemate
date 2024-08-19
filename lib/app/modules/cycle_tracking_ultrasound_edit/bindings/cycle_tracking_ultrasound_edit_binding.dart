
import 'package:fertility_boost/app/modules/cycle_tracking_ultrasound_edit/controllers/cycle_tracking_ultrasound_edit_controller.dart';
import 'package:get/get.dart';

class CycleTrackingUltraSoundEditBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<CycleTrackingUltraSoundEditController>(() => CycleTrackingUltraSoundEditController());
  }


}