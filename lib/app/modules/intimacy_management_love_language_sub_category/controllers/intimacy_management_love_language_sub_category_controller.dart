import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/love_sub_language_get_love_sub_language_model.dart';
import '../../../routes/app_pages.dart';

class IntimacyManagementLoveLanguageSubCategoryController
    extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  TextEditingController searchController = TextEditingController();
  Map<String, dynamic> parameters = Get.parameters;

  String loveLanguageId = '';
  String title = '';

  List<LoveSubLanguageGetLoveSubLanguageResult> result = [];
  List<LoveSubLanguageGetLoveSubLanguageResult> searchResult = [];

  LoveSubLanguageGetLoveSubLanguageModel? getIntimacySubCategoryModel;

  @override
  Future<void> onInit() async {
    loveLanguageId = parameters[ApiKeyConstants.loveLanguageId] ?? '';
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
  }

  Future<void> intimacySubCategoryGetIntimacySubcategoryApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.loveLanguageId: loveLanguageId.toString()
    };
    getIntimacySubCategoryModel =
        await ApiMethods.loveSubLanguageGetLoveSubLanguage(
            queryParameters: queryParameters);
    if (getIntimacySubCategoryModel != null &&
        getIntimacySubCategoryModel!.result != null &&
        getIntimacySubCategoryModel!.result!.isNotEmpty) {
      result = getIntimacySubCategoryModel!.result!;
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

  clickOnCard({required LoveSubLanguageGetLoveSubLanguageResult result}) {
    Get.toNamed(Routes.INTIMACY_MANAGEMENT_LOVE_LANGUAGE_SUB_CATEGORY_DETAIL,
        arguments: result);
  }
}
