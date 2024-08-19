import 'dart:io';

import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:fertility_boost/app/modules/prt_edit_profile/controllers/prt_edit_profile_controller.dart';
import 'package:fertility_boost/common/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class PrtEditProfileView extends GetView<PrtEditProfileController> {
  const PrtEditProfileView({super.key});

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
              title: StringConstants.editProfile,
              wantBackButton:
                  controller.prefs!.getString(ApiKeyConstants.token) != null &&
                          controller.prefs!
                              .getString(ApiKeyConstants.token)!
                              .isNotEmpty
                      ? true
                      : false,
            ),
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
                                image: (controller.userImage.isNotEmpty)
                                    ? controller.userImage
                                    : ImageConstants.defaultNetworkImage,
                                height: 100.px,
                                width: 100.px,
                                radius: 50.px,
                              ),
                        SizedBox(height: 20.px),
                        GestureDetector(
                          onTap: () => controller.clickOnChangeProfilePicture(),
                          child: Text(
                            StringConstants.changeProfilePicture,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 16.px),
                          ),
                        ),
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
                              FormValidator.isNameValid(value: value),
                          controller: controller.lastNameController,
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          hintText: StringConstants.lastName,
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
                          controller: controller.postController,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          hintText: StringConstants.post,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          controller: controller.yearOfExperienceController,
                          hintText: StringConstants.yearOfExperience,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNameValid(value: value),
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          controller: controller.educationController,
                          hintText: StringConstants.education,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNameValid(value: value),
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          controller:
                              controller.identificationCardNoPassportController,
                          hintText:
                              StringConstants.identificationCardNoPassport,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNameValid(value: value),
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          controller: controller.consultFeesController,
                          hintText: StringConstants.clinicFees,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNameValid(value: value),
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          controller: controller.languageController,
                          hintText: StringConstants.language,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNameValid(value: value),
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          controller: controller.nationalityController,
                          hintText: StringConstants.nationality,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNameValid(value: value),
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          controller: controller.addressController,
                          hintText: StringConstants.address,
                          readOnly: true,
                          onTap: () => controller.clickOnAddressTextField(),
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNameValid(value: value),
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          maxLines: null,
                          controller: controller.aboutMeController,
                          hintText: StringConstants.aboutMe,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNameValid(value: value),
                          borderRadius: 8.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          maxLines: null,
                          controller: controller.descriptionController,
                          hintText: StringConstants.description,
                        ),
                        SizedBox(height: 20.px),
                        Card(
                          elevation: 0.px,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.px)),
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          child: controller.medicalLicenceImage.isNotEmpty
                              ? Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 200.px,
                                      child: CommonWidgets.imageView(
                                        image: controller.medicalLicenceImage
                                            .toString(),
                                        borderRadius:
                                            BorderRadius.circular(20.px),
                                        width: double.infinity,
                                        height: 200.px,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.px),
                                        child: SizedBox(
                                          height: 40.px,
                                          width: 40.px,
                                          child: FloatingActionButton(
                                            onPressed: () =>
                                                controller.clickOnUploadCard(),
                                            child: Icon(Icons.upload_file,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : controller.imageMedicalLicence.value != null
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(20.px),
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            height: 200.px,
                                            child: Image.file(
                                              controller.imageMedicalLicence
                                                      .value ??
                                                  File(''),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.px),
                                            child: FloatingActionButton(
                                              onPressed: () => controller
                                                  .clickOnDeleteButton(
                                                      type: 'lice'),
                                              child: Icon(
                                                Icons.delete_forever,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                size: 24.px,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : InkWell(
                                      borderRadius:
                                          BorderRadius.circular(20.px),
                                      onTap: () =>
                                          controller.clickOnUploadCard(),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 200.px,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              IconConstants.icUploadPicture,
                                              height: 30.px,
                                              width: 30.px,
                                            ),
                                            SizedBox(height: 10.px),
                                            Text(
                                              StringConstants
                                                  .pleaseUploadYourMedicalLicense,
                                              maxLines: 1,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                      fontSize: 10.px,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
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
