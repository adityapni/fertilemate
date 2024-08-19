import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/data/apis/api_models/blog_category.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_fertility_educations_featured_saved_webinars_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_fertility_educations_featured_webinars_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/constants/string_constants.dart';

class FertilityEducationWebinarsController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  BlogCategoryModel? blogCategorylist;

  GetFertilityEducationsFeaturedWebinarsModel?
      getFertilityEducationsFeaturedWebinarsModel;
  List<GetFertilityEducationsFeaturedWebinarsData>
      getFertilityEducationsFeaturedWebinarsData = [];

  GetFertilityEducationsFeaturedSavedWebinarsModel?
      getFertilityEducationsFeaturedSavedWebinarsModel;

  List<GetFertilityEducationsFeaturedSavedWebinarsData>
      getFertilityEducationsFeaturedSavedWebinarsData = [];

  getBlogCategory() async {
    blogCategorylist = await ApiMethods.getBlogCategory();
    increment();
  }

  getFertilityEducationsFeaturedWebinarsApi() async {
    getFertilityEducationsFeaturedWebinarsModel =
        await ApiMethods.getFertilityEducationsFeaturedWebinars();
    if (getFertilityEducationsFeaturedWebinarsModel != null &&
        getFertilityEducationsFeaturedWebinarsModel!.data != null &&
        getFertilityEducationsFeaturedWebinarsModel!.data!.isNotEmpty) {
      getFertilityEducationsFeaturedWebinarsData =
          getFertilityEducationsFeaturedWebinarsModel!.data!;
    }
    increment();
  }

  getWebinarSaved() async {
    getFertilityEducationsFeaturedSavedWebinarsModel =
        await ApiMethods.getFertilityEducationsFeaturedSavedWebinars(
            bodyParams: {ApiKeyConstants.userId: userId});
    if (getFertilityEducationsFeaturedSavedWebinarsModel != null &&
        getFertilityEducationsFeaturedSavedWebinarsModel!.data != null &&
        getFertilityEducationsFeaturedSavedWebinarsModel!.data!.isNotEmpty) {
      getFertilityEducationsFeaturedSavedWebinarsData.clear();
      getFertilityEducationsFeaturedSavedWebinarsModel!.data!
          .forEach((element) {
        if (element.saveStatus == true) {
          getFertilityEducationsFeaturedSavedWebinarsData.add(element);
          increment();
        } else {
          getFertilityEducationsFeaturedSavedWebinarsData.remove(element);
          increment();
        }
      });
    }
  }

  String userId = '';

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getFertilityEducationsFeaturedWebinarsApi();
    await getBlogCategory();
    await getWebinarSaved();
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

  clickOnCard({required String catId, required String cardTitle}) async {
    await Get.toNamed(Routes.FERTILITY_EDUCATION_DISCOVER, parameters: {
      ApiKeyConstants.fecId: catId,
      StringConstants.title: cardTitle
    });
    inAsyncCall.value = true;
    await getWebinarSaved();
    inAsyncCall.value = false;
  }

  clickOnWatchButton() async {
    await Get.toNamed(Routes.FERTILITY_EDUCATION_NOW_PLAYING, parameters: {
      ApiKeyConstants.webinarsBlogId:
          getFertilityEducationsFeaturedWebinarsData.first.id!.toString(),
    });
    inAsyncCall.value = true;
    await getWebinarSaved();
    inAsyncCall.value = false;
  }

  clickOnContentCard({required int index}) async {
    await Get.toNamed(Routes.FERTILITY_EDUCATION_NOW_PLAYING, parameters: {
      ApiKeyConstants.webinarsBlogId:
          getFertilityEducationsFeaturedSavedWebinarsData[index].id ?? '',
    });
    inAsyncCall.value = true;
    await getWebinarSaved();
    inAsyncCall.value = false;
  }

  clickOnBookmarkIcon({required int index}) async {
    http.Response? response =
        await ApiMethods.addDeleteFertilityBlogEducation(bodyParams: {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.fertilityBlogEducationId:
          getFertilityEducationsFeaturedWebinarsData[index].id,
      ApiKeyConstants.type: ApiKeyConstants.webinar,
    });
    if (response != null) {
      inAsyncCall.value = true;
      await getWebinarSaved();
      inAsyncCall.value = false;
    }
  }
}
