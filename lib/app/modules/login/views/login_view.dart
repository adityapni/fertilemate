import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: ProgressBar(
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
                    onPressed: () => controller.clickOnLoginButton(),
                    child: Text(
                      StringConstants.login,
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
                        StringConstants.doNotHaveAnAccountYet,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                      InkWell(
                        onTap: () => controller.clickOnSignUpButton(),
                        borderRadius: BorderRadius.circular(4.px),
                        child: Padding(
                          padding: EdgeInsets.all(4.px),
                          child: Text(
                            StringConstants.signUp,
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
                  Text(
                    StringConstants.orLoginWith,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(height: 10.px),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {
                      controller.googleLogin();
                    },
                  ),
                  SizedBox(height: 10.px),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {
                      controller.facebookLogin();
                    },
                  ),
                  SizedBox(height: 10.px),
                ],
              ),
            ),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.px),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            ImageConstants.imageLogin,
                            height: 234.px,
                            width: 250.px,
                          ),
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: controller.emailController,
                          isCard: controller.isEmail.value,
                          focusNode: controller.focusEmail,
                          prefixIcon: CommonWidgets.prefixIconWidget(
                              iconName: IconConstants.icEmail,
                              colorValue: controller.isEmail.value),
                          hintText: StringConstants.emailOrPhoneNo,
                          hintTextColor: controller.isEmail.value,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
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
                        SizedBox(height: 10.px),
                        TextButton(
                          onPressed: () =>
                              controller.clickOnForgotYourPasswordButton(),
                          child: Text(
                            StringConstants.forgotYourPassword,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
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
}
