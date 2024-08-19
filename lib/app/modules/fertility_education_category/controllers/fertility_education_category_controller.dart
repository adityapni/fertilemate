import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/data/apis/api_models/blog_by_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class FertilityEducationCategoryController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  TextEditingController searchController = TextEditingController();
  String catId = "";
  String title = "";
  BlogByCategoryModel? blogByCategory;
  List<Data> searchResult = [];

  getBlogByCategory() async {
    blogByCategory = await ApiMethods.getBlogCategorywise(
        bodyParams: {ApiKeyConstants.febFecCategoryId: catId.toString()});
  }

  @override
  Future<void> onInit() async {
    catId = Get.parameters[ApiKeyConstants.febFecCategoryId] ?? '';
    title = Get.parameters["title"] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getBlogByCategory();
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

  clickOnReadButton({required int index}) {
    Get.toNamed(Routes.FERTILITY_EDUCATION_EBOOKS, parameters: {
      ApiKeyConstants.febId: blogByCategory!.data![index].febId.toString(),
    });
  }

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    blogByCategory!.data!.forEach((res) {
      if (res.febTitle!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }
}
