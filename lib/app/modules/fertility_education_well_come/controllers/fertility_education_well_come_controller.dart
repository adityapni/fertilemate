import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/data/apis/api_models/blog_by_category.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_fertility_education_banner_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/constants/string_constants.dart';

class FertilityEducationWellComeController extends GetxController {
  final count = 0.obs;
  List listOfCards = [
    StringConstants.blog,
    StringConstants.webinars,
    StringConstants.ebooks,
  ];
  final inAsyncCall = false.obs;
  BlogByCategoryModel? blogCategorylist;

  GetFertilityEducationBannerModel? getFertilityEducationBannerModel;
  Result? result;

  GetBlogPopular() async {
    blogCategorylist = await ApiMethods.GetBlogPopular();
    increment();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    await getFertilityEducationBannerApi();
    await GetBlogPopular();
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

  clickOnCard({required int index}) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.FERTILITY_EDUCATION_BLOG,
            parameters: {ApiKeyConstants.title: StringConstants.blog});
        break;
      case 1:
        Get.toNamed(Routes.FERTILITY_EDUCATION_WEBINARS,
            parameters: {ApiKeyConstants.title: StringConstants.webinars});
        break;
      case 2:
        Get.toNamed(Routes.FERTILITY_EDUCATION_EXPLORE_OUR_E_BOOK);
        break;
    }
  }

  Future<void> getFertilityEducationBannerApi() async {
    getFertilityEducationBannerModel =
        await ApiMethods.getFertilityEducationBanner();
    if (getFertilityEducationBannerModel != null &&
        getFertilityEducationBannerModel!.result != null) {
      result = getFertilityEducationBannerModel!.result!;
    }
  }

  clickOnContentCard({required int index}) {
    Get.toNamed(Routes.FERTILITY_EDUCATION_EBOOKS, parameters: {
      ApiKeyConstants.febId: blogCategorylist!.data![index].febId ?? '',
    });
  }
}
