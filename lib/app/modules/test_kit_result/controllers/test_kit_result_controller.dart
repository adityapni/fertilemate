import 'package:fertility_boost/app/data/apis/api_models/fertility_educations_get_fertility_report_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class TestKitResultController extends GetxController {
  final count = 0.obs;
  String userId = '';

  FertilityEducationsGetFertilityReportModel?
      fertilityEducationsGetFertilityReportModel;

  Map<String, dynamic> bodyParams = {};

  Data? data;

  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId)!;
    super.onInit();
    inAsyncCall.value = true;
    await onInitWorking();
    increment();
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

  onInitWorking() async {
    await fertilityEducationsGetFertilityReportApi();
  }

  Future<void> fertilityEducationsGetFertilityReportApi() async {
    bodyParams = {ApiKeyConstants.userId: userId.toString()};
    fertilityEducationsGetFertilityReportModel =
        await ApiMethods.fertilityEducationsGetFertilityReport(
            bodyParams: bodyParams);
    if (fertilityEducationsGetFertilityReportModel != null &&
        fertilityEducationsGetFertilityReportModel!.data != null) {
      data = fertilityEducationsGetFertilityReportModel!.data;
      // Get.toNamed(Routes.TEST_KIT_RESULT);
    }
  }
}
