import 'package:fertility_boost/app/data/apis/api_models/get_find_coach_category_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/expert_consultation_get_expert_consultation_doctors_by_categories_model.dart';
import '../../../data/apis/api_models/get_upcoming_booking_appointment_model.dart';
import '../../../data/constants/string_constants.dart';

class ExpertConsultationDashboardController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  ExpertConsultationGetExpertConsultationDoctorsByCategoriesModel?
      expertConsultationGetExpertConsultationDoctorsByCategoriesModel;
  List<Result> result = [];

  SharedPreferences? sharedPreferences;

  final expertConsultation = ''.obs;
  String expertConsultationCategoriesId = '';

  Map<String, dynamic> queryParameters = {};

  GetUpcomingBookingAppointmentModel? getUpcomingBookingAppointmentModel;
  List<AppointmentResult> appointmentResult = [];

  String userId = '';

  List<GetFindCoachCategoryResult> getFindCoachCategoryResult = [];
  GetFindCoachCategoryModel? getFindCoachCategoryModel;

  @override
  Future<void> onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    expertConsultation.value =
        sharedPreferences?.getString(StringConstants.expertConsultation) ?? '';
    userId = sharedPreferences?.getString(ApiKeyConstants.userId) ?? '';
    expertConsultationCategoriesId = sharedPreferences
            ?.getString(ApiKeyConstants.expertConsultationCategoriesId) ??
        '';
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

  clickOnBackNow() {
    Get.back();
  }

  Widget cards({
    required int index,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonWidgets.imageView(
            image: getFindCoachCategoryResult[index].image.toString(),
            width: 64.px,
            height: 64.px),
        SizedBox(height: 4.px),
        Text(
          getFindCoachCategoryResult[index].name ?? '',
          style: Theme.of(Get.context!)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 12.px),
        ),
      ],
    );
  }

  clickOnViewProfileButton({required int index}) {
    Map<String, String> parameters = {
      ApiKeyConstants.doctorId: result[index].id.toString()
    };
    Get.toNamed(Routes.EXPERT_CONSULTATION_COACH_PROFILE,
        parameters: parameters);
  }

  clickOnCard({required int index}) {
    Get.toNamed(Routes.EXPERT_CONSULTATION_DISCOVER, parameters: {
      ApiKeyConstants.findCoachCategoryId:
          getFindCoachCategoryResult[index].id.toString(),
      ApiKeyConstants.title: getFindCoachCategoryResult[index].name.toString()
    });
  }

  Future<void> onInitWork() async {
    await getUpcomingBookingAppointmentApi();
    await expertConsultationGetExpertConsultationDoctorsByCategoriesApi();
    await getFindCoachCategoryApi();
  }

  Future<void>
      expertConsultationGetExpertConsultationDoctorsByCategoriesApi() async {
    queryParameters = {
      ApiKeyConstants.expertConsultationCategoriesId:
          expertConsultationCategoriesId.toString()
    };
    expertConsultationGetExpertConsultationDoctorsByCategoriesModel =
        await ApiMethods
            .expertConsultationGetExpertConsultationDoctorsByCategories(
                queryParameters: queryParameters);
    if (expertConsultationGetExpertConsultationDoctorsByCategoriesModel !=
            null &&
        expertConsultationGetExpertConsultationDoctorsByCategoriesModel!
                .result !=
            null &&
        expertConsultationGetExpertConsultationDoctorsByCategoriesModel!
            .result!.isNotEmpty) {
      result = expertConsultationGetExpertConsultationDoctorsByCategoriesModel!
          .result!;
    }
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

  Future<void> getFindCoachCategoryApi() async {
    getFindCoachCategoryModel = await ApiMethods.getFindCoachCategory();
    if (getFindCoachCategoryModel != null &&
        getFindCoachCategoryModel!.getFindCoachCategoryResult != null &&
        getFindCoachCategoryModel!.getFindCoachCategoryResult!.isNotEmpty) {
      getFindCoachCategoryResult =
          getFindCoachCategoryModel!.getFindCoachCategoryResult!;
    }
  }

  clickOnChatButton({required int index}) async {
    Map<String, String> parameter = {
      ApiKeyConstants.otherUserId: appointmentResult[index].doctorId.toString(),
      ApiKeyConstants.userName: appointmentResult[index].doctorName.toString(),
    };
    await Get.toNamed(Routes.CHAT, parameters: parameter);
  }
}
