import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController extends GetxController {
  final count = 0.obs;

  final isCurrentPassword = false.obs;
  final currentPasswordHide = true.obs;
  TextEditingController currentPasswordController = TextEditingController();
  FocusNode focusCurrentPassword = FocusNode();

  final isNewPassword = false.obs;
  final newPasswordHide = true.obs;
  TextEditingController newPasswordController = TextEditingController();
  FocusNode focusNewPassword = FocusNode();

  final isConfirmPassword = false.obs;
  final confirmPasswordHide = true.obs;
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode focusConfirmPassword = FocusNode();
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParams = {};
  String userId = '';

  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId)!;
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
    focusCurrentPassword.addListener(onFocusChange);
    focusNewPassword.addListener(onFocusChange);
    focusConfirmPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isCurrentPassword.value = focusCurrentPassword.hasFocus;
    isNewPassword.value = focusNewPassword.hasFocus;
    isConfirmPassword.value = focusConfirmPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnSaveButton() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      inAsyncCall.value = true;
      await changePassword();
      inAsyncCall.value = false;
    }
  }

  clickOnCurrentPasswordEyeButton() {
    currentPasswordHide.value = !currentPasswordHide.value;
  }

  clickOnNewPasswordEyeButton() {
    newPasswordHide.value = !newPasswordHide.value;
  }

  clickOnConfirmPasswordEyeButton() {
    confirmPasswordHide.value = !confirmPasswordHide.value;
  }

  Future<void> changePassword() async {
    bodyParams = {
      ApiKeyConstants.oldPassword: currentPasswordController.text.toString(),
      ApiKeyConstants.password: newPasswordController.text.toString(),
      ApiKeyConstants.id: userId.toString(),
    };
    http.Response? response =
        await ApiMethods.changePassword(bodyParams: bodyParams);
    if (response != null && response.statusCode == 200) {
      Get.back();
    }
  }
}
