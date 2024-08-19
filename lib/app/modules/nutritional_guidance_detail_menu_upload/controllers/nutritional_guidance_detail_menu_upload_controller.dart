import 'dart:io';

import 'package:fertility_boost/common/common_methods.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/alert_dialog_view.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import 'package:http/http.dart' as http;

import '../../../data/constants/string_constants.dart';

class NutritionalGuidanceDetailMenuUploadController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String guideId = '';
  String userId = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final image = Rxn<File?>();

  final formKey = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    guideId = parameters[ApiKeyConstants.guideId] ?? '';
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

  Future<void> uploadMenu() async {
    bodyParams = {
      ApiKeyConstants.title: titleController.text.toString(),
      ApiKeyConstants.description: descriptionController.text.toString(),
      ApiKeyConstants.guideId: guideId.toString(),
      ApiKeyConstants.userId: userId.toString(),
    };
    http.Response? response = await ApiMethods.guidesUploadMenuByGuideId(
        bodyParams: bodyParams,
        image: image.value,
        imageKey: ApiKeyConstants.image);
    if (response != null) {
      Get.back();
    }
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

  clickOnUploadButton() async {
    CommonMethods.unFocsKeyBoard();
    if (image.value != null &&
        titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      await uploadMenu();
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: 'All field required');
    }
  }
}
