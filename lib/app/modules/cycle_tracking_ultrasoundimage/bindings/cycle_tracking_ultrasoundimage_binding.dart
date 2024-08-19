
import 'package:fertility_boost/app/modules/cycle_tracking_ultrasoundimage/controllers/cycle_tracking_ultrasoundimage_controller.dart';
import 'package:get/get.dart';

class CycleTrackingUltrasoundImageBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<CycleTrackingUltrasoundImageController>(() => CycleTrackingUltrasoundImageController());
  }

}