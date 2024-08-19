import 'dart:convert';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import 'package:http/http.dart' as http;

import '../../../data/apis/api_models/password_reset_model.dart';

class ResetPasswordController extends GetxController {
  final count = 0.obs;
  final isEmail = false.obs;
  final isPhone = false.obs;
  final inAsyncCall = false.obs;

  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParams = {};
  Map<String, dynamic> parameters = Get.parameters;

  String type = '';

  @override
  void onInit() {
    type = parameters[ApiKeyConstants.type] ?? '';
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
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
  }

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
  }

  void increment() => count.value++;

  clickOnNextButton() async {
    inAsyncCall.value = true;
    if (emailController.text.isNotEmpty) {
      bodyParams = {
        ApiKeyConstants.email: emailController.text.toString(),
        ApiKeyConstants.type: type,
      };
    }
    /* if (phoneController.text.isNotEmpty) {
      bodyParams = {
        ApiKeyConstants.emailPhone: phoneController.text.toString(),
        ApiKeyConstants.type: ApiKeyConstants.phone,
      };
    }*/

    PasswordResetModel? passwordResetModel =
        await ApiMethods.resetPassword(bodyParams: bodyParams);
    if (passwordResetModel != null && passwordResetModel.result != null) {
      Map<String, String> parameters = {
        ApiKeyConstants.type: type,
        ApiKeyConstants.email: emailController.text.toString()
      };
      Get.toNamed(Routes.CHECK_YOUR_MAIL, parameters: parameters);
    }
    inAsyncCall.value = false;
  }
}
