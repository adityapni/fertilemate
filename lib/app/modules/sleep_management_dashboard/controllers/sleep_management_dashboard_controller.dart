import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_soundtrack_categories_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_recommended_soundtracks_model.dart';
import '../../../data/apis/api_models/sleep_management_get_sleep_management_sound_tracks_model.dart';
import '../../../data/constants/string_constants.dart';

class SleepManagementDashboardController extends GetxController {
  final count = 0.obs;

  TextEditingController searchController = TextEditingController();

  final inAsyncCall = false.obs;

  SleepManagementGetSleepManagementSoundTracksModel?
      sleepManagementGetSleepManagementSoundTracksModel;
  List<Result> result = [];

  GetSoundtrackCategoriesModel? getSoundtrackCategoriesModel;

  List<GetSoundtrackCategoriesResult> getSoundtrackCategoriesResult = [];

  GetRecommendedSoundtracksModel? getRecommendedSoundtracksModel;

  List<GetRecommendedSoundtracksResult> getRecommendedSoundtracksResult = [];

  List<GetRecommendedSoundtracksResult> searchResult = [];

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

  clickOnBackNow() {
    Get.back();
  }

  clickOnBackButton() {}

  clickOnPreviousIconInList() {}

  clickOnNextIconInList() {}

  clickOnCard({required int index}) {
    parameters = {
      ApiKeyConstants.id: getSoundtrackCategoriesResult[index].id ?? ''
    };
    Get.toNamed(Routes.SLEEP_MANAGEMENT_DISCOVER, parameters: parameters);
  }

  Widget cards({
    required int index,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonWidgets.imageView(
            image: getSoundtrackCategoriesResult[index].smstImage.toString(),
            width: 64.px,
            height: 64.px),
        SizedBox(height: 4.px),
        Text(
          getSoundtrackCategoriesResult[index].smstName.toString(),
          style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
              fontSize: 12.px, color: Theme.of(Get.context!).primaryColor),
        ),
      ],
    );
  }

  Future<void> onInitWork() async {
    await sleepManagementGetSleepManagementCategoriesApi();
    await sleepManagementGetSoundtrackCategoriesApi();
    await sleepManagementGetRecommendedSoundtracksApi();
  }

  Future<void> sleepManagementGetSleepManagementCategoriesApi() async {
    sleepManagementGetSleepManagementSoundTracksModel =
        await ApiMethods.sleepManagementGetSleepManagementSoundTracks();
    if (sleepManagementGetSleepManagementSoundTracksModel != null &&
        sleepManagementGetSleepManagementSoundTracksModel!.result != null &&
        sleepManagementGetSleepManagementSoundTracksModel!.result!.isNotEmpty) {
      result = sleepManagementGetSleepManagementSoundTracksModel!.result!;
    }
  }

  Future<void> sleepManagementGetSoundtrackCategoriesApi() async {
    getSoundtrackCategoriesModel =
        await ApiMethods.sleepManagementGetSoundtrackCategories();
    if (getSoundtrackCategoriesModel != null &&
        getSoundtrackCategoriesModel!.getSoundtrackCategoriesResult != null &&
        getSoundtrackCategoriesModel!
            .getSoundtrackCategoriesResult!.isNotEmpty) {
      getSoundtrackCategoriesResult =
          getSoundtrackCategoriesModel!.getSoundtrackCategoriesResult!;
    }
  }

  Future<void> sleepManagementGetRecommendedSoundtracksApi() async {
    getRecommendedSoundtracksModel =
        await ApiMethods.sleepManagementGetRecommendedSoundtracks();
    if (getRecommendedSoundtracksModel != null &&
        getRecommendedSoundtracksModel!.getRecommendedSoundtracksResult !=
            null &&
        getRecommendedSoundtracksModel!
            .getRecommendedSoundtracksResult!.isNotEmpty) {
      getRecommendedSoundtracksResult =
          getRecommendedSoundtracksModel!.getRecommendedSoundtracksResult!;
    }
  }

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    getRecommendedSoundtracksResult.forEach((res) {
      if (res.title!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }

  clickOnSearchResultCard({required int index}) {
    Map<String, String> parameter = {
      StringConstants.postName: searchResult[index].title.toString(),
      StringConstants.postDescription:
          searchResult[index].description.toString(),
      StringConstants.postAudio: searchResult[index].audio.toString(),
      StringConstants.postImage: searchResult[index].image.toString(),
      StringConstants.title: searchResult[index].title.toString(),
    };
    Get.toNamed(Routes.PLAY_AUDIO_STRESS_MANAGEMENT, parameters: parameter);
  }

  clickOnResultCard({required int index}) {
    Map<String, String> parameter = {
      StringConstants.postName:
          getRecommendedSoundtracksResult[index].title.toString(),
      StringConstants.postDescription:
          getRecommendedSoundtracksResult[index].description.toString(),
      StringConstants.postAudio:
          getRecommendedSoundtracksResult[index].audio.toString(),
      StringConstants.postImage:
          getRecommendedSoundtracksResult[index].image.toString(),
      StringConstants.title:
          getRecommendedSoundtracksResult[index].title.toString(),
    };
    Get.toNamed(Routes.PLAY_AUDIO_STRESS_MANAGEMENT, parameters: parameter);
  }
}
