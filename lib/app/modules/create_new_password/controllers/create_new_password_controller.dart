import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../routes/app_pages.dart';

class CreateNewPasswordController extends GetxController {
  final count = 0.obs;
  final isNewPassword = false.obs;
  final isConfirmPassword = false.obs;

  FocusNode focusNewPassword = FocusNode();
  FocusNode focusConfirmPassword = FocusNode();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final hideNewPassword = true.obs;
  final hideConfirmPassword = true.obs;
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};

  String id = '';
  String type = '';

  final inAsyncCall = false.obs;

  final formKey = GlobalKey<FormState>();
  UserModel? userModel;

  @override
  Future<void> onInit() async {
    id = parameters[ApiKeyConstants.id] ?? '';
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
    isNewPassword.value = focusNewPassword.hasFocus;
    isConfirmPassword.value = focusConfirmPassword.hasFocus;
  }

  void startListener() {
    focusNewPassword.addListener(onFocusChange);
    focusConfirmPassword.addListener(onFocusChange);
  }

  void increment() => count.value++;

  clickOnSubmitButton() async {
    inAsyncCall.value = true;
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      bodyParams = {
        ApiKeyConstants.id: id.toString(),
        ApiKeyConstants.password: newPasswordController.text.toString(),
        ApiKeyConstants.type: type.toString(),
      };
      userModel = await ApiMethods.createNewPassword(bodyParams: bodyParams);
      if (userModel != null) {
        Get.offAllNamed(Routes.LOGIN);
      }
    }
    inAsyncCall.value = false;
  }

  clickOnEyeNewPasswordButton() {
    hideNewPassword.value = !hideNewPassword.value;
  }

  clickOnEyeConfirmPasswordButton() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
  }
}
