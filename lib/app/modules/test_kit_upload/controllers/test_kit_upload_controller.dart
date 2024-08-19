import 'dart:io';

import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class TestKitUploadController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  String id = '';
  String title = '';
  final image = Rxn<File?>();

  Map<String, String> bodyParams = {};

  String fertilityKitId = '';

  final inAsyncCall = false.obs;

  TextEditingController fshController = TextEditingController();

  TextEditingController thyroidController = TextEditingController();

  TextEditingController spermConcentrationController = TextEditingController();

  String userId = '';

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    title = parameters[StringConstants.title] ?? '';
    fertilityKitId = parameters[ApiKeyConstants.fertilityKitId] ?? '';
    super.onInit();
    increment();
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

  clickOnUploadCard() {
    showAlertDialog();
  }

  clickOnUploadButton() async {
    inAsyncCall.value = true;
    if (image.value != null) {
      await fertilityEducationsAddFertilityReportApi();
    } else {
      CommonWidgets.snackBarView(title: 'Image field required');
    }
    inAsyncCall.value = false;
  }

  Future<void> fertilityEducationsAddFertilityReportApi() async {
    if (fertilityKitId == '2') {
      if (fshController.text.isNotEmpty && thyroidController.text.isNotEmpty) {
        bodyParams = {
          ApiKeyConstants.userId: userId.toString(),
          ApiKeyConstants.fertilityKitId: fertilityKitId.toString(),
          ApiKeyConstants.fsh: fshController.text.toString(),
          ApiKeyConstants.thyroid: thyroidController.text.toString(),
          ApiKeyConstants.spermConcentration: '',
        };
        await apiMethod();
      } else {
        CommonWidgets.snackBarView(title: 'All field required');
      }
    } else {
      if (spermConcentrationController.text.isNotEmpty) {
        bodyParams = {
          ApiKeyConstants.userId: userId.toString(),
          ApiKeyConstants.fertilityKitId: fertilityKitId.toString(),
          ApiKeyConstants.fsh: '',
          ApiKeyConstants.thyroid: '',
          ApiKeyConstants.spermConcentration:
              spermConcentrationController.text.toString(),
        };
        await apiMethod();
      } else {
        CommonWidgets.snackBarView(title: 'All field required');
      }
    }
  }

  Future<void> apiMethod() async {
    http.Response? response =
        await ApiMethods.fertilityEducationsAddFertilityReport(
            bodyParams: bodyParams,
            image: image.value,
            imageKey: ApiKeyConstants.image);
    if (response != null) {
      Get.toNamed(Routes.TEST_KIT_RESULT);
    }
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
