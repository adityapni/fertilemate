import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/doctors_model.dart';
import '../../../routes/app_pages.dart';

class FertilitySpecialistController extends GetxController {
  final count = 0.obs;
  TextEditingController searchController = TextEditingController();
  final inAsyncCall = false.obs;

  DoctorsModel? doctorsModel;
  List<Doctor> doctor = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    await onInitWork();
    inAsyncCall.value = false;
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

  clickOnBookNowButton({required int index}) {
    Map<String, String> parameter = {
      ApiKeyConstants.id: doctor[index].doctorId ?? ''
    };
    Get.toNamed(Routes.FERTILITY_SPECIALIST_DETAILS, parameters: parameter);
  }

  clickOnCard() {}

  Future<void> onInitWork() async {
    await doctorsApi();
  }

  Future<void> doctorsApi() async {
    doctorsModel = await ApiMethods.doctors();
    if (doctorsModel != null &&
        doctorsModel!.doctor != null &&
        doctorsModel!.doctor!.isNotEmpty) {
      doctor = doctorsModel!.doctor!;
    }
  }
}
