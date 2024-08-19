import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/apis/api_models/user_model.dart';

class PrtLoginController extends GetxController {
  final count = 0.obs;
  final hide = true.obs;

  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isEmail = false.obs;
  final isPassword = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParams = {};
  Map<String, dynamic> parameter = Get.parameters;
  SharedPreferences? prefs;

  final inAsyncCall = false.obs;
  UserModel? userModel;
  String type = '';

  @override
  Future<void> onInit() async {
    print("usertype----------------${parameter['type']}");
    type = parameter[ApiKeyConstants.type] ?? '';
    prefs = await SharedPreferences.getInstance();
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

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnLoginButton() async {
    inAsyncCall.value = true;
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      bodyParams = {
        ApiKeyConstants.email: emailController.text.toString(),
        ApiKeyConstants.password: passwordController.text.toString(),
        ApiKeyConstants.type: type.toString(),
      };
      userModel = await ApiMethods.login(bodyParams: bodyParams);
      if (userModel != null) {
        if (userModel?.token != null && userModel!.token!.isNotEmpty) {
          prefs?.setString(ApiKeyConstants.type, type.toString());
          prefs?.setString(ApiKeyConstants.token, userModel!.token.toString());
          if (userModel!.userData != null &&
              userModel!.userData!.id != null &&
              userModel!.userData!.id!.isNotEmpty) {
            prefs?.setString(
                ApiKeyConstants.userId, userModel!.userData!.id.toString());
            if (type == ApiKeyConstants.trainer) {
              Get.offAllNamed(Routes.TRAINER_NET_HOME);
            } else if (type == ApiKeyConstants.doctor) {
              Get.offAllNamed(Routes.TEL_DOC_HOME);
            } else if (type == ApiKeyConstants.lab) {
              Get.offAllNamed(Routes.LABORATORY_AND_CLINIC_HOME);
            }
          }
        }
      }
    }
    inAsyncCall.value = false;
  }

  clickOnForgotYourPasswordButton() {
    Get.toNamed(Routes.RESET_PASSWORD,
        parameters: {ApiKeyConstants.type: type.toString()});
  }

  clickOnSignUpButton() {
    Get.toNamed(Routes.PRT_SIGN_UP,
        parameters: {ApiKeyConstants.type: type.toString()});
  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }
}
