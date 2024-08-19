import 'package:fertility_boost/app/data/apis/api_models/doctors_get_doctor_by_id_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class FertilitySpecialistDetailsController extends GetxController {
  final count = 0.obs;

  TextEditingController searchController = TextEditingController();

  final inAsyncCall = false.obs;

  Map<String, String?> parameters = Get.parameters;
  String id = '';

  DoctorsGetDoctorByIdModel? doctorsGetDoctorByIdModel;
  Doctor? doctor;

  Map<String, String> bodyParams = {};

  @override
  Future<void> onInit() async {
    id = parameters[ApiKeyConstants.id] ?? '';
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

  clickOnBookButton() {
    Map<String, String> parameter = {
      ApiKeyConstants.doctorId: doctor?.id ?? '',
      ApiKeyConstants.bookingType: ApiKeyConstants.doctorBooking,
      ApiKeyConstants.consultantfee: doctor?.consultFee ?? '',
      ApiKeyConstants.title: StringConstants.chooseYourExpert,
      ApiKeyConstants.description:
          "${doctor?.name ?? ''},${doctor?.education ?? ''}",
    };
    Get.toNamed(Routes.BOOKING_BY_CALENDAR, parameters: parameter);
  }

  clickOnBackButton() {
    Get.back();
  }

  Future<void> onInitWork() async {
    await doctorsGetDoctorByIdApi();
  }

  Future<void> doctorsGetDoctorByIdApi() async {
    bodyParams = {ApiKeyConstants.doctorId: id.toString()};
    doctorsGetDoctorByIdModel =
        await ApiMethods.doctorsGetDoctorById(bodyParams: bodyParams);
    if (doctorsGetDoctorByIdModel != null &&
        doctorsGetDoctorByIdModel!.doctor != null) {
      doctor = doctorsGetDoctorByIdModel!.doctor!;
    }
  }
}
