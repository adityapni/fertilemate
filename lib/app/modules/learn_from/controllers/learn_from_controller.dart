import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_supportive_community_model.dart';

class LearnFromController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  TextEditingController searchController = TextEditingController();

  GetSupportiveCommunityModel? getSupportiveCommunityModel;

  List<Result> result = [];
  List<Result> searchResult = [];

  Future<void> getSupportiveCommunityApi() async {
    getSupportiveCommunityModel = await ApiMethods.getSupportiveCommunity();
    if (getSupportiveCommunityModel != null &&
        getSupportiveCommunityModel!.result!.isNotEmpty) {
      result = getSupportiveCommunityModel!.result!;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    await getSupportiveCommunityApi();
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
    if (result[index].id != null && result[index].id!.isNotEmpty) {
      Map<String, String> parameters = {
        ApiKeyConstants.id: result[index].id.toString()
      };
      Get.toNamed(Routes.LEARN_FROM_DETAIL, parameters: parameters);
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
}
