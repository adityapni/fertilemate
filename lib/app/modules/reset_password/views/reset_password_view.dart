import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

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
                    onPressed: () => controller.clickOnNextButton(),
                    child: Text(
                      StringConstants.next,
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
                CommonWidgets.appBarView(title: StringConstants.passwordReset),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.px),
                  Text(
                    StringConstants.pleasePutYourEmailToResetYourPassword,
                    // textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 16.px,
                        ),
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    controller: controller.emailController,
                    isCard: controller.isEmail.value,
                    focusNode: controller.focusEmail,
                    prefixIcon: CommonWidgets.prefixIconWidget(
                        iconName: IconConstants.icEmail,
                        colorValue: controller.isEmail.value),
                    hintText: StringConstants.pleaseEnterEmail,
                    hintTextColor: controller.isEmail.value,
                  ),
                  /* SizedBox(height: 20.px),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.px),
                          child: Divider(thickness: 1.px),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.px),
                        child: Text(
                          StringConstants.or,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 30.px),
                          child: Divider(thickness: 1.px),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    controller: controller.phoneController,
                    isCard: controller.isPhone.value,
                    focusNode: controller.focusPhone,
                    prefixIcon: CommonWidgets.prefixIconWidget(
                        iconName: IconConstants.icCall,
                        colorValue: controller.isPhone.value),
                    hintText: StringConstants.pleaseEnterPhoneNo,
                    hintTextColor: controller.isPhone.value,
                  ),*/
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
