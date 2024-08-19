import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/user_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class CheckYourMailController extends GetxController {
  final count = 0.obs;
  TextEditingController pin = TextEditingController();
  String emailPhone = '';
  String type = '';
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  final inAsyncCall = false.obs;
  UserModel? userModel;
  UserData? userData;

  @override
  void onInit() {
    type = parameters[ApiKeyConstants.type] ?? '';
    emailPhone = parameters[ApiKeyConstants.email] ?? '';
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

  clickOnNextButton() async {
    inAsyncCall.value = true;
    bodyParams = {
      ApiKeyConstants.emailPhone: emailPhone.toString(),
      ApiKeyConstants.type: type.toString(),
      ApiKeyConstants.otp: pin.text.toString(),
    };
    userModel = await ApiMethods.checkOtp(bodyParams: bodyParams);
    if (userModel != null) {
      if (userModel!.userData != null) {
        userData = userModel!.userData;
        if (userData != null &&
            userData!.id != null &&
            userData!.id!.isNotEmpty) {
          Map<String, String> parameters = {
            ApiKeyConstants.id: userModel!.userData!.id.toString(),
            ApiKeyConstants.type: type.toString()
          };
          Get.toNamed(Routes.CREATE_NEW_PASSWORD, parameters: parameters);
        }
      }
    }
    inAsyncCall.value = false;
  }
}
