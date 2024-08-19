import 'dart:io';

import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:fertility_boost/common/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: GestureDetector(
          onTap: () => CommonMethods.unFocsKeyBoard(),
          child: Scaffold(
            appBar: CommonWidgets.appBarView(
                title: StringConstants.editProfile, wantBackButton: true),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.px),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            (controller.image.value != null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.px),
                                    ),
                                    child: Image.file(
                                      height: 100.px,
                                      width: 100.px,
                                      fit: BoxFit.cover,
                                      File(
                                        controller.image.value!.path.toString(),
                                      ),
                                    ),
                                  )
                                : CommonWidgets.imageView(
                                    image: controller.userData != null &&
                                            controller.userData!.image !=
                                                null &&
                                            controller
                                                .userData!.image!.isNotEmpty
                                        ? controller.userData!.image.toString()
                                        : ImageConstants.defaultNetworkImage,
                                    height: 100.px,
                                    width: 100.px,
                                    radius: 50.px,
                                  ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.px, top: 8.px),
                              child: SizedBox(
                                width: 36.px,
                                height: 36.px,
                                child: FloatingActionButton(
                                  onPressed: () =>
                                      controller.clickOnChangeProfilePicture(),
                                  child: Icon(
                                    size: 24.px,
                                    Icons.camera_alt_outlined,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        /*SizedBox(height: 20.px),
                        GestureDetector(
                          onTap: () => controller.clickOnChangeProfilePicture(),
                          child: Text(
                            StringConstants.changeProfilePicture,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 16.px),
                          ),
                        ),*/
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNameValid(value: value),
                          controller: controller.firstNameController,
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          hintText: StringConstants.firstName,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmailValid(value: value),
                          controller: controller.emailController,
                          borderRadius: 8.px,
                          readOnly: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          hintText: StringConstants.email,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNumberValid(value: value),
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          readOnly: true,
                          controller: controller.phoneNumberController,
                          hintText: StringConstants.phoneNumber,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                            validator: (value) =>
                                FormValidator.isEmptyValid(value: value),
                            controller: controller.birthDateController,
                            fillColor: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.2.px),
                            hintText: StringConstants.birthDate,
                            onTap: () => controller.clickOnDob(),
                            readOnly: true),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: controller.occupationController,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          hintText: StringConstants.occupation,
                          /* onTap: () => controller.clickOnDob(),
                            readOnly: true,*/
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                            validator: (value) =>
                                FormValidator.isEmptyValid(value: value),
                            controller: controller.maritalStatusController,
                            fillColor: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.2.px),
                            hintText: StringConstants.maritalStatus,
                            onTap: () => controller.clickOnMaritalStatus(),
                            readOnly: true),
                        if (controller.maritalStatusValue.value)
                          SizedBox(height: 20.px),
                        if (controller.maritalStatusValue.value)
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: controller.maritalStatusList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () => controller
                                      .clickOnMaritalStatusTile(index: index),
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    controller.maritalStatusList[index],
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 14.px),
                                  ),
                                );
                              },
                            ),
                          ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                            validator: (value) =>
                                FormValidator.isEmptyValid(value: value),
                            controller: controller.genderController,
                            fillColor: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.2.px),
                            hintText: StringConstants.gender,
                            onTap: () => controller.clickOnGender(),
                            readOnly: true),
                        if (controller.genderValue.value)
                          SizedBox(height: 20.px),
                        if (controller.genderValue.value)
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: controller.genderList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () => controller.clickOnGenderTile(
                                      index: index),
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    controller.genderList[index],
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 14.px),
                                  ),
                                );
                              },
                            ),
                          ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonElevatedButton(
                          onPressed: () => controller.clickOnSubmitButton(),
                          child: Text(
                            StringConstants.submit,
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
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
