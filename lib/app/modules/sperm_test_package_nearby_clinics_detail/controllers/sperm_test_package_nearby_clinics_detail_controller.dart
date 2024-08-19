import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_models/ClinicDetailByClinicId.dart';
import '../../../data/apis/api_models/ClinicDetailModel.dart';
import '../../../data/constants/string_constants.dart';

class SpermTestPackageNearbyClinicsDetailController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  String clinicId = '';
  ClinicDetailByClinicIdModel? clinicDetail;

  Map<String, String> parameters = {};

  getClinicDetail() async {
    clinicDetail = await ApiMethods.GetClinicDetailById(
        bodyParams: {ApiKeyConstants.clinicId: clinicId});
    increment();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    clinicId = Get.parameters[ApiKeyConstants.clinicId] ?? '';
    inAsyncCall.value = true;
    await getClinicDetail();
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

  clickOnScheduleAppointmentButton() {
    parameters = {
      ApiKeyConstants.bookingType: ApiKeyConstants.spermTest,
      ApiKeyConstants.clinicId: clinicId,
      ApiKeyConstants.title: clinicDetail!.data!.clinicName ?? '',
      ApiKeyConstants.subTitle: StringConstants.packagePremium,
      ApiKeyConstants.consultantfee: clinicDetail!.data!.consultan! ?? '',
      ApiKeyConstants.testId: Get.parameters[ApiKeyConstants.testId] ?? '',
      ApiKeyConstants.description: clinicDetail!.data!.clinicAddress ?? ''
    };
    Get.toNamed(Routes.BOOKING_BY_CALENDAR, parameters: parameters);
  }
}
