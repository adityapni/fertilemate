import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_supportive_peace_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';

class FindPeaceDetailController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  String title = '';
  String peaceSubCategoryId = '';
  Map<String, dynamic> queryParameters = {};
  TextEditingController searchController = TextEditingController();
  final inAsyncCall = false.obs;
  GetSupportivePeaceModel? getSupportivePeaceModel;
  List<Result> result = [];
  List<Result> searchResult = [];

  @override
  Future<void> onInit() async {
    peaceSubCategoryId = parameters[ApiKeyConstants.id] ?? '';
    title = parameters[ApiKeyConstants.title] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getSupportivePeaceApi();
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

  Future<void> getSupportivePeaceApi() async {
    queryParameters = {ApiKeyConstants.peaceSubCategoryId: peaceSubCategoryId};
    getSupportivePeaceModel =
        await ApiMethods.getSupportivePeace(queryParameters: queryParameters);
    if (getSupportivePeaceModel != null &&
        getSupportivePeaceModel!.result != null &&
        getSupportivePeaceModel!.result!.isNotEmpty) {
      result = getSupportivePeaceModel!.result!;
    }
  }

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    result.forEach((res) {
      if (res.title!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }

  clickOnCard({required String id, required String title}) {
    Get.toNamed(Routes.FIND_PEACE_DETAIL_TWO, parameters: {
      ApiKeyConstants.id: id,
      ApiKeyConstants.peaceSubCategoryId: peaceSubCategoryId,
      ApiKeyConstants.title: title
    });
  }
}
