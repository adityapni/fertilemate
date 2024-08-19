import 'package:fertility_boost/app/data/apis/api_models/get_save_intimacy_management_blogs_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/sleep_management_intimacy_management_get_intimacy_management_categories_blogs_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_intimacy_sub_category_model.dart';
import '../../../routes/app_pages.dart';

class IntimacyManagementConversationStartersExploreController
    extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  TextEditingController searchController = TextEditingController();
  Map<String, dynamic> parameters = Get.parameters;

  String intimacyCategoryId = '';
  String title = '';

  GetIntimacySubCategoryModel? getIntimacySubCategoryModel;

  List<GetIntimacySubCategoryResult> result = [];
  List<GetIntimacySubCategoryResult> searchResult = [];

  GetSaveIntimacyManagementBlogsModel? getSaveIntimacyManagementBlogsModel;
  List<Result> getSaveIntimacyManagementBlogsResult = [];

  String userId = '';

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    intimacyCategoryId = parameters[ApiKeyConstants.intimacyCategoryId] ?? '';
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
    await intimacySubCategoryGetIntimacySubcategoryApi();
    await getSaveIntimacyManagementBlogsApi();
  }

  Future<void> intimacySubCategoryGetIntimacySubcategoryApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.intimacyCategoryId: intimacyCategoryId.toString(),
      ApiKeyConstants.userId: userId.toString()
    };
    getIntimacySubCategoryModel =
        await ApiMethods.intimacySubCategoryGetIntimacySubcategory(
            queryParameters: queryParameters);
    if (getIntimacySubCategoryModel != null &&
        getIntimacySubCategoryModel!.result != null &&
        getIntimacySubCategoryModel!.result!.isNotEmpty) {
      result = getIntimacySubCategoryModel!.result!;
    }
  }

  Future<void> getSaveIntimacyManagementBlogsApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: userId.toString()
    };
    getSaveIntimacyManagementBlogsModel =
        await ApiMethods.getSaveIntimacyManagementBlogs(
            queryParameters: queryParameters);
    if (getSaveIntimacyManagementBlogsModel != null &&
        getSaveIntimacyManagementBlogsModel!
                .getSaveIntimacyManagementBlogsResult !=
            null &&
        getSaveIntimacyManagementBlogsModel!
            .getSaveIntimacyManagementBlogsResult!.isNotEmpty) {
      getSaveIntimacyManagementBlogsResult =
          getSaveIntimacyManagementBlogsModel!
              .getSaveIntimacyManagementBlogsResult!;
    }
  }

  clickOnSaveButton({required int index}) async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: userId.toString(),
      ApiKeyConstants.intimacyCategoryId:
          result[index].intimacyCategoryId.toString()
    };
    http.Response? response = await ApiMethods.saveIntimacySubcategory(
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
      if (res.name!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }

  clickOnCard({required GetIntimacySubCategoryResult result}) {
    Get.toNamed(Routes.INTIMACY_MANAGEMENT_CONVERSATION_STARTERS_EXPLORE_DETAIL,
        arguments: result);
  }

  clickOnCard1({required Result result}) {
    Get.toNamed(Routes.INTIMACY_MANAGEMENT_COMMUNICATION_TIPS_DETAIL,
        arguments: result);
  }
}
