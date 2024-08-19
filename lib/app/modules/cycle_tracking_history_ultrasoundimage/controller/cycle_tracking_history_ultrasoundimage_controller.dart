import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_ultrasound_history_model.dart';
import '../../../data/constants/string_constants.dart';

class CycleTrackingHistoryUltrasoundImageController extends GetxController {
  TextEditingController remarkController = TextEditingController();
  final count = 0.obs;
  Map<String, dynamic> bodyParams = {};
  Map<String, File> imageMap = {};
  final inAsyncCall = false.obs;
  UltrasoundImageHistoryData? historyUltrasound;
  final arguments = Get.arguments;

  final image = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
    historyUltrasound = arguments;
    remarkController.value =
        TextEditingValue(text: historyUltrasound?.remark ?? '');
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

  clickOnEditButton() async {
    inAsyncCall.value = true;
    if (remarkController.text.isNotEmpty) {
      imageMap = {
        ApiKeyConstants.image: image.value ?? File(''),
      };
      bodyParams = {
        ApiKeyConstants.id: historyUltrasound?.id,
        ApiKeyConstants.remark: remarkController.text.toString()
      };
      http.Response? response =
          await ApiMethods.cycleTrackingUpdateUltraSoundImage(
              bodyParams: bodyParams,
              imageMap: image.value != null ? imageMap : null);
      if (response != null && response.statusCode == 200) {
        Get.back();
      }
    } else {
      CommonWidgets.snackBarView(title: 'All Fields Required');
    }
    inAsyncCall.value = false;
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
            .displayMedium
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
}
