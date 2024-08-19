import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_upcoming_booking_appointment_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_models/personal_trainer_category.dart';
import '../../../data/apis/api_models/tvs_scan_get_trainer_type_list_model.dart';
import '../../../data/constants/string_constants.dart';

class PersonalTrainerController extends GetxController {
  final count = 0.obs;

  TextEditingController searchController = TextEditingController();

  final inAsyncCall = false.obs;

  final selectedTab = 0.obs;

  PersonalTrainerGetPersonalTrainerCategoryModel?
      personalTrainerGetPersonalTrainerCategoryModel;

  List<Data> data = [];
  List<Data> searchResult = [];

  TvsScanGetTrainerTypeListModel? tvsScanGetTrainerTypeListModel;

  List<Doctor> doctor = [];

  String trainerCateTypeId = '';

  GetUpcomingBookingAppointmentModel? getUpcomingBookingAppointmentModel;

  List<AppointmentResult> appointmentResult = [];

  String userId = '';

  Map<String, String> parameters = {};

  getPersonalTrainerCategory() async {
    Map<String, dynamic> queryParameters = {
      //ApiKeyConstants.trainerCateTypeId: trainerCateTypeId.toString(),
      ApiKeyConstants.expertConsultationCategoriesId:
          expertConsultationCategoriesId.toString(),
    };
    personalTrainerGetPersonalTrainerCategoryModel =
        await ApiMethods.getPersonalTrainerCategory(
            queryParameters: queryParameters);
    data.clear();
    if (personalTrainerGetPersonalTrainerCategoryModel != null &&
        personalTrainerGetPersonalTrainerCategoryModel!.data != null &&
        personalTrainerGetPersonalTrainerCategoryModel!.data!.isNotEmpty) {
      data = personalTrainerGetPersonalTrainerCategoryModel!.data!;
    }
    increment();
  }

  Future<void> getTrainerTypeListApi() async {
    tvsScanGetTrainerTypeListModel = await ApiMethods.getTrainerTypeList();
    if (tvsScanGetTrainerTypeListModel != null &&
        tvsScanGetTrainerTypeListModel!.doctor != null &&
        tvsScanGetTrainerTypeListModel!.doctor!.isNotEmpty) {
      doctor = tvsScanGetTrainerTypeListModel!.doctor!;
      if (doctor.isNotEmpty) {
        trainerCateTypeId = doctor.first.id.toString();
      }
    }
  }

  SharedPreferences? sharedPreferences;

  final expertConsultation = ''.obs;
  String expertConsultationCategoriesId = '';

  @override
  Future<void> onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    expertConsultation.value =
        sharedPreferences?.getString(StringConstants.expertConsultation) ?? '';
    expertConsultationCategoriesId = sharedPreferences
            ?.getString(ApiKeyConstants.expertConsultationCategoriesId) ??
        '';
    userId = sharedPreferences?.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getUpcomingBookingAppointmentApi();
    // await getTrainerTypeListApi();
    await getPersonalTrainerCategory();
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

  clickOnCard({required String expertConsultationCategoriesId}) async {
    parameters = {
      ApiKeyConstants.personalTrainerCategoryId: expertConsultationCategoriesId,
    };
    Get.toNamed(Routes.PERSONAL_TRAINER_BOOK, parameters: parameters);
  }

  clickOnFilterCard({required int index}) async {
    selectedTab.value = index;
    inAsyncCall.value = true;
    trainerCateTypeId = doctor[index].id.toString();
    await getPersonalTrainerCategory();
    inAsyncCall.value = false;
  }

  Future<void> getUpcomingBookingAppointmentApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.userId: userId.toString()
    };
    getUpcomingBookingAppointmentModel =
        await ApiMethods.getUpcomingBookingAppointment(
            queryParameters: queryParameters);
    if (getUpcomingBookingAppointmentModel != null &&
        getUpcomingBookingAppointmentModel!.appointmentResult != null &&
        getUpcomingBookingAppointmentModel!.appointmentResult!.isNotEmpty) {
      appointmentResult =
          getUpcomingBookingAppointmentModel!.appointmentResult!;
    }
  }

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    for (var res in data) {
      if (res.ptcName!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    }
    increment();
  }

  clickOnChatButton({required int index}) async {
    Map<String, String> parameter = {
      ApiKeyConstants.otherUserId: appointmentResult[index].doctorId.toString(),
      ApiKeyConstants.userName: appointmentResult[index].doctorName.toString(),
    };
    await Get.toNamed(Routes.CHAT, parameters: parameter);
  }
}
