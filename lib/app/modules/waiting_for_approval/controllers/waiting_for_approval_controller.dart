import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/doctors_get_profile_model.dart';
import '../../../routes/app_pages.dart';

class WaitingForApprovalController extends GetxController {
  final count = 0.obs;
  Map<String, String> bodyParams = {};

  DoctorsGetProfileModel? doctorsGetProfileModel;
  SharedPreferences? prefs;
  String verifyStatus = '';

  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
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

  clickOnRefresh() {
    if (prefs?.getString(ApiKeyConstants.userId) == null &&
        prefs!.getString(ApiKeyConstants.userId)!.isNotEmpty &&
        prefs?.getString(ApiKeyConstants.type) != null &&
        prefs!.getString(ApiKeyConstants.type)!.isNotEmpty) {
      doctorsGetDoctorByIdApi(
        id: prefs!.getString(ApiKeyConstants.userId).toString(),
        type: prefs!.getString(ApiKeyConstants.type).toString(),
      ).whenComplete(() {
        if (prefs?.getString(ApiKeyConstants.token) != null &&
            prefs!.getString(ApiKeyConstants.token)!.isNotEmpty &&
            prefs?.getString(ApiKeyConstants.type) != null &&
            prefs!.getString(ApiKeyConstants.type)!.isNotEmpty) {
          prefs?.setString(ApiKeyConstants.token,
              prefs!.getString(ApiKeyConstants.token).toString());
          prefs?.setString(ApiKeyConstants.type,
              prefs!.getString(ApiKeyConstants.type).toString());
          prefs?.setString(ApiKeyConstants.userId,
              prefs!.getString(ApiKeyConstants.userId).toString());
          if (prefs!.getString(ApiKeyConstants.type) == ApiKeyConstants.user) {
            Get.offAllNamed(Routes.NAV_BAR);
          } else if (prefs!.getString(ApiKeyConstants.type) ==
              ApiKeyConstants.doctor) {
            if (verifyStatus == '0') {
              Get.offAllNamed(Routes.PRT_EDIT_PROFILE);
            } else if (verifyStatus == '1') {
              // Get.offAllNamed(Routes.WAITING_FOR_APPROVAL);
            } else {
              Get.offAllNamed(Routes.TEL_DOC_HOME);
            }
          } else if (prefs!.getString(ApiKeyConstants.type) ==
              ApiKeyConstants.trainer) {
            if (verifyStatus == '0') {
              Get.offAllNamed(Routes.PRT_EDIT_PROFILE);
            } else if (verifyStatus == '1') {
              // Get.offAllNamed(Routes.WAITING_FOR_APPROVAL);
            } else {
              Get.offAllNamed(Routes.TRAINER_NET_HOME);
            }
          } else if (prefs!.getString(ApiKeyConstants.type) ==
              ApiKeyConstants.lab) {
            if (verifyStatus == '0') {
              Get.offAllNamed(Routes.PRT_EDIT_PROFILE);
            } else if (verifyStatus == '1') {
              // Get.offAllNamed(Routes.WAITING_FOR_APPROVAL);
            } else {
              Get.offAllNamed(Routes.LABORATORY_AND_CLINIC_HOME);
            }
          }
        } else if (verifyStatus == '0') {
          Get.offAllNamed(Routes.PRT_EDIT_PROFILE);
        } else if (verifyStatus == '1') {
          // Get.offAllNamed(Routes.WAITING_FOR_APPROVAL);
        } else {
          Get.offAllNamed(Routes.GET_START);
        }
      });
    } else {
      Get.offAllNamed(Routes.GET_START);
    }
  }

  Future<void> doctorsGetDoctorByIdApi(
      {required String id, required String type}) async {
    bodyParams = {
      ApiKeyConstants.id: id.toString(),
      ApiKeyConstants.type: type.toString()
    };
    inAsyncCall.value = true;
    doctorsGetProfileModel =
        await ApiMethods.doctorsGetProfile(bodyParams: bodyParams);
    if (doctorsGetProfileModel != null &&
        doctorsGetProfileModel!.userData != null &&
        doctorsGetProfileModel!.userData!.verifyStatus != null &&
        doctorsGetProfileModel!.userData!.verifyStatus!.isNotEmpty) {
      verifyStatus = doctorsGetProfileModel!.userData!.verifyStatus!;
    }
    inAsyncCall.value = false;
  }
}
