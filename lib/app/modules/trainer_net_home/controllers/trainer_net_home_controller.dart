import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/data/apis/api_models/count_doctor_upcoming_appointment_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/doctors_get_profile_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/personal_trainer_get_trainer_category.dart';
import 'package:fertility_boost/app/data/apis/api_models/trainer_appointment_list.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_models/get_doctor_upcoming_appointment_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class TrainerNetHomeController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  TextEditingController searchController = TextEditingController();
  final selectedTab = 0.obs;
  List listOfTabs = ['Top', 'Featured', 'Popular'];
  TrainerAppointmentListModel? appointmentList;
  PersonalTrainerGetTrainerCategoryModel?
      personalTrainerGetTrainerCategoryModel;
  List<TrainerCategoryData> trainerCategoryData = [];
  GetDoctorUpcomingAppointmentModel? getDoctorUpcomingAppointmentModel;
  List<Result> resultPending = [];
  List<Result> resultAccepted = [];
  Map<String, String> queryParameters = {};
  String userId = '';

  CountDoctorUpcomingAppointmentModel? countDoctorUpcomingAppointmentModel;

  CountDoctorUpcomingAppointmentResult? countDoctorUpcomingAppointmentResult;

  DoctorsGetProfileModel? doctorsGetProfileModel;

  UserData? userData;


  getAppointment() async {
    appointmentList = await ApiMethods.getAppointment(
        bodyParams: {ApiKeyConstants.trainerId: userId});
    /*{ApiKeyConstants.trainerId:'1'});
    print("appointmentList-------------${appointmentList!.data!.length}");
 */
  }

  Future<void> personalTrainerGetTrainerCategoryApi() async {
    personalTrainerGetTrainerCategoryModel =
        await ApiMethods.personalTrainerGetTrainerCategory();
    if (personalTrainerGetTrainerCategoryModel != null &&
        personalTrainerGetTrainerCategoryModel!
            .trainerCategoryData!.isNotEmpty) {
      trainerCategoryData =
          personalTrainerGetTrainerCategoryModel!.trainerCategoryData!;
    }
  }

  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await doctorsGetDoctorByIdApi();
    await countDoctorUpcomingAppointmentApi();
    await getAppointment();
    await personalTrainerGetTrainerCategoryApi();
    await getDoctorUpcomingAppointmentApi();
    await getDoctorUpcomingAppointmentApi(type: ApiKeyConstants.accepted);
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

  clickOnCard({required int index}) {
    Get.toNamed(Routes.TRAINER_NET_MANAGE_APPOINTMENTS);
  }

  void ClickOnFilter() {
    Get.toNamed(Routes.TRAINER_NET_APPOINTMENTS);
  }

  clickOnAddButton() {
    Get.toNamed(Routes.TRAINER_NET_ADD_APPOINTMENT);
  }

  clickOnFilter() {}

  clickOnLogout() async {
    CommonWidgets.showAlertDialog(
      onPressedYes: () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();
        Get.offAllNamed(Routes.GET_START);
      },
    );
  }

  Future<void> doctorsGetDoctorByIdApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.id: userId,
      ApiKeyConstants.type: ApiKeyConstants.trainer
    };
    doctorsGetProfileModel =
        await ApiMethods.doctorsGetProfile(bodyParams: bodyParams);
    if (doctorsGetProfileModel != null &&
        doctorsGetProfileModel!.userData != null) {
      userData = doctorsGetProfileModel!.userData;
    }
  }

  Future<void> getDoctorUpcomingAppointmentApi(
      {String type = ApiKeyConstants.pending}) async {
    queryParameters = {
      ApiKeyConstants.trainerId: '1',
      ApiKeyConstants.doctorId: '',
      ApiKeyConstants.labId: '',
      ApiKeyConstants.type: type,
    };
    getDoctorUpcomingAppointmentModel =
        await ApiMethods.getDoctorUpcomingAppointment(
            queryParameters: queryParameters);
    if (getDoctorUpcomingAppointmentModel != null &&
        getDoctorUpcomingAppointmentModel!.result != null) {
      resultPending = getDoctorUpcomingAppointmentModel!.result!;
      if (ApiKeyConstants.accepted == type) {
        resultAccepted = getDoctorUpcomingAppointmentModel!.result!;
      } else {
        resultPending = getDoctorUpcomingAppointmentModel!.result!;
      }
    }
  }

  Future<void> countDoctorUpcomingAppointmentApi() async {
    queryParameters = {
      ApiKeyConstants.trainerId: '1',
      ApiKeyConstants.doctorId: '',
      ApiKeyConstants.labId: '',
    };
    countDoctorUpcomingAppointmentModel =
        await ApiMethods.countDoctorUpcomingAppointment(
            queryParameters: queryParameters);
    if (countDoctorUpcomingAppointmentModel != null &&
        countDoctorUpcomingAppointmentModel!
                .countDoctorUpcomingAppointmentResult !=
            null) {
      countDoctorUpcomingAppointmentResult =
          countDoctorUpcomingAppointmentModel!
              .countDoctorUpcomingAppointmentResult!;
    }
  }

  clickOnUpComingAppointment({required int index}) async {
    Map<String, String> parameters = {
      ApiKeyConstants.appointmentId: resultPending[index].id.toString(),
      ApiKeyConstants.isTrainer: ApiKeyConstants.isTrainer,
    };
    await Get.toNamed(Routes.TEL_DOC_CLIENT_DETAIL, parameters: parameters);
    await onInit();
  }

  onWillPop() {
    if (selectedIndex.value == 0) {
      CommonWidgets.showAlertDialog(
        title: StringConstants.exit,
        content: StringConstants.doYouWantToExitAnApp,
        onPressedYes: () => SystemNavigator.pop(),
      );
    } else {
      selectedIndex.value = 0;
    }
  }

  void clickOnProfile() {
    Get.toNamed(Routes.PRT_PROFILE);
  }
}
