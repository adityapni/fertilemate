import 'package:get/get.dart';

import '../controllers/sperm_test_package_hospital_serdang_controller.dart';

class SpermTestPackageHospitalSerdangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpermTestPackageHospitalSerdangController>(
      () => SpermTestPackageHospitalSerdangController(),
    );
  }
}
