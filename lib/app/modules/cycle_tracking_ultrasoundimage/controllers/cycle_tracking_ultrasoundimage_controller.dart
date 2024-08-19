import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_ultrasound_history_model.dart';

class CycleTrackingUltrasoundImageController extends GetxController {
  TextEditingController patientRemarkController = TextEditingController();
  Map<String, String?> arguments = Get.arguments;
  List<UltrasoundImageHistoryData> historyList = [];
  final count = 0.obs;
  final historyPresent = false.obs;
  final inAsyncCall = true.obs;
  String userId = '';

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
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

  void increment() => count.value++;

  openUltraSoundImageEditView() {
    Get.toNamed(Routes.CYCLE_TRACKING_ULTRASOUND_EDIT);
  }

  clickOnHistoryCard(int index) {
    Get.toNamed(Routes.CYCLE_TRACKING_HISTORY_ULTRASOUND_IMAGE,
        arguments: historyList[index]);
  }

  Future<void> getCycleTrackingUltrasoundHistoryApi() async {
    Map<String, dynamic> queryParameters = {ApiKeyConstants.userId: userId};
    UltrasoundImageHistoryModel? ultrasoundImageHistoryModel =
        await ApiMethods.getCycleTrackingUltrasoundImageHistory(
            queryParameters: queryParameters);
    if (ultrasoundImageHistoryModel != null &&
        ultrasoundImageHistoryModel.doctor != null &&
        ultrasoundImageHistoryModel.doctor!.isNotEmpty) {
      historyList = ultrasoundImageHistoryModel.doctor!;
      historyPresent.value = true;
    } else {
      historyPresent.value = false;
    }
    inAsyncCall.value = false;
  }
}
