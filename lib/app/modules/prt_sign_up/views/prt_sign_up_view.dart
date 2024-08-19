import 'package:fertility_boost/common/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/prt_sign_up_controller.dart';

class PrtSignUpView extends GetView<PrtSignUpController> {
  const PrtSignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: GestureDetector(
          onTap: () => CommonMethods.unFocsKeyBoard(),
          child: Scaffold(
            /* extendBody: true,
            resizeToAvoidBottomInset: false,*/
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
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmailValid(value: value),
                          controller: controller.emailController,
                          isCard: controller.isEmail.value,
                          // focusNode: controller.focusEmail,
                          prefixIcon: CommonWidgets.prefixIconWidget(
                              iconName: IconConstants.icEmail,
                              colorValue: controller.isEmail.value),
                          hintText: StringConstants.email,
                          hintTextColor: controller.isEmail.value,
                        ),
                        // SizedBox(height: 20.px),
                        // CommonWidgets.commonTextFieldForLoginSignUP(
                        //   // validator: (value) =>
                        //   //     FormValidator.isEmailValid(value: value),
                        //     controller: controller.profileController,
                        //     isCard: controller.isProfile.value,
                        //     focusNode: controller.focusProfile,
                        //     readOnly: true,
                        //     prefixIcon: Image.asset(
                        //       IconConstants.icUser,
                        //       color: controller.isProfile.value
                        //           ? Theme.of(context).primaryColor
                        //           : Theme.of(context).colorScheme.onSecondary,
                        //     ),
                        //     hintText: StringConstants.profile,
                        //     hintTextColor: controller.isProfile.value,
                        //     onTap: (){
                        //       showModalBottomSheet(context: context,
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.only(
                        //               topRight: Radius.circular(14.px),
                        //               topLeft: Radius.circular(14.px),
                        //             ),
                        //           ),
                        //           builder: (context){
                        //             return StatefulBuilder(
                        //                 builder: (context,setState) {
                        //                   return Container(
                        //                     child: Column(
                        //                       children: [
                        //                         ListView.builder(
                        //                           shrinkWrap: true,
                        //                           physics: const NeverScrollableScrollPhysics(),
                        //                           itemBuilder: (context, index) => RadioListTile(
                        //                             activeColor: Theme.of(context).primaryColor,
                        //                             controlAffinity: ListTileControlAffinity.trailing,
                        //                             selected: true,
                        //                             groupValue: controller.selectedRadio,
                        //                             value: index,
                        //                             onChanged: (value) async {
                        //                               if (value != null) {
                        //                                 controller.selectedRadio = value;
                        //                                 controller.increment();
                        //                                 print("selectedRadio-------${controller.selectedRadio}");
                        //                                 SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        //                                 sharedPreferences.setString(StringConstants.userType, controller.listOfListTile[int.parse(value.toString())]['title']);
                        //                                 var userTypee=sharedPreferences.getString(StringConstants.userType);
                        //                                 print("userTypee-------${userTypee}");
                        //                                 setState((){});
                        //                               }
                        //                             },
                        //                             title: Row(
                        //                               children: [
                        //                                 Flexible(
                        //                                   child: Text(
                        //                                     controller.listOfListTile[index]['title'],
                        //                                     overflow: TextOverflow.ellipsis,
                        //                                     maxLines: 2,
                        //                                     style: Theme.of(context)
                        //                                         .textTheme
                        //                                         .displayMedium
                        //                                         ?.copyWith(fontSize: 14.px),
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ),
                        //                           itemCount: controller.listOfListTile.length,
                        //                         ),
                        //                       ],
                        //                     ),);
                        //                 }
                        //             );
                        //           });
                        //     }
                        // ),

                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: controller.phoneNumberController,
                          isCard: controller.isPhoneNumber.value,
                          focusNode: controller.focusPhoneNumber,
                          inputFormatters: [
                            // LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          prefixIcon: CommonWidgets.prefixIconWidget(
                              iconName: IconConstants.icPhone,
                              colorValue: controller.isPhoneNumber.value),
                          hintText: StringConstants.phoneNumber,
                          hintTextColor: controller.isPhoneNumber.value,
                        ),

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
                        SizedBox(height: 150.px),
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
                        SizedBox(height: 20.px),
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
}
