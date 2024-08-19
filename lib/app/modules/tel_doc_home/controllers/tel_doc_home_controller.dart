import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/doctors_get_profile_model.dart';
import '../../../data/apis/api_models/get_doctor_availability_model.dart';
import '../../../data/apis/api_models/get_doctor_upcoming_appointment_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class TelDocHomeController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  Map<String, String?> parameters = Get.parameters;
  String id = '';

  GetDoctorUpcomingAppointmentModel? getDoctorUpcomingAppointmentModel;
  List<Result> result = [];

  Map<String, String> queryParameters = {};

  String userImage = ImageConstants.defaultNetworkImage;

  Map<String, String> bodyParams = {};

  DoctorsGetProfileModel? doctorsGetProfileModel;
  DoctorAvailabilityModel? doctorAvailabilityModel;

  UserData? userData;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await onInitWork();
    inAsyncCall.value = false;
    print('Day:-${currentDay}');
  }

  var currentDay = DateFormat('EEEE').format(DateTime.now());
  List<DoctorAvailabilityData> availabilityList = [];

  List<bool> statusList = List.generate(7, (i) => false);

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void ClickOnProfile() {
    Get.toNamed(Routes.PRT_PROFILE);
  }

  void ClickOnCard() {
    Get.toNamed(Routes.HEALTHCARE_PROVIDER_CHAT);
  }

  changeStatus(int index) {
    statusList[index] = !statusList[index];
    increment();
  }

  clickOnLogout() {
    CommonWidgets.showAlertDialog(
      onPressedYes: () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();
        Get.offAllNamed(Routes.GET_START);
      },
    );
  }

  clickOnUpComingAppointment({required int index}) {
    Map<String, String> parameter = {
      ApiKeyConstants.appointmentId: result[index].id.toString(),
    };
    Get.toNamed(Routes.TEL_DOC_CLIENT_DETAIL, parameters: parameter);
  }

  Future<void> onInitWork() async {
    await getProfile();
    await doctorsGetDoctorByIdApi();
    await getDoctorAvailability();
  }

  Future<void> getProfile() async {
    bodyParams = {
      ApiKeyConstants.userId: id.toString(),
    };
    doctorsGetProfileModel =
        await ApiMethods.doctorsGetProfile(bodyParams: bodyParams);
    if (doctorsGetProfileModel != null &&
        doctorsGetProfileModel!.userData != null) {
      userData = doctorsGetProfileModel!.userData!;
      if (userData != null &&
          userData!.image != null &&
          userData!.image!.isNotEmpty) {
        userImage = userData!.image.toString();
        increment();
      }
    }
  }

  Future<void> doctorsGetDoctorByIdApi() async {
    queryParameters = {
      ApiKeyConstants.doctorId: id,
      ApiKeyConstants.labId: '',
      ApiKeyConstants.trainerId: '',
    };
    getDoctorUpcomingAppointmentModel =
        await ApiMethods.getDoctorUpcomingAppointment(
            queryParameters: queryParameters);
    if (getDoctorUpcomingAppointmentModel != null &&
        getDoctorUpcomingAppointmentModel!.result != null) {
      result = getDoctorUpcomingAppointmentModel!.result!;
    }
  }

  clickOnDateTime({required int index}) async {
    Map<String, String> parameter = {
      ApiKeyConstants.otherUserId: result[index].id.toString(),
      ApiKeyConstants.userName: result[index].userName.toString(),
    };
    await Get.toNamed(Routes.CHAT, parameters: parameter);
  }

  clickOnSetAvailability() async {
    await Get.toNamed(Routes.TEL_DOC_SET_AVAILABILITY);
    getDoctorAvailability();
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

  Future<void> getDoctorAvailability() async {
    bodyParams = {
      ApiKeyConstants.doctorId: id.toString(),
    };
    doctorAvailabilityModel =
        await ApiMethods.getDoctorAvailability(queryParameters: bodyParams);
    if (doctorAvailabilityModel != null &&
        doctorAvailabilityModel!.data != null) {
      availabilityList = doctorAvailabilityModel!.data!;
      increment();
    }
  }
}
