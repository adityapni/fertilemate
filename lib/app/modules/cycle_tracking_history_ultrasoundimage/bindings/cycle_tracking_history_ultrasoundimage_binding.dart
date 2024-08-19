import 'package:fertility_boost/app/modules/cycle_tracking_history_ultrasoundimage/controller/cycle_tracking_history_ultrasoundimage_controller.dart';
import 'package:get/get.dart';

class CycleTrackingHistoryUltraSoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CycleTrackingHistoryUltrasoundImageController>(
        () => CycleTrackingHistoryUltrasoundImageController());
  }
}
