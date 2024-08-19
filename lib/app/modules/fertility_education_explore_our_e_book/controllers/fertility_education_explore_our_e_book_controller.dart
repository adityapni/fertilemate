import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_e_book_category_model.dart';

class FertilityEducationExploreOurEBookController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  final selectedCard = 0.obs;
  GetEBookCategoryModel? getEBookCategoryModel;
  List<Result> result = [];

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

  clickOnCard({required int index}) {
    parameters = {ApiKeyConstants.ebookCategoryId: result[index].id.toString()};
    Get.toNamed(Routes.FERTILITY_EDUCATION_EXPLORE_OUR_E_BOOK_DETAIL,
        parameters: parameters);
  }

  Future<void> onInitWork() async {
    await getEbookCategoryApi();
  }

  Future<void> getEbookCategoryApi() async {
    getEBookCategoryModel = await ApiMethods.getEbookCategory();
    if (getEBookCategoryModel != null &&
        getEBookCategoryModel!.result != null &&
        getEBookCategoryModel!.result!.isNotEmpty) {
      result = getEBookCategoryModel!.result!;
    }
  }
}
