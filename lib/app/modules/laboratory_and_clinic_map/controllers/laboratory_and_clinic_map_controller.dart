import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';

class LaboratoryAndClinicMapController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  final count = 0.obs;

  double lat = 0.0;
  double long = 0.0;

  Map<String, dynamic> parameters = Get.parameters;

  @override
  void onInit() {
    lat = double.parse(parameters[ApiKeyConstants.lat]);
    long = double.parse(parameters[ApiKeyConstants.long]);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnBack() {
    Get.back();
  }
}
