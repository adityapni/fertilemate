import 'package:fertility_boost/app/data/apis/api_models/user_model.dart';
import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/time_picker_view.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class SocialSignUpController extends GetxController {
  final count = 0.obs;
  final hide = true.obs;
  final confirmPasswordHide = true.obs;
  Object selectedRadio = 0;
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

  DateTime? dateTime;

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

  UserModel? userModel;
  UserData? userData;

  SharedPreferences? prefs;

  final selectCheckBox = false.obs;

  Map<String, dynamic> parameters = Get.parameters;

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    emailController.text = parameters[ApiKeyConstants.email];
    phoneNumberController.text = parameters[ApiKeyConstants.phone]=='null'?'':parameters[ApiKeyConstants.phone];
    super.onInit();
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
      if (selectCheckBox.value) {
        bodyParams = {
          ApiKeyConstants.type: ApiKeyConstants.user,
          ApiKeyConstants.userName: fullNameController.text.toString(),
          ApiKeyConstants.email: emailController.text.toString(),
          ApiKeyConstants.companyName: companyNameController.text.toString(),
          ApiKeyConstants.countryCode: '+60',
          ApiKeyConstants.mobile: phoneNumberController.text.toString(),
          ApiKeyConstants.gender: genderController.text.toString(),
          ApiKeyConstants.dob: birthDateController.text.toString(),
          ApiKeyConstants.password: passwordController.text.toString(),
          ApiKeyConstants.confirmPassword:
              confirmPasswordController.text.toString(),
        };
        userModel = await ApiMethods.register(bodyParams: bodyParams);
        if (userModel != null) {
          if (userModel?.token != null &&
              userModel!.token!.isNotEmpty &&
              userModel!.userData != null &&
              userModel!.userData!.id != null &&
              userModel!.userData!.id!.isNotEmpty) {
            prefs?.setString(ApiKeyConstants.type, ApiKeyConstants.user);
            prefs?.setString(
                ApiKeyConstants.token, userModel!.token.toString());
            prefs?.setString(
                ApiKeyConstants.userId, userModel!.userData!.id.toString());
            Get.offAllNamed(Routes.NAV_BAR);
          }
        }
      } else {
        CommonWidgets.snackBarView(
            title: 'Please accept Terms & condition and Privacy policy');
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

  clickOnDob() async {
    dateTime = await DatePickerView().datePickerView(
      color: Theme.of(Get.context!).primaryColor,
      lastDate: DateTime.now(),
      initialDate: DateTime(1940),
      firstDate: DateTime(1940),
    );
    if (dateTime != null) {
      birthDateController.text = DateFormat('dd-MM-yyyy')
          .format(dateTime ?? DateTime.now())
          .toString();
    }
  }
}
