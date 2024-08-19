import 'package:fertility_boost/app/data/apis/api_models/get_fertility_webinars_banner_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_fertility_webinars_blogs_by_category_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class FertilityEducationDiscoverController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  Map<String, dynamic> queryParameters = {};

  GetFertilityWebinarsBlogsByCategoryModel?
      getFertilityWebinarsBlogsByCategoryModel;
  List<Result> result = [];

  String fecId = '';
  String title = '';

  Map<String, String?> parameters = Get.parameters;

  GetFertilityWebinarsBannerModel? getFertilityWebinarsBannerModel;
  BannerResult? bannerResult;

  @override
  Future<void> onInit() async {
    fecId = Get.parameters[ApiKeyConstants.fecId] ?? '';
    title = Get.parameters[ApiKeyConstants.title] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getFertilityWebinarsBannerApi();
    await getFertilityWebinarsBlogsByCategoryApi();
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

  clickOnWatchButton({required String id}) {
    Get.toNamed(Routes.FERTILITY_EDUCATION_NOW_PLAYING,
        parameters: {ApiKeyConstants.webinarsBlogId: id.toString()});
  }

  Future<void> getFertilityWebinarsBlogsByCategoryApi() async {
    queryParameters = {ApiKeyConstants.fecId: fecId};
    getFertilityWebinarsBlogsByCategoryModel =
        await ApiMethods.getFertilityWebinarsBlogsByCategory(
            queryParameters: queryParameters);
    if (getFertilityWebinarsBlogsByCategoryModel != null &&
        getFertilityWebinarsBlogsByCategoryModel!.result != null &&
        getFertilityWebinarsBlogsByCategoryModel!.result!.isNotEmpty) {
      result = getFertilityWebinarsBlogsByCategoryModel!.result!;
    }
  }

  Future<void> getFertilityWebinarsBannerApi() async {
    getFertilityWebinarsBannerModel =
        await ApiMethods.getFertilityWebinarsBanner();
    if (getFertilityWebinarsBannerModel != null &&
        getFertilityWebinarsBannerModel!.bannerResult != null) {
      bannerResult = getFertilityWebinarsBannerModel!.bannerResult!;
    }
  }
}
