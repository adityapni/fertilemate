import 'dart:io';

import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/alert_dialog_view.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_sonography_ultrasounds_model.dart';
import 'package:http/http.dart' as http;

class HealthcareProviderController extends GetxController {
  final count = 0.obs;

  GetSonographyUltrasoundsModel? getSonographyUltrasoundsModel;
  List<Data> data = [];
  Map<String, dynamic> bodyParams = {};
  Map<String, dynamic> bodyParamsForUploadImage = {};

  String suUserId = '1';

  final inAsyncCall = false.obs;
  Map<String, String?> parameters = Get.parameters;
  final image = Rxn<File?>();

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    await onInitWork();
    inAsyncCall.value = false;
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

  clickOnCard() {}

  Future<void> onInitWork() async {
    await getSonographyUltrasoundsApi();
  }

  Future<void> getSonographyUltrasoundsApi() async {
    bodyParams = {ApiKeyConstants.suUserId: suUserId.toString()};
    getSonographyUltrasoundsModel =
        await ApiMethods.getSonographyUltrasounds(bodyParams: bodyParams);
    if (getSonographyUltrasoundsModel != null &&
        getSonographyUltrasoundsModel!.data!.isNotEmpty) {
      data = getSonographyUltrasoundsModel!.data!;
      increment();
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
    if (image.value != null) {
      bodyParamsForUploadImage = {
        ApiKeyConstants.suUserId: suUserId.toString(),
        ApiKeyConstants.suDescription: '',
        ApiKeyConstants.suTitle: '',
      };
      inAsyncCall.value = true;
      http.Response? response = await ApiMethods.uploadSonographyUltrasounds(
        bodyParams: bodyParamsForUploadImage,
        imageKey: ApiKeyConstants.suImage,
        image: image.value,
      );
      if (response != null) {
        image.value = null;
        await onInitWork();
      }
      inAsyncCall.value = false;
    }
  }
}
