import 'dart:io';

import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class AskQuestionForumController extends GetxController {
  final count = 0.obs;
  List listOfTextTitle = [
    {
      'hint': StringConstants.firstName,
    },
    {
      'hint': StringConstants.yourAge,
    },
    {
      'hint': StringConstants.yourLocation,
    },
    {
      'hint': StringConstants.yourEmail,
    },
    {
      'hint': StringConstants.yourPhoneNumber,
    },
  ];

  final formKey = GlobalKey<FormState>();
  final inAsyncCall = false.obs;
  Map<String, dynamic> bodyParams = {};
  TextEditingController firstNameController = TextEditingController();
  TextEditingController yourAgeController = TextEditingController();
  TextEditingController yourLocationController = TextEditingController();
  TextEditingController yourEmailController = TextEditingController();
  TextEditingController yourPhoneNumberCodeController = TextEditingController();

  String userId = '';
  final image = Rxn<File?>();

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnPostQuestionButton() async {
    inAsyncCall.value = true;
    if (formKey.currentState != null &&
        formKey.currentState!.validate() &&
        image.value != null) {
      bodyParams = {
        ApiKeyConstants.userId: userId.toString(),
        ApiKeyConstants.firstName: firstNameController.text.toString(),
        ApiKeyConstants.age: yourAgeController.text.toString(),
        ApiKeyConstants.location: yourLocationController.text.toString(),
        ApiKeyConstants.email: yourEmailController.text.toString(),
        ApiKeyConstants.mobile: yourPhoneNumberCodeController.text.toString(),
      };
      http.Response? response = await ApiMethods.contactForum(
        bodyParams: bodyParams,
        imageKey: ApiKeyConstants.documentSmall,
        image: image.value,
      );
      if (response != null && response.statusCode == 200) {
        Get.offNamed(Routes.BACK_TO_FORUM);
      }
    } else {
      CommonWidgets.snackBarView(title: 'All Fields Required');
    }
    inAsyncCall.value = false;
  }

  clickOnUploadCard() {
    showAlertDialog();
  }

  void showAlertDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(),
              onPressed: () => clickCameraTextButtonView(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(),
              onPressed: () => clickGalleryTextButtonView(),
            ),
          ],
          title: selectImageTextView(),
          content: contentTextView(),
        );
      },
    );
  }

  Widget selectImageTextView() => Text(
        StringConstants.selectImage,
        style: Theme.of(Get.context!)
            .textTheme
            .titleMedium
            ?.copyWith(fontSize: 18.px),
      );

  Widget contentTextView() => Text(
        StringConstants.chooseImageFromTheOptionsBelow,
        style: Theme.of(Get.context!)
            .textTheme
            .titleSmall
            ?.copyWith(fontSize: 14.px),
      );

  Widget cameraTextButtonView() => Text(
        StringConstants.camera,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),
      );

  Widget galleryTextButtonView() => Text(
        StringConstants.gallery,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),
      );

  Future<void> clickCameraTextButtonView() async {
    pickCamera();
    Get.back();
  }

  Future<void> clickGalleryTextButtonView() async {
    pickGallery();
    Get.back();
  }

  Future<void> pickCamera() async {
    image.value = await ImagePickerAndCropper.pickImage(
      context: Get.context!,
      wantCropper: true,
      color: Theme.of(Get.context!).primaryColor,
    );
    increment();
  }

  Future<void> pickGallery() async {
    image.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
        pickImageFromGallery: true);
    increment();
  }

  clickOnDeleteButton() {
    image.value = null;
    increment();
  }
}
