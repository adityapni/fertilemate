import 'package:fertility_boost/app/data/apis/api_models/user_model.dart';
import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class PrtSignUpController extends GetxController {
  final count = 0.obs;
  final hide = true.obs;
  final confirmPasswordHide = true.obs;
  Object selectedRadio = 0;
  Map<String, dynamic> parameter = Get.parameters;
  List listOfListTile = [
    {'title': 'User', 'image': IconConstants.icSearch},
    {'title': 'Telehealth Doctor', 'image': IconConstants.icSearch},
    {'title': 'Telehealth Mental Coach', 'image': IconConstants.icAvailability},
    {'title': 'Personal Trainer', 'image': IconConstants.icPricing},
    {'title': 'Nutritionist', 'image': IconConstants.icPricing},
    {
      'title': 'Laboratory & Clinic',
      'image': IconConstants.icBookAnAppointment
    },
  ];
  FocusNode focusFullName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusProfile = FocusNode();
  FocusNode focusCompanyName = FocusNode();
  FocusNode focusPhoneNumber = FocusNode();
  FocusNode focusGender = FocusNode();
  FocusNode focusBirthDate = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusConfirmPassword = FocusNode();

  final isFullName = false.obs;
  final isEmail = false.obs;
  final isProfile = false.obs;
  final isCompanyName = false.obs;
  final isPhoneNumber = false.obs;
  final isGender = false.obs;
  final isBirthDate = false.obs;
  final isPassword = false.obs;
  final isConfirmPassword = false.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController profileController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParams = {};

  final inAsyncCall = false.obs;
  String type = '';

  UserModel? userModel;
  UserData? userData;
  SharedPreferences? prefs;

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    super.onInit();
    type = parameter[ApiKeyConstants.type] ?? '';
    startListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isProfile.value = focusProfile.hasFocus;
    isCompanyName.value = focusCompanyName.hasFocus;
    isPhoneNumber.value = focusPhoneNumber.hasFocus;
    isGender.value = focusGender.hasFocus;
    isBirthDate.value = focusBirthDate.hasFocus;
    isPassword.value = focusPassword.hasFocus;
    isConfirmPassword.value = focusConfirmPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnLoginButton() {
    Get.back();
  }

  clickOnSignUpButton() async {
    inAsyncCall.value = true;
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      bodyParams = {
        ApiKeyConstants.userName: fullNameController.text.toString(),
        ApiKeyConstants.email: emailController.text.toString(),
        ApiKeyConstants.companyName: companyNameController.text.toString(),
        ApiKeyConstants.mobile: phoneNumberController.text.toString(),
        ApiKeyConstants.gender: genderController.text.toString(),
        ApiKeyConstants.dob: birthDateController.text.toString(),
        ApiKeyConstants.password: passwordController.text.toString(),
        ApiKeyConstants.confirmPassword:
            confirmPasswordController.text.toString(),
        ApiKeyConstants.type: type.toString(),
        ApiKeyConstants.countryCode: '',
      };
      userModel = await ApiMethods.register(bodyParams: bodyParams);
      if (userModel != null) {
        if (userModel!.userData != null &&
            userModel!.userData!.id != null &&
            userModel!.userData!.id!.isNotEmpty &&
            userModel!.userData!.verifyStatus != null &&
            userModel!.userData!.verifyStatus!.isNotEmpty) {
          prefs?.setString(ApiKeyConstants.type, type.toString());
          prefs?.setString(ApiKeyConstants.token, userModel!.token.toString());
          prefs?.setString(
              ApiKeyConstants.userId, userModel!.userData!.id.toString());
          prefs?.setString(
            ApiKeyConstants.verifyStatus,
            userModel!.userData!.verifyStatus.toString(),
          );
          Get.offAllNamed(Routes.PRT_EDIT_PROFILE);
        }
      }
    }
    inAsyncCall.value = false;
  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusProfile.addListener(onFocusChange);
    focusCompanyName.addListener(onFocusChange);
    focusPhoneNumber.addListener(onFocusChange);
    focusGender.addListener(onFocusChange);
    focusBirthDate.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
    focusConfirmPassword.addListener(onFocusChange);
  }

  clickOnConfirmEyeButton() {
    confirmPasswordHide.value = !confirmPasswordHide.value;
  }
}
