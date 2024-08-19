import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/sleep_management_intimacy_management_get_intimacy_management_categories_blogs_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_recommendation_blogs_model.dart';

class IntimacyManagementCommunicationTipsController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  TextEditingController searchController = TextEditingController();
  Map<String, dynamic> parameters = Get.parameters;

  String imbIntimacyManagementCategoriesId = '';
  String title = '';

  SleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel?
      sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel;
  List<Result> result = [];
  List<Result> searchResult = [];

  GetRecommendationBlogsModel? getRecommendationBlogsModel;
  List<Result> getRecommendationBlogsResult = [];

  String userId = '';

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    imbIntimacyManagementCategoriesId =
        parameters[ApiKeyConstants.imbIntimacyManagementCategoriesId] ?? '';
    title = parameters[ApiKeyConstants.title] ?? '';
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
    await sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsApi();
    await sleepManagementIntimacyManagementGetRecommendationBlogsApi();
  }

  Future<void>
      sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.imbIntimacyManagementCategoriesId:
          imbIntimacyManagementCategoriesId.toString(),
      ApiKeyConstants.userId: userId.toString()
    };
    sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel =
        await ApiMethods
            .sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogs(
                queryParameters: queryParameters);
    if (sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel != null &&
        sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel!
                .result !=
            null &&
        sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel!
            .result!.isNotEmpty) {
      result =
          sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel!
              .result!;
    }
  }

  Future<void>
      sleepManagementIntimacyManagementGetRecommendationBlogsApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.imbIntimacyManagementCategoriesId:
          imbIntimacyManagementCategoriesId.toString()
    };
    getRecommendationBlogsModel = await ApiMethods
        .sleepManagementIntimacyManagementGetRecommendationBlogs();
    if (getRecommendationBlogsModel != null &&
        getRecommendationBlogsModel!.getRecommendationBlogsResult != null &&
        getRecommendationBlogsModel!.getRecommendationBlogsResult!.isNotEmpty) {
      getRecommendationBlogsResult =
          getRecommendationBlogsModel!.getRecommendationBlogsResult!;
    }
  }

  clickOnSaveButton({required int index}) async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: userId.toString(),
      ApiKeyConstants.imbId: result[index].imbId.toString()
    };
    http.Response? response = await ApiMethods.saveIntimacyManagementBlogs(
        queryParameters: queryParameters);
    if (response != null) {
      await onInit();
    }
  }

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    result.forEach((res) {
      if (res.imbTitle!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }

  clickOnCard({required Result result}) {
    Get.toNamed(Routes.INTIMACY_MANAGEMENT_COMMUNICATION_TIPS_DETAIL,
        arguments: result);
  }
}
