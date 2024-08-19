import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_methods.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/social_sign_up_controller.dart';

class SocialSignUpView extends GetView<SocialSignUpController> {
  const SocialSignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: GestureDetector(
          onTap: () => CommonMethods.unFocsKeyBoard(),
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.px),
                        Text(
                          StringConstants.signUp,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: controller.fullNameController,
                          isCard: controller.isFullName.value,
                          focusNode: controller.focusFullName,
                          prefixIcon: CommonWidgets.prefixIconWidget(
                              iconName: IconConstants.icUser,
                              colorValue: controller.isFullName.value),
                          hintText: StringConstants.fullName,
                          hintTextColor: controller.isFullName.value,
                        ),
                        SizedBox(height: 20.px),
                        // CommonWidgets.commonTextFieldForLoginSignUP(
                        //   validator: (value) =>
                        //       FormValidator.isEmailValid(value: value),
                        //   controller: controller.emailController,
                        //   isCard: controller.isEmail.value,
                        //   // focusNode: controller.focusEmail,
                        //   prefixIcon: CommonWidgets.prefixIconWidget(
                        //       iconName: IconConstants.icEmail,
                        //       colorValue: controller.isEmail.value),
                        //   hintText: StringConstants.email,
                        //   hintTextColor: controller.isEmail.value,
                        // ),
                        // SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: controller.companyNameController,
                          isCard: controller.isCompanyName.value,
                          focusNode: controller.focusCompanyName,
                          prefixIcon: CommonWidgets.prefixIconWidget(
                              iconName: IconConstants.icCompany,
                              colorValue: controller.isCompanyName.value),
                          hintText: StringConstants.companyName,
                          hintTextColor: controller.isCompanyName.value,
                        ),
                        SizedBox(height: 20.px),
                        Visibility(
                          visible: controller.parameters[ApiKeyConstants.phone]=='null',
                          child: CommonWidgets.commonTextFieldForLoginSignUP(
                            validator: (value) =>
                                FormValidator.isEmptyValid(value: value),
                            controller: controller.phoneNumberController,
                            isCard: controller.isPhoneNumber.value,
                            focusNode: controller.focusPhoneNumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              // LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            prefixIcon: CommonWidgets.prefixIconWidget(
                                iconName: IconConstants.icPhone,
                                colorValue: controller.isPhoneNumber.value),
                            hintText: StringConstants.phoneNumber,
                            hintTextColor: controller.isPhoneNumber.value,
                          ),
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                            validator: (value) =>
                                FormValidator.isEmptyValid(value: value),
                            controller: controller.birthDateController,
                            isCard: controller.isBirthDate.value,
                            focusNode: controller.focusBirthDate,
                            prefixIcon: CommonWidgets.prefixIconWidget(
                                iconName: IconConstants.icDob,
                                colorValue: controller.isBirthDate.value),
                            hintText: StringConstants.birthDate,
                            hintTextColor: controller.isBirthDate.value,
                            onTap: () => controller.clickOnDob(),
                            readOnly: true),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isPasswordValid(value: value),
                          controller: controller.passwordController,
                          isCard: controller.isPassword.value,
                          focusNode: controller.focusPassword,
                          obscureText: controller.hide.value,
                          hintText: StringConstants.password,
                          hintTextColor: controller.isPassword.value,
                          prefixIcon: CommonWidgets.prefixIconWidget(
                              iconName: IconConstants.icLock,
                              colorValue: controller.isPassword.value),
                          suffixIcon: GestureDetector(
                            onTap: () => controller.clickOnEyeButton(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  controller.hide.value
                                      ? IconConstants.icHide
                                      : IconConstants.icView,
                                  color: controller.isPassword.value
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
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
                              FormValidator.isConfirmPasswordValid(
                                  value: value,
                                  password: controller.passwordController.text),
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
                            onTap: () => controller.clickOnConfirmEyeButton(),
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
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                  height: 18.px,
                                  width: 18.px,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Theme(
                              data: ThemeData(
                                unselectedWidgetColor:
                                    Theme.of(context).primaryColor,
                                disabledColor: Theme.of(context).primaryColor,
                              ),
                              child: Checkbox(
                                activeColor: Theme.of(context).primaryColor,
                                value: controller.selectCheckBox.value,
                                onChanged: (value) {
                                  controller.selectCheckBox.value =
                                      !controller.selectCheckBox.value;
                                  controller.increment();
                                },
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                maxLines: 2,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'I agree to Fertilemate ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 12.px),
                                    ),
                                    TextSpan(
                                      text: 'Terms &  conditions',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12.px,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => clickOnTermsAndConditions(),
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 12.px),
                                    ),
                                    TextSpan(
                                      text: 'Privacy policy',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12.px,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => clickOnPrivacyPolicy(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.px),
                        CommonWidgets.commonElevatedButton(
                          onPressed: () => controller.clickOnSignUpButton(),
                          child: Text(
                            StringConstants.signUp,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: 10.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringConstants.alreadyHaveAnAccountYet,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                            InkWell(
                              onTap: () => controller.clickOnLoginButton(),
                              borderRadius: BorderRadius.circular(4.px),
                              child: Padding(
                                padding: EdgeInsets.all(4.px),
                                child: Text(
                                  StringConstants.login,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.px),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  clickOnTermsAndConditions() {
    Get.toNamed(Routes.PRIVACY_POLICY, parameters: {
      ApiKeyConstants.title: ApiKeyConstants.termsAndConditions
    });
  }

  clickOnPrivacyPolicy() {
    Get.toNamed(Routes.PRIVACY_POLICY,
        parameters: {ApiKeyConstants.title: ApiKeyConstants.privacyPolicy});
  }
}
