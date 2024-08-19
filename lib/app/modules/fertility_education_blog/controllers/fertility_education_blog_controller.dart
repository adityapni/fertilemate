import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/data/apis/api_models/blog_category.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_models/blog_by_category.dart';
import '../../../data/apis/api_models/get_fertility_educations_saved_blog_model.dart';
import '../../../data/constants/string_constants.dart';

class FertilityEducationBlogController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  BlogCategoryModel? blogCategorylist;
  BlogByCategoryModel? blogfeaturedList;
  GetFertilityEducationsSavedBlogModel? getFertilityEducationsSavedBlogModel;
  List<GetFertilityEducationsSavedBlogData>
      getFertilityEducationsSavedBlogData = [];

  getBlogCategory() async {
    blogCategorylist = await ApiMethods.getBlogCategory();
    increment();
  }

  GetBlogFeatured() async {
    blogfeaturedList = await ApiMethods.GetBlogFeatured();
    increment();
  }

  getBlogSaved() async {
    getFertilityEducationsSavedBlogModel = await ApiMethods.getBlogSaved(
        bodyParams: {ApiKeyConstants.userId: userId});
    if (getFertilityEducationsSavedBlogModel != null &&
        getFertilityEducationsSavedBlogModel!.data != null &&
        getFertilityEducationsSavedBlogModel!.data!.isNotEmpty) {
      getFertilityEducationsSavedBlogData.clear();
      getFertilityEducationsSavedBlogModel!.data!.forEach((element) {
        if (element.saveStatus == true) {
          getFertilityEducationsSavedBlogData.add(element);
          increment();
        } else {
          getFertilityEducationsSavedBlogData.remove(element);
          increment();
        }
      });
    }
  }

  String title = '';
  String userId = '';

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    title = Get.parameters[ApiKeyConstants.title] ?? '';
    inAsyncCall.value = true;
    await GetBlogFeatured();
    await getBlogCategory();
    await getBlogSaved();
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
    await Get.toNamed(Routes.FERTILITY_EDUCATION_CATEGORY, parameters: {
      ApiKeyConstants.febFecCategoryId: catId,
      StringConstants.title: cardTitle,
    });
    await onInit();
  }

  clickOnReadButton() async {
    await Get.toNamed(Routes.FERTILITY_EDUCATION_EBOOKS, parameters: {
      ApiKeyConstants.febId: blogfeaturedList!.data!.first.febId.toString(),
    });
    await onInit();
  }

  clickOnContentCard({required int index}) async {
    await Get.toNamed(Routes.FERTILITY_EDUCATION_EBOOKS, parameters: {
      ApiKeyConstants.febId:
          getFertilityEducationsSavedBlogModel!.data![index].febImage ?? '',
      ApiKeyConstants.title:
          getFertilityEducationsSavedBlogModel!.data![index].febTitle ?? '',
    });
    await onInit();
  }

  clickOnBookmarkIcon({required int index}) async {
    http.Response? response =
        await ApiMethods.addDeleteFertilityBlogEducation(bodyParams: {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.fertilityBlogEducationId:
          getFertilityEducationsSavedBlogData[index].febId,
      ApiKeyConstants.type: ApiKeyConstants.blog,
    });
    if (response != null) {
      inAsyncCall.value = true;
      await getBlogSaved();
      inAsyncCall.value = false;
    }
  }
}
