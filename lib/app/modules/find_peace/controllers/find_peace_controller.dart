import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_peace_category_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_peace_sub_category_model.dart';

class FindPeaceController extends GetxController {
  final count = 0.obs;

  TextEditingController searchController = TextEditingController();
  final inAsyncCall = false.obs;

  GetPeaceCategoryModel? getPeaceCategoryModel;
  List<Result> result = [];

  GetPeaceSubCategoryModel? getPeaceSubCategoryModel;

  List<GetPeaceSubCategoryResult> getPeaceSubCategoryResult = [];
  List<GetPeaceSubCategoryResult> searchResult = [];

  Map<String, dynamic> bodyParams = {};
  String peaceCategoryId = '';

  final selectedTab = 0.obs;

  Map<String, String> parameters = {};

  @override
  Future<void> onInit() async {
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

  clickOnCard({required int index}) async {
    selectedTab.value = index;
    inAsyncCall.value = true;
    peaceCategoryId = result[index].id.toString();
    await getPeaceSubCategoryApi();
    inAsyncCall.value = false;
    increment();
  }

  Future<void> onInitWork() async {
    await getPeaceCategoryApi();
    await getPeaceSubCategoryApi();
  }

  Future<void> getPeaceCategoryApi() async {
    getPeaceCategoryModel = await ApiMethods.getPeaceCategory();
    if (getPeaceCategoryModel != null &&
        getPeaceCategoryModel!.result != null &&
        getPeaceCategoryModel!.result!.isNotEmpty) {
      result = getPeaceCategoryModel!.result!;
      peaceCategoryId = result.first.id.toString();
    }
  }

  Future<void> getPeaceSubCategoryApi() async {
    bodyParams = {ApiKeyConstants.peaceCategoryId: peaceCategoryId};
    getPeaceSubCategoryModel =
        await ApiMethods.getPeaceSubCategory(bodyParams: bodyParams);
    getPeaceSubCategoryResult.clear();
    if (getPeaceSubCategoryModel != null &&
        getPeaceSubCategoryModel!.getPeaceSubCategoryResult != null &&
        getPeaceSubCategoryModel!.getPeaceSubCategoryResult!.isNotEmpty) {
      getPeaceSubCategoryResult =
          getPeaceSubCategoryModel!.getPeaceSubCategoryResult!;
    }
  }

  clickOnListTileCard({required int index}) {
    parameters = {
      ApiKeyConstants.title: getPeaceSubCategoryResult[index].name.toString(),
      ApiKeyConstants.id: getPeaceSubCategoryResult[index].id.toString()
    };
    Get.toNamed(Routes.FIND_PEACE_DETAIL, parameters: parameters);
  }

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    getPeaceSubCategoryResult.forEach((res) {
      if (res.name!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }
}
