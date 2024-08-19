import 'package:fertility_boost/common/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnSaveButton(),
                  child: Text(
                    StringConstants.save,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 10.px),
              ],
            ),
          ),
          appBar:
              CommonWidgets.appBarView(title: StringConstants.changePassword),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        validator: (value) =>
                            FormValidator.isEmptyValid(value: value),
                        controller: controller.currentPasswordController,
                        isCard: controller.isCurrentPassword.value,
                        focusNode: controller.focusCurrentPassword,
                        obscureText: controller.currentPasswordHide.value,
                        hintText: StringConstants.currentPassword,
                        hintTextColor: controller.isCurrentPassword.value,
                        prefixIcon: CommonWidgets.prefixIconWidget(
                            iconName: IconConstants.icLock,
                            colorValue: controller.isCurrentPassword.value),
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              controller.clickOnCurrentPasswordEyeButton(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.currentPasswordHide.value
                                    ? IconConstants.icHide
                                    : IconConstants.icView,
                                color: controller.isCurrentPassword.value
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.onSecondary,
                                height: 18.px,
                                width: 18.px,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        validator: (value) =>
                            FormValidator.isPasswordValid(value: value),
                        controller: controller.newPasswordController,
                        isCard: controller.isNewPassword.value,
                        focusNode: controller.focusNewPassword,
                        obscureText: controller.newPasswordHide.value,
                        hintText: StringConstants.newPassword,
                        hintTextColor: controller.isNewPassword.value,
                        prefixIcon: CommonWidgets.prefixIconWidget(
                            iconName: IconConstants.icLock,
                            colorValue: controller.isNewPassword.value),
                        suffixIcon: GestureDetector(
                          onTap: () => controller.clickOnNewPasswordEyeButton(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.newPasswordHide.value
                                    ? IconConstants.icHide
                                    : IconConstants.icView,
                                color: controller.isNewPassword.value
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.onSecondary,
                                height: 18.px,
                                width: 18.px,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        validator: (value) =>
                            FormValidator.isConfirmPasswordValid(value: value),
                        controller: controller.confirmPasswordController,
                        isCard: controller.isConfirmPassword.value,
                        focusNode: controller.focusConfirmPassword,
                        obscureText: controller.confirmPasswordHide.value,
                        hintText: StringConstants.confirmPassword,
                        hintTextColor: controller.isConfirmPassword.value,
                        prefixIcon: CommonWidgets.prefixIconWidget(
                            iconName: IconConstants.icLock,
                            colorValue: controller.isConfirmPassword.value),
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              controller.clickOnConfirmPasswordEyeButton(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.confirmPasswordHide.value
                                    ? IconConstants.icHide
                                    : IconConstants.icView,
                                color: controller.isConfirmPassword.value
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.onSecondary,
                                height: 18.px,
                                width: 18.px,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
