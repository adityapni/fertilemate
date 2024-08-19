import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_ultrasound_history_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class CycleTrackingUltraSoundEditController extends GetxController {
  final count = 0.obs;
  FocusNode focusDate = FocusNode();
  FocusNode focusPatientsRemote = FocusNode();
  final image = Rxn<File>();
  Map<String, File> imageMap = {};
  Map<String, dynamic> bodyParams = {};

  final isDate = false.obs;
  final isPatientsRemark = false.obs;

  TextEditingController dateController = TextEditingController();
  TextEditingController patientsRemarkController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final inAsyncCall = false.obs;

  SharedPreferences? prefs;

  Map<String, String?> parameters = Get.parameters;
  List<UltrasoundImageHistoryData> historyList = [];

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    super.onInit();
    startListener();
    await getCycleTrackingUltrasoundHistoryApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onFocusChange() {
    isDate.value = focusDate.hasFocus;
    isPatientsRemark.value = focusPatientsRemote.hasFocus;
  }

  void increment() => count.value++;

  void startListener() {
    focusDate.addListener(onFocusChange);
    focusPatientsRemote.addListener(onFocusChange);
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

  clickOnSubmitButton() async {
    inAsyncCall.value = true;
    if (image.value != null && patientsRemarkController.text.isNotEmpty) {
      imageMap = {
        ApiKeyConstants.image: image.value ?? File(''),
      };
      bodyParams = {
        ApiKeyConstants.userId:
            prefs!.getString(ApiKeyConstants.userId).toString(),
        ApiKeyConstants.remark: patientsRemarkController.text.toString()
      };
      http.Response? response =
          await ApiMethods.cycleTrackingAddUltraSoundImage(
              bodyParams: bodyParams, imageMap: imageMap);
      if (response != null && response.statusCode == 200) {
        Get.back();
      }
    } else {
      CommonWidgets.snackBarView(title: 'All Fields Required');
    }
    inAsyncCall.value = false;
  }

  Future<void> getCycleTrackingUltrasoundHistoryApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]
    };
    UltrasoundImageHistoryModel? ultrasoundImageHistoryModel =
        await ApiMethods.getCycleTrackingUltrasoundImageHistory(
            queryParameters: queryParameters);
    if (ultrasoundImageHistoryModel != null &&
        ultrasoundImageHistoryModel.doctor != null &&
        ultrasoundImageHistoryModel.doctor!.isNotEmpty) {
      historyList = ultrasoundImageHistoryModel.doctor!;
      increment();
    }
    inAsyncCall.value = false;
  }

  clickOnHistoryCard(int index) async {
    await Get.toNamed(Routes.CYCLE_TRACKING_HISTORY_ULTRASOUND_IMAGE,
        arguments: historyList[index]);
    await onInit();
  }
}
