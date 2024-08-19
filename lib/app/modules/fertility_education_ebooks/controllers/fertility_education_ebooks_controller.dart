import 'package:fertility_boost/app/data/apis/api_models/get_fertility_educations_blogs_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class FertilityEducationEbooksController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  Map<String, String> bodyParams = {};

  String febId = '';
  String userId = '';
  String type = '';

  GetFertilityEducationsBlogsDetailsModel?
      getFertilityEducationsBlogsDetailsModel;

  Data? data;
  Map<String, String?> parameters = Get.parameters;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    febId = parameters[ApiKeyConstants.febId] ?? '';
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

  Future<void> onInitWork() async {
    await getFertilityEducationsBlogsDetailsApi();
  }

  Future<void> getFertilityEducationsBlogsDetailsApi() async {
    bodyParams = {
      ApiKeyConstants.febId: febId.toString(),
      ApiKeyConstants.userId: userId,
    };
    getFertilityEducationsBlogsDetailsModel =
        await ApiMethods.getFertilityEducationsBlogsDetails(
            bodyParams: bodyParams);
    if (getFertilityEducationsBlogsDetailsModel != null &&
        getFertilityEducationsBlogsDetailsModel!.data != null) {
      data = getFertilityEducationsBlogsDetailsModel!.data!;
      increment();
    }
  }

  clickOnBookmarkIcon() async {
    http.Response? response =
        await ApiMethods.addDeleteFertilityBlogEducation(bodyParams: {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.fertilityBlogEducationId: febId,
      ApiKeyConstants.type: ApiKeyConstants.blog,
    });
    if (response != null) {
      await getFertilityEducationsBlogsDetailsApi();
    }
  }
}
